// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`ifndef __I2S_READER_DEFINES__
`define __I2S_READER_DEFINES__

`timescale 1 ns / 1 ps

//initial
`define DEFAULT_MEM_0_BASE        32'h00000000
`define DEFAULT_MEM_1_BASE        32'h00100000

//control bit definition
`define CONTROL_ENABLE            0
`define CONTROL_ENABLE_INTERRUPT  1
`define CONTROL_RESET             3
`define CONTROL_ENABLE_PHY        4
`define CONTROL_RESET_PHY         7

//status bit definition
`define STATUS_MEMORY_0_FINISHED  0
`define STATUS_MEMORY_1_FINISHED  1
`define STATUS_MEMORY_0_EMPTY     2
`define STATUS_MEMORY_1_EMPTY     3

`define AUDIO_RATE                44100
`define AUDIO_BITS                24
`define AUDIO_CHANNELS            2
`define MIN_READ_SIZE             64

`endif //__I2S_READER_DEFINES__

