// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

/*
* AUDIODAC TESTBENCH -- 16b Delta-Sigma Modulator with Single-Bit Output
*
* (c) 2021-2022 Harald Pretl (harald.pretl@jku.at)
* Johannes Kepler University Linz, Institute for Integrated Circuits
*
* This is the testbench for audiodac.v
*/

`timescale 100 ns / 1 ps

//`define GL

`ifdef GL
//`define UNIT_DELAY #1
//`define FUNCTIONAL
`define USE_POWER_PINS
/* verilator lint_off INCABSPATH */
`include "/usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
`include "/usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
/* verilator lint_on INCABSPATH */
`include "../../gl/audiodac.v"
`else
`include "../../rtl/audiodac.v"
`include "../../rtl/audiodac_fifo.v"
`include "../../rtl/audiodac_dsmod.v"
`include "../../rtl/audiodac_sinegen.v"
`endif

/* verilator lint_off STMTDLY */

module audiodac_tb;

	localparam sim_mode = 1;
	localparam sim_osr = 2;
	localparam sim_volume = 15;
	localparam sim_testmode = 0;

	// housekeeping for getting data in
`ifdef GL
	localparam data_samples = 44100; // 1sec audio at 44.1kHz samplerate
`else
	localparam data_samples = 441000; // 10sec audio at 44.1kHz samplerate
`endif
	reg [15:0] data_in[0:data_samples-1]; // large memory to hold the audio
	reg data_out[0:(data_samples*(32*(2**sim_osr))-1)]; // output results written to file
	integer data_in_ctr = 0;
	integer data_out_ctr = 0;

	// configuration bits
        reg MODE = sim_mode;
        reg [1:0] OSR = sim_osr;
        reg [3:0] VOLUME = sim_volume;

	// inputs
	reg reset_n = 1'b1;
	reg clk = 1'b0;

        // outputs
	wire FIFO_FULL, FIFO_EMPTY, FIFO_ACK, DS_OUT, DS_OUT_N;

	// test modes
	reg tst_sine = sim_testmode;
	reg [3:0] tst_sine_step = 4'b1;
	reg tst_fifoloop = 1'b0;

	// instantiate DUT
	audiodac dac (
`ifdef GL
		.vssd1(1'b0),
		.vccd1(1'b1),
`endif
        	.fifo_i(DATA),
                .fifo_rdy_i(DATA_RDY),
                .fifo_ack_o(FIFO_ACK),
                .fifo_full_o(FIFO_FULL),
                .fifo_empty_o(FIFO_EMPTY),
                .rst_n_i(reset_n),
                .clk_i(clk),
                .mode_i(MODE),
                .volume_i(VOLUME),
                .osr_i(OSR),
                .ds_o(DS_OUT),
                .ds_n_o(DS_OUT_N),
		.tst_sinegen_en_i(tst_sine),
		.tst_sinegen_step_i(tst_sine_step),
		.tst_fifo_loop_i(tst_fifoloop)
        );

	
	// make a clock
	always #1 clk = ~clk;

	// handle FIFO input data
	reg [15:0] DATA = 16'b0;
	reg DATA_RDY = 1'b0, WAIT_FOR_EMPTY = 1'b0;

	always @(negedge clk) begin
		
		// provide input data
		if (~FIFO_FULL && ~FIFO_ACK && ~DATA_RDY && ~WAIT_FOR_EMPTY && reset_n) begin
			// option 1: just use a simple counter as data
			//#1 DATA <= DATA + 1;
			
			// option 2: use data from file
			DATA <= data_in[data_in_ctr];
			data_in_ctr <= data_in_ctr + 1;

			// signal to FIFO that data is ready
			DATA_RDY <= 1'b1;

			// no more input data left? write result and exit
			if (data_in_ctr == data_samples) begin
				$writememh("verilog_bin_out.txt", data_out);
				$finish;
			end
		end
	
		// de-assert data_rdy when data transfer ack'd by FIFO
		if (FIFO_ACK) DATA_RDY <= 1'b0;


		// The FIFO data write-in is done in a bursty nature, like a
		// host system would likely do. When the FIFO is empty we write
		// until the FIFO is full, then we wait for the FIFO to get
		// empty again--then we do another bursty data transfer. This
		// is meant to put less burden on the host system, so just an
		// interrupt service routine is required, no constant polling
		// of the data_rdy line, instead fifo_empty can trigger the ISR.

		if (FIFO_FULL) begin
			WAIT_FOR_EMPTY <= 1'b1; 
		end else if (FIFO_EMPTY) begin
			WAIT_FOR_EMPTY <= 1'b0;
		end
	end
	
	// store simulation result into memory for later dump
	always @(negedge clk) begin
		if (reset_n) begin
			data_out[data_out_ctr] <= DS_OUT;
			data_out_ctr <= data_out_ctr + 1;
		end
	end

	initial begin
		#1 reset_n = 1'b0;
		#5 reset_n = 1'b1;
	end

	// here is all the initilization work for the simulation
	initial begin
		// read in the testdata into the memory
`ifdef GL
		$readmemh("verilog_testaudio_short.txt", data_in);
`else
		$readmemh("verilog_testaudio.txt", data_in);
`endif

		// dump signals into VCD for debug
		$dumpfile("audiodac_tb.vcd");
		$dumpvars(1, audiodac_tb);
		
		// provide an online output for tracking sim progress
     		//$monitor("At time %t, ds_out = %h", $time, DS_OUT);
	end

endmodule // audiodac_tb
