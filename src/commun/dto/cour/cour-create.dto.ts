import { IsNotEmpty } from "class-validator";

export class CourCreateDTO{
    @IsNotEmpty()
    conten: string;    
    lieuId: number;
}