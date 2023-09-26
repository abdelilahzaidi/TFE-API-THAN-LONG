import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToMany,
} from 'typeorm';
import { SeanceEntity } from '../seance/seance';

@Entity('horaire')
export class HoraireEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  heureDebut: Date;
  @Column()
  heureFin: Date;
  @Column()
  jour: Date;
  @OneToMany(() => SeanceEntity, (seance) => seance.horaire)
  seances: SeanceEntity[];
}
