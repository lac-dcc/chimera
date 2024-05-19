// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

/*
* AUDIODAC TESTBENCH -- 16b Delta-Sigma Modulator with Single-Bit Output
*
* (c) 2021 Harald Pretl (harald.pretl@jku.at)
* Johannes Kepler University Linz, Institute for Integrated Circuits
*
* This is the testbench for audiodac_sinegen.v
*/

`timescale 100ns / 1ns

`include "../../rtl/audiodac_sinegen.v"

/* verilator lint_off STMTDLY */

module audiodac_sinegen_tb;

	// inputs
	reg reset_n = 1'b1;
	reg clk = 1'b0;
	reg read = 1'b1;
	reg sgen_en = 1'b0;
	reg [3:0] sgen_step = 4'd1;

        // outputs
	wire [15:0] SINE_OUT;

	// instantiate DUT
	audiodac_sinegen sinegen (
        	.data_o(SINE_OUT),
		.data_rd_i(read),
                .rst_n_i(reset_n),
                .clk_i(clk),
		.tst_sinegen_en(sgen_en),
		.tst_sinegen_step(sgen_step)
        );

	
	// make a clock
	always #1 clk = ~clk;

	initial begin
		#1 reset_n = 1'b0;
		#5 reset_n = 1'b1;
	end

	// here is all the initiliaztion work for the simulation
	initial begin
		// dump signals into VCD for debug
		$dumpfile("audiodac_sinegen_tb.vcd");
		$dumpvars;

		#20 sgen_en = 1'b1;
		#500 sgen_step = 4'd2;
		#500 sgen_step = 4'd4;
		#500 sgen_step = 4'd8;
		#500 sgen_step = 4'd15;

		#500 $finish;
	end

endmodule // audiodac_sinegen_tb
