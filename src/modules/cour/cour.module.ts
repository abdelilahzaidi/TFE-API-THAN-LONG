import { Module } from '@nestjs/common';
import { CourController } from './cour.controller';
import { CourService } from './cour.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CourEntity } from 'src/commun/entities/cour/cour';

@Module({
  imports:[TypeOrmModule.forFeature([CourEntity])],
  controllers: [CourController],
  providers: [CourService],
  exports:[CourService]
})
export class CourModule {}
