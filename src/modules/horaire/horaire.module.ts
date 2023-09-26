import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { HoraireEntity } from 'src/commun/entities/horaire/horaire';

@Module({
    imports:[
        TypeOrmModule.forFeature([HoraireEntity]),
        
      ],
      providers: [],
      controllers: [],
      exports:[]
})
export class HoraireModule {}
