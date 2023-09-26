import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SeanceUserEntity } from 'src/commun/entities/seance_user/seance-user';

@Module({imports:[
    TypeOrmModule.forFeature([SeanceUserEntity]),   
   
  ],
  providers: [],
  controllers: [],
  exports:[]})
export class SeanceUserModule {}



