// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps
module _24dec_tb;
  reg [1:0] a1;
  reg e1;
  wire [3:0] y1;

  _24dec uut (
    .a(a1),
    .e(e1),
    .y(y1)
  );

  initial begin
    $dumpfile("_24dec_tb.vcd");
    $dumpvars(0, _24dec_tb);
    a1 = 2'b00; e1 = 0;

    // #20 a1 = 2'b00; e1 = 1'b0;
    #20 a1 = 2'b00; e1 = 1'b1;
    #20 a1 = 2'b01; e1 = 1'b1;
    #20 a1 = 2'b10; e1 = 1'b1;
    #20 a1 = 2'b11; e1 = 1'b1;
    #20;
  end

  initial begin
    $monitor("a=%b e=%b y=%b", a1, e1, y1);
  end

endmodule