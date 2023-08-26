import { Exclude } from "class-transformer";
import { UserGender } from "src/commun/enums/gender.enum";
import { UserStatus } from "src/commun/enums/status.enum";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { LevelEntity } from "../level/level";

@Entity('users')
export class UserEntity{
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    first_name: string;

    @Column()
    last_name: string; 

    @Column({ type: 'enum', enum: UserGender, default: UserGender.MALE  })
    gender: UserGender;

    @Column()
    birthDate: Date;

    @Column()
    adress: string;

    @Column({default: true })
    actif: boolean;

    @Column()
    attributionDate: Date;

    @Column()
    gsm: string;

    @Column({unique: true})
    email: string;

    @Column()
    @Exclude()
    password: string;

    @Column({ type: 'enum', enum: UserStatus, default: UserStatus.MEMBER })
    status: UserStatus;

    // @ManyToMany(() => RoleEntity, role => role.users)
    // @JoinTable({
    //     name: 'user_role',
    //     joinColumn: { name: 'user_id', referencedColumnName: 'id' },
    //     inverseJoinColumn: { name: 'role_id', referencedColumnName: 'id' }
    // })
    // roles: RoleEntity[];
    @ManyToOne(() => LevelEntity, level => level.users, { nullable: true })
    level: LevelEntity;
}