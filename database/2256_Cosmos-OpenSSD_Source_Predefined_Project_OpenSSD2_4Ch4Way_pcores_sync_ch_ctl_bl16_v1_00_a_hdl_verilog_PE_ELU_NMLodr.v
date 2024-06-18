// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// PE_ELU_NMLodr.v for Cosmos OpenSSD
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
// Module Name: PE_ELU_NMLodr
// File Name: PE_ELU_NMLodr.v
//
// Version: v1.1.2-2KB_T32
//
// Description: 
//   - Processing Element: Error Locator Update module, normal order
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

module PE_ELU_NMLodr( // error locate update module: normal order
	clk,
	nRESET_KES,
	
	EXECUTE_PE_ELU,
	
    v_2i_Xm1,
    k_2i_Xm1,
    k_2i_Xm2,
    d_2i,
    delta_2im2,
    condition_2i,
    
	v_2i_X,
	v_2i_X_deg_chk_bit,
    k_2i_X
    );

	////////////////////////////////////////////////////////////////////////////////
	parameter GF_ORDER = 15; // GF(2^GF_ORDER)
	parameter [14:0] VALUE_ZERO = 15'b00000_00000_00000;
	parameter [14:0] VALUE_ONE = 15'b00000_00000_00001;
	////////////////////////////////////////////////////////////////////////////////
	
	input wire clk;
	input wire nRESET_KES;
	input wire EXECUTE_PE_ELU;
	input wire [GF_ORDER-1:0] v_2i_Xm1;
    input wire [GF_ORDER-1:0] k_2i_Xm1;
    input wire [GF_ORDER-1:0] k_2i_Xm2;
    input wire [GF_ORDER-1:0] d_2i;
    input wire [GF_ORDER-1:0] delta_2im2;
    input wire condition_2i;
    output reg [GF_ORDER-1:0] v_2i_X;
	output reg v_2i_X_deg_chk_bit;
    output reg [GF_ORDER-1:0] k_2i_X;
	
	
	
	//reg EXECUTE_PE_ELU_b;
	reg [GF_ORDER-1:0] v_2i_Xm1_b;
    reg [GF_ORDER-1:0] k_2i_Xm1_b;
    reg [GF_ORDER-1:0] k_2i_Xm2_b;
    reg [GF_ORDER-1:0] d_2i_b;
    reg [GF_ORDER-1:0] delta_2im2_b;
	reg condition_2i_b;
	
	wire [GF_ORDER-1:0] v_2ip2_X_term_A;
	wire [GF_ORDER-1:0] v_2ip2_X_term_B;
	wire [GF_ORDER-1:0] v_2ip2_X;
	
	wire [GF_ORDER-1:0] k_2ip2_X;
	
	// FSM
	parameter PE_ELU_RST = 3'b001; // reset
	parameter PE_ELU_INP = 3'b010; // input capture
	parameter PE_ELU_OUT = 3'b100; // output buffer update
	
	// FSM state
	reg [2:0] cur_state;
	reg [2:0] nxt_state;
	
	
	/*
	// execution register update
	always @ (posedge clk, negedge nRESET_KES)
	begin
		if (!nRESET_KES) begin
			EXECUTE_PE_ELU_b <= 0;
		end	else begin
			EXECUTE_PE_ELU_b <= EXECUTE_PE_ELU;
		end
	end*/
	
	// update current state to next state
	always @ (posedge clk, negedge nRESET_KES)
	begin
		if (!nRESET_KES) begin
			cur_state <= PE_ELU_RST;
		end else begin
			cur_state <= nxt_state;
		end
	end
	
	// decide next state
	always @ ( * )
	begin
		case (cur_state)
		PE_ELU_RST: begin
			nxt_state <= (EXECUTE_PE_ELU)? (PE_ELU_INP):(PE_ELU_RST);
		end
		PE_ELU_INP: begin
			nxt_state <= PE_ELU_OUT;
		end
		PE_ELU_OUT: begin
			nxt_state <= PE_ELU_RST;
		end
		default: begin
			nxt_state <= PE_ELU_RST;
		end
		endcase
	end

	// state behaviour
	always @ (posedge clk, negedge nRESET_KES)
	begin
		if (!nRESET_KES) begin // initializing
			v_2i_Xm1_b <= 0;
			k_2i_Xm1_b <= 0;
			k_2i_Xm2_b <= 0;
			d_2i_b <= 0;
			delta_2im2_b <= 0;
			condition_2i_b <= 0;
			
			v_2i_X[GF_ORDER-1:0] <= VALUE_ZERO[GF_ORDER-1:0];
			v_2i_X_deg_chk_bit <= 0;
			k_2i_X[GF_ORDER-1:0] <= VALUE_ZERO[GF_ORDER-1:0];
		end
		
		else begin		
			case (nxt_state)
			PE_ELU_RST: begin // hold original data
				v_2i_Xm1_b <= v_2i_Xm1_b;
				k_2i_Xm1_b <= k_2i_Xm1_b;
				k_2i_Xm2_b <= k_2i_Xm2_b;
				d_2i_b <= d_2i_b;
				delta_2im2_b <= delta_2im2_b;
				condition_2i_b <= condition_2i_b;
				
				v_2i_X[GF_ORDER-1:0] <= v_2i_X[GF_ORDER-1:0];
				v_2i_X_deg_chk_bit <= v_2i_X_deg_chk_bit;
				k_2i_X[GF_ORDER-1:0] <= k_2i_X[GF_ORDER-1:0];
			end
			PE_ELU_INP: begin // input capture only
				v_2i_Xm1_b <= v_2i_Xm1;
				k_2i_Xm1_b <= k_2i_Xm1;
				k_2i_Xm2_b <= k_2i_Xm2;
				d_2i_b <= d_2i;
				delta_2im2_b <= delta_2im2;
				condition_2i_b <= condition_2i;
				
				v_2i_X[GF_ORDER-1:0] <= v_2i_X[GF_ORDER-1:0];
				v_2i_X_deg_chk_bit <= v_2i_X_deg_chk_bit;
				k_2i_X[GF_ORDER-1:0] <= k_2i_X[GF_ORDER-1:0];
			end
			PE_ELU_OUT: begin // output update only
				v_2i_Xm1_b <= v_2i_Xm1_b;
				k_2i_Xm1_b <= k_2i_Xm1_b;
				k_2i_Xm2_b <= k_2i_Xm2_b;
				d_2i_b <= d_2i_b;
				delta_2im2_b <= delta_2im2_b;
				condition_2i_b <= condition_2i_b;
				
				v_2i_X[GF_ORDER-1:0] <= v_2ip2_X[GF_ORDER-1:0];
				v_2i_X_deg_chk_bit <= |(v_2ip2_X[GF_ORDER-1:0]);
				k_2i_X[GF_ORDER-1:0] <= k_2ip2_X[GF_ORDER-1:0];
			end
			default: begin
				v_2i_Xm1_b <= v_2i_Xm1_b;
				k_2i_Xm1_b <= k_2i_Xm1_b;
				k_2i_Xm2_b <= k_2i_Xm2_b;
				d_2i_b <= d_2i_b;
				delta_2im2_b <= delta_2im2_b;
				condition_2i_b <= condition_2i_b;
				
				v_2i_X[GF_ORDER-1:0] <= v_2i_X[GF_ORDER-1:0];
				v_2i_X_deg_chk_bit <= v_2i_X_deg_chk_bit;
				k_2i_X[GF_ORDER-1:0] <= k_2i_X[GF_ORDER-1:0];
			end
			endcase
		end
	end	
	
	
	
	parallel_FFM_gate delta_2im2_FFM_v_2i_X (
    .poly_form_A(delta_2im2_b[GF_ORDER-1:0]), 
    .poly_form_B(v_2i_X[GF_ORDER-1:0]), 
    .poly_form_result(v_2ip2_X_term_A[GF_ORDER-1:0]));
	
	parallel_FFM_gate d_2i_FFM_k_2i_Xm1 (
    .poly_form_A(d_2i_b[GF_ORDER-1:0]), 
    .poly_form_B(k_2i_Xm1_b[GF_ORDER-1:0]), 
    .poly_form_result(v_2ip2_X_term_B[GF_ORDER-1:0]));
	
	assign v_2ip2_X[GF_ORDER-1:0] = v_2ip2_X_term_A[GF_ORDER-1:0] ^ v_2ip2_X_term_B[GF_ORDER-1:0];
	
	assign k_2ip2_X[GF_ORDER-1:0] = (condition_2i_b)? (v_2i_Xm1_b[GF_ORDER-1:0]):(k_2i_Xm2_b[GF_ORDER-1:0]);
	
	
endmodule
