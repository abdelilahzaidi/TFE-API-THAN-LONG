import { LevelService } from './../level/level.service';
import { UserEntity } from './../../commun/entities/user/user';
import { ConflictException, Delete, Injectable, Param } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt'
import { UserCreateDTO } from 'src/commun/dto/user/user-create.dto';

@Injectable()
export class UserService {
    constructor(
        @InjectRepository(UserEntity)
        private readonly userRepository : Repository<UserEntity>,
        private readonly levelService :LevelService
        
    ){}
    async all():Promise<UserEntity[]>{
        return await this.userRepository.find();
    }

    // async createUser(dto : UserCreateDTO):Promise<UserEntity>{ 
    //       const {levelId} =dto
    //     console.log("DTO ",dto)
        
    // const hashedPassword = await bcrypt.hash("Zah14$01471983", 12);

    // try {
    //     const user = await this.userRepository.save({
    //         ...dto,
    //         password: hashedPassword,
    //         attributionDate: new Date(),
    //         levelId:{id:dto.levelId}      

    //     });
        
        
    //     console.log("user ",user)
    //     return user;
    // } catch (error) {
    //     if (error.code = 11000) {
    //         throw new ConflictException('Duplicate Email!!');
    //     }
    //     throw error;
    // }
        
    // }


    async createUser(dto: UserCreateDTO): Promise<UserEntity> {
        const hashedPassword = await bcrypt.hash("Zah14$01471983", 12);
    
        try {
            const level = await this.levelService.findLevelById(dto.levelId); // Récupérez le niveau associé
    
            const user = await this.userRepository.save({
                ...dto,
                password: hashedPassword,
                attributionDate: new Date(),
                level: level, // Associez le niveau à l'utilisateur
            });
    
            return user;
        } catch (error) {
            if (error.code === 11000) {
                throw new ConflictException('Duplicate Email!!');
            }
            throw error;
        }
    }
    




    async update(id: number, data): Promise<any> {
        return this.userRepository.update(id, data)
    }

    async delete(id: number): Promise<any> {
        return this.userRepository.delete(id);
    }

        //Find a user by email
        async findOneByEmail(email : string): Promise<any> {
            return this.userRepository.findOne({where:{email}});
        }
        //Find a user by id
        async findOneById(id : number): Promise<any> {
            return this.userRepository.findOne({where:{id}});
        }



}
