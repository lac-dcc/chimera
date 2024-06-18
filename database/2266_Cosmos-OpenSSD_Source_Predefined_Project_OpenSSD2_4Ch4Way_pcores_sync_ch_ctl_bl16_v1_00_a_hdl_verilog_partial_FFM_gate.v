// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// partial_FFM_gate.v for Cosmos OpenSSD
// Copyright (c) 2015 Hanyang University ENC Lab.
// Contributed by Ilyong Jung <iyjung@enc.hanyang.ac.kr>
//                Yong Ho Song <yhsong@enc.hanyang.ac.kr>
//
// This file is part of Cosmos OpenSSD.
//
// Cosmos OpenSSD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3, or (at your option)
// any later version.
//
// Cosmos OpenSSD is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Cosmos OpenSSD; see the file COPYING.
// If not, see <http://www.gnu.org/licenses/>. 
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Company: ENC Lab. <http://enc.hanyang.ac.kr>
// Engineer: Ilyong Jung <iyjung@enc.hanyang.ac.kr>
// 
// Project Name: Cosmos OpenSSD
// Design Name: BCH Decoder
// Module Name: partial_FFM_gate
// File Name: partial_FFM_gate.v
//
// Version: v1.0.2-5b
//
// Description: 
//   - parallel Finite Field Multiplier (FFM) module
//   - 2 polynomial form input, 1 polynomial form output
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.0.2
//   - temporary roll-back for releasing
//   - coding style of this version is not unified
//
// * v1.0.1
//   - minor modification for releasing
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module partial_FFM_gate(
	a,
	b,
	
	r
    );
	
	///////////////////////////////////////////////////////////
	// CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! //
	//                                                       //
	//      ONLY FOR  5 BIT POLYNOMIAL MULTIPLICATION        //
	//                                                       //
	// CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! //
	///////////////////////////////////////////////////////////
	
	input wire [4:0] a;
	input wire [4:0] b;
	
	output wire [8:0] r;
	
	assign r[8] = (a[4]&b[4]);
	assign r[7] = (a[3]&b[4]) ^ (a[4]&b[3]);
	assign r[6] = (a[2]&b[4]) ^ (a[3]&b[3]) ^ (a[4]&b[2]);
	assign r[5] = (a[1]&b[4]) ^ (a[2]&b[3]) ^ (a[3]&b[2]) ^ (a[4]&b[1]);
	assign r[4] = (a[0]&b[4]) ^ (a[1]&b[3]) ^ (a[2]&b[2]) ^ (a[3]&b[1]) ^ (a[4]&b[0]);
	assign r[3] = (a[0]&b[3]) ^ (a[1]&b[2]) ^ (a[2]&b[1]) ^ (a[3]&b[0]);
	assign r[2] = (a[0]&b[2]) ^ (a[1]&b[1]) ^ (a[2]&b[0]);
	assign r[1] = (a[0]&b[1]) ^ (a[1]&b[0]);
	assign r[0] = (a[0]&b[0]);


endmodule
