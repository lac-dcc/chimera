// This program was cloned from: https://github.com/efabless/clear
// License: Apache License 2.0

//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Netlist Summary
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Nov 16 17:02:30 2020
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

// ------ Include simulation defines -----
`include "/localfile/OpenFPGA/TESTBENCH/k4_non_adder_caravel_io_FPGA_10x10_fdhd_cc/verilog_testbench/define_simulation.v"

// ------ Include fabric top-level netlists -----
`include "/localfile/OpenFPGA/HDL/k4_non_adder_caravel_io_FPGA_10x10_fdhd_cc/SRC/fabric_netlists.v"

`ifdef AUTOCHECKED_SIMULATION
	`include "and2_output_verilog.v"
`endif

`ifdef ENABLE_FORMAL_VERIFICATION
	`include "/localfile/OpenFPGA/TESTBENCH/k4_non_adder_caravel_io_FPGA_10x10_fdhd_cc/verilog_testbench/and2_top_formal_verification.v"
	`ifdef FORMAL_SIMULATION
		`include "/localfile/OpenFPGA/TESTBENCH/k4_non_adder_caravel_io_FPGA_10x10_fdhd_cc/verilog_testbench/and2_formal_random_top_tb.v"
	`endif
`endif

`ifdef AUTOCHECKED_SIMULATION
	`include "/localfile/OpenFPGA/TESTBENCH/k4_non_adder_caravel_io_FPGA_10x10_fdhd_cc/verilog_testbench/and2_autocheck_top_tb.v"
`endif

