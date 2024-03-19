`timescale 1ns/1ps
module register4(input clk, input [3:0] D, input EI, output reg [3:0] Q);
wire CLK;
assign CLK=(clk & EI);
always @(posedge CLK)
begin
    Q <= D;
end
endmodule