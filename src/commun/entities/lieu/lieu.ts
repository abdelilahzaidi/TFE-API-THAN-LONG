import { Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";


@Entity('lieu')
export class LieuEntity{
    @PrimaryGeneratedColumn()
    id : number;

    @Column()
    adresse: string;
}