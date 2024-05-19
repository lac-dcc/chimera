// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`ifndef __SF_CAMERA_DEFINES__
`define __SF_CAMERA_DEFINES__

`timescale 1 ns / 1 ps

//initial
`define DEFAULT_MEM_0_BASE        32'h00000000
`define DEFAULT_MEM_1_BASE        32'h00100000

//control bit definition
`define CONTROL_ENABLE            0
`define CONTROL_ENABLE_INTERRUPT  1


`define CONTROL_RESET             4

//status bit definition
`define STATUS_MEMORY_0_FINISHED  0
`define STATUS_MEMORY_1_FINISHED  1
`define STATUS_MEMORY_0_EMPTY     2
`define STATUS_MEMORY_1_EMPTY     3

`endif //__SF_CAMERA_DEFINES__

