// This program was cloned from: https://github.com/dh219/DSTB
// License: GNU General Public License v2.0

`timescale 1ns / 1ps

/* DAVID'S ST BOOSTER v 1 (DSTB1) 				*/
/* Copyright 2022 D Henderson 						*/
/* Released under the terms of the GPLv2 	*/

module altram_68k (
	input AS_INT,
	inout AS,
	input RW,
	input UDS,
	input LDS,
	inout DTACK,
	inout DTACK_INT,

	input BGK,
	input RST,
	inout BERR,

	input CLKOSC,
	input CLK8,
	output CLKOUT,
	output RAMCLK,
	output CKE,

	inout E,
	input E_INT,
	input VPA,
	input VMA_INT,
	output VMA,
	
	output [2:0] DQM,
	output [1:0] BA,
	output [12:0] MA,
	output BOE ,
	output RAMWE,
	output CAS,
	output RAS,

	input [2:0] FC,
	input [23:1] A,

	inout [1:5] TP,
	output LED
 );


reg CLKOSC_2 = 1'b1;
always @(posedge CLKOSC ) begin
	CLKOSC_2 <= ~CLKOSC_2;
end
reg CLKOSC_4 = 1'b1;
always @(posedge CLKOSC_2 ) begin
	CLKOSC_4 <= ~CLKOSC_4;
end

reg ALLOWFAST = 1'b1;
always @( posedge RST ) begin
	ALLOWFAST <= TP[3];
end

/* RAM */
reg ENABLE = 1'b1;
reg reg_dtack = 1'b1;
reg ROM_DECODE = 1'b1;
wire rom_access = ROM_DECODE | ( A[23:20] != 4'he );

wire AS_COMBINED = AS_INT & AS;

always @( negedge AS_INT or negedge RST ) begin
	if( ~RST ) begin
		reg_dtack <= 1'b1;
		ENABLE <= 1'b1;
		ROM_DECODE <= 1'b1;
	end
	else begin
		if( A[23:4] == 20'hFFFE0 ) begin
			if( A[3:1] == 3'h7 ) begin
				ROM_DECODE <= 1'b0;
				reg_dtack <= 1'b0;
			end
			else			begin
				ENABLE <= 1'b0;
				reg_dtack <= 1'b0;
			end
		end
		else begin
			reg_dtack <= 1'b1;		
		end
	end
end


/* sdram module */
wire [12:0] ma;
wire [1:0] ba;
wire [1:0] dqm;
wire ras;
wire cas;
wire ramwe;
wire sdram_valid;

wire altram_access_int = (UDS&LDS) | ENABLE | ( A[23:22] != 2'b01 && A[23:22] != 2'b10 ) & rom_access;
wire altram_access_ext = AS | ENABLE | ( A[23:22] != 2'b01 && A[23:22] != 2'b10 );
wire [3:0] REWRITE_A2320 = rom_access ? A[23:20] : 4'hB;

reg PSG_DTACK;
always @( negedge DTACK ) begin
	PSG_DTACK <= ( A[23:8] != 16'hFF88 );
end

wire TOS206 = AS_COMBINED | ( ( A[23:20] != 4'he ) & ( A[23:3] != 21'h0 ) );
reg [1:0] dtack_tos206 = 1'b1;
always @( negedge CLK8 ) begin
	if( AS_COMBINED )
		dtack_tos206 <= 2'b11;
	else
		dtack_tos206 <= {dtack_tos206[0],TOS206};
end


nouveau_sdram sdram(
	.CLK(RAMCLK),
	.CLK8(CLK8),
	.RST_ASYNC(RST),
	
	.AS_ASYNC( altram_access_int ),
	.UDS_ASYNC(UDS),
	.LDS_ASYNC(LDS),
	.RW_ASYNC(RW),
	
	.A( { REWRITE_A2320, A[19:1] } ),
	.VALID(sdram_valid),
	.WTERM(sdram_wterm),
	
	.MA(ma),
	.BA(ba),
	.DQM(dqm),

	.RAS(ras),
	.CAS(cas),
	.RAMWE(ramwe)
);

wire SLOW = ALLOWFAST ? PSG_DTACK & ( AS_INT | ~altram_access_int ) : 1'b0;
wire CLK_OUT_INT;
clockmux mod_clock ( 
	.clk0( CLKOSC_4 ),
	.clk1( ~CLK8 ),
	.select( SLOW ), // high = clk0
	.active0( FASTACTIVE ),
	.active1( SLOWACTIVE ),
	.out_clock( CLK_OUT_INT )
);

/* assignments */
assign DTACK = (BGK | (sdram_valid & sdram_wterm & dtack_tos206) )  ? 1'bz : 1'b0;

//assign AS_INT = BGK ? 1'bz : AS;

wire newas = altram_access_int ? AS_INT : 1'b1;
assign AS = BGK ? newas : 1'bz;
assign DTACK_INT = DTACK & reg_dtack & sdram_valid & sdram_wterm & dtack_tos206;

assign BERR = 1'bz;// BGK | altram_access_ext  ? 1'bz : 1'b0;

assign RAMCLK = CLKOSC;
assign CLKOUT = ~CLK_OUT_INT;
//assign CLKOUT = CLK8;

assign E = BGK ? E_INT : 1'bz;
assign VMA = BGK ? VMA_INT : 1'bz;

assign CKE = 1'b1;
assign DQM[1:0] = dqm;
assign BA[1:0] = ba;
assign MA[12:0] = ma;
assign RAMWE = ramwe;
assign CAS = cas;
assign RAS = ras;
assign BOE = 1'b0;

//wire screen = ~RW & ~AS_INT & A[23:1] == 23'h7FC101; // upper 23 bits of the mid screen address register

assign TP[1] = TOS206; 
assign TP[2] = 1'bz; //SLOWACTIVE;//(UDS&LDS) | ( A[23:20] != 4'hc );
assign TP[3] = 1'bz;
assign TP[4] = 1'bz;
assign TP[5] = 1'bz;

assign LED = sdram_valid & sdram_wterm;

endmodule
