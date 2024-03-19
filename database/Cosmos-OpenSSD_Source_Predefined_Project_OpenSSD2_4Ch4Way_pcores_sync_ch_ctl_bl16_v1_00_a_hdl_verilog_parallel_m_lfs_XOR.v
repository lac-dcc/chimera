//////////////////////////////////////////////////////////////////////////////////
// parallel_m_lfs_XOR.v for Cosmos OpenSSD
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
// Module Name: parallel_m_lfs_XOR
// File Name: parallel_m_lfs_XOR.v
//
// Version: v1.0.2-2KB_T32
//
// Description: 
//   - parallel modified Linear Feedback Shift XOR
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

module parallel_m_lfs_XOR(
    message,
    cur_parity,
    nxt_parity
    );

	//////////////////////////////////////////////////////////////////////
	parameter PARITY_LENGTH = 480; // 32b * 15b/b = 480b
	parameter ENCODER_PARALLEL = 8; // 8bit I/F with NAND
	//////////////////////////////////////////////////////////////////////

	input wire [ENCODER_PARALLEL-1:0] message;
	input wire [PARITY_LENGTH-1:0] cur_parity;
	output wire [PARITY_LENGTH-1:0] nxt_parity;
	
	
	
	wire [PARITY_LENGTH*(ENCODER_PARALLEL+1)-1:0] parallel_wire;
	
	
	
	genvar i;
	generate
		for (i=0; i<ENCODER_PARALLEL; i=i+1)
		begin: m_lfs_XOR_blade_enclosure
			
			// modified(improved) linear feedback shift XOR blade
			// LFSR = LFSXOR + register
			serial_m_lfs_XOR mLFSXOR_blade(
				.message(message[i]),
				.cur_parity(parallel_wire[PARITY_LENGTH*(i+2)-1:PARITY_LENGTH*(i+1)]),
				.nxt_parity(parallel_wire[PARITY_LENGTH*(i+1)-1:PARITY_LENGTH*(i)]  ) );
		
		end
	endgenerate
	
	assign parallel_wire[PARITY_LENGTH*(ENCODER_PARALLEL+1)-1:PARITY_LENGTH*(ENCODER_PARALLEL)] = cur_parity[PARITY_LENGTH-1:0];
	assign nxt_parity[PARITY_LENGTH-1:0] = parallel_wire[PARITY_LENGTH-1:0];

	
endmodule
