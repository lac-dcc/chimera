`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/24 18:21:42
// Design Name: 
// Module Name: MemoryPart
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


module MemoryPart #(
    parameter ADDR_LEN = 4,
    parameter INSTRUCTION_LEN = 10
)
(
    input                          Clock   ,
    input                          PClocd  ,
    input                          Reset   ,
    input                          IRload  ,
    input                          Jmux    ,
    output reg [INSTRUCTION_LEN:0] IR
    );

    wire [INSTRUCTION_LEN-1:0] instruction;
    reg  [ADDR_LEN - 1:0] PC = 0;
    wire [ADDR_LEN - 1:0] PC_JMP = IR[ADDR_LEN - 1:0];
    wire [ADDR_LEN - 1:0] PC_INC = PC + 1;
    wire [ADDR_LEN - 1:0] PC_NXT = Jmux ? PC_INC : PC_JMP;

    always @ (posedge Clock) begin
        if(IRload)
            IR <= instruction;
    end

    always @ (posedge Clock) begin
        if(Reset)
            PC <= 0;
        else
        if(PClocd)
            PC <= PC_NXT;
    end

    ProgramMemory ProgramMemory_inst(
    .addra(PC),
    .clka(Clock),
    .douta(instruction)
);


endmodule
