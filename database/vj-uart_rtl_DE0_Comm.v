// This program was cloned from: https://github.com/binary-logic/vj-uart
// License: GNU General Public License v3.0

/*
#   DE0_Comm.v - Connect all the pieces, system clock, heartbeat LED, FSM
#
#   Copyright (C) 2014  Binary Logic (nhi.phan.logic at gmail.com).
#
#   This file is part of the Virtual JTAG UART toolkit
#   
#   Virtual UART is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
*/

//=======================================================
//  DE0 Top Module
//=======================================================
`include "system_include.v"

module DE0_Comm(

	//////////// CLOCK //////////
	input CLOCK_50,

	//  Only included if we're running with ModelSim
	`ifdef UNDER_TEST
		// Async reset
		input areset,
	`endif
	
	//////////// LED //////////
	output [7:0] LED 
);

//=======================================================
//  REG/WIRE declarations
//=======================================================

// System signals
wire sysclk, reset_n;

// Heartbeat signals
wire heartbeat;


//=======================================================
//  Outputs
//=======================================================

assign LED = {7'b0,heartbeat};

//=======================================================
//  Structural coding
//=======================================================

// System  clock
pll_clock	clock (
	.inclk0 ( CLOCK_50 ),
	.c0 ( sysclk ),
	
	//  Only included if we're running with ModelSim
	`ifdef UNDER_TEST
		.areset( areset ),
	`else
		.areset(),
	`endif
	
	.locked ( )
	);

// Reset timer
reset reset(
	.clk_i( sysclk ),
	.nreset_o( reset_n )
	);

// Heartbeat function
heartbeat hb(
	.clk_i( sysclk ),
	.nreset_i( reset_n ),
	.heartbeat_o( heartbeat )
	);

// The finite state machine for sending data through JTAG
fsm_app app(
	.clk_i(sysclk),
	.nreset_i(reset_n)
	);
	
//=======================================================
//  Procedural coding
//=======================================================
	
endmodule
