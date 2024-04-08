`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:14:45 01/25/2023 
// Design Name: 
// Module Name:    async_counter 
// Author Name: Ummidi Chandrika

//////////////////////////////////////////////////////////////////////////////////
module dff(q,qbar,clk,rst,d);
	output reg q;
	output qbar;
	input clk, rst;
	input d;

	assign qbar = ~q;

	always @(posedge clk, posedge rst)
	begin
		if (rst)
			q <= 0;
		else
			q <= d;
	end
endmodule

module async_counter(count,countbar,clk,rst);
  input clk, rst;
  output [3:0] count, countbar;
    dff dff1(count[0],countbar[0],clk     ,rst,countbar[0]);
  dff dff2(count[1],countbar[1],count[0],rst,countbar[1]);
 dff dff3(count[2],countbar[2],count[1],rst,countbar[2]);
  dff dff4(count[3],countbar[3],count[2],rst,countbar[3]);
  
endmodule 
