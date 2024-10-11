// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps

module _7bitSync_tb;
reg clk, rst, en;
reg [6:0] i;
wire [6:0] o;

_7bitSync uut(
  .clk(clk), .rst(rst), .en(en),
  .i(i),
  .o(o)
);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("7bitSync_tb.vcd");
    $dumpvars(0, _7bitSync_tb);

    clk <= 0;
    rst <= 1;
    en <= 0;
    i <= 7'b0000_000;

    #10 rst <= 0; en <= 1;
    #10 i <= 7'b0000_001;
    #10 i <= 7'b0000_010;
    #10 i <= 7'b0000_011;
    #10 i <= 7'b0000_100;
    #10 i <= 7'b0000_101;
    #10 i <= 7'b0000_110;
    #10 i <= 7'b0000_111;
    #10 i <= 7'b0001_000;
    #10;
    $finish;
  end

  initial begin
    $monitor("clk=%b rst=%b en=%b i=%b o=%b", clk, rst, en, i, o);
  end

endmodule

