// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`ifndef __SEEED_TFT_DEFINES__
`define __SEEED_TFT_DEFINES__

`timescale 1 ns/1 ps
//Initially 2MB data chunk
`define DEFAULT_MEM_0_BASE        32'h00000000
//`ifndef SIMULATION
`define DEFAULT_MEM_1_BASE        32'h00200000
//`else
//  `define DEFAULT_MEM_1_BASE        32'h00000008
//`endif
`define DELAY_COUNT                 8'h02


//Command Registers
`define CMD_START_MEM_WRITE 8'h22
`define CMD_GET_TEAR_STATUS 8'h0E

`endif


