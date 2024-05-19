// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// encoder.v for Cosmos OpenSSD
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
// Module Name: encoder
// File Name: encoder.v
//
// Version: v1.0.2-2KB_T32
//
// Description: 
//   - BCH encoder TOP module
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

module encoder(
	clk,
	nRESET,
	
	execute_encoding,
	message_BUS_valid,
	message,
	
	encoding_start,
	last_message_block_received,
	encoding_complete,
	
	parity_strobe,
	parity_out_start,
	parity_out_complete,
	parity_out
    );

//`include "../ENC_parameters.v"
//`include "ENC_parameters.v"

	//////////////////////////////////////////////////////////////////////
	parameter PARITY_LENGTH = 480; // 32b * 15b/b = 480b
	parameter ENCODER_PARALLEL = 8; // 8bit I/F with NAND
	parameter ENCODER_INPUT_LOOP_COUNT = 2048; // 2KB chunk / 8b = 2048
	parameter ENCODER_INPUT_LOOP_COUNT_BIT = 12; // must be bigger than ENCODER_INPUT_LOOP_COUNT, 2^11 = 2048
	parameter ENCODER_OUTPUT_LOOP_COUNT = 60; // 480b / 8b = 60
	//////////////////////////////////////////////////////////////////////

	parameter ENCODER_FSM_BIT = 6;
	parameter RESET   = 6'b000001; // RESET: encoder sequence reset
	parameter ENCD_ST = 6'b000010; // encoder: start mode, compute parity
	parameter ENCD_FB = 6'b000100; // encoder: feedback mode, compute parity
	parameter P_O_STR = 6'b001000; // parity out: first block
	parameter P_O_SHF = 6'b010000; // parity out: shifted block
	parameter MSG_T_P = 6'b100000; // encoder: message BUS invalid
	
	
	
	input wire clk;
	input wire nRESET;
	
	input wire execute_encoding; // encoding start command signal
	input wire message_BUS_valid; // message BUS strobe signal
	input wire [ENCODER_PARALLEL-1:0] message; // message block data BUS
	
	output wire encoding_start; // [indicate] encoding start
	output wire last_message_block_received; // [indicate] last message block received
	output wire encoding_complete; // [indicate] encoding complete
	
	output wire parity_strobe; // [indicate] parity BUS strobe signal
	output wire parity_out_start; // [indicate] parity block out start
	output wire parity_out_complete; // [indicate] last parity block transmitted
	output wire [ENCODER_PARALLEL-1:0] parity_out; // parity block data BUS
	
	
	
	// registered input
	reg [ENCODER_PARALLEL-1:0] message_b;
	
	// encoder FSM state
	reg [ENCODER_FSM_BIT-1:0] cur_state;
	reg [ENCODER_FSM_BIT-1:0] nxt_state;
	
	// internal counter
	reg [ENCODER_INPUT_LOOP_COUNT_BIT-1:0] counter;
	
	// registers for parity code
	reg [PARITY_LENGTH-1:0] parity_code;
	wire [PARITY_LENGTH-1:0] nxt_parity_code;
	wire valid_execution;
	
	
	
	////////////////////////////////////////////////////////////////////////////////
	// modified(improved) linear feedback shift XOR matrix
	// LFSR = LFSXOR + register
	parallel_m_lfs_XOR mLFSXOR_matrix (
		.message(message_b), 
		.cur_parity(parity_code), 
		.nxt_parity(nxt_parity_code) );
	////////////////////////////////////////////////////////////////////////////////
	
	
	
	assign valid_execution = execute_encoding & message_BUS_valid;
	assign encoding_start = (cur_state == ENCD_ST);
	assign last_message_block_received = (message_BUS_valid == 1) & (counter == ENCODER_INPUT_LOOP_COUNT - 1);
	assign encoding_complete = (counter == ENCODER_INPUT_LOOP_COUNT);
	
	assign parity_strobe = (cur_state == P_O_STR) | (cur_state == P_O_SHF);
	assign parity_out_start = (cur_state == P_O_STR);
	assign parity_out_complete = ((cur_state == P_O_STR) | (cur_state == P_O_SHF)) & (counter == ENCODER_OUTPUT_LOOP_COUNT - 1);
	assign parity_out = (parity_strobe)? parity_code[PARITY_LENGTH-1:PARITY_LENGTH-ENCODER_PARALLEL]:0;
	
	
	
	// update current state to next state
	always @ (posedge clk, negedge nRESET)
	begin
		if (!nRESET) begin
			cur_state <= RESET;
		end else begin
			cur_state <= nxt_state;
		end
	end
	
	
	
	// decide next state
	always @ ( * )
	begin
		case (cur_state)
		RESET: begin
			nxt_state <= (valid_execution)? (ENCD_ST):(RESET);
		end
		ENCD_ST: begin
			nxt_state <= (message_BUS_valid)? (ENCD_FB):(MSG_T_P);
		end
		ENCD_FB: begin
			nxt_state <= (encoding_complete)? (P_O_STR):
														((message_BUS_valid)? (ENCD_FB):(MSG_T_P));
		end
		P_O_STR: begin
			nxt_state <= P_O_SHF;
		end
		P_O_SHF: begin
			nxt_state <= (parity_out_complete)? ((valid_execution)? (ENCD_ST):(RESET)):(P_O_SHF);
		end
		MSG_T_P: begin
			nxt_state <= (message_BUS_valid)? (ENCD_FB):(MSG_T_P);
		end
		default: begin
			nxt_state <= RESET;
		end
		endcase
	end

	// state behaviour
	always @ (posedge clk, negedge nRESET)
	begin
		if (!nRESET) begin
			counter <= 0;
			message_b <= 0;
			parity_code <= 0;
		end
		
		else begin		
			case (nxt_state)
			RESET: begin
				counter <= 0;
				message_b <= 0;
				parity_code <= 0;
			end
			ENCD_ST: begin
				counter <= 1;
				message_b <= message;
				parity_code <= 0;
			end
			ENCD_FB: begin
				counter <= counter + 1'b1;
				message_b <= message;
				parity_code <= nxt_parity_code;
			end
			P_O_STR: begin
				counter <= 0;
				message_b <= 0;
				parity_code <= nxt_parity_code;
			end
			P_O_SHF: begin
				counter <= counter + 1'b1;
				message_b <= 0;
				parity_code <= parity_code << ENCODER_PARALLEL;
			end
			MSG_T_P: begin
				counter <= counter;
				message_b <= message_b;
				parity_code <= parity_code;
			end
			default: begin
				counter <= 0;
				message_b <= 0;
				parity_code <= 0;
			end
			endcase
		end
	end
	
	
endmodule
