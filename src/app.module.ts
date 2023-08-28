import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './modules/user/user.module';
import { BdModule } from './BD/bd.modules';
import { LevelModule } from './modules/level/level.module';
import { ProgramModule } from './modules/program/program.module';
import { RoleModule } from './modules/role/role.module';
import { PeriodModule } from './modules/period/period.module';
import { TeamModule } from './modules/team/team.module';

@Module({
  imports: [
    BdModule,
    UserModule,
    LevelModule,
    ProgramModule,
    RoleModule,
    PeriodModule,
    TeamModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
