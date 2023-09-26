import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SeanceEntity } from 'src/commun/entities/seance/seance';

@Module({
    imports:[
        TypeOrmModule.forFeature([SeanceEntity]),
        
      ],
      providers: [],
      controllers: [],
      exports:[]
})
export class SeanceModule {}
