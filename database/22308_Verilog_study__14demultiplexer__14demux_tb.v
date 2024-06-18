// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps
module _14mux_tb;
  reg [1:0] s1;
  reg i1;
  wire [3:0] y1;

  _14mux uut(
    .s(s1),
    .i(i1),
    .y(y1)
  );

  initial
    begin
      s1 = 2'b00; i1 = 1'b1;
      #10;
      #10 s1 = 2'b01; i1 = 1'b1;
      #10 s1 = 2'b10; i1 = 1'b1;
      #10 s1 = 2'b11; i1 = 1'b0;
      #10;
    end

  initial
    begin
      $monitor("s1 = %b | i1 = %b | y1 = %b", s1, i1, y1);
    end
endmodule