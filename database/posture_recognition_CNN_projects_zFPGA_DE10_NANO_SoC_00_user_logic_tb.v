// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

`timescale 1 ns / 1 ps
`include "vga_config.inc"
module tb;
	
	reg			FPGA_CLK1_50, FPGA_CLK2_50, FPGA_CLK3_50;
	always #10	FPGA_CLK1_50 <= ~FPGA_CLK1_50;	// 50 mhz
	always #10	FPGA_CLK2_50 <= ~FPGA_CLK2_50;	// 50 mhz
	always #10	FPGA_CLK3_50 <= ~FPGA_CLK3_50;	// 50 mhz
	
	reg			[1:0]	KEY;
	/////////
	// top
	ghrd				ghrd_inst(
							.FPGA_CLK1_50(FPGA_CLK1_50),
							.FPGA_CLK2_50(FPGA_CLK2_50),
							.FPGA_CLK3_50(FPGA_CLK3_50),
							.KEY(KEY)
						);
	
	initial
	begin
	
		#0		KEY = 2'B10; FPGA_CLK1_50 = 0; FPGA_CLK2_50 = 0; FPGA_CLK3_50 = 0;
		#1000	KEY = 2'B11; //top_inst.SAA7121_reset_n = 0;
		#200000	KEY = 2'B11; //top_inst.SAA7121_reset_n = 1;
		
		//#10		$stop;
		
	end
	
	//////////////////
endmodule