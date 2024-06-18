// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


`timescale	1ns / 1ns
`default_nettype none


/*Produced by NSL Core(version=20221225), IP ARCH, Inc. Sat Apr 27 08:45:50 2024
 Licensed to :EVALUATION USER*/

//synthesis translate_off
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/
module tb;
	parameter tCYC=2;
	parameter tPD=(tCYC/10);

	reg p_reset;
	reg m_clock;

	test test_instance(
		.p_reset(p_reset),
		.m_clock(m_clock)
	);

	initial forever #(tCYC/2) m_clock = ~m_clock;

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,test_instance);
	end

	initial begin
		#(tPD)
			p_reset = 1;
			m_clock = 0;
		#(tCYC)
			p_reset = 0;
	end

endmodule

//synthesis translate_on
