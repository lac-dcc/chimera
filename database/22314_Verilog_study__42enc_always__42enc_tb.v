// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps
module _42enc_tb;
  reg [3:0] y1;
  wire [1:0] a1;

  _42enc uut (
    .y(y1),
    .a(a1)
  );

  initial begin
    $dumpfile("_42enc_tb.vcd");
    $dumpvars(0, _42enc_tb);
    y1 = 4'b0000;

    #20;
    #20 y1 = 4'b0001;
    #20 y1 = 4'b0010;
    #20 y1 = 4'b0100;
    #20 y1 = 4'b1000;
    #20;
  end

  initial begin
    $monitor("y = %b | a = %b", y1, a1);
  end

endmodule