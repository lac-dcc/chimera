// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module Register(clk,In,Out);
// I/O ports

input clk;
input [3:0]In;
output [3:0] Out;
reg [3:0] Out;
always @ (posedge clk)
begin
Out <= In;
end
endmodule
