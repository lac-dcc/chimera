// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

//============================================================================
//  Konami TMNT for MiSTer
//
//  Copyright (C) 2022 Sean 'Furrtek' Gonsalves
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//============================================================================

// k007232 2-channel PCM sound chip

module k007232(
	input CLK,
	input clk_en_p,
	input clk_en_n,
	input NRES,					// Reset (active low)
	
	input NRCS, NRD,			// External memory CS
	input DACS,					// Internal registers CS
	input [3:0] AB,
	output NQ, NE,				// For 6809
	
	inout [7:0] DB,			// CPU data bus
	//inout [7:0] RAM,		// External memory data
	input [7:0] RAM_IN,
	output [7:0] RAM_OUT,
	output [16:0] SA,			// External memory address
	output reg [6:0] ASD,	// Channel A output
	output reg [6:0] BSD,	// Channel A output
	
	output CK2M,
	output SLEV					// Decoded register 12 access
);

	wire nNRES = ~NRES;
	reg [7:0] CLKDIV;
	reg E74, F74, D69;
	wire [11:0] CH1_PRE;
	wire [16:0] CH1_A;
	wire [11:0] CH2_PRE;
	wire [16:0] CH2_A;

	reg [7:0] REG0;
	reg [5:0] REG1;
	reg [7:0] REG2;
	reg [7:0] REG3;
	reg REG4;
	reg [7:0] REG6;
	reg [5:0] REG7;
	reg [7:0] REG8;
	reg [7:0] REG9;
	reg REG10;
	reg [1:0] REG13;
	
	reg CH1_RESET, CH2_RESET;
	wire CH1_PRE_OUT, CH2_PRE_OUT;
	wire nCH1_RELOAD, nCH2_RELOAD;
	
	assign NE = F74;
	assign NQ = E74;
	
	always @(posedge CLK or posedge nNRES) begin
		if (nNRES)
			E74 <= 0;
		else begin
			if (clk_en_n)
				E74 <= F74;
		end
	end
	always @(posedge CLK or posedge nNRES) begin
		if (nNRES)
			F74 <= 0;
		else begin
			if (clk_en_p)
				F74 <= ~E74;
		end
	end
	always @(posedge F74 or posedge nNRES) begin
		if (nNRES)
			D69 <= 0;
		else
			D69 <= ~D69;
	end

	// CLK/1024
	always @(posedge CLK or posedge nNRES) begin
		if (nNRES)
			CLKDIV <= 8'b00000000;
		else begin
			if (clk_en_p)
				CLKDIV <= CLKDIV + 1'b1;
		end
	end

	wire CLKd1024 = CLKDIV[7];
	wire CLKd4 = D69;

	// Output data latches
	always @(negedge CLKd4)
		BSD <= RAM_IN[6:0];
		
	always @(posedge CLKd4)
		ASD <= RAM_IN[6:0];

	// Address output selector
	assign SA = D69 ? CH2_A : CH1_A;

	wire [3:0] DIV;
	wire RELOAD_DIV = &{DIV};

	CNT1 CLKDIV10(REG1[4] ? CLKd4 : CLKd1024, nNRES, ~RELOAD_DIV, 1'b1, ~RELOAD_DIV, 4'b1001, DIV);

	assign CK2M = REG1[5] ? CLKd1024 : RELOAD_DIV;
	
	wire [3:0] ADDR = {AB[3:1], ~AB[0]};

	// Registers
	wire nREG0_WR = ~((ADDR == 4'd0) & ~DACS);
	wire nREG1_WR = ~((ADDR == 4'd1) & ~DACS);
	wire nREG2_WR = ~((ADDR == 4'd2) & ~DACS);
	wire nREG3_WR = ~((ADDR == 4'd3) & ~DACS);
	wire nREG4_WR = ~((ADDR == 4'd4) & ~DACS);
	wire REG5_WR = ((ADDR == 4'd5) & ~DACS);
	wire nREG6_WR = ~((ADDR == 4'd6) & ~DACS);
	wire nREG7_WR = ~((ADDR == 4'd7) & ~DACS);
	wire nREG8_WR = ~((ADDR == 4'd8) & ~DACS);
	wire nREG9_WR = ~((ADDR == 4'd9) & ~DACS);
	wire nREG10_WR = ~((ADDR == 4'd10) & ~DACS);
	wire REG11_WR = ((ADDR == 4'd11) & ~DACS);
	assign SLEV = ~((ADDR == 4'd12) & ~DACS);
	wire nREG13_WR = ~((ADDR == 4'd13) & ~DACS);

	assign RAM_OUT = (~NRCS & NRD & ~NE) ? DB : 8'bzzzzzzzz;	// TODO
	assign DB = (~NRCS & ~NRD & ~NE) ? RAM_IN : 8'bzzzzzzzz;

	// Reload CH1 prescaler whenever regs 0 or 1 are written to, or overflow
	wire V66 = ~&{nREG0_WR, nREG1_WR};
	reg K74;
	always @(posedge NE or posedge V66) begin
		if (V66)
			K74 <= 0;
		else
			K74 <= 1;
	end
	wire nCH1_RESET_PRE = ~|{CH1_PRE_OUT, ~K74};

	// Reload CH2 prescaler whenever regs 6 or 7 are written to, or overflow
	wire V91 = ~&{nREG6_WR, nREG7_WR};
	reg L79;
	always @(posedge NE or posedge V91) begin
		if (V91)
			L79 <= 0;
		else
			L79 <= 1;
	end
	wire nCH2_RESET_PRE = ~|{CH2_PRE_OUT, ~L79};

	always @(posedge nREG4_WR)
		REG4 <= DB[0];
	always @(posedge nREG10_WR)
		REG10 <= DB[0];

	always @(posedge nREG13_WR)
		REG13 <= DB[1:0];
		
	always @(posedge nREG0_WR)
		REG0 <= DB;
	always @(posedge nREG1_WR)
		REG1 <= DB[5:0];
	always @(posedge nREG2_WR)
		REG2 <= DB;
	always @(posedge nREG3_WR)
		REG3 <= DB;
	always @(posedge nREG6_WR)
		REG6 <= DB;
	always @(posedge nREG7_WR)
		REG7 <= DB[5:0];
	always @(posedge nREG8_WR)
		REG8 <= DB;
	always @(posedge nREG9_WR)
		REG9 <= DB;
		
	wire M49, H97, M75, K95;
	// CH1 Prescaler
	CNT2 CH1PRE0(NE, nCH1_RESET_PRE, CLKd4, nCH1_RESET_PRE, REG0[3:0], CH1_PRE[3:0]);
	CNT2 CH1PRE1(NE, nCH1_RESET_PRE, M49, nCH1_RESET_PRE, REG0[7:4], CH1_PRE[7:4]);
	CNT2 CH1PRE2(NE, nCH1_RESET_PRE, H97, nCH1_RESET_PRE, REG1[3:0], CH1_PRE[11:8]);
	assign M49 = &{CLKd4, CH1_PRE[3:0]};		// Second CEN: first carry
	wire J33 = &{M49, CH1_PRE[7:4]};
	wire J83 = &{H97, CH1_PRE[11:8]};
	assign H97 = REG1[5] ? CLKd4 : J33;			// Third CEN: bypass two first stages, or use second carry
	assign CH1_PRE_OUT = REG1[4] ? J33 : J83;	// Overflow output: use second carry, or third
	
	// CH2 Prescaler
	CNT2 CH2PRE0(NE, nCH2_RESET_PRE, CLKd4, nCH2_RESET_PRE, REG6[3:0], CH2_PRE[3:0]);
	CNT2 CH2PRE1(NE, nCH2_RESET_PRE, M75, nCH2_RESET_PRE, REG6[7:4], CH2_PRE[7:4]);
	CNT2 CH2PRE2(NE, nCH2_RESET_PRE, K95, nCH2_RESET_PRE, REG7[3:0], CH2_PRE[11:8]);
	assign M75 = &{~CLKd4, CH2_PRE[3:0]};		// Second CEN: first carry
	wire K91 = &{M75, CH2_PRE[7:4]};
	wire G95 = &{K95, CH2_PRE[11:8]};
	assign K95 = REG7[5] ? ~CLKd4 : K91;		// Third CEN: bypass two first stages, or use second carry
	assign CH2_PRE_OUT = REG7[4] ? K91 : G95;	// Overflow output: use second carry, or third
	
	// CH1 Counter
	wire P49, T44, X36;
	CNT1 CH1CNT0(NE, CH1_RESET, nCH1_RELOAD, CH1_PRE_OUT, nCH1_RELOAD, REG2[3:0], CH1_A[3:0]);
	CNT1 CH1CNT1(NE, CH1_RESET, nCH1_RELOAD, P49, nCH1_RELOAD, REG2[7:4], CH1_A[7:4]);
	CNT1 CH1CNT2(NE, CH1_RESET, nCH1_RELOAD, T44, nCH1_RELOAD, REG3[3:0], CH1_A[11:8]);
	CNT3 CH1CNT3(NE, CH1_RESET, nCH1_RELOAD, X36, nCH1_RELOAD, {REG4, REG3[7:4]}, CH1_A[16:12]);
	
	// REG1[5] bypasses all carries, maybe counter test mode ?
	assign P49 = REG1[5] ? CH1_PRE_OUT : &{CH1_PRE_OUT, CH1_A[3:0]};
	assign T44 = REG1[5] ? CH1_PRE_OUT : &{P49, CH1_A[7:4]};
	assign X36 = REG1[5] ? CH1_PRE_OUT : &{T44, CH1_A[11:8]};
	
	wire N67 = CLKd4;
	reg T72, H71;
	always @(posedge N67)
		T72 <= RAM_IN[7];
	always @(posedge NE or posedge nNRES or posedge REG5_WR) begin
		if (nNRES)
			H71 <= 1;
		else if (REG5_WR)
			H71 <= 0;
		else
			H71 <= 1;
	end
	
	assign nCH1_RELOAD = &{~&{REG13[0], T72}, H71};
	//wire L97 = &{~&{~&{~&{~REG13[0], T72}, L97}, ~H71}, NRES};	// Combinational loop :(
	//wire CH1_RESET = ~L97;
	always @(*) begin
		casex({NRES, H71, REG13[0], T72})
			4'b0xxx: CH1_RESET <= 1'b1;			// Reset
			4'b10xx: CH1_RESET <= 1'b0;			// Start
			4'b111x: CH1_RESET <= CH1_RESET;		// Loop
			4'b1100: CH1_RESET <= CH1_RESET;		// Keep running
			4'b1101: CH1_RESET <= 1'b1;			// Stop
		endcase
	end
	
	// CH2 Counter
	wire R25, E31, X21;
	CNT1 CH2CNT0(NE, CH2_RESET, nCH2_RELOAD, CH2_PRE_OUT, nCH2_RELOAD, REG8[3:0], CH2_A[3:0]);
	CNT1 CH2CNT1(NE, CH2_RESET, nCH2_RELOAD, R25, nCH2_RELOAD, REG8[7:4], CH2_A[7:4]);
	CNT1 CH2CNT2(NE, CH2_RESET, nCH2_RELOAD, E31, nCH2_RELOAD, REG9[3:0], CH2_A[11:8]);
	CNT3 CH2CNT3(NE, CH2_RESET, nCH2_RELOAD, X21, nCH2_RELOAD, {REG10, REG9[7:4]}, CH2_A[16:12]);
	
	// REG1[5] bypasses all carries, maybe counter test mode ?
	assign R25 = REG7[5] ? CH2_PRE_OUT : &{CH2_PRE_OUT, CH2_A[3:0]};
	assign E31 = REG7[5] ? CH2_PRE_OUT : &{R25, CH2_A[7:4]};
	assign X21 = REG7[5] ? CH2_PRE_OUT : &{E31, CH2_A[11:8]};
	
	wire N70 = ~CLKd4;
	reg R66, J66;
	always @(posedge N70)
		R66 <= RAM_IN[7];
	always @(posedge NE or posedge nNRES or posedge REG11_WR) begin
		if (nNRES)
			J66 <= 1;
		else if (REG11_WR)
			J66 <= 0;
		else
			J66 <= 1;
	end
	
	assign nCH2_RELOAD = &{~&{REG13[1], R66}, J66};
	//wire T61 = &{~&{~&{~&{~REG13[1], R66}, T61}, ~J66}, NRES};	// Combinational loop :(
	//wire CH2_RESET = ~T61;
	always @(*) begin
		casex({NRES, J66, REG13[0], R66})
			4'b0xxx: CH2_RESET <= 1'b1;			// Reset
			4'b10xx: CH2_RESET <= 1'b0;			// Start
			4'b111x: CH2_RESET <= CH2_RESET;		// Loop
			4'b1100: CH2_RESET <= CH2_RESET;		// Keep running
			4'b1101: CH2_RESET <= 1'b1;			// Stop
		endcase
	end
	
endmodule
