// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 05:14:00 PM
// Design Name: 
// Module Name: Controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Controller (
    input [6:0] OP,funct7,
    input [2:0] funct3,
    output reg MemWriteD,ALUSrcD,RegWriteD,JumpD,BranchD,
    output reg [1:0] ResultSrcD,
    output reg [2:0] ALUControlD,
    output reg [2:0] Imm_SrcD,
    output reg WD3_SrcD
);
    always @(*)begin
         BranchD <=(OP==7'b1100011)?1'b1:1'b0;
    end
    
    wire [9:0] check;
    assign check={{funct7},{funct3}};
    reg [1:0] ALUOp;
    always @(OP) begin
	{RegWriteD,MemWriteD,BranchD,JumpD}=4'd0;
	{ALUSrcD,ResultSrcD,Imm_SrcD,WD3_SrcD,ALUOp}=11'bxxxxxxxxxxx;
        casex (OP)
            7'b0110011: begin  //R_type
                RegWriteD <= 1;
                Imm_SrcD <= 3'bxxx;
                ALUSrcD <= 0;
                MemWriteD <= 0;
                ResultSrcD <= 2'b00;
                ALUOp <= 2'b00;
                WD3_SrcD <=0;
            end 

            7'b0010011:begin  //I_type
                RegWriteD <= 1;
                Imm_SrcD <= 3'b000;
                ALUSrcD <= 1;
                MemWriteD <= 0;
                ResultSrcD<= 2'b00;
                ALUOp <= 2'b01;
                WD3_SrcD <=0;
            end

            7'b1100111:begin  //jalr
                RegWriteD <= 1;
                Imm_SrcD <= 3'b000;
                ALUSrcD <= 1;
                MemWriteD <= 0;
                ResultSrcD <= 2'b10;
                ALUOp <= 2'b11;
                WD3_SrcD <=1;
                JumpD <=1;
            end

            7'b0000011:begin  //Lw
                RegWriteD <= 1;
                Imm_SrcD <= 3'b000;
                ALUSrcD <= 1;
                MemWriteD <= 0;
                ResultSrcD <= 2'b01;
                ALUOp <= 2'b10;
                WD3_SrcD <=0;
            end

            7'b0100011:begin  //S_type
                RegWriteD <= 0;
                Imm_SrcD <= 3'b001;
                ALUSrcD <= 1;
                MemWriteD <= 1;
                ResultSrcD <= 2'bxx;
                ALUOp <= 2'b10;
                WD3_SrcD <=0;
            end
            7'b1100011:begin //B_type
                RegWriteD <= 0;
                Imm_SrcD <= 3'b010;
                ALUSrcD <= 0;
                MemWriteD <= 0;
                ResultSrcD <= 2'b00;
                BranchD <= 1;
                ALUOp <= 2'b10;
                WD3_SrcD <=0;
            end
            7'b0110111:begin//lui
                RegWriteD <= 1;
                Imm_SrcD <= 3'b011;
                ALUSrcD <= 1'bx;
                MemWriteD <= 0;
                ResultSrcD <= 2'b11;
                ALUOp <= 2'bxx;
                WD3_SrcD <=0;
            end    
            7'b1101111:begin//jal
                RegWriteD <= 1;
                Imm_SrcD <= 3'b100;
                ALUSrcD <= 1'bx;
                MemWriteD <= 0;
                ResultSrcD <= 2'b10;
                ALUOp <= 2'bxx;
                WD3_SrcD <=1;
            end  
            default:begin
                RegWriteD <= 0;
                Imm_SrcD <= 3'bxxx;
                ALUSrcD <= 1'bx;
                MemWriteD <= 0;
                ResultSrcD <= 2'bxx;
                ALUOp <= 2'bxx;
                WD3_SrcD <=1'bx;
            end 
            
        endcase
        
    end
    always @(ALUOp,check,funct3,funct7) begin
	ALUControlD=3'bxxx;
        case (ALUOp)
             2'b00:begin ALUControlD<=(check==10'b0)?3'b0:
                  (check==10'd256)?3'b001:
                  (check==10'd7)?3'b010:
                  (check==10'd6)?3'b011:
                  (check==10'd2)?3'b100:3'bxxx;
                  end
            2'b01:begin ALUControlD<=(funct3==3'b000)?3'b0:
                  (funct3==3'b110)?3'b011:
                  (funct3==3'b100)?3'b101:
                  (funct3==3'b010)?3'b100:3'bxxx;
                   end
            2'b10:begin ALUControlD<=(funct3==10'b010)?3'b0:
                  (funct3==3'b0)?3'b001:
                  (funct3==3'b001)?3'b001:
                  (funct3==3'b100)?3'b100:
                  (funct3==3'b101)?3'b100:3'bxxx;
                   end
            2'b11: ALUControlD<=3'b0;
            default: ALUControlD <= 3'bxxx;
        endcase
        
    end
endmodule