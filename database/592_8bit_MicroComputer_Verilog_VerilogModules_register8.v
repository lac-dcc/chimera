// This program was cloned from: https://github.com/TheSUPERCD/8bit_MicroComputer_Verilog
// License: MIT License

`timescale 1ns/1ps
module register8(input clk, input [7:0] D, input EI, output reg [7:0] Q);
wire CLK;
assign CLK=(clk & EI);
always @(posedge CLK)
begin
    Q <= D;
end
endmodule