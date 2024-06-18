// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
`define     F3_ADD          3'b000
`define     F3_SLL          3'b001
`define     F3_SLT          3'b010
`define     F3_SLTU         3'b011
`define     F3_XOR          3'b100
`define     F3_SRL          3'b101
`define     F3_OR           3'b110
`define     F3_AND          3'b111

`define     ALU_ADD         4'b00_00
`define     ALU_SUB         4'b00_01
`define     ALU_PASS        4'b00_11
`define     ALU_OR          4'b01_00
`define     ALU_AND         4'b01_01
`define     ALU_XOR         4'b01_11
`define     ALU_SRL         4'b10_00
`define     ALU_SRA         4'b10_10
`define     ALU_SLL         4'b10_01
`define     ALU_SLT         4'b11_01
`define     ALU_SLTU        4'b11_11

module ALU_CU(input[1:0]ALUop,input[31:0]inst, output reg[3:0]ALU_selection );
    

    always @(*)begin
    case(ALUop)
        2'b00:ALU_selection = `ALU_ADD;  //add
        2'b01:ALU_selection = `ALU_SUB;  //sub
        2'b10:begin                         //R-format
            case(inst[14:12])
                `F3_ADD:ALU_selection=(inst[30]==1)? `ALU_SUB:`ALU_ADD ;    //sub or add
                
                `F3_SLL:ALU_selection= `ALU_SLL ;         
                `F3_SLT:ALU_selection=    `ALU_SLT;     
                `F3_SLTU :ALU_selection= `ALU_SLTU;      
                `F3_XOR :ALU_selection=    `ALU_XOR;    
                `F3_SRL :ALU_selection=  (inst[30]==1)? `ALU_SRA:`ALU_SRL ;  
                `F3_OR   :ALU_selection=   `ALU_OR;    
                `F3_AND  :ALU_selection=   `ALU_AND;                    
                default: ALU_selection = 4'b1111;   //That wil; not happen
            endcase 
        end
        
        default: ALU_selection = 4'b1111;   //That wil; not happen
    endcase
    end

endmodule



