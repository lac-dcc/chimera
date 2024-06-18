// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

/*Instruction Register
Stores the instruction to be executed
Format
instruction[7:4] := opcode
instruction[3:2] := source
instruction[1:0] := destionation
*/

module Instruction_Register #(
  parameter word_size = 8
) (
    // data_out := instruction
    output reg [word_size-1: 0] data_out,
    // data_in := Bus_2
    input [word_size-1: 0] data_in,
    // load := Load_IR
    input load,
    input clk, rst
);
    always @ (posedge clk or negedge rst)
    if (rst == 0) 
        data_out <= 0; 
    else if (load) 
        data_out <= data_in; 
endmodule