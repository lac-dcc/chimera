// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "Memory.v"
`timescale 1ns / 1ns
`define clock_dur 50

module Memory_TB ();

  reg [7:0] in_bus;
  reg clk = 1'b1, rst, read_en, write_en;
  reg  [7:0] addr;

  wire [7:0] out_bus;

  Memory to_be_tested (
      .in_bus(in_bus),
      .addr(addr),
      .clk(clk),
      .rst(rst),
      .read_en(read_en),
      .write_en(write_en),
      .out_bus(out_bus)
  );

  always begin
    #(`clock_dur) clk = ~clk;
  end

  initial begin
    rst = 1'b1;
    #(`clock_dur * 1 * 2) rst = 1'b0;
    #(`clock_dur * 1 * 2);
    addr = 8'd10;
    write_en = 1'b1;
    in_bus = 8'd34;
    #(`clock_dur * 1 * 2);
    write_en = 1'b0;
    read_en  = 1'b1;
    #(`clock_dur * 1 * 2) $stop;
  end

endmodule
