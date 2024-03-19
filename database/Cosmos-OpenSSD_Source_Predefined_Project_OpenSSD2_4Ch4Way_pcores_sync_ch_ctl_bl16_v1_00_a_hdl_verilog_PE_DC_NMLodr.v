//////////////////////////////////////////////////////////////////////////////////
// PE_DC_NMLodr.v for Cosmos OpenSSD
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
// Module Name: PE_DC_NMLodr
// File Name: PE_DC_NMLodr.v
//
// Version: v1.1.2-2KB_T32
//
// Description: 
//   - Processing Element: Discrepancy Computation module, normal order
//   - for binary version of inversion-less Berlekamp-Massey algorithm (iBM.b)
//   - for data area
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.1.2
//   - temporary roll-back for releasing
//   - coding style of this version is not unified
//
// * v1.1.1
//   - minor modification for releasing
//
// * v1.1.0
//   - change state machine: divide states
//   - insert additional registers
//   - improve frequency characteristic
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module PE_DC_NMLodr( // discrepancy computation module: normal order
	clk,
	nRESET_KES,
	
	EXECUTE_PE_DC,
	
    S_in,
	v_2i_X,
	
	S_out,
	coef_2ip1
    );

	////////////////////////////////////////////////////////////////////////////////
	parameter GF_ORDER = 15; // GF(2^GF_ORDER)
	parameter [14:0] VALUE_ZERO = 15'b00000_00000_00000;
	parameter [14:0] VALUE_ONE = 15'b00000_00000_00001;
	////////////////////////////////////////////////////////////////////////////////
	
	input wire clk;
	input wire nRESET_KES;
	input wire EXECUTE_PE_DC;
	input wire [GF_ORDER-1:0] S_in;
    input wire [GF_ORDER-1:0] v_2i_X;
    output wire [GF_ORDER-1:0] S_out;
    output reg [GF_ORDER-1:0] coef_2ip1;
	
	//reg EXECUTE_PE_DC_b;
	reg [GF_ORDER-1:0] S_in_b;
    reg [GF_ORDER-1:0] v_2i_X_b;
	wire [GF_ORDER-1:0] coef_term;
	
	// FSM
	parameter PE_DC_RST = 3'b001; // reset
	parameter PE_DC_INP = 3'b010; // input capture
	parameter PE_DC_OUT = 3'b100; // output buffer update
	
	// FSM state
	reg [2:0] cur_state;
	reg [2:0] nxt_state;
	
	
	/*
	// execution register update
	always @ (posedge clk, negedge nRESET_KES)
	begin
		if (!nRESET_KES) begin
			EXECUTE_PE_DC_b <= 0;
		end	else begin
			EXECUTE_PE_DC_b <= EXECUTE_PE_DC;
		end
	end*/
	
	// update current state to next state
	always @ (posedge clk, negedge nRESET_KES)
	begin
		if (!nRESET_KES) begin
			cur_state <= PE_DC_RST;
		end else begin
			cur_state <= nxt_state;
		end
	end
	
	// decide next state
	always @ ( * )
	begin
		case (cur_state)
		PE_DC_RST: begin
			nxt_state <= (EXECUTE_PE_DC)? (PE_DC_INP):(PE_DC_RST);
		end
		PE_DC_INP: begin
			nxt_state <= PE_DC_OUT;
		end
		PE_DC_OUT: begin
			nxt_state <= PE_DC_RST;
		end
		default: begin
			nxt_state <= PE_DC_RST;
		end
		endcase
	end

	// state behaviour
	always @ (posedge clk, negedge nRESET_KES)
	begin
		if (!nRESET_KES) begin // initializing
			S_in_b <= 0;
			v_2i_X_b <= 0;
			
			coef_2ip1[GF_ORDER-1:0] <= VALUE_ZERO[GF_ORDER-1:0];
		end
		
		else begin		
			case (nxt_state)
			PE_DC_RST: begin // hold original data
				S_in_b <= S_in_b;
				v_2i_X_b <= v_2i_X_b;
				
				coef_2ip1[GF_ORDER-1:0] <= coef_2ip1[GF_ORDER-1:0];
			end
			PE_DC_INP: begin // input capture only
				S_in_b <= S_in;
				v_2i_X_b <= v_2i_X;
				
				coef_2ip1[GF_ORDER-1:0] <= coef_2ip1[GF_ORDER-1:0];
			end
			PE_DC_OUT: begin // output update only
				S_in_b <= S_in_b;
				v_2i_X_b <= v_2i_X_b;
				
				coef_2ip1[GF_ORDER-1:0] <= coef_term[GF_ORDER-1:0];
			end
			default: begin
				S_in_b <= S_in_b;
				v_2i_X_b <= v_2i_X_b;
				
				coef_2ip1[GF_ORDER-1:0] <= coef_2ip1[GF_ORDER-1:0];
			end
			endcase
		end
	end	
	
	
	
	parallel_FFM_gate S_in_FFM_v_2i_X (
    .poly_form_A(S_in_b[GF_ORDER-1:0]), 
    .poly_form_B(v_2i_X_b[GF_ORDER-1:0]), 
    .poly_form_result(coef_term[GF_ORDER-1:0]));
	
	
	
	assign S_out[GF_ORDER-1:0] = S_in_b[GF_ORDER-1:0];
	

endmodule
