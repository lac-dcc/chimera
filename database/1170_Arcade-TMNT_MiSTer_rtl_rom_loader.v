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

module rom_loader(
	input reset,
	input clk_sys,
	input [25:0] ioctl_addr,
	input [15:0] ioctl_dout,
	input ioctl_wr,
	input load_en,
	input [3:0] tno,
	
	output rom_68k_we,
	output rom_z80_we,
	output rom_tiles_we,
	output rom_sprites_we,
	output rom_007232_we,
	output rom_theme_we,
	output rom_prom1_we,
	output rom_prom2_we,
	output rom_uPD7759C_we,
	
	output [25:0] rom_addr,	// Word-based
	output reg [15:0] rom_data
);

wire [25:0] tmnt_rom_addr;
wire [25:0] mia_rom_addr;

assign is_tmnt = (tno == 4'd1);

assign rom_68k_we = 			is_tmnt ? tmnt_rom_68k_we : mia_rom_68k_we;
assign rom_z80_we = 			is_tmnt ? tmnt_rom_z80_we : mia_rom_z80_we;
assign rom_tiles_we = 		is_tmnt ? tmnt_rom_tiles_we : mia_rom_tiles_we;
assign rom_sprites_we = 	is_tmnt ? tmnt_rom_sprites_we : mia_rom_sprites_we;
assign rom_007232_we = 		is_tmnt ? tmnt_rom_007232_we : mia_rom_007232_we;
assign rom_theme_we = 		is_tmnt ? tmnt_rom_theme_we : 1'b0;
assign rom_prom1_we = 		is_tmnt ? tmnt_rom_prom1_we : 1'b0;
assign rom_prom2_we = 		is_tmnt ? tmnt_rom_prom2_we : mia_rom_prom2_we;
assign rom_uPD7759C_we = 	is_tmnt ? tmnt_rom_uPD7759C_we : 1'b0;

assign rom_addr =				is_tmnt ? tmnt_rom_addr : mia_rom_addr;

always @(posedge clk_sys) begin
	if (ioctl_wr & load_en)
		rom_data <= ioctl_dout;
end

rom_loader_tmnt LOADER_TMNT(
	.reset(reset),
	.clk_sys(clk_sys),
	.load_en(load_en),
	.ioctl_addr(ioctl_addr),
	.ioctl_dout(ioctl_dout),
	.ioctl_wr(ioctl_wr),
	
	.rom_68k_we(tmnt_rom_68k_we),
	.rom_z80_we(tmnt_rom_z80_we),
	.rom_tiles_we(tmnt_rom_tiles_we),
	.rom_sprites_we(tmnt_rom_sprites_we),
	.rom_007232_we(tmnt_rom_007232_we),
	.rom_theme_we(tmnt_rom_theme_we),
	.rom_prom1_we(tmnt_rom_prom1_we),
	.rom_prom2_we(tmnt_rom_prom2_we),
	.rom_uPD7759C_we(tmnt_rom_uPD7759C_we),
	
	.rom_addr(tmnt_rom_addr)	// Word-based for 16-bit ROMs
);

rom_loader_mia LOADER_MIA(
	.reset(reset),
	.clk_sys(clk_sys),
	.load_en(load_en),
	.ioctl_addr(ioctl_addr),
	.ioctl_dout(ioctl_dout),
	.ioctl_wr(ioctl_wr),
	
	.rom_68k_we(mia_rom_68k_we),
	.rom_z80_we(mia_rom_z80_we),
	.rom_tiles_we(mia_rom_tiles_we),
	.rom_sprites_we(mia_rom_sprites_we),
	.rom_007232_we(mia_rom_007232_we),
	.rom_prom2_we(mia_rom_prom2_we),
	
	.rom_addr(mia_rom_addr)	// Word-based for 16-bit ROMs
);

endmodule
