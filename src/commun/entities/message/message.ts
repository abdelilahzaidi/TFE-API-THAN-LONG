// message.entity.ts
import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, OneToMany, ManyToMany, JoinTable } from 'typeorm';
import { UserEntity } from '../user/user';


@Entity('message')
export class MessageEntity {
    @PrimaryGeneratedColumn()
    id: number;
  
    @Column()
    titre: string;
  
    @Column()
    contenu: string;
  
    @ManyToMany(() => UserEntity, (user) => user.receivedMessages) // Correction ici
    @JoinTable()
    receivers: UserEntity[]; // Un ou plusieurs utilisateurs peuvent recevoir ce message

    @ManyToOne(() => UserEntity, (user) => user.sentMessages)
    sender: UserEntity;
  }
