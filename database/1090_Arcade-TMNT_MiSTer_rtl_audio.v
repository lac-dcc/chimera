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

// The whole audio subsystem.

module TMNTAudio(
	input reset,
	input clk_sys,
	input ce_snd_p, ce_snd_n,
	input ce_snd_half,
	input is_tmnt,
	
	input load_en,
	input [25:0] rom_addr,
	input [15:0] rom_data,
	input rom_z80_we,
	input rom_007232_we,
	input rom_uPD7759C_we,
	
	input SNDON,
	input [15:0] m68k_dout,
	input SNDDT,
	
	output reg theme_rom_req,
	output [17:0] theme_rom_addr,
	input [31:0] theme_rom_dout,
	
	output signed [15:0] mixdown
);

wire signed [15:0] mixdown_tmnt, mixdown_mia;
wire nWR, nRD, nWAIT, nMREQ, nIORQ, nRFSH;
wire [15:0] z80_addr;
reg [7:0] z80_din;
wire [7:0] z80_dout;
wire [7:0] z80_rom_dout;
wire [7:0] z80_ram_dout;
reg [7:0] snd_code;
wire [7:0] ym2151_dout;
reg nINT;
reg SNDON_prev;
reg SNDDT_prev;

reg signed [4:0] level_A;
reg signed [4:0] level_B;
reg [7:0] U82;

reg theme_en;
reg [15:0] clk_640k_div;
reg [15:0] clk_640k_div2;
reg uPD7759C_ce;
reg [18:0] theme_addr;
reg theme_inc_flag;
reg [15:0] theme_rom_sample;

reg uPD7759C_res;
reg uPD7759C_start;
wire signed [8:0] uPD7759C_mono;
wire [7:0] rom_uPD7759C_dout;
wire [16:0] rom_uPD7759C_addr;

wire signed [15:0] ym_left;
wire signed [15:0] ym_right;

wire [7:0] rom_007232_dout;
wire [16:0] rom_007232_addr;
wire [6:0] k007232_A;
wire [6:0] k007232_B;
wire signed [15:0] k007232_mono;

byte_loader LOAD_Z80(
	.clk(clk_sys),
	.en(load_en),
	.wein(rom_z80_we),
	.weout(rom_z80_we_byte),
	.lsb(rom_z80_lsb)
);

byte_loader LOAD_007232(
	.clk(clk_sys),
	.en(load_en),
	.wein(rom_007232_we),
	.weout(rom_007232_we_byte),
	.lsb(rom_007232_lsb)
);

byte_loader LOAD_uPD7759C(
	.clk(clk_sys),
	.en(load_en),
	.wein(rom_uPD7759C_we),
	.weout(rom_uPD7759C_we_byte),
	.lsb(rom_uPD7759C_lsb)
);

// 32k * 8
rom_z80 ROM_Z80(
	.clock(clk_sys),
	.address(load_en ? {rom_addr[14:1], rom_z80_lsb} : z80_addr[14:0]),
	.q(z80_rom_dout),
	.wren(rom_z80_we_byte),
	.data(rom_z80_lsb ? rom_data[15:8] : rom_data[7:0])
);

// 2k * 8
ram_z80 RAM_Z80(
	.clock(clk_sys),
	.address(z80_addr[11:0]),
	.q(z80_ram_dout),
	.wren(~nWR & ~U82[0]),
	.data(z80_dout)
);

cpu_z80 cpu(
	.nRESET(~reset),
	.clk(clk_sys),
	.clken(ce_snd_p),
	.nWAIT(1'b1),		// Hardwired
	.nINT(nINT),
	.nNMI(1'b1),		// Hardwired
	.nMREQ(nMREQ),
	.nIORQ(nIORQ),
	.nRD(nRD),
	.nWR(nWR),
	.nRFSH(nRFSH),
	.Z80_ADDR(z80_addr),
	.Z80_DIN(z80_din),
	.Z80_DOUT(z80_dout)
);

// Z80_A[15:12] Zone
// 0xxx			ROM		0000~7FFF
// 1000			work RAM	8000~8FFF (mirrored x2)
// 1001			SRES    	9000~9FFF
// 1010			Comm reg	A000~AFFF
// 1011			DACS    	B000~BFFF (007232)
// 1100			YM2151  	C000~CFFF
// 1101			VDIN    	D000~DFFF
// 1110			VST     	E000~EFFF
// 1111			BSY    	F000~FFFF
// Address decoding only enabled when Z80_RFSH is high, a technique used to save power by putting devices on the bus
// in standby during the Z80 refresh cycles.

// On the real PCB, nothing prevents the Z80 from fighting against the sound code reg U84 if it decides to write to it
// Hopefully this never actually happens
always @(*) begin
	casez({z80_addr[15], U82[2], U82[0], U82[4], U82[7]})
		5'b0zzzz: z80_din <= z80_rom_dout;
		5'b10zzz: z80_din <= snd_code;
		5'b110zz: z80_din <= z80_ram_dout;
		5'b1110z: z80_din <= ym2151_dout;
		5'b11110: z80_din <= is_tmnt ? {7'd0, uPD7759C_busy} : 8'hFF;
		default: z80_din <= 8'hFF;
	endcase
end

always @(*) begin
	case ({z80_addr[15], nMREQ, ~nRFSH, z80_addr[14:12]})
		6'b100_000: U82 <= 8'b11111110;	// Work RAM
		6'b100_001: U82 <= 8'b11111101;	// SRES
		6'b100_010: U82 <= 8'b11111011;	// Sound latch
		6'b100_011: U82 <= 8'b11110111;	// k007232
		6'b100_100: U82 <= 8'b11101111;	// YM2151
		6'b100_101: U82 <= 8'b11011111;	// VDIN
		6'b100_110: U82 <= 8'b10111111;	// VST
		6'b100_111: U82 <= 8'b01111111;	// BSY
		default: U82 <= 8'b11111111;
	endcase
end

always @(posedge clk_sys) begin
	// Z80 IRQ
	// The IRQ flag is automatically cleared during the Z80 IRQ ack cycle (IORQ asserted, see manual)
	if (reset | ~nIORQ)
		nINT <= 1;
	else if ({SNDON_prev, SNDON} == 2'b01)
		nINT <= 0;	// Trigger IRQ on SNDON rising edge

	SNDON_prev <= SNDON;

	// Z80 comm reg
	if ({SNDDT_prev, SNDDT} == 2'b01)
		snd_code <= m68k_dout[7:0];	// Store data on SNDDT rising edge

	SNDDT_prev <= SNDDT;
end

// E10
always @(posedge U82[1] or posedge reset) begin
	if (reset) begin
		uPD7759C_res <= 1'b0;
	end else begin
		uPD7759C_res <= z80_dout[1];
	end
end

// F15
reg [7:0] uPD7759C_din;
always @(posedge U82[5] or posedge reset) begin
	if (reset) begin
		uPD7759C_din <= 8'd0;
	end else begin
		uPD7759C_din <= z80_dout;
	end
end

// H20
always @(posedge U82[6] or posedge reset) begin
	if (reset) begin
		uPD7759C_start <= 1'b0;
	end else begin
		uPD7759C_start <= z80_dout[0];
	end
end

// TMNT theme playback system
// ROM is read at 640kHz/2/16 = 20kHz

// 640kHz	_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_'_
// DAC CLK	_''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''
// PISO CLK	___''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__''__
// LS161    000111122223333444455556666777788889999AAAABBBBCCCCDDDDEEEEFFFF0000111122223333
// Count		_______________________________'''''''''''''''''''''''''''''''V________________ Also DAC LOAD
// PISO LD	___________________________________________________________''''________________

wire [15:0] theme_rom_mux = theme_rom_addr[0] ? theme_rom_dout[15:0] : theme_rom_dout[31:16];

assign theme_rom_addr = theme_addr[17:0];

reg prev_9000_wr;
always @(posedge clk_sys or posedge reset) begin
	if (reset) begin
		clk_640k_div <= 16'd0;
		clk_640k_div2 <= 16'd0;
		theme_en <= 0;
		theme_addr <= 19'd1;	// Force request on 1st sample
		theme_rom_req <= 1'b0;
		theme_inc_flag <= 1'b0;
		uPD7759C_ce <= 1'b0;
	end else if (is_tmnt) begin

		if (~prev_9000_wr & U82[1])
			theme_en <= z80_dout[2];
		prev_9000_wr <= U82[1];
		
		if (clk_640k_div2 == 16'd150-1) begin
			clk_640k_div2 <= 16'd0;
			uPD7759C_ce <= 1'b1;
		end else begin
			clk_640k_div2 <= clk_640k_div2 + 1'b1;	// 96M/150=640k
			uPD7759C_ce <= 1'b0;
		end
		
		if (!theme_en) begin
			theme_addr <= 19'd0;
			clk_640k_div <= 16'd0;
		end else begin
			if ((clk_640k_div == 16'd4800-1) & !theme_addr[18]) begin
				clk_640k_div <= 16'd0;
				theme_rom_sample <= theme_rom_mux;
				theme_inc_flag <= 1'b1;
				if (theme_addr[0])
					theme_rom_req <= 1'b1;
			end else begin
				theme_rom_req <= 1'b0;
				if (theme_inc_flag) begin
					theme_addr <= theme_addr + 1'b1;
					theme_inc_flag <= 1'b0;
				end
				clk_640k_div <= clk_640k_div + 1'b1;	// 96M/4800=20k
			end
		end
	end
end

// 128k * 8
rom_uPD7759C ROM_uPD7759C(
	.clock(clk_sys),
	.clken(is_tmnt),
	.address(load_en ? {rom_addr[16:1], rom_uPD7759C_lsb} : rom_uPD7759C_addr),
	.q(rom_uPD7759C_dout),
	.wren(rom_uPD7759C_we_byte),
	.data(rom_uPD7759C_lsb ? rom_data[15:8] : rom_data[7:0])
);

jt7759 uPD7759C(
    .rst(~uPD7759C_res & is_tmnt),
    .clk(clk_sys),
    .cen(uPD7759C_ce),  	// 640kHz
    .stn(~uPD7759C_start),	// Start (active low)
    .cs(1'b1),
    .mdn(1'b1),  				// Standalone mode
    .busyn(uPD7759C_busy),
    .wrn(1'b1),  				// For slave mode only
    .din(uPD7759C_din),
    .rom_cs(uPD7759_drq),
    .rom_addr(rom_uPD7759C_addr),
    .rom_data(rom_uPD7759C_dout),
    .rom_ok(1'b1),
    .sound(uPD7759C_mono)
);
	
jt51 YM2151(
    .rst(reset),    			// reset
    .clk(clk_sys),			// main clock
    .cen(ce_snd_p),    		// clock enable
    .cen_p1(ce_snd_half), 	// clock enable at half the speed
    .cs_n(U82[4]),   		// chip select
    .wr_n(nWR),   			// write
    .a0(z80_addr[0]),
    .din(z80_dout), 			// data in
    .dout(ym2151_dout), 	// data out
    // Full resolution output
    .xleft(ym_left),
    .xright(ym_right)
);

// 128k * 8
rom_k007232 ROM_K007232(
	.clock(clk_sys),
	.address(load_en ? {rom_addr[16:1], rom_007232_lsb} : rom_007232_addr),
	.q(rom_007232_dout),
	.wren(rom_007232_we_byte),
	.data(rom_007232_lsb ? rom_data[15:8] : rom_data[7:0])
);

k007232 K007232(
	.CLK(clk_sys),
	.clk_en_p(ce_snd_p),
	.clk_en_n(ce_snd_n),
	.NRES(~reset),
	
	.NRCS(1'b1),
	.DACS(U82[3]),
	.NRD(1'b1),
	
	.AB({z80_addr[3:1], ~z80_addr[0]}),
	.DB(z80_dout),
	.RAM_IN(rom_007232_dout),
	.SA(rom_007232_addr),
	.ASD(k007232_A),
	.BSD(k007232_B),
	.SLEV(SLEV)
);

always @(posedge SLEV) begin
	level_A <= {1'b0, z80_dout[7:4]};
	level_B <= {1'b0, z80_dout[3:0]};
end

wire signed [15:0] k007232_A_signed = {9'd0, k007232_A} - 16'd64;
wire signed [15:0] k007232_B_signed = {9'd0, k007232_B} - 16'd64;

assign k007232_mono = {k007232_A_signed * level_A + k007232_B_signed * level_B, 4'd0};

// Mix channels and convert to signed

// Mixing:
// YM2151	Stereo	16s
// 007232	Mono		7u
// Theme		Mono		16s
// uPD7759	Mono		8u

// Theme rom data YM floating point format convertion to integer, see logic in k053260 or MAME's ymfm.h comments
// TODO: Simplify

// 9C80
// 1001 1100 1000 0000 ROM
// 0000 0001 0011 1001 Reverse
// ---E EES8 7654 3210 Meaning

reg signed [15:0] theme_mono;
always @(*) begin
	casex(theme_rom_sample[12:9])
		4'b111_1: theme_mono <= {1'b0, theme_rom_sample[8:0], 6'b00_0000};
		4'b110_1: theme_mono <= {2'b0_0, theme_rom_sample[8:0], 5'b0_0000};
		4'b101_1: theme_mono <= {3'b0_00, theme_rom_sample[8:0], 4'b0000};
		4'b100_1: theme_mono <= {4'b0_000, theme_rom_sample[8:0], 3'b000};
		4'b011_1: theme_mono <= {5'b0_0000, theme_rom_sample[8:0], 2'b00};
		4'b010_1: theme_mono <= {6'b0_0000_0, theme_rom_sample[8:0], 1'b0};
		4'b001_1: theme_mono <= {7'b0_0000_00, theme_rom_sample[8:0]};
		4'b001_0: theme_mono <= {7'b1_1111_11, theme_rom_sample[8:0]};
		4'b010_0: theme_mono <= {6'b1_1111_1, theme_rom_sample[8:0], 1'b0};
		4'b011_0: theme_mono <= {5'b1_1111, theme_rom_sample[8:0], 2'b00};
		4'b100_0: theme_mono <= {4'b1_111, theme_rom_sample[8:0], 3'b000};
		4'b101_0: theme_mono <= {3'b1_11, theme_rom_sample[8:0], 4'b0000};
		4'b110_0: theme_mono <= {2'b1_1, theme_rom_sample[8:0], 5'b0_0000};
		4'b111_0: theme_mono <= {1'b1, theme_rom_sample[8:0], 6'b00_0000};
		default: theme_mono <= 16'd0;
	endcase
end

// TODO: Adjust mixing levels
assign mixdown_tmnt = (theme_mono >>> 2) + (uPD7759C_mono <<< 4) + (ym_left >>> 2) + (ym_right >>> 2) + (k007232_mono >>> 3);
assign mixdown_mia = (ym_left >>> 2) + (ym_right >>> 2) + (k007232_mono >>> 2);
assign mixdown = is_tmnt ? mixdown_tmnt : mixdown_mia;

endmodule
