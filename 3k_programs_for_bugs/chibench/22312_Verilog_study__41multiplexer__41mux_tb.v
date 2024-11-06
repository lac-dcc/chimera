// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps
module _41mux_tb;
reg [3:0] i1;
reg [1:0] s1;
wire y1;

_41mux uut1(
  .i(i1),
  .s(s1),
  .y(y1)
);

  initial
    begin
      i1 = 4'b0000; s1 = 2'b00;

      #10 i1 = 4'b0001; s1 = 2'b00;
      #10 i1 = 4'b0010; s1 = 2'b01;
      #10 i1 = 4'b0100; s1 = 2'b10;
      #10 i1 = 4'b1000; s1 = 2'b11;
    end

    initial
      begin
        $monitor("i = %b | s = %b | y = %b", i1, s1, y1);
      end

endmodule