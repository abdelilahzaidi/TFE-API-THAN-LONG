import { Module, forwardRef } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserEntity } from 'src/commun/entities/user/user';
import { LevelModule } from '../level/level.module';
import { RoleModule } from '../role/role.module';
import { RoleEntity } from 'src/commun/entities/role/role';
import { RoleService } from '../role/role.service';

@Module({
  imports:[TypeOrmModule.forFeature([UserEntity,RoleEntity],), 
  forwardRef(() => RoleModule),
    forwardRef(() => LevelModule),
 
  
],
  providers: [UserService, RoleService],
  controllers: [UserController],
  exports:[UserService]
})
export class UserModule {}
