// This program was cloned from: https://github.com/LIV2/RIPPLE-IDE
// License: GNU General Public License v2.0

`timescale 1ns / 1ps
/*
 * Copyright (C) 2023 Matthew Harlum <matt@harlum.net>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
module IDE(
    input [23:1] ADDR,
    inout [1:0] DIN,
    input UDS_n,
    input LDS_n,
    input RW,
    input AS_n,
    input CLK,
    input ide_access,
    input ide_enable,
    input RESET_n,
    output AS_n_S4,
    output DTACK,
    output IOR_n,
    output IOW_n,
    output [1:0] IDE1_CS_n,
    output [1:0] IDE2_CS_n,
    output [1:0] ROM_BANK,
    output IDE_ROMEN
    );

wire ds = !UDS_n || !LDS_n;

reg ide_dtack;
reg ide_enabled = 0;
reg bank_sel = 0;

reg [1:0] as_delay; // AS_n shifted by CLK
reg [1:0] rom_bankSel;

assign ROM_BANK = (ide_enabled) ? rom_bankSel : {1'b0,ADDR[16]};

reg S3_n;           // S3 has started

assign AS_n_S4 = as_delay[0];

always @(posedge CLK or negedge RESET_n) begin
  if (!RESET_n) begin
    ide_enabled <= 0;
    rom_bankSel <= 0;
  end else begin
    // IDE enabled on first write seen
    if (ide_enable && ide_access && !RW && !UDS_n && !S3_n) ide_enabled <= 1;
    if (ide_enable && ide_access && ADDR[16:15] == 2'b01 && !RW && !UDS_n && !S3_n) rom_bankSel <= DIN;
  end
end

wire CS_0 = ide_enabled && ide_access && ADDR[16:15] == 2'b00 && ADDR[13:12] == 2'b01;
wire CS_1 = ide_enabled && ide_access && ADDR[16:15] == 2'b00 && ADDR[13:12] == 2'b10;

assign IDE1_CS_n[0] = !(!ADDR[14] && CS_0);
assign IDE2_CS_n[0] = !(!ADDR[14] && CS_1);
assign IDE1_CS_n[1] = !( ADDR[14] && CS_0);
assign IDE2_CS_n[1] = !( ADDR[14] && CS_1);

// IDE ROM is mapped to whole range until ide is enabled by the first write
// After then, it is mapped to (base address) + 64K
assign IDE_ROMEN = !(!AS_n && ide_access && (!ide_enabled || !(ADDR[12] ^ ADDR[13]) || ADDR[16]));

always @(negedge CLK or negedge RESET_n) begin
  if (!RESET_n) begin
    S3_n <= 1;
  end else begin
    S3_n <= AS_n;
  end
end

always @(posedge CLK or negedge RESET_n) begin
  if (!RESET_n) begin
    as_delay <= 2'b11;
  end else begin
    if (AS_n) begin
      as_delay[1:0] <= 2'b11;
    end else begin
      as_delay <= {as_delay[0], S3_n};
    end
  end
end

// IOR Active during states S3-S6
// IOW Active during states S3-S5
assign IOR_n = !(!AS_n &&  RW && !S3_n);
assign IOW_n = !(!AS_n && !RW && !S3_n && as_delay[1]);

endmodule
