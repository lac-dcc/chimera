// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps
module ALUControl (
    OpCode,
    Funct,
    ALUCtrl,
    Sign
);

parameter ADD = 0;
parameter SUB = 1;
parameter AND = 2;
parameter OR = 3;
parameter XOR = 4;
parameter NOR = 5;
parameter SLL = 6;
parameter SRL = 7;
parameter SRA = 8;
parameter SLT = 9;

input [5:0] OpCode;
input [5:0] Funct;
output [4:0] ALUCtrl;
output Sign;

reg [4:0] ALUCtrl;
reg Sign;

always @(OpCode, Funct) begin
    case(OpCode)
    6'h23: ALUCtrl <= ADD;  // lw
    6'h20: ALUCtrl <= ADD;  // lb
    6'h2b: ALUCtrl <= ADD;  // sw
    6'h0f: ALUCtrl <= ADD; // lui
    6'h08: begin
        ALUCtrl <= ADD;
        Sign <= 1;
    end
    6'h09: begin
        ALUCtrl <= ADD;
        Sign <= 0;
    end
    6'h0c: ALUCtrl <= AND;
    6'h0a: begin
        ALUCtrl <= SLT;
        Sign <= 1;
    end
    6'h0b: begin
        ALUCtrl <= SLT;
        Sign <= 0;
    end
    6'h04: ALUCtrl <= SUB;  // beq
    default: begin // Opcode = 0
        case(Funct)
        6'h20: begin
            ALUCtrl <= ADD;
            Sign <= 1;
        end
        6'h21: begin
            ALUCtrl <= ADD;
            Sign <= 0;
        end
        6'h22: begin
            ALUCtrl <= SUB;
            Sign <= 1;
        end
        6'h23: begin
            ALUCtrl <= SUB;
            Sign <= 0;
        end
        6'h24: ALUCtrl <= AND;
        6'h25: ALUCtrl <= OR;
        6'h26: ALUCtrl <= XOR;
        6'h27: ALUCtrl <= NOR;
        6'h00: ALUCtrl <= SLL;
        6'h02: begin
            ALUCtrl <= SRL;
            Sign <= 0;
        end
        6'h03: begin
            ALUCtrl <= SRA;
            Sign <= 1;
        end
        6'h2a: begin
            ALUCtrl <= SLT;
            Sign <= 1;
        end
        6'h2b: begin
            ALUCtrl <= SLT;
            Sign <= 0;
        end
        6'h08: ALUCtrl <= ADD;  // jr
        6'h09: ALUCtrl <= ADD;  // jalr
        default: ALUCtrl <= ALUCtrl;
        endcase
    end
    endcase    
end
    
endmodule