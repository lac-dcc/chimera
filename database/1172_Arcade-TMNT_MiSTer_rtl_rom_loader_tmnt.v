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

module rom_loader_tmnt(
	input reset,
	input clk_sys,
	input [25:0] ioctl_addr,
	input [15:0] ioctl_dout,
	input ioctl_wr,
	input load_en,
	
	output reg rom_68k_we,
	output reg rom_z80_we,
	output reg rom_tiles_we,
	output reg rom_sprites_we,
	output reg rom_007232_we,
	output reg rom_theme_we,
	output reg rom_prom1_we,
	output reg rom_prom2_we,
	output reg rom_uPD7759C_we,
	
	output reg [25:0] rom_addr	// Word-based
);

// ROM data is sent in the order defined in the MRA file and loaded to:

// 			TMNT
// 68k		384kB		SDRAM 	16bit		0x0000000
// Z80		32kB		BRAM		8bit
// Tiles		1MB		SDRAM 	32bit		0x1000000
// Sprites	2MB		SDRAM 	32bit		0x1200000
// k007232	128kB		BRAM		8bit
// uPD7759	128kB		BRAM		8bit
// Theme		512kB		SDRAM		8bit		0x0100000
// Dec		256B		BRAM		4bit
// Prio		256B		BRAM		4bit

// Byte-based lengths
localparam ROM_68K_L = 		26'h060000;
localparam ROM_Z80_L = 		26'h008000;
localparam ROM_TILES_L = 	26'h100000;
localparam ROM_SPRITES_L = 26'h200000;
localparam ROM_007232_L = 	26'h020000;
localparam ROM_UPD7759_L = 26'h020000;
localparam ROM_THEME_L = 	26'h080000;
localparam ROM_PROM1_L = 	26'h000100;
localparam ROM_PROM2_L = 	26'h000100;

// Bases
wire [25:0] ROM_68K_B = 	26'h000000;
wire [25:0] ROM_Z80_B = 	ROM_68K_B + 		ROM_68K_L;
wire [25:0] ROM_TILES_B = 	ROM_Z80_B + 		ROM_Z80_L;
wire [25:0] ROM_SPRITES_B = ROM_TILES_B + 	ROM_TILES_L;
wire [25:0] ROM_007232_B = ROM_SPRITES_B + 	ROM_SPRITES_L;
wire [25:0] ROM_UPD7759_B = ROM_007232_B + 	ROM_007232_L;
wire [25:0] ROM_THEME_B = 	ROM_UPD7759_B + 	ROM_UPD7759_L;
wire [25:0] ROM_PROM1_B = 	ROM_THEME_B + 		ROM_THEME_L;
wire [25:0] ROM_PROM2_B = 	ROM_PROM1_B + 		ROM_PROM1_L;
wire [25:0] ROM_END = 		ROM_PROM2_B + 		ROM_PROM2_L;

wire is_68k = 		ioctl_addr >= ROM_68K_B && ioctl_addr < ROM_Z80_B;
wire is_z80 = 		ioctl_addr >= ROM_Z80_B && ioctl_addr < ROM_TILES_B;
wire is_tiles = 	ioctl_addr >= ROM_TILES_B && ioctl_addr < ROM_SPRITES_B;
wire is_sprites = ioctl_addr >= ROM_SPRITES_B && ioctl_addr < ROM_007232_B;
wire is_007232 = 	ioctl_addr >= ROM_007232_B && ioctl_addr < ROM_UPD7759_B;
wire is_upd7759 = ioctl_addr >= ROM_UPD7759_B && ioctl_addr < ROM_THEME_B;
wire is_theme = 	ioctl_addr >= ROM_THEME_B && ioctl_addr < ROM_PROM1_B;
wire is_prom1 = 	ioctl_addr >= ROM_PROM1_B && ioctl_addr < ROM_PROM2_B;
wire is_prom2 = 	ioctl_addr >= ROM_PROM2_B && ioctl_addr < ROM_END;

// Byte-based offsets
localparam offs_tiles = 26'h1000000;
localparam offs_sprites = 26'h1200000;
localparam offs_theme = 26'h0100000;
localparam offs_m68k = 26'h0000000;

wire [25:0] addr_68k = 		(ioctl_addr - ROM_68K_B) + offs_m68k;
wire [25:0] addr_z80 = 		ioctl_addr - ROM_Z80_B;
wire [25:0] addr_tiles = 	(ioctl_addr - ROM_TILES_B) + offs_tiles;
wire [25:0] addr_sprites = (ioctl_addr - ROM_SPRITES_B) + offs_sprites;
wire [25:0] addr_007232 = 	ioctl_addr - ROM_007232_B;
wire [25:0] addr_theme = 	(ioctl_addr - ROM_THEME_B) + offs_theme;
wire [25:0] addr_prom1 = 	ioctl_addr - ROM_PROM1_B;
wire [25:0] addr_prom2 = 	ioctl_addr - ROM_PROM2_B;
wire [25:0] addr_upd7759 = ioctl_addr - ROM_UPD7759_B;

always @(posedge clk_sys) begin
	if (ioctl_wr & load_en) begin
		if (is_68k) begin
			rom_68k_we <= 1'b1;
			rom_addr <= {1'b0, addr_68k[25:1]};
		end else if (is_z80) begin
			rom_z80_we <= 1'b1;
			rom_addr <= addr_z80;
		end else if (is_tiles) begin
			rom_tiles_we <= 1'b1;
			rom_addr <= {1'b0, addr_tiles[25:1]};
		end else if (is_sprites) begin
			rom_sprites_we <= 1'b1;
			rom_addr <= {1'b0, addr_sprites[25:1]};
		end else if (is_007232) begin
			rom_007232_we <= 1'b1;
			rom_addr <= addr_007232;
		end else if (is_theme) begin
			rom_theme_we <= 1'b1;
			rom_addr <= {1'b0, addr_theme[25:1]};
		end else if (is_prom1) begin
			rom_prom1_we <= 1'b1;
			rom_addr <= addr_prom1;
		end else if (is_prom2) begin
			rom_prom2_we <= 1'b1;
			rom_addr <= addr_prom2;
		end else if (is_upd7759) begin
			rom_uPD7759C_we <= 1'b1;
			rom_addr <= addr_upd7759;
		end
	end else begin
		rom_68k_we <= 1'b0;
		rom_z80_we <= 1'b0;
		rom_tiles_we <= 1'b0;
		rom_sprites_we <= 1'b0;
		rom_007232_we <= 1'b0;
		rom_theme_we <= 1'b0;
		rom_prom1_we <= 1'b0;
		rom_prom2_we <= 1'b0;
		rom_uPD7759C_we <= 1'b0;
	end
end

endmodule
