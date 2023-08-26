import { IsNotEmpty } from "class-validator";

export class CreateLevelDto {
    @IsNotEmpty()
    grade: string;

    @IsNotEmpty()
    programId: number;
}