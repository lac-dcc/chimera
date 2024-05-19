// This program was cloned from: https://github.com/efabless/clear
// License: Apache License 2.0

//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Preprocessing flags to enable/disable simulation features
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Nov 24 12:27:27 2020
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

`define INITIAL_SIMULATION 1

`define AUTOCHECKED_SIMULATION 1

`define ENABLE_FORMAL_VERIFICATION 1

`define FORMAL_SIMULATION 1

`define ICARUS_SIMULATOR 1 