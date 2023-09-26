import { LevelService } from './../level/level.service';
import { UserEntity } from './../../commun/entities/user/user';
import {
  
  ConflictException,
  HttpException,
  HttpStatus,
  Inject,
  Injectable,
  
  InternalServerErrorException,
  
  NotFoundException,
 
  forwardRef,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { UserCreateDTO } from 'src/commun/dto/user/user-create.dto';

import { UserRoleDTO } from 'src/commun/dto/user/user-role.dto';
import { UserEventDTO } from 'src/commun/dto/user/user-event.dto';




@Injectable()
export class UserService {
  constructor(
    @InjectRepository(UserEntity)
    private readonly userRepository: Repository<UserEntity>,    
    private readonly levelService : LevelService,

    ) {}
  async all(): Promise<UserEntity[]> {
    return await this.userRepository.find();
  }

  async createUser(dto: UserCreateDTO): Promise<UserEntity> {
    const hashedPassword = await bcrypt.hash('Zah14$01471983', 12);

    try {
      const level = await  this.levelService.findLevelByGrade(dto.grade)
        if (!level) {
          throw new NotFoundException(`Level with ID ${dto.grade} not found.`);
        }

      const userFound = await this.userRepository.findOne({
        where: { email: dto.email },
      });
      if (userFound) {
        throw new ConflictException('Cette adresse e-mail est déjà utilisée.');
      }

      const user = new UserEntity();
      user.first_name = dto.first_name;
      user.last_name = dto.last_name;
      user.email = dto.email;
      user.gender = dto.gender;
      user.adress = dto.adress;
      user.birthDate = dto.birthDate;
      user.password = hashedPassword;
      user.attributionDate = new Date();
      user.actif = dto.actif;
      user.gsm = dto.gsm;
      user.level=level
      user.status=dto.status
      return this.userRepository.save(user);
    } catch (error) {
      throw new InternalServerErrorException(
        error,
        "Une erreur est survenue lors de la création de l'utilisateur.",
      );
    }
  }

  async create(data): Promise<UserEntity> {
    return this.userRepository.save(data);
}

async update(id: number, dto: UserCreateDTO): Promise<any> {
  console.log(dto)
  try {
    const level = await  this.levelService.findLevelByGrade(dto.grade)
    console.log(level)
      if (!level) {
        throw new NotFoundException(`Level with ID ${dto.grade} not found.`);
      }
   
    const user = new UserEntity();
    user.first_name = dto.first_name;
    user.last_name = dto.last_name;
    user.email = dto.email;
    user.gender = dto.gender;
    user.adress = dto.adress;
    user.birthDate = dto.birthDate;
    //user.password = hashedPassword;
    user.attributionDate = new Date();
    user.actif = dto.actif;
    user.gsm = dto.gsm;
    user.level=level
    user.status=dto.status
    console.log('user modifié', this.userRepository.update(id,user))
    return this.userRepository.update(id,user);
  } catch (error) {
    throw new InternalServerErrorException(
      error,
      "Une erreur est survenue lors de la modification de l'utilisateur.",
    );
  }




  //return this.userRepository.update(id, data);
}

  

  async delete(id: number): Promise<any> {
    return this.userRepository.delete(id);
  }

  //Find a user by email
  async findOneByEmail(email: string): Promise<any> {
    return this.userRepository.findOne({ where: { email } });
  }
  //Find a user by id
  async findOneById(id: number): Promise<any> {
    return this.userRepository.findOne({ where: { id } });
  }

  async findUserStatusByUserId(id: any) {
    const user = await this.userRepository.findOne({ where: { id } });

    if (!user) {
      throw new HttpException('No user found by Id', HttpStatus.NOT_FOUND);
    }

    return user.status;
  }  
}
