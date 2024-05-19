// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//author: давным давно, в далекой-далекой галактике...
//A long time ago in a galaxy far, far away...
`timescale 1ns / 1ns
module delay_rg
   #(parameter W = 16,         // разрядность входного и выходного сигнала
     parameter D = 10)         // задержка
   (
    input clk,
	input [W-1:0] data_in,     // входной сигнал
    output [W-1:0] data_out);   // выходной сигнал


	reg [W-1:0] rg [0:D-1]; 
	always @ (posedge clk ) begin : delay_line
	integer i;
		begin
		    rg[0] <= data_in;
			for(i=0; i<(D-1); i=i+1)
				rg[i+1] <= rg[i];
		end
	end

	assign data_out = rg[D-1];
	
endmodule








