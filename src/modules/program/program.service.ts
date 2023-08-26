import { LevelEntity } from 'src/commun/entities/level/level';
import { CreateLevelDto } from './../../commun/dto/level/level-create.dto';
import { ConflictException, Injectable } from '@nestjs/common';
import * as bcrypt from 'bcrypt'
import { Repository } from 'typeorm';
import { ProgramEntity } from 'src/commun/entities/program/program';
import { InjectRepository } from '@nestjs/typeorm';
import { ProgramCreateDTO } from 'src/commun/dto/program/program-create.dto';

@Injectable()
export class ProgramService {
    constructor(
        @InjectRepository(ProgramEntity)
        private readonly programRepository : Repository<ProgramEntity>
    ){}

    async all():Promise<ProgramEntity[]>{
        return await this.programRepository.find()
    }



    async createProgram(dto: ProgramCreateDTO): Promise<ProgramEntity> {        
    
        try {
            
    
            const program = await this.programRepository.save({
                title :dto.title,
                contenu :dto.contenu
                
            });
    
            return program
        } catch (error) {
            if (error.code === 11000) {
                throw new ConflictException('Duplicate Email!!');
            }
            throw error;
        }
    }

    async findProgramById(id: number): Promise<ProgramEntity | undefined> {
        return this.programRepository.findOne({ where: { id } });
      }
}
