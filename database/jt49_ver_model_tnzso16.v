// This program was cloned from: https://github.com/jotego/jt49
// License: GNU General Public License v3.0

module vcd_tnzso16(
	input clk,
	output  wr_n,
	output [7:0] din,
	output [3:0] addr,
	output reg eof=0
);
	reg [77-1:0] data[0:819-1];
	wire [63:0] vcd_time;
	integer idx=0;

	initial $readmemb("tnzso16.bin",data);
	assign {vcd_time,wr_n,din,addr} = data[idx];

	always @(posedge clk) begin
		if( !eof ) begin
			if( $time > vcd_time ) idx <= idx+1;
			if( idx==819-1 ) begin
				eof <= 1;
				$display("tnzso16 data completely parsed");
			end
		end
	end
endmodule
