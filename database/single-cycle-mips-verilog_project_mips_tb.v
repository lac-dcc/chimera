// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
`define CYCLE_TIME 20
module mips_tb;
  reg clk;
  reg rst;
  // segments for the 7-segment displays
  wire [6:0] seg_first, seg_second, seg_third, seg_fourth, seg_fifth;
  integer i;  // loop variable
  always #(`CYCLE_TIME / 2) clk = ~clk;
  mips uut (
      .i_Clk(clk),
      .i_Rst(rst),
      .o_Seg_first(seg_first),
      .o_Seg_second(seg_second),
      .o_Seg_third(seg_third),
      .o_Seg_fourth(seg_fourth),
      .o_Seg_fifth(seg_fifth)
  );
  initial begin
    // Initialize data memory
    for (i = 0; i < 32; i = i + 1) begin
      uut.inst_DataMemory.Dmem[i] = 32'b0;
    end
    // Initialize Register File
    for (i = 0; i < 32; i = i + 1) begin
      uut.inst_RegisterFile.RegData[i] = 32'b0;
    end
    clk = 0;
  end
  initial begin
    #1800 $finish;
  end
endmodule
