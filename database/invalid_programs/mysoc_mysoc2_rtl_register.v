// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

`include "dff.v"

module register #(parameter WIDTH=16)(clk, re, we, rstn, data);
	input wire clk;
	input wire re;
	input wire we;
	input wire rstn;
	inout wire [WIDTH-1:0] data;

	genvar i;
	generate 
		for(i=0;i<WIDTH;i=i+1) begin
			dff bt (data[i],re,we,rstn,clk,data[i]);
		end
	endgenerate

endmodule
