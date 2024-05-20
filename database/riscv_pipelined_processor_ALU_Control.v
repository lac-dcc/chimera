// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module ALU_Control(
    input [1:0] ALUOp,
    input [3:0] Funct,
    output reg [3:0] Operation
    );
    always @(*)
    begin
    if (ALUOp == 2'b00)
        Operation <= 4'b0010;    
    else if (ALUOp == 2'b01)
        Operation <= 4'b0110;
    else if (ALUOp == 2'b10)
        begin
            if (Funct == 4'b0000)
                Operation <= 4'b0010;
            if (Funct == 4'b1000)
                Operation <= 4'b0110;
            if (Funct == 4'b0111)
                Operation <= 4'b0000;
            if (Funct == 4'b0110)
                Operation <= 4'b0001;
        end
    else if (ALUOp == 2'b11)
        begin
            if (Funct[0] == 1'b0) // addi
                Operation <= 4'b0010;
            else
                Operation <= 4'b1111; // slli
        end
    end
endmodule
