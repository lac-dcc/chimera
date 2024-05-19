// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//
//                                      Copyright (C) 2015 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
	
	initial begin
		$dumpfile("tb_top.vcd");
		$dumpvars(1, tb_top);
		$dumpvars(1, tb_top.i_top);
//		$dumpvars(0, tb_top.i_top.i_vdma_axi4_to_axi4s);
		$dumpvars(0, tb_top.i_top.i_vdma_axi4s_to_axi4);
	
	#1000000
		$finish;
	end
	
	
	top
	/*		#(
				.BUF_STRIDE		(4096),
				.IMAGE_X_NUM	(640),
				.IMAGE_Y_NUM	(48)
			)
	*/	i_top
			(
				.led	()
			);
	
endmodule


`default_nettype wire


// end of file
