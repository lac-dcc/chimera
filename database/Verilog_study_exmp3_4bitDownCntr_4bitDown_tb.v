// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps
module _4bitDown_tb;
reg clk, set;
wire [3:0] o;

_4bitDown uut(
  .clk(clk), .set(set),
  .o(o)
);

always begin
  clk = ~clk;
  #5;
end

  initial begin
    $dumpfile("_4bitDown_tb.vcd");
    $dumpvars(0, _4bitDown_tb);

    clk <= 0;
    set <= 1;
    #10;

    set <= 0;
    #150;
    $finish;
  end

  initial begin
    $monitor($time, " clk=%b, set=%b, o=%b", clk, set, o);
  end

endmodule

