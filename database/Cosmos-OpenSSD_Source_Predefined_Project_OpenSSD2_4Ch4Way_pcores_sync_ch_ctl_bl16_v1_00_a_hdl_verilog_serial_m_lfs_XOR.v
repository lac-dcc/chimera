// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// serial_m_lfs_XOR.v for Cosmos OpenSSD
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
// Design Name: BCH Encoder
// Module Name: serial_m_lfs_XOR
// File Name: serial_m_lfs_XOR.v
//
// Version: v1.0.2-2KB_T32
//
// Description: 
//   - serial modified Linear Feedback Shift XOR
//   - for data area
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

module serial_m_lfs_XOR(
    message,
    cur_parity,
    nxt_parity
    );

	//////////////////////////////////////////////////////////////////////
	parameter PARITY_LENGTH = 480; // 32b * 15b/b = 480b
	parameter [0:480] GEN_POLY = 481'b1101110100111011110100011101111000110111110010101100101011111101110111010100110000000000010111101011010011101011011100000101000100101001101111111111011000010010011111000111110001110101101011100111000011010000110000010000110001010001000100101101100110011011000000011110110011111101010010010000001011110001110101110100100000100101010101011110111111000110111011001100111100101110000111000011000011010100110000001100001101111100101111000111001101001100111100001001001100011111010011101;
	//////////////////////////////////////////////////////////////////////

	input wire message;
	input wire [PARITY_LENGTH-1:0] cur_parity;
	output wire [PARITY_LENGTH-1:0] nxt_parity;

	
	
	wire FB_term;

	
	
	assign FB_term = message ^ cur_parity[PARITY_LENGTH-1];
	
	
	assign nxt_parity[0] = FB_term;
	
	genvar i;
	generate
		for (i=1; i<PARITY_LENGTH; i=i+1)
		begin: linear_function
		
			// modified(improved) linear feedback shift XOR
		
			if (GEN_POLY[i] == 1)
			begin
				assign nxt_parity[i] = cur_parity[i-1] ^ FB_term;
			end
			
			else
			begin
				assign nxt_parity[i] = cur_parity[i-1];
			end
			
		end
	endgenerate
	

endmodule
