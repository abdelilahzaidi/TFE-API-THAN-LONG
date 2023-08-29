import { Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { EventEntity } from "../event/event";
import { CourEntity } from "../cour/cour";

@Entity('lieu')
export class LieuEntity{
    @PrimaryGeneratedColumn()
    id : number;

    @Column()
    adresse: string;

    // @ManyToOne(() => EventEntity, event => event, { nullable: true })
    // event: EventEntity[];

    // @ManyToOne(() => CourEntity, cour => cour.lieu)
    // cour:CourEntity[];

}