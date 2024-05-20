// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "Register.v"
`timescale 1ns / 1ns
`define clock_dur 50

module Register_TB ();

  reg [7:0] par_in;
  reg clk = 1'b0, rst, load_en;
  wire [7:0] par_out;

  Register to_be_tested (
      .par_in(par_in),
      .clk(clk),
      .rst(rst),
      .load_en(load_en),
      .par_out(par_out)
  );

  always begin
    #(`clock_dur) clk = ~clk;
  end

  initial begin
    #(`clock_dur * 1 * 2) rst = 1'b1;
    #(`clock_dur * 1 * 2) rst = 1'b0;
    #(`clock_dur * 1 * 2) load_en = 1'b1;
    par_in = 8'd17;
    #(`clock_dur * 3 * 2) $stop;
  end

endmodule
