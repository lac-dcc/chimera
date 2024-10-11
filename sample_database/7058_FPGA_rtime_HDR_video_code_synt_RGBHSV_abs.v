// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//Author: Sharshin Vladislav shvladspb@gmail.com

module abs
#(
	parameter W	= 8
)
(
	input wire  				clk,             
	input wire		[W-1: 0]	data_in,
	output reg		[W-1: 0]	data_out	
);

always @( posedge clk )	
	if ( data_in[W-1] )
		begin
			data_out[W-2:0]	<= ~data_in[W-2:0] + 1'h1;
			data_out[W-1]	<= 1'h0;
		end
	else
		begin
			data_out	<= data_in;
		end

endmodule




