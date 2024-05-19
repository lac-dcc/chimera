// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`ifndef __SF_CAMERA_DEFINES__
`define __SF_CAMERA_DEFINES__


`timescale 1 ns/1 ps
//Initially 2MB data chunk
`define DEFAULT_MEM_0_BASE        32'h00000000
`define DEFAULT_MEM_1_BASE        32'h00100000

//control bit definition
`define CONTROL_ENABLE            0
`define CONTROL_ENABLE_INTERRUPT  1
`define CONTROL_AUTO_FLASH        2
`define CONTROL_MANUAL_FLASH_ON   3
`define CONTROL_CAMERA_RESET      4
`define CONTROL_RESET_COUNTS      5
`define CONTROL_IMAGE_DEBUG       6

//status bit definition
`define STATUS_MEMORY_0_FINISHED  0
`define STATUS_MEMORY_1_FINISHED  1
`define STATUS_IMAGE_CAPTURED     2
`define STATUS_BUSY               3
`define STATUS_DCM_LOCKED         4
`define STATUS_ENABLE             5
`define STATUS_MEMORY_0_EMPTY     6
`define STATUS_MEMORY_1_EMPTY     7

`endif
