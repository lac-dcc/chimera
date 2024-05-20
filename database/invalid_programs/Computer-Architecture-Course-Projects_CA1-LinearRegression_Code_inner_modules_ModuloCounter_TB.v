// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "ModuloCounter.v"
`timescale 1ns/1ns
`define clock_dur 50
module ModuloCounter_TB ();
  reg clk = 1'b1, cnt_en = 1'b1, rst = 1'b0;
  wire [7:0] out;
  wire cout;

  ModuloCounter to_be_tested (
      .clk(clk),
      .rst(rst),
      .cnt_en(cnt_en),
      .out(out),
      .cout(cout)
  );

  always begin
    #`clock_dur clk = ~clk;
  end
  initial begin
    #(`clock_dur * 1 * 2) rst = 1'b1;
    #(`clock_dur * 1 * 2) rst = 1'b0; 
    #(`clock_dur * 150 * 2); //test modulo
    #(`clock_dur * 3 * 2) cnt_en = 1'b0; //test count enable after 3 clock
    #(`clock_dur * 10 * 2) rst = 1'b1; //after 10 clocks nothing should change and then counter will reset ro 0
    #(`clock_dur * 10 * 2) $stop;
  end
endmodule
