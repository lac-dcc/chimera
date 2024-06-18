// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns/1ns

module clockDiv(
    output clkDiv,
    input clk
);

reg clkDiv;
initial
begin
    clkDiv = 0;
end

always @(posedge clk)
begin
    clkDiv = ~clkDiv;
end

endmodule
