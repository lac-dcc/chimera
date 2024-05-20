// This program was cloned from: https://github.com/jferrer08/latinpractice
// License: Apache License 2.0

`timescale 1ns / 1ps

module contadorTDC(start, clk, cuenta);

input start;
input clk;

output reg [7:0] cuenta;

reg [7:0] q;


always @(posedge clk, negedge start)
begin
	if (start == 0)
		q <= 0;
	else
		q <= q + 1'b1;
end

always @(posedge clk)
begin
	cuenta <= q;
end

endmodule
