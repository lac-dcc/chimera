// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
module InstructionMemory (
    input [31:0] i_Addr,
    output reg [5:0] i_Ctr,  // [31-26]
    output reg [5:0] i_Funcode,  // [5-0]
    output reg [31:0] i_Instruction  // [31-0]
);
  parameter SIZE_IM = 128;  // size of this memory, by default 128*32
  reg [31:0] Imem[SIZE_IM-1:0];  // instruction memory
  integer n;
  initial begin
    for (n = 0; n < SIZE_IM; n = n + 1) begin
      Imem[n] = 32'b11111100000000000000000000000000;
    end
    $readmemb("instructions.mem", Imem);
    i_Instruction = 32'b11111100000000000000000000000000;
  end
  always @(i_Addr) begin
    if (i_Addr == -4) begin  // init
      i_Instruction = 32'b11111100000000000000000000000000;
    end else begin
      i_Instruction = Imem[i_Addr>>2];
    end
    i_Ctr = i_Instruction[31:26];
    i_Funcode = i_Instruction[5:0];
  end
endmodule
