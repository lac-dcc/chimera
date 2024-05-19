// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module jt51_interpol_tb;


	wire fir_sample;
	reg	fir_clk;
	wire signed [15:0] left_out;
	wire signed [15:0] right_out;


	initial begin // 50MHz
		fir_clk = 0;
		forever #10 fir_clk = ~fir_clk;
	end

	initial begin
		rst = 0;
		#(280*3) rst=1;
		#(280*4) rst=0;
	end

	initial begin 
		$dumpfile("jt51_interpol.lxt");
		$dumpvars();
		$dumpon;
	end

	always @(posedge prog_done) #100 $finish;			

	initial #(1000*1000*10) $finish;

`include "../common/jt51_test.vh"

jt51_interpol i_jt51_interpol (
	.clk        (fir_clk    ),
	.rst        (rst        ),
	.sample_in  (sample     ),
	.left_in    (xleft    	),
	.right_in   (xright   	),
	.left_other (16'd0 		),
	.right_other(16'd0		),
	.out_l		(left_out   ),
	.out_r		(right_out  ),
	.sample_out (fir_sample )
);


endmodule
