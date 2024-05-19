// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

//////////////////////////////////////////////////////////////////////////////////
// decoder.v for Cosmos OpenSSD
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
// Module Name: decoder
// File Name: decoder.v
//
// Version: v1.2.2-2KB_T32
//
// Description: 
//   - BCH decoder TOP module
//   - for data area
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.2.2
//   - temporary roll-back for releasing
//   - coding style of this version is not unified
//
// * v1.2.1, "Open"
//   - minor modification for releasing
//
// * v1.2.0, "Sliced KES"
//   - change state machine
//
// * v1.1.0, "Long Tail SC"
//   - change state machine
//
// * v1.0.0, "The First"
//   - first draft
//
// * v0.9.0, "Test"
//   - test version
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module decoder(
    clk_100,
	nRESET,
	
	decoder_state,
	decoder_available,
	
	execute_decoding,
	code_BUS_valid,
	code,
	
	decoding_start,
	last_code_block_received,
	decoding_end,
	
	error_detection_stage_end,
	error_detected,
	
	ELP_search_stage_end,
	correction_fail,
	//total_error_number,
	
	corrected_message_strobe,
	corrected_message_output_start,
	corrected_message_output_end,
	corrected_message_out
    );

	//////////////////////////////////////////////////////////////////////
	parameter GF_ORDER = 15;
	parameter DECODER_INPUT_PARALLEL = 8;
	parameter DECODER_OUTPUT_PARALLEL = 8;
	parameter ECC_PARAM_T = 32; // t = 32
	parameter TOTAL_ERROR_BIT = 6; // 2^6 = 64
	parameter RECEIVED_MESSAGE_LENGTH = 2108; // (2KB chunk + 60B parity) / 8b = 2108
	parameter MESSAGE_LENGTH = 2048; // 2KB chunk / 8b = 2048
	parameter MESSAGE_LENGTH_BIT = 11; // 2^11 = 2048
	//////////////////////////////////////////////////////////////////////
	
	parameter DECODER_FSM_BIT = 4;
	parameter RESET   = 4'b0001; // decoder: RESET
	parameter DEC_SC  = 4'b0010; // decoder: syndrome calculation
	parameter DEC_KES = 4'b0100; // decoder: key equation solver
	parameter DEC_CS  = 4'b1000; // decoder: Chien search
	
	
	
	wire clk;
	input wire clk_100;
	input wire nRESET;
	
	output wire [DECODER_FSM_BIT-1:0] decoder_state;
	output wire decoder_available;
	
	input wire execute_decoding; // decoding start command signal
	input wire code_BUS_valid; // code BUS strobe signal
	input wire [DECODER_INPUT_PARALLEL-1:0] code; // code block data BUS
	
	output wire decoding_start; // [indicate] decoding start
	output wire last_code_block_received; // [indicate] last code block received
	output wire decoding_end; // [indicate] decoding end

	output wire error_detection_stage_end; // [indicate] error detection stage(SC) end, check error_detected flag now
	output wire error_detected; // if 1, error_detected
	
	output wire ELP_search_stage_end; // [indicate] error locate polynomial search stage(KES) end, check correction_fail flag now
	output wire correction_fail; // if 1, correction fail, decoding sequence will be terminated
	//output wire [TOTAL_ERROR_BIT-1:0] total_error_number;
	
	output wire corrected_message_strobe; // [indicate] corrected message BUS strobe signal
	output wire corrected_message_output_start; // [indicate] corrected message block transmit start
	output wire corrected_message_output_end; // [indicate] last corrected message block transmitted
	output wire [DECODER_OUTPUT_PARALLEL-1:0] corrected_message_out; // corrected message block data BUS
	
	
	
	// encoder FSM state
	reg [DECODER_FSM_BIT-1:0] cur_state;
	reg [DECODER_FSM_BIT-1:0] nxt_state;
	
	// BRAM
	wire BRAM_write_enable;
	wire [MESSAGE_LENGTH_BIT-1:0] BRAM_write_address;
	wire [DECODER_INPUT_PARALLEL-1:0] BRAM_write_data;
	wire BRAM_read_enable;
	wire [MESSAGE_LENGTH_BIT-1:0] BRAM_read_address;
	wire [DECODER_OUTPUT_PARALLEL-1:0] BRAM_read_data;
	
	// SC
	wire sc_available;
	wire sc_start;
	wire sc_last_code_block_received;
	wire sc_complete;
	wire sc_error_detected;
	
	// KES
	wire execute_kes;
	wire kes_sequence_end;
	wire kes_fail;
	
	// CS
	wire execute_cs;
	wire cs_start;
	wire next_cs_available;
	wire cs_complete;
	wire cs_corrected_message_BUS_valid;
    wire cs_corrected_message_output_start;
    wire cs_corrected_message_output_end;
    wire [DECODER_OUTPUT_PARALLEL-1:0] cs_corrected_message;
	
	// internal variable
	wire valid_execution;
	
	
	
	assign decoder_state[DECODER_FSM_BIT-1:0] = cur_state[DECODER_FSM_BIT-1:0];
	assign decoder_available = (cur_state == RESET);
	// block the fast execute function
	//assign decoder_available = (cur_state == RESET) | ((cur_state == DEC_CS) & (next_cs_available));
	
	assign decoding_start = sc_start;
	assign last_code_block_received = sc_last_code_block_received;
	assign decoding_end = cs_complete;
	
	assign error_detection_stage_end = sc_complete;
	assign error_detected = sc_error_detected;
	
	assign ELP_search_stage_end = kes_sequence_end;
	assign correction_fail = kes_fail;
	//assign total_error_number = 
	
	assign execute_kes = (error_detection_stage_end) & (error_detected);
	assign execute_cs = (ELP_search_stage_end) & (~correction_fail);
	
	assign corrected_message_strobe = cs_corrected_message_BUS_valid;
	assign corrected_message_output_start = cs_corrected_message_output_start;
	assign corrected_message_output_end = cs_corrected_message_output_end;
	assign corrected_message_out = cs_corrected_message;
	
	assign valid_execution = execute_decoding & code_BUS_valid;
	
	
	
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
			nxt_state <= (valid_execution)? DEC_SC:RESET;
		end
		DEC_SC: begin
			nxt_state <= (sc_available)? (RESET):( (error_detection_stage_end)? ( (error_detected)? (DEC_KES):(DEC_SC) ):(DEC_SC) );
		end
		DEC_KES: begin
			nxt_state <= (correction_fail)? ((valid_execution)? (DEC_SC):(RESET)):
											((ELP_search_stage_end)? (DEC_CS):(DEC_KES));
		end
		DEC_CS: begin
			// block the fast execute function
			//nxt_state <= (decoder_available)? ((valid_execution)? (DEC_SC):(RESET)):(DEC_CS);
			nxt_state <= (corrected_message_output_end)? (RESET):(DEC_CS);
		end
		default: begin
			nxt_state <= RESET;
		end
		endcase
	end

	
	
	////////////////////////////////////////////////////////////////////////////////
	
	wire [GF_ORDER-1:0] sdr_001;
    wire [GF_ORDER-1:0] sdr_002;
    wire [GF_ORDER-1:0] sdr_003;
    wire [GF_ORDER-1:0] sdr_004;
    wire [GF_ORDER-1:0] sdr_005;
    wire [GF_ORDER-1:0] sdr_006;
    wire [GF_ORDER-1:0] sdr_007;
    wire [GF_ORDER-1:0] sdr_008;
    wire [GF_ORDER-1:0] sdr_009;
    wire [GF_ORDER-1:0] sdr_010;
    wire [GF_ORDER-1:0] sdr_011;
    wire [GF_ORDER-1:0] sdr_012;
    wire [GF_ORDER-1:0] sdr_013;
    wire [GF_ORDER-1:0] sdr_014;
    wire [GF_ORDER-1:0] sdr_015;
    wire [GF_ORDER-1:0] sdr_016;
    wire [GF_ORDER-1:0] sdr_017;
    wire [GF_ORDER-1:0] sdr_018;
    wire [GF_ORDER-1:0] sdr_019;
    wire [GF_ORDER-1:0] sdr_020;
    wire [GF_ORDER-1:0] sdr_021;
    wire [GF_ORDER-1:0] sdr_022;
    wire [GF_ORDER-1:0] sdr_023;
    wire [GF_ORDER-1:0] sdr_024;
    wire [GF_ORDER-1:0] sdr_025;
    wire [GF_ORDER-1:0] sdr_026;
    wire [GF_ORDER-1:0] sdr_027;
    wire [GF_ORDER-1:0] sdr_028;
    wire [GF_ORDER-1:0] sdr_029;
    wire [GF_ORDER-1:0] sdr_030;
    wire [GF_ORDER-1:0] sdr_031;
    wire [GF_ORDER-1:0] sdr_032;
    wire [GF_ORDER-1:0] sdr_033;
    wire [GF_ORDER-1:0] sdr_034;
    wire [GF_ORDER-1:0] sdr_035;
    wire [GF_ORDER-1:0] sdr_036;
    wire [GF_ORDER-1:0] sdr_037;
    wire [GF_ORDER-1:0] sdr_038;
    wire [GF_ORDER-1:0] sdr_039;
    wire [GF_ORDER-1:0] sdr_040;
    wire [GF_ORDER-1:0] sdr_041;
    wire [GF_ORDER-1:0] sdr_042;
    wire [GF_ORDER-1:0] sdr_043;
    wire [GF_ORDER-1:0] sdr_044;
    wire [GF_ORDER-1:0] sdr_045;
    wire [GF_ORDER-1:0] sdr_046;
    wire [GF_ORDER-1:0] sdr_047;
    wire [GF_ORDER-1:0] sdr_048;
    wire [GF_ORDER-1:0] sdr_049;
    wire [GF_ORDER-1:0] sdr_050;
    wire [GF_ORDER-1:0] sdr_051;
    wire [GF_ORDER-1:0] sdr_052;
    wire [GF_ORDER-1:0] sdr_053;
    wire [GF_ORDER-1:0] sdr_054;
    wire [GF_ORDER-1:0] sdr_055;
    wire [GF_ORDER-1:0] sdr_056;
    wire [GF_ORDER-1:0] sdr_057;
    wire [GF_ORDER-1:0] sdr_058;
    wire [GF_ORDER-1:0] sdr_059;
    wire [GF_ORDER-1:0] sdr_060;
    wire [GF_ORDER-1:0] sdr_061;
    wire [GF_ORDER-1:0] sdr_062;
    wire [GF_ORDER-1:0] sdr_063;
	
	////////////////////////////////////////////////////////////////////////////////
	
	wire [GF_ORDER-1:0] v_000;
    wire [GF_ORDER-1:0] v_001;
    wire [GF_ORDER-1:0] v_002;
    wire [GF_ORDER-1:0] v_003;
    wire [GF_ORDER-1:0] v_004;
    wire [GF_ORDER-1:0] v_005;
    wire [GF_ORDER-1:0] v_006;
    wire [GF_ORDER-1:0] v_007;
    wire [GF_ORDER-1:0] v_008;
    wire [GF_ORDER-1:0] v_009;
    wire [GF_ORDER-1:0] v_010;
    wire [GF_ORDER-1:0] v_011;
    wire [GF_ORDER-1:0] v_012;
    wire [GF_ORDER-1:0] v_013;
    wire [GF_ORDER-1:0] v_014;
    wire [GF_ORDER-1:0] v_015;
    wire [GF_ORDER-1:0] v_016;
    wire [GF_ORDER-1:0] v_017;
    wire [GF_ORDER-1:0] v_018;
    wire [GF_ORDER-1:0] v_019;
    wire [GF_ORDER-1:0] v_020;
    wire [GF_ORDER-1:0] v_021;
    wire [GF_ORDER-1:0] v_022;
    wire [GF_ORDER-1:0] v_023;
    wire [GF_ORDER-1:0] v_024;
    wire [GF_ORDER-1:0] v_025;
    wire [GF_ORDER-1:0] v_026;
    wire [GF_ORDER-1:0] v_027;
    wire [GF_ORDER-1:0] v_028;
    wire [GF_ORDER-1:0] v_029;
    wire [GF_ORDER-1:0] v_030;
    wire [GF_ORDER-1:0] v_031;
    wire [GF_ORDER-1:0] v_032;
	
	////////////////////////////////////////////////////////////////////////////////
	
	
	
	////////////////////////////////////////////////////////////////////////////////
	
	received_message_buffer BRAM_buf_2K (
    // write port
	.clka(clk), 
    .ena(BRAM_write_enable), 
    .wea(BRAM_write_enable), 
    .addra(BRAM_write_address), 
    .dina(BRAM_write_data), 
    
	// read port
	.clkb(clk), 
    .enb(BRAM_read_enable), 
    .addrb(BRAM_read_address), 
    .doutb(BRAM_read_data)
    );
	
	////////////////////////////////////////////////////////////////////////////////
	
	syndrome_calculator SC_module (
    .clk(clk), 
    .nRESET(nRESET), 
	.sc_available(sc_available),
    .execute_sc(execute_decoding), 
    .code_BUS_valid(code_BUS_valid), 
    .code(code), 
    .sc_start(sc_start), 
    .last_code_block_received(sc_last_code_block_received), 
    .BRAM_write_enable(BRAM_write_enable), 
    .BRAM_write_address(BRAM_write_address), 
    .BRAM_write_data(BRAM_write_data), 
    .sdr_001(sdr_001), 
    .sdr_002(sdr_002), 
    .sdr_003(sdr_003), 
    .sdr_004(sdr_004), 
    .sdr_005(sdr_005), 
    .sdr_006(sdr_006), 
    .sdr_007(sdr_007), 
    .sdr_008(sdr_008), 
    .sdr_009(sdr_009), 
    .sdr_010(sdr_010), 
    .sdr_011(sdr_011), 
    .sdr_012(sdr_012), 
    .sdr_013(sdr_013), 
    .sdr_014(sdr_014), 
    .sdr_015(sdr_015), 
    .sdr_016(sdr_016), 
    .sdr_017(sdr_017), 
    .sdr_018(sdr_018), 
    .sdr_019(sdr_019), 
    .sdr_020(sdr_020), 
    .sdr_021(sdr_021), 
    .sdr_022(sdr_022), 
    .sdr_023(sdr_023), 
    .sdr_024(sdr_024), 
    .sdr_025(sdr_025), 
    .sdr_026(sdr_026), 
    .sdr_027(sdr_027), 
    .sdr_028(sdr_028), 
    .sdr_029(sdr_029), 
    .sdr_030(sdr_030), 
    .sdr_031(sdr_031), 
    .sdr_032(sdr_032), 
    .sdr_033(sdr_033), 
    .sdr_034(sdr_034), 
    .sdr_035(sdr_035), 
    .sdr_036(sdr_036), 
    .sdr_037(sdr_037), 
    .sdr_038(sdr_038), 
    .sdr_039(sdr_039), 
    .sdr_040(sdr_040), 
    .sdr_041(sdr_041), 
    .sdr_042(sdr_042), 
    .sdr_043(sdr_043), 
    .sdr_044(sdr_044), 
    .sdr_045(sdr_045), 
    .sdr_046(sdr_046), 
    .sdr_047(sdr_047), 
    .sdr_048(sdr_048), 
    .sdr_049(sdr_049), 
    .sdr_050(sdr_050), 
    .sdr_051(sdr_051), 
    .sdr_052(sdr_052), 
    .sdr_053(sdr_053), 
    .sdr_054(sdr_054), 
    .sdr_055(sdr_055), 
    .sdr_056(sdr_056), 
    .sdr_057(sdr_057), 
    .sdr_058(sdr_058), 
    .sdr_059(sdr_059), 
    .sdr_060(sdr_060), 
    .sdr_061(sdr_061), 
    .sdr_062(sdr_062), 
    .sdr_063(sdr_063), 
    .sc_complete(sc_complete), 
    .error_detected(sc_error_detected)
    );
	
	////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////
	
	key_equation_solver KES_module (
    //.clk(clk), 
	.clk(clk_100), 
    .nRESET(nRESET), 
    .execute_kes(execute_kes), 
    .sdr_001(sdr_001), 
    .sdr_002(sdr_002), 
    .sdr_003(sdr_003), 
    .sdr_004(sdr_004), 
    .sdr_005(sdr_005), 
    .sdr_006(sdr_006), 
    .sdr_007(sdr_007), 
    .sdr_008(sdr_008), 
    .sdr_009(sdr_009), 
    .sdr_010(sdr_010), 
    .sdr_011(sdr_011), 
    .sdr_012(sdr_012), 
    .sdr_013(sdr_013), 
    .sdr_014(sdr_014), 
    .sdr_015(sdr_015), 
    .sdr_016(sdr_016), 
    .sdr_017(sdr_017), 
    .sdr_018(sdr_018), 
    .sdr_019(sdr_019), 
    .sdr_020(sdr_020), 
    .sdr_021(sdr_021), 
    .sdr_022(sdr_022), 
    .sdr_023(sdr_023), 
    .sdr_024(sdr_024), 
    .sdr_025(sdr_025), 
    .sdr_026(sdr_026), 
    .sdr_027(sdr_027), 
    .sdr_028(sdr_028), 
    .sdr_029(sdr_029), 
    .sdr_030(sdr_030), 
    .sdr_031(sdr_031), 
    .sdr_032(sdr_032), 
    .sdr_033(sdr_033), 
    .sdr_034(sdr_034), 
    .sdr_035(sdr_035), 
    .sdr_036(sdr_036), 
    .sdr_037(sdr_037), 
    .sdr_038(sdr_038), 
    .sdr_039(sdr_039), 
    .sdr_040(sdr_040), 
    .sdr_041(sdr_041), 
    .sdr_042(sdr_042), 
    .sdr_043(sdr_043), 
    .sdr_044(sdr_044), 
    .sdr_045(sdr_045), 
    .sdr_046(sdr_046), 
    .sdr_047(sdr_047), 
    .sdr_048(sdr_048), 
    .sdr_049(sdr_049), 
    .sdr_050(sdr_050), 
    .sdr_051(sdr_051), 
    .sdr_052(sdr_052), 
    .sdr_053(sdr_053), 
    .sdr_054(sdr_054), 
    .sdr_055(sdr_055), 
    .sdr_056(sdr_056), 
    .sdr_057(sdr_057), 
    .sdr_058(sdr_058), 
    .sdr_059(sdr_059), 
    .sdr_060(sdr_060), 
    .sdr_061(sdr_061), 
    .sdr_062(sdr_062), 
    .sdr_063(sdr_063),
    .v_2i_000(v_000),
    .v_2i_001(v_001),
    .v_2i_002(v_002),
    .v_2i_003(v_003),
    .v_2i_004(v_004),
    .v_2i_005(v_005),
    .v_2i_006(v_006),
    .v_2i_007(v_007),
    .v_2i_008(v_008),
    .v_2i_009(v_009),
    .v_2i_010(v_010),
    .v_2i_011(v_011),
    .v_2i_012(v_012),
    .v_2i_013(v_013),
    .v_2i_014(v_014),
    .v_2i_015(v_015),
    .v_2i_016(v_016),
    .v_2i_017(v_017),
    .v_2i_018(v_018),
    .v_2i_019(v_019),
    .v_2i_020(v_020),
    .v_2i_021(v_021),
    .v_2i_022(v_022),
    .v_2i_023(v_023),
    .v_2i_024(v_024),
    .v_2i_025(v_025),
    .v_2i_026(v_026),
    .v_2i_027(v_027),
    .v_2i_028(v_028),
    .v_2i_029(v_029),
    .v_2i_030(v_030),
    .v_2i_031(v_031),
    .v_2i_032(v_032),
    .kes_fail(kes_fail), 
    .kes_sequence_end(kes_sequence_end)
    );

	////////////////////////////////////////////////////////////////////////////////
	
	Chien_search CS_module (
    .clk(clk), 
    .nRESET(nRESET), 
    .execute_cs(execute_cs), 
    .v_000(v_000), 
    .v_001(v_001), 
    .v_002(v_002), 
    .v_003(v_003), 
    .v_004(v_004), 
    .v_005(v_005), 
    .v_006(v_006), 
    .v_007(v_007), 
    .v_008(v_008), 
    .v_009(v_009), 
    .v_010(v_010), 
    .v_011(v_011), 
    .v_012(v_012), 
    .v_013(v_013), 
    .v_014(v_014), 
    .v_015(v_015), 
    .v_016(v_016), 
    .v_017(v_017), 
    .v_018(v_018), 
    .v_019(v_019), 
    .v_020(v_020), 
    .v_021(v_021), 
    .v_022(v_022), 
    .v_023(v_023), 
    .v_024(v_024), 
    .v_025(v_025), 
    .v_026(v_026), 
    .v_027(v_027), 
    .v_028(v_028), 
    .v_029(v_029), 
    .v_030(v_030), 
    .v_031(v_031), 
    .v_032(v_032), 
    .BRAM_read_enable(BRAM_read_enable), 
    .BRAM_read_address(BRAM_read_address), 
	.BRAM_read_data(BRAM_read_data), 
    .cs_start(cs_start), 
    .next_cs_available(next_cs_available), 
    .cs_complete(cs_complete), 
    .corrected_message_BUS_valid(cs_corrected_message_BUS_valid), 
    .corrected_message_output_start(cs_corrected_message_output_start), 
    .corrected_message_output_end(cs_corrected_message_output_end), 
    .corrected_message(cs_corrected_message)
    );

	////////////////////////////////////////////////////////////////////////////////
	
	assign clk = clk_100;
	
endmodule
