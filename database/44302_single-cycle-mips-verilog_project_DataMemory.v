// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
module DataMemory (
    input i_clk,
    input [31:0] i_addr,
    input [31:0] i_wData,
    input [31:0] i_ALUresult,
    input i_MemWrite,
    input i_MemRead,
    input i_MemtoReg,
    output reg [31:0] o_rData
);
  parameter SIZE_DM = 128;  // size of this memory, by default 128*32
  reg [31:0] Dmem[SIZE_DM-1:0];  // instruction memory
  integer i;
  initial begin
    for (i = 0; i < SIZE_DM; i = i + 1) begin
      Dmem[i] = 32'b0;
    end
  end
  always @(i_addr or i_MemRead or i_MemtoReg or i_ALUresult) begin
    if (i_MemRead == 1) begin
      if (i_MemtoReg == 1) begin
        o_rData = Dmem[i_addr];
      end else begin
        o_rData = i_ALUresult;
      end
    end else begin
      o_rData = i_ALUresult;
    end
  end
  always @(posedge i_clk) begin  // MemWrite, wData, addr
    if (i_MemWrite == 1) begin
      Dmem[i_addr] = i_wData;
    end
  end
endmodule
