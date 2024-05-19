// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



`timescale 1 ps / 1 ps

(* altera_attribute = "-name GLOBAL_SIGNAL OFF" *)
module ddr3_p0_reset_m10(
	pll_afi_clk,
	pll_write_clk,
	pll_locked,
	global_reset_n,
	soft_reset_n,
	ctl_reset_n,
	ctl_reset_export_n,
	reset_n_afi_clk,
	reset_n_resync_clk
);


parameter MEM_READ_DQS_WIDTH = ""; 

parameter NUM_AFI_RESET = 1;



input	pll_afi_clk;
input	pll_write_clk;
input	pll_locked;
input	global_reset_n;
input	soft_reset_n;
output	ctl_reset_n;
output  ctl_reset_export_n;
output	[NUM_AFI_RESET-1:0] reset_n_afi_clk;
output	reset_n_resync_clk;
// Apply the synthesis keep attribute on the synchronized reset wires
// so that these names can be constrained using QSF settings to keep
// the resets on local routing.
wire	phy_reset_n /* synthesis keep = 1 */;
wire	phy_reset_mem_stable_n /* synthesis keep = 1*/;

wire	[MEM_READ_DQS_WIDTH-1:0] reset_n_read_capture;

        assign phy_reset_n = pll_locked & global_reset_n & soft_reset_n;

	ddr3_p0_reset_sync	ureset_afi_clk(
		.reset_n		(phy_reset_n),
		.clk			(pll_afi_clk),
		.reset_n_sync	(reset_n_afi_clk)
	);
	defparam ureset_afi_clk.RESET_SYNC_STAGES = 15; 
	defparam ureset_afi_clk.NUM_RESET_OUTPUT = NUM_AFI_RESET;

	ddr3_p0_reset_sync	ureset_ctl_reset_clk(
		.reset_n		(phy_reset_n),
		.clk			(pll_afi_clk),
		.reset_n_sync	({ctl_reset_n, ctl_reset_export_n})
	);
	defparam ureset_ctl_reset_clk.RESET_SYNC_STAGES = 15;
	defparam ureset_ctl_reset_clk.NUM_RESET_OUTPUT = 2;


	ddr3_p0_reset_sync	ureset_resync_clk(
		.reset_n		(phy_reset_n),
		.clk			(pll_write_clk),
		.reset_n_sync	(reset_n_resync_clk)
	);
	defparam ureset_resync_clk.RESET_SYNC_STAGES = 15; 
	defparam ureset_resync_clk.NUM_RESET_OUTPUT = 1;


endmodule
