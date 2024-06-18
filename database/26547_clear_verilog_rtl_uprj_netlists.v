// This program was cloned from: https://github.com/efabless/clear
// License: Apache License 2.0

//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Fabric Netlist Summary
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Nov 24 12:04:19 2020
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

// PDK
`define UNIT_DELAY #1
`define USE_POWER_PINS

//`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
//`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"

// Include caravel global defines for the number of the user project IO pads 
//`include "defines.v"

/*
    For running fpga simulation with caravel, we have to simulate with the fpga gate-level netlists.
    This is because the fpga rtl has hand-instantiated cells from the pdk, these cells aren't connected to power pins 
    which fails the simulation with caravel due to the use of "USE_POWER_PINS".
*/

`default_nettype wire
//`include "gl/sb_0__0_.v"
//`include "gl/sb_0__1_.v"
//`include "gl/sb_0__2_.v"
//`include "gl/sb_1__0_.v"
//`include "gl/sb_1__1_.v"
//`include "gl/sb_1__2_.v"
//`include "gl/sb_2__0_.v"
//`include "gl/sb_2__1_.v"
//`include "gl/sb_2__2_.v"
//`include "gl/cbx_1__0_.v"
//`include "gl/cbx_1__1_.v"
//`include "gl/cbx_1__2_.v"
//`include "gl/cby_0__1_.v"
//`include "gl/cby_1__1_.v"
//`include "gl/cby_2__1_.v"
//`include "gl/grid_clb.v"
//`include "gl/tie_array.v"
//`include "gl/fpga_core.v"
//`include "gl/user_project_wrapper.v"
