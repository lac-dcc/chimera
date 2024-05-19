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

module tmnt
(
	input reset,
	input clk_sys,				// 96MHz
	input [3:0] tno,
	
	input CPU_RUN,				// DEBUG
	
	input load_en,				// ROM loading from HPS
	input rom_z80_we,
	input rom_prom1_we,
	input rom_prom2_we,
	input rom_007232_we,
	input rom_uPD7759C_we,
	input [15:0] rom_data,
	input [25:0] rom_addr,
	
	output ce_pix,				// Pixel clock enable
	
	input [7:0] inputs_P1,
	input [7:0] inputs_P2,
	input [7:0] inputs_P3,
	input [7:0] inputs_P4,
	input [3:0] inputs_coin,
	input [3:0] inputs_service,
	
	output reg [1:0] coin_counter,

	output [5:0] video_r,
	output [5:0] video_g,
	output [5:0] video_b,

	input [7:0] dipswitch1,
	input [7:0] dipswitch2,
	input [3:0] dipswitch3,
	
	output NCBLK,
	output NHBK,
	output NHSY,
	output NVSY,
	
	output tiles_rom_req,
	output [17:0] tiles_rom_addr,
	input [31:0] tiles_rom_dout,
	
	output spr_rom_req,
	output [18:0] spr_rom_addr,
	input [31:0] spr_rom_dout,

	output theme_rom_req,
	output [17:0] theme_rom_addr,
	input [31:0] theme_rom_dout,
	
	output reg m68k_rom_req,
	output [17:0] m68k_rom_addr,
	input [15:0] m68k_rom_dout,
	
	output signed [15:0] audio_mono,
	
	input sdram_dtack
);

reg [3:0] ce_main_sr;
reg [15:0] ce_pix_sr;
reg [1:0] ce_snd_div;
reg [11:0] ce_snd_cnt;
reg ce_snd_p, ce_snd_n;		// Fractional
reg ce_snd_half;
reg [31:0] rom_req_sr;

// ce_snd_n		_'___'___'___'___'___'___'___' at 3.58M
// ce_snd_p		___'___'___'___'___'___'___'__ at 3.58M
//	ce_snd_div  011223300112233001122330011223
// ce_snd_half _______'_______'_______'______ at 3.58M/2

always @(posedge clk_sys or posedge reset) begin
	if (reset) begin
		ce_main_sr <= 4'd1;
		ce_pix_sr <= 16'd1;
		rom_req_sr <= 32'd1;
		
		ce_snd_cnt <= 12'd0;
		ce_snd_p <= 1'b0;
		ce_snd_n <= 1'b0;
		ce_snd_div <= 2'd0;
		ce_snd_half <= 1'b0;
	end else begin
		ce_main_sr <= {ce_main_sr[2:0], ce_main_sr[3]};		// ROL
		ce_pix_sr <= {ce_pix_sr[14:0], ce_pix_sr[15]};		// ROL
		rom_req_sr <= {rom_req_sr[30:0], rom_req_sr[31]};	// ROL
		// 96M/(3.58M*2) = 13.408
		// 13408/1000 = 1676/125
		if (ce_snd_cnt >= 12'd1676) begin
			ce_snd_div <= ce_snd_div + 1'b1;
			ce_snd_cnt <= ce_snd_cnt - 12'd1676 + 12'd125;
			
			ce_snd_p <= ce_snd_div[0];
			ce_snd_n <= ~ce_snd_div[0];
			ce_snd_half <= &{ce_snd_div};
		end else begin
			ce_snd_p <= 1'b0;
			ce_snd_n <= 1'b0;
			ce_snd_half <= 1'b0;
			ce_snd_cnt <= ce_snd_cnt + 12'd125;
		end
	end
end

assign ce_main = ce_main_sr[3];	// 96/4 = 24 MHz
assign ce_pix = ce_pix_sr[0];		// 96/16 = 6 MHz

assign tiles_rom_req = rom_req_sr[2];	// 1 too early, 96/32 = 3 MHz
assign spr_rom_req = rom_req_sr[16];	// 12 OK, 16 OK 96/32 = 3 MHz, phase shifted

wire [23:1] m68k_addr;
reg [15:0] m68k_din;
wire [15:0] m68k_dout;
wire [15:0] m68k_ram_A_dout;
wire [15:0] m68k_ram_B_dout;
wire nAS;

assign is_tmnt = (tno == 4'd1);

assign m68k_rom_addr = is_tmnt ? m68k_addr[18:1] : {1'b0, m68k_addr[17:1]};

wire [7:0] pal_dout;

wire [7:0] DB_OUT_k052109;	// CPU data from k052109
wire [7:0] DB_OUT_k051960;	// CPU data from k051960
wire [7:0] DB_OUT_k051962;	// CPU data from k051962
wire [7:0] DB_OUT_k051937;	// CPU data from k051937
wire [11:0] VA;				// Layer A palette and pixel
wire [11:0] VB;				// Layer B palette and pixel
wire [7:0] FX;					// Layer FIX palette and pixel
wire [11:0] OB;				// Sprites palette and pixel
reg INT16EN;
reg [7:0] k007644_reg;

reg PRI, PRI2;
wire SHA;
wire NFX, NOBJ, NVB, NVA;	// Pixel opaque signals (active high)
wire ODTAC, VDTAC;			// DTACKs from sprite and plane chips
wire NVBLK;

wire [7:0] prio_addr;
wire [7:0] prio_dout;
assign prio_addr = {PRI2, PRI, VB[7], SHA, NFX, NOBJ, NVB, NVA};	// 2C6 = VB[7] ?

// MiSTer specific: load 8-bit ROM from 16-bit data
byte_loader LOAD_PRIO(
	.clk(clk_sys),
	.en(load_en),
	.wein(rom_prom2_we),
	.weout(rom_prio_we),
	.lsb(rom_lsb)
);

// 256 * 8 (really 256 * 4)
rom_prio ROM_PRIO(
	.clock(~clk_sys),
	.address(load_en ? {rom_addr[7:1], rom_lsb} : prio_addr),
	.q(prio_dout),
	.wren(rom_prio_we),
	.data(rom_lsb ? rom_data[11:8] : rom_data[3:0])
);

wire SHADOW = prio_dout[2];	// prio_dout[3] unused

// 2 * 8k * 8 * 2
// MIA uses both halves, TMNT only uses half B
ram_main RAM_MAIN_A_U(
	.clock(~clk_sys),
	.clken(~is_tmnt),
	.address(m68k_addr[13:1]),
	.q(m68k_ram_A_dout[15:8]),
	.wren(~NUWR & ~nW1CS),
	.data(m68k_dout[15:8])
);
ram_main RAM_MAIN_A_L(
	.clock(~clk_sys),
	.clken(~is_tmnt),
	.address(m68k_addr[13:1]),
	.q(m68k_ram_A_dout[7:0]),
	.wren(~NLWR & ~nW1CS),
	.data(m68k_dout[7:0])
);
ram_main RAM_MAIN_B_U(
	.clock(~clk_sys),
	.clken(1'b1),
	.address(m68k_addr[13:1]),
	.q(m68k_ram_B_dout[15:8]),
	.wren(~NUWR & ~nW2CS),
	.data(m68k_dout[15:8])
);
ram_main RAM_MAIN_B_L(
	.clock(~clk_sys),
	.clken(1'b1),
	.address(m68k_addr[13:1]),
	.q(m68k_ram_B_dout[7:0]),
	.wren(~NLWR & ~nW2CS),
	.data(m68k_dout[7:0])
);

// Everything below 100000 is full speed
assign nDTACK = &{ODTAC, VDTAC, nAS | m68k_addr[20]} | ~sdram_dtack;

// LS74
reg OIPL;
assign VBLK = ~NVBLK;
always @(posedge VBLK or negedge INT16EN) begin
	if (!INT16EN)
		OIPL <= 1'b1;
	else
		OIPL <= 1'b0;
end

wire [23:1] m68k_addr_pre;
wire nAS_pre;
cpu_68k CPU68K(
	.clk(CPU_RUN ? clk_sys : 1'b0),
	.clken(ce_main),
	.nRESET(~reset & CPU_RUN),
	.IPL2(OIPL), .IPL1(1'b1), .IPL0(OIPL),
	.nDTACK(nDTACK),
	.M68K_ADDR(m68k_addr_pre),
	.FX68K_DATAIN(m68k_din),
	.FX68K_DATAOUT(m68k_dout),
	.nLDS(nLDS), .nUDS(nUDS_pre),
	.nAS(nAS_pre),
	.M68K_RW(m68k_rw),
	.nBG(nBG),
	.nBR(1'b1),
	.nBGACK(1'b1)
);

assign m68k_addr = CPU_RUN ? m68k_addr_pre : 23'h000000;
assign nAS = nAS_pre | ~CPU_RUN;
assign nUDS = nUDS_pre | ~CPU_RUN;

assign NLWR = nLDS | m68k_rw | ~CPU_RUN;
assign NUWR = nUDS | m68k_rw | ~CPU_RUN;
assign PDS = ~&{nLDS, nUDS, CPU_RUN};

reg [7:0] U47;	// CPU LS138
always @(*) begin
	case({nAS, m68k_addr[20], m68k_addr[19:17]})
		5'b0_0000: U47 <= 8'b11111110;
		5'b0_0001: U47 <= 8'b11111101;
		5'b0_0010: U47 <= 8'b11111011;
		5'b0_0011: U47 <= 8'b11110111;
		5'b0_0100: U47 <= 8'b11101111;
		5'b0_0101: U47 <= 8'b11011111;
		5'b0_0110: U47 <= 8'b10111111;
		5'b0_0111: U47 <= 8'b01111111;
		default: U47 <= 8'b11111111;
	endcase
end

assign nROMCS = &{U47[1:0]};	// Bottom ROMs
assign nW1CS = U47[2];			// TMNT:Top ROMs, MIA:Work RAM
assign nW2CS = U47[3];			// Work RAM
assign COLCS = U47[4];			// Palette RAM
assign SYSWR = U47[6];			// Set PRI*

reg [7:0] U45;	// CPU LS138
always @(*) begin
	case({U47[5], m68k_addr[16], m68k_rw, m68k_addr[4:3]})
		5'b0_0000: U45 <= 8'b11111110;
		5'b0_0001: U45 <= 8'b11111101;
		5'b0_0010: U45 <= 8'b11111011;
		5'b0_0011: U45 <= 8'b11110111;
		5'b0_0100: U45 <= 8'b11101111;
		5'b0_0101: U45 <= 8'b11011111;
		5'b0_0110: U45 <= 8'b10111111;
		5'b0_0111: U45 <= 8'b01111111;
		default: U45 <= 8'b11111111;
	endcase
end

assign IOWR = U45[0];	// Coin lockouts, Z80 IRQ, GFX ROM read...
assign SNDDT = U45[1];	// Sound code
assign AFR = U45[2];		// TODO: k051550 watchdog reset

assign SHOOT = U45[4];	// Read inputs
assign DIP = U45[6];
assign DIP3 = U45[7];

reg RMRD;
reg SNDON;
always @(posedge IOWR or posedge reset) begin
	if (reset) begin
		{RMRD, INT16EN, SNDON, coin_counter} <= 5'b000_00;
	end else begin
		RMRD <= m68k_dout[7];		// GFX ROM read
		INT16EN <= m68k_dout[5];	// Vblank IRQ en
		SNDON <= m68k_dout[3];		// Z80 IRQ trig
		coin_counter[1] <= m68k_dout[1];
		coin_counter[0] <= m68k_dout[0];
	end
end

always @(posedge SYSWR or posedge reset) begin
	if (reset) begin
		PRI <= 0;
		PRI2 <= 0;
	end else begin
		PRI <= m68k_dout[2];
		PRI2 <= m68k_dout[3];
	end
end

assign m68k_rom_ncs = is_tmnt ? (nROMCS & nW1CS) : nROMCS;

reg m68k_rom_ncs_reg;
always @(posedge clk_sys or posedge reset) begin
	if (reset) begin
		m68k_rom_ncs_reg <= 1'b1;
		m68k_rom_req <= 1'b0;
	end else begin
		if (!m68k_rom_req) begin
			if (m68k_rom_ncs_reg & ~m68k_rom_ncs)	// Falling edge
				m68k_rom_req <= 1'b1;
		end else
			m68k_rom_req <= 1'b0;
		m68k_rom_ncs_reg <= m68k_rom_ncs;
	end
end

wire OEQ, PE;
// 68k data input mux - Control signals all active low
// OEQ					Read video-side data bus
// COLCS					Read palette RAM
// nW2CS					Read work RAM B
// nW1CS					TMNT: Read ROM, MIA: Read work RAM A
// nROMCS				Read ROM
// DIP3					M68K_DIN[3:0] <= dipswitch3;
// DIP 	A[2:1] == 0	M68K_DIN[7:0] <= dipswitch1;
// DIP 	A[2:1] == 1	M68K_DIN[7:0] <= dipswitch2;
// DIP 	A[2:1] == 2	M68K_DIN[7:0] <= inputs_P4;	Start, Shoot3, Shoot2, Shoot1, Down, Up, Right, Left
// DIP 	A[2:1] == 3	M68K_DIN[7:0] <= 8'hFF;
// SHOOT	A[2:1] == 0	M68K_DIN[7:0] <= Service4, Service3, Service2, Service1, Coin4, Coin3, Coin2, Coin1
// SHOOT	A[2:1] == 1	M68K_DIN[7:0] <= inputs_P1;	Start, Shoot3, Shoot2, Shoot1, Down, Up, Right, Left
// SHOOT	A[2:1] == 2	M68K_DIN[7:0] <= inputs_P2;	Start, Shoot3, Shoot2, Shoot1, Down, Up, Right, Left
// SHOOT	A[2:1] == 3	M68K_DIN[7:0] <= inputs_P3;	Start, Shoot3, Shoot2, Shoot1, Down, Up, Right, Left
// MIA player inputs don't have Starts, instead they're mapped to the Coin inputs:
// Unused, Service1, Unused, Start2, Start1, Unused, Coin2, Coin1
always @(*) begin
	casez({OEQ, COLCS | ~m68k_rw, nW2CS | ~m68k_rw, nW1CS, nROMCS, DIP3, DIP, SHOOT, m68k_addr[2:1]})
		10'b11_110z_zzzz: m68k_din <= m68k_rom_dout;
		10'b11_101z_zzzz: m68k_din <= is_tmnt ? m68k_rom_dout : m68k_ram_A_dout;
		10'b11_011z_zzzz: m68k_din <= m68k_ram_B_dout;
		10'b10_111z_zzzz: m68k_din <= {8'h00, pal_dout};

		10'b11_1110_zzzz: m68k_din <= {12'h000, dipswitch3};

		10'b11_1111_0100: m68k_din <= {8'h00, dipswitch1};
		10'b11_1111_0101: m68k_din <= {8'h00, dipswitch2};
		10'b11_1111_0110: m68k_din <= is_tmnt ? {8'h00, inputs_P4} : 16'h00FF;
		10'b11_1111_0111: m68k_din <= 16'h00FF;

		10'b11_1111_1000: m68k_din <= is_tmnt ? {8'h00, inputs_service, inputs_coin} : {8'h00, 1'b1, inputs_service[0], 1'b1, inputs_P2[7], inputs_P1[7], 1'b1, inputs_coin[1:0]};
		10'b11_1111_1001: m68k_din <= {8'h00, inputs_P1};
		10'b11_1111_1010: m68k_din <= {8'h00, inputs_P2};
		10'b11_1111_1011: m68k_din <= is_tmnt ? {8'h00, inputs_P3} : 16'h00FF;

		10'b0z_zzzz_zzzz: m68k_din <= {2{k007644_reg}};

		default: m68k_din <= 16'h0000;
	endcase
end

// V24M = O24M = 24M
assign NREAD = ~m68k_rw | ~CPU_RUN;
assign OVCS = ~&{m68k_addr[20], ~nAS};
assign OBJCS = ~((m68k_addr[18:17] == 2'd2) & ~OVCS);
assign VRAMCS = ~((m68k_addr[18:17] == 2'd0) & ~OVCS);
assign OEQ = NREAD | OVCS;

assign OEL = ~({OVCS, m68k_rw, nUDS} == 3'b001);
assign OEU = ~({OVCS, m68k_rw, nUDS} == 3'b000);

// Video-side 8bit data bus
reg [7:0] DB_IN;
reg [7:0] DB_OUT;

// 007644 x2
always @(*) begin
	if (PE)
		k007644_reg <= DB_OUT;
	else
		k007644_reg <= k007644_reg;
end

reg [7:0] DB_IN_imm;
reg [7:0] DB_IN_del;
always @(*) begin
	case({OEU, OEL})
		2'd0: DB_IN_imm <= 8'bzzzzzzzz;	// Should never happen
		2'd1: DB_IN_imm <= m68k_dout[15:8];
		2'd2: DB_IN_imm <= m68k_dout[7:0];
		2'd3: DB_IN_imm <= 8'h00;			// Really hi-z, zero to make sim happy
	endcase
end

// Custom chips don't always have the time to register the DB_IN value before it changes
// Certainly caused by async clocks, see D23, D7... in k052109.
// This shifts the time they stay on the bus by 1 clk_sys
always @(posedge clk_sys) begin
	DB_IN_del <= DB_IN_imm;
	DB_IN <= DB_IN_del;
end


// DB_OUT_k052109 talks when internal DBDIR=0
// DB_OUT_k051962 talks when internal DBDIR=0 (CRCS=0 and RMRD=1)
// DB_OUT_k051960 talks when internal DBDIR=0
// DB_OUT_k051937 talks when internal DBDIR=0 (NRD=0 and any ROMRDx=0)
wire DBDIR_k052109, DBDIR_k051962, DBDIR_k051960, DBDIR_k051937;

always @(*) begin
	case({DBDIR_k052109, DBDIR_k051962, DBDIR_k051960, DBDIR_k051937})
		4'b0111: DB_OUT <= DB_OUT_k052109;
		4'b1011: DB_OUT <= DB_OUT_k051962;
		4'b1101: DB_OUT <= DB_OUT_k051960;
		4'b1110: DB_OUT <= DB_OUT_k051937;
		default: DB_OUT <= 8'h00;		// Really hi-z, zero to make sim happy
	endcase
end

planes PLANES(
	.reset(reset),
	.clk(clk_sys),
	.clken(ce_main),
	.is_tmnt(is_tmnt),
	.P2H(P2H),
	.V6M(V6M),
	
	.RMRD(RMRD),
	.VRAMCS(VRAMCS),
	.PDS(PDS),
	.NREAD(NREAD),
	.VDTAC(VDTAC),
	
	.DB_IN(DB_IN),
	.m68k_addr_16(m68k_addr[16]),
	.AB(m68k_addr[15:1]),
	.nUDS(nUDS),
	
	.DB_OUT_k052109(DB_OUT_k052109),
	.DBDIR_k052109(DBDIR_k052109),
	.DB_OUT_k051962(DB_OUT_k051962),
	.DBDIR_k051962(DBDIR_k051962),
	
	.HVOT(HVOT),
	.VA(VA),
	.VB(VB),
	.FX(FX),
	
	.NVA(NVA),
	.NVB(NVB),
	.NFX(NFX),
	
	.NVBLK(NVBLK),
	.NCBLK(NCBLK),
	.NHSY(NHSY),
	.NVSY(NVSY),
	.NHBK(NHBK),
	
	.tiles_rom_addr(tiles_rom_addr),
	.tiles_rom_dout(tiles_rom_dout)
);

sprites SPRITES(
	.reset(reset),
	.clk(clk_sys),
	.clken(ce_main),
	.is_tmnt(is_tmnt),
	.P2H(P2H),
	
	.rom_prom1_we(rom_prom1_we),
	.load_en(load_en),
	.rom_data(rom_data),
	.rom_addr(rom_addr),
	
	.OBJCS(OBJCS),
	.PDS(PDS),
	.NREAD(NREAD),
	.PE(PE),
	
	.HVOT(HVOT),
	
	.DB_IN(DB_IN),
	.AB(m68k_addr[15:1]),
	.nUDS(nUDS),
	
	.DB_OUT_k051960(DB_OUT_k051960),
	.DBDIR_k051960(DBDIR_k051960),
	.DB_OUT_k051937(DB_OUT_k051937),
	.DBDIR_k051937(DBDIR_k051937),
	
	.SHA(SHA), .NOBJ(NOBJ),
	.OB(OB),
	
	.ODTAC(ODTAC),
	
	.spr_rom_addr(spr_rom_addr),
	.spr_rom_dout(spr_rom_dout)
);

// Video plane mixing
// 4x LS153
reg [9:0] CD;

always @(*) begin
	case(prio_dout[1:0])
		2'd0: CD <= {2'b10, 1'b0, VA[7:5], VA[3:0]};	// VA[4] unused
		2'd1: CD <= {2'b10, 1'b1, VB[7:5], VB[3:0]};	// VB[4] unused
		2'd2: CD <= {2'b01, OB[7:4], OB[0], OB[1], OB[2], OB[3]};	// Sprites
		2'd3: CD <= {2'b00, is_tmnt ? {1'b0, FX[7:5]} : {FX[4], FX[7], 2'b00}, FX[3:0]};	// FX[4] unused in TMNT
	endcase
end

TMNTColor color(
	.clk_sys(clk_sys),
	.V6M(V6M),
	.AB(m68k_addr[12:1]),
	.CD(CD),
	.SHADOW(SHADOW),
	.CPU_DIN(m68k_dout[7:0]),
	.CPU_DOUT(pal_dout),
	.NCBLK(NCBLK),
	.COLCS(COLCS),
	.NLWR(NLWR),
	.NREAD(NREAD),
	.RED_OUT(video_r),
	.GREEN_OUT(video_g),
	.BLUE_OUT(video_b)
);

TMNTAudio audio(
	.reset(reset),
	.clk_sys(clk_sys),
	.ce_snd_p(ce_snd_p),
	.ce_snd_n(ce_snd_n),
	.ce_snd_half(ce_snd_half),
	.is_tmnt(is_tmnt),
	.load_en(load_en),
	.rom_addr(rom_addr),
	.rom_data(rom_data),
	.rom_z80_we(rom_z80_we),
	.rom_007232_we(rom_007232_we),
	.rom_uPD7759C_we(rom_uPD7759C_we),
	.m68k_dout(m68k_dout),
	.theme_rom_req(theme_rom_req),
	.theme_rom_addr(theme_rom_addr),
	.theme_rom_dout(theme_rom_dout),
	
	.SNDON(SNDON),
	.SNDDT(SNDDT),
	
	.mixdown(audio_mono)
);

endmodule
