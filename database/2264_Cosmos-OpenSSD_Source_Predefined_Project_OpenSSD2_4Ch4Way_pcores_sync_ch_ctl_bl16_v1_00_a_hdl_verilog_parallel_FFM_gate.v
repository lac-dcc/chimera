// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// parallel_FFM_gate.v for Cosmos OpenSSD
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
// Module Name: parallel_FFM_gate
// File Name: parallel_FFM_gate.v
//
// Version: v2.0.3-GF15tA
//
// Description: 
//   - parallel Finite Field Multiplier (FFM) module
//   - 2 polynomial form input, 1 polynomial form output
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v2.0.3
//   - temporary roll-back for releasing
//   - coding style of this version is not unified
//
// * v2.0.2
//   - minor modification for releasing
//
// * v2.0.1
//   - re-factoring
//
// * v2.0.0
//   - based on partial multiplication
//   - fixed GF
//
// * v1.0.0
//   - based on LFSR
//   - variable GF by parameter setting
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module parallel_FFM_gate(
	poly_form_A,
	poly_form_B,
	
	poly_form_result
    );

	///////////////////////////////////////////////////////////
	// CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! //
	//                                                       //
	//      ONLY FOR 15 BIT POLYNOMIAL MULTIPLICATION        //
	//                                                       //
	// CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! //
	///////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////////////////
	// CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! //
	//                                                       //
	//     PRIMITIVE POLYNOMIAL: P(X) = X^15 + X^1 + 1       //
	//                                                       //
	// CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! CAUTION! //
	///////////////////////////////////////////////////////////
	
	input wire [14:0] poly_form_A;
	input wire [14:0] poly_form_B;
	
	output wire [14:0] poly_form_result;
	
	
	
	
	wire [4:0] p_A2;
	wire [4:0] p_A1;
	wire [4:0] p_A0;
	
	wire [4:0] p_B2;
	wire [4:0] p_B1;
	wire [4:0] p_B0;
	
	wire [8:0] p_r_A2_B0;
	wire [8:0] p_r_A1_B0;
	wire [8:0] p_r_A0_B0;
	wire [8:0] p_r_A2_B1;
	wire [8:0] p_r_A1_B1;
	wire [8:0] p_r_A0_B1;
	wire [8:0] p_r_A2_B2;
	wire [8:0] p_r_A1_B2;
	wire [8:0] p_r_A0_B2;
	
	wire [3:0] p_E2;
	wire [4:0] p_E1;
	wire [4:0] p_E0;
	
	wire [4:0] p_S2;
	wire [4:0] p_S1;
	wire [4:0] p_S0;
	
	
	
	
	assign p_A2[4:0] = poly_form_A[14:10];
	assign p_A1[4:0] = poly_form_A[9:5];
	assign p_A0[4:0] = poly_form_A[4:0];
	
	assign p_B2[4:0] = poly_form_B[14:10];
	assign p_B1[4:0] = poly_form_B[9:5];
	assign p_B0[4:0] = poly_form_B[4:0];
	
	
	
	
	partial_FFM_gate p_mul_A2_B0 (
    .a(p_A2[4:0]), 
    .b(p_B0[4:0]), 
    .r(p_r_A2_B0[8:0])
    );
	
	partial_FFM_gate p_mul_A1_B0 (
    .a(p_A1[4:0]), 
    .b(p_B0[4:0]), 
    .r(p_r_A1_B0[8:0])
    );
	
	partial_FFM_gate p_mul_A0_B0 (
    .a(p_A0[4:0]), 
    .b(p_B0[4:0]), 
    .r(p_r_A0_B0[8:0])
    );
	
	partial_FFM_gate p_mul_A2_B1 (
    .a(p_A2[4:0]), 
    .b(p_B1[4:0]), 
    .r(p_r_A2_B1[8:0])
    );
	
	partial_FFM_gate p_mul_A1_B1 (
    .a(p_A1[4:0]), 
    .b(p_B1[4:0]), 
    .r(p_r_A1_B1[8:0])
    );
	
	partial_FFM_gate p_mul_A0_B1 (
    .a(p_A0[4:0]), 
    .b(p_B1[4:0]), 
    .r(p_r_A0_B1[8:0])
    );
	
	partial_FFM_gate p_mul_A2_B2 (
    .a(p_A2[4:0]), 
    .b(p_B2[4:0]), 
    .r(p_r_A2_B2[8:0])
    );
	
	partial_FFM_gate p_mul_A1_B2 (
    .a(p_A1[4:0]), 
    .b(p_B2[4:0]), 
    .r(p_r_A1_B2[8:0])
    );
	
	partial_FFM_gate p_mul_A0_B2 (
    .a(p_A0[4:0]), 
    .b(p_B2[4:0]), 
    .r(p_r_A0_B2[8:0])
    );
	
	
	
	
	assign p_E2[3:0] = p_r_A2_B2[8:5];
	assign p_E1[4:0] = { p_r_A2_B2[4], ( p_r_A2_B2[3:0] ^ p_r_A1_B2[8:5] ^ p_r_A2_B1[8:5] ) };
	assign p_E0[4:0] = { ( p_r_A1_B2[4] ^ p_r_A2_B1[4] ), ( p_r_A1_B2[3:0] ^ p_r_A2_B1[3:0] ^ p_r_A0_B2[8:5] ^ p_r_A1_B1[8:5] ^ p_r_A2_B0[8:5] ) };
	
	
	
	
	assign p_S2[4:0] = { ( p_r_A0_B2[4] ^ p_r_A1_B1[4] ^ p_r_A2_B0[4] ), ( p_r_A0_B2[3:0] ^ p_r_A1_B1[3:0] ^ p_r_A0_B1[8:5] ^ p_r_A2_B0[3:0] ^ p_r_A1_B0[8:5] ) };
	assign p_S1[4:0] = { ( p_r_A0_B1[4] ^ p_r_A1_B0[4] ), ( p_r_A0_B1[3:0] ^ p_r_A1_B0[3:0] ^ p_r_A0_B0[8:5] ) };
	assign p_S0[4:0] = p_r_A0_B0[4:0];
	
	
	
	
	assign poly_form_result[14] = p_S2[4] ^ p_E2[3];
	assign poly_form_result[13] = p_S2[3] ^ p_E2[2] ^ p_E2[3];
	assign poly_form_result[12] = p_S2[2] ^ p_E2[1] ^ p_E2[2];
	assign poly_form_result[11] = p_S2[1] ^ p_E2[0] ^ p_E2[1];
	assign poly_form_result[10] = p_S2[0] ^ p_E1[4] ^ p_E2[0];
	assign poly_form_result[ 9] = p_S1[4] ^ p_E1[3] ^ p_E1[4];
	assign poly_form_result[ 8] = p_S1[3] ^ p_E1[2] ^ p_E1[3];
	assign poly_form_result[ 7] = p_S1[2] ^ p_E1[1] ^ p_E1[2];
	assign poly_form_result[ 6] = p_S1[1] ^ p_E1[0] ^ p_E1[1];
	assign poly_form_result[ 5] = p_S1[0] ^ p_E0[4] ^ p_E1[0];
	assign poly_form_result[ 4] = p_S0[4] ^ p_E0[3] ^ p_E0[4];
	assign poly_form_result[ 3] = p_S0[3] ^ p_E0[2] ^ p_E0[3];
	assign poly_form_result[ 2] = p_S0[2] ^ p_E0[1] ^ p_E0[2];
	assign poly_form_result[ 1] = p_S0[1] ^ p_E0[0] ^ p_E0[1];
	assign poly_form_result[ 0] = p_S0[0] ^ p_E0[0];
	

endmodule
