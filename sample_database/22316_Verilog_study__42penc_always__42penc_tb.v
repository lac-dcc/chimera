// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps
module _42penc_tb;

  reg [3:0] y1;
  wire [1:0] a1;

  _42penc uut(
    .y(y1),
    .a(a1)
  );

  initial begin
    $dumpfile("_42penc_tb.vcd");
    $dumpvars(0, _42penc_tb);

    y1 = 4'b0000;

    #10;
    #10 y1 = 4'b0001;
    #10 y1 = 4'b0010;
    #10 y1 = 4'b0100;
    #10 y1 = 4'b1000;
    #10 y1 = 4'b0101;   // for priority encoder, only the highest bit is considered
    #10 $finish;
  end

  initial begin
    $monitor("y = %b | a = %b", y1, a1);
  end

endmodule