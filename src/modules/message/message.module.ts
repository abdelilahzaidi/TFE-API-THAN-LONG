import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MessageEntity } from 'src/commun/entities/message/message';

@Module({
    imports:[
        TypeOrmModule.forFeature([MessageEntity]),
        
      ],
      providers: [],
      controllers: [],
      exports:[]
})
export class MessageModule {}
