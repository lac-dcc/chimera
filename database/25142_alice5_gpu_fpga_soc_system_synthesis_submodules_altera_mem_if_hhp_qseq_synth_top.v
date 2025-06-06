// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// (C) 2001-2018 Intel Corporation. All rights reserved.
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
module altera_mem_if_hhp_qseq_synth_top 
# ( parameter
	APB_DATA_WIDTH     = 32,
	APB_ADDR_WIDTH     = 32,
	AVL_DATA_WIDTH     = 32,
	AVL_ADDR_WIDTH     = 16, // for PHY
	AVL_MMR_DATA_WIDTH = 32,
	AVL_MMR_ADDR_WIDTH = 8,
	MEM_IF_DQS_WIDTH   = 1,
	MEM_IF_DQ_WIDTH    = 8,
	MEM_IF_DM_WIDTH    = 1,
	MEM_IF_CS_WIDTH    = 1
) (
   );

endmodule
