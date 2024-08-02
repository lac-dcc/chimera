// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

module testbench;

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

wire [2:0]w;

lfsr lfsr(clk, w);

initial begin
    $dumpvars;
    #100 $finish;
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

module testbench;

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

wire [2:0]w;

lfsr lfsr(clk, w);

initial begin
    $dumpvars;
    #100 $finish;
end

endmodule
