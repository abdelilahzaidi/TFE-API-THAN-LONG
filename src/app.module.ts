import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './modules/user/user.module';
import { BdModule } from './BD/bd.modules';
import { LevelModule } from './modules/level/level.module';
import { ProgramModule } from './modules/program/program.module';
import { LieuModule } from './modules/lieu/lieu.module';
import { CourModule } from './modules/cour/cour.module';
import { AuthModule } from './modules/auth/auth.module';
import { MessageModule } from './modules/message/message.module';
import { SeanceModule } from './modules/seance/seance.module';
import { HoraireModule } from './modules/horaire/horaire.module';
import { FactureModule } from './modules/facture/facture.module';
import { AbonnementModule } from './modules/abonnement/abonnement.module';
import { TypeAbonnementModule } from './modules/type-abonnement/type-abonnement.module';
import { DateCourModule } from './modules/date-cour/date-cour.module';
import { SeanceUserModule } from './modules/seance-user/seance-user.module';

@Module({
  imports: [
    BdModule,
    AuthModule,
    UserModule,
    LevelModule,
    ProgramModule,
    LieuModule,
    CourModule,
    MessageModule,
    SeanceModule,
    HoraireModule,
    FactureModule,
    AbonnementModule,
    TypeAbonnementModule,
    DateCourModule,
    SeanceUserModule    
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
