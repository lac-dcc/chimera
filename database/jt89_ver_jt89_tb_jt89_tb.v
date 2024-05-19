// This program was cloned from: https://github.com/jotego/jt89
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module jt89_tb;

wire signed [9:0] ch0, ch1, ch2, noise;
reg clk, rst, wr_n;
reg [7:0] din;

initial begin
	$dumpfile("jt89_tb.lxt");
	$dumpvars;
	$dumpon;
end

initial begin
	clk = 0;
	forever #10 clk = ~clk;
end

integer cnt;

initial begin
	rst = 0;
	din = 8'd0;
	wr_n= 1'b1;
	#5 rst = 1;
	#35 rst = 0;
	`include "inputs.vh"
end

wire signed [10:0] sound;

reg [1:0] cnt2;
reg clk_en;

always @(posedge clk)
	if( rst ) begin
		cnt2 <= 2'b0;
		clk_en <= 1'b0;
	end
	else begin
		cnt2 <= cnt2 +1'b1;		
		clk_en <= cnt2==2'b11;
	end

reg rst2;

always @(posedge clk)
	if( rst ) rst2<=1'b1;
	else if(clk_en ) rst2<=1'b0;

jt89 u_uut(
	.clk	( clk	),
	.clk_en	( 1'b1  ),
	.rst	( rst2	),
	.wr_n	( wr_n	),
	.din	( din	),
	.sound	( sound	)
);

`ifdef SIMLIMIT
initial #(1000*`SIMLIMIT) $finish;
`endif


endmodule
