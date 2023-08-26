import { UserService } from './../user/user.service';
import { ConflictException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateLevelDto } from 'src/commun/dto/level/level-create.dto';
import { LevelEntity } from 'src/commun/entities/level/level';
import { UserEntity } from 'src/commun/entities/user/user';
import { Repository } from 'typeorm';
import { ProgramService } from '../program/program.service';

@Injectable()
export class LevelService {
    constructor(
        @InjectRepository(LevelEntity)
        private levelRepository: Repository<LevelEntity>,
        private programService : ProgramService
      ) {}
    
      async all(): Promise<LevelEntity[]> {
        return await this.levelRepository.find();
      }

      async createLevel(dto: CreateLevelDto): Promise<LevelEntity> {
        try {
            const program = await this.programService.findProgramById(dto.programId); // Récupérez le programme associé

            const level = new LevelEntity();
            level.grade = dto.grade;
            level.program = program; // Associez le programme au niveau

            const savedLevel = await this.levelRepository.save(level);

            console.log('in service', savedLevel);
            return savedLevel;
        } catch (error) {
            if (error.code === '23505') {
                throw new ConflictException('Duplicate Entry');
            }
            throw error;
        }
    }    
      async findLevelById(id: number): Promise<LevelEntity | undefined> {
        return this.levelRepository.findOne({ where: { id } });
      }
}
