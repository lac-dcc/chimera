// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License




//sdram_include.v
`ifdef SDRAM_INCLUDE_V
`else
`define SDRAM_INCLUDE_V

`timescale 1 ns/1 ps



`define SYS_CLK_FREQUENCY   50000     // in kHz

//Sequential
`define SDRAM_INIT_LMR	12'b000000100111
//A[11:10]	RESERVED: 0, 0
//A[9]		Write Burst Mode
//				0: 	Programed burst length
//				1:	Single Location Address
//A[8:7]	Operation Mode
//				00: Standard Operation Mode
//A[6:4]	CAS Latency
//				010: 2
//				011: 3
//A[3]		Burst Type
//				0:	Sequential
//				1:	Interleaved
//A[2:0]	Burst Length
//				111:	Page Burst




//----------------------------------------------------------------------------
// SDRAM constants
//----------------------------------------------------------------------------
`define SDRAM_CMD_NOP   3'b111
`define SDRAM_CMD_ACT   3'b011
`define SDRAM_CMD_READ  3'b101
`define SDRAM_CMD_WRITE 3'b100
`define SDRAM_CMD_TERM  3'b110
`define SDRAM_CMD_PRE   3'b010
`define SDRAM_CMD_AR    3'b001
`define SDRAM_CMD_MRS   3'b000

`define T_RCD	2			//ACTIVE -> READ/WRITE 2 clock cycles 7E
`define T_CAS	2			//READ -> DATA READY 2 clock cycles for CAS latency
`define T_RP	2			//PRECHARGE -> finished	
`define T_CCD	1			//READ -> READ
`define T_RFC	7		  //AUTO REFRESH to ready
`define T_PLL	11000 //XXX: 16 IS ONLY FOR SIMULATION
`define T_MRD	2     //MODE Register Set
`define T_WR  2     //Writing to memory

//Auto Refresh Timeout
`ifndef SIMULATION
  `define T_AR_TIMEOUT	1500
`else
  `define T_AR_TIMEOUT	200
`endif

`endif
