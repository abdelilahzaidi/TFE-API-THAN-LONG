import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DateCourEntity } from 'src/commun/entities/dateCour/dateCour';

@Module({
    imports:[
        TypeOrmModule.forFeature([DateCourEntity]),
        
      ],
      providers: [],
      controllers: [],
      exports:[]
})
export class DateCourModule {}
