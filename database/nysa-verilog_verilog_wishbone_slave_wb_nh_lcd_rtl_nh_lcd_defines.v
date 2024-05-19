// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`ifndef __NH_LCD_DEFINES__
`define __NH_LCD_DEFINES__

`timescale 1 ns/1 ps
//Initially 2MB data chunk
`define DEFAULT_MEM_0_BASE        32'h00000000
//`ifndef SIMULATION
`define DEFAULT_MEM_1_BASE        32'h00100000
//`else
//  `define DEFAULT_MEM_1_BASE        32'h00000008
//`endif




//Command Registers
`define CMD_START_MEM_WRITE 8'h2C
`define CMD_GET_TEAR_STATUS 8'h0E



`endif


