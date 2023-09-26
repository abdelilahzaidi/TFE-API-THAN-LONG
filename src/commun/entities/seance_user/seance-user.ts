import { Entity, PrimaryGeneratedColumn, ManyToOne, OneToMany, Column } from "typeorm";
import { SeanceEntity } from "../seance/seance";
import { UserEntity } from "../user/user";

@Entity('seance_user')
export class SeanceUserEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(() => SeanceEntity, (seance) => seance.seanceUsers)
    seance: SeanceEntity;

    @ManyToOne(() => UserEntity, (user) => user.seanceUsers)
    user: UserEntity;

    @Column({ default: false }) // Par défaut, la présence est à "false" (absence)
    presence: boolean;
}

