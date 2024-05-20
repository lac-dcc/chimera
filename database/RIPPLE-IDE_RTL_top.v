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

module RIPPLE(
    input [23:1] ADDR,
    input AS_n,
    input BERR_n,
    input C1n,
    input C3n,
    input CFGIN_n,
    inout [15:12] DBUS,
    input LDS_n,
    input RESET_n,
    input RW,
    input UDS_n,
    output CFGOUT_n,
    output DTACK_n,
    output OVR_n_1,
    output OVR_n_2,
    output SLAVE_n,
// IDE stuff
    input IDE_OFF_n,
    output [1:0] ROM_BANK,
    output IDE_ROMEN,
    output IDEBUF_OE,
    output [1:0] IDE1_CS_n,
    output [1:0] IDE2_CS_n,
    output IOR_n,
    output IOW_n
    );

wire autoconfig_cycle;
wire ide_access;
wire [3:0] autoconfig_dout;
wire ide_dtack;

wire CLK7M = !(C1n ^ C3n);

reg RESET = 0;

always @(posedge CLK7M) begin
  RESET <= RESET_n;
end

reg ide_enable;

always @(posedge CLK7M) begin
  if (!RESET)
    ide_enable <= IDE_OFF_n;
end

Autoconfig AUTOCONFIG (
  .ADDR (ADDR),
  .AS_n (AS_n),
  .UDS_n (UDS_n),
  .CLK (CLK7M),
  .RW (RW),
  .DIN (DBUS[15:12]),
  .RESET_n (RESET),
  .ide_enabled (ide_enable),
  .CFGIN_n (CFGIN_n),
  .CFGOUT_n (CFGOUT_n),
  .ide_access (ide_access),
  .autoconfig_cycle (autoconfig_cycle),
  .DOUT (autoconfig_dout),
  .dtack (autoconf_dtack)
);

IDE IDE (
  .ADDR (ADDR),
  .DIN  (DBUS[15:14]),
  .UDS_n (UDS_n),
  .LDS_n (LDS_n),
  .RW (RW),
  .AS_n (AS_n),
  .CLK (CLK7M),
  .ide_access (ide_access),
  .ide_enable (ide_enable),
  .RESET_n (RESET),
  .AS_n_S4 (AS_n_S4),
  .DTACK (ide_dtack),
  .IOR_n (IOR_n),
  .IOW_n (IOW_n),
  .IDE1_CS_n (IDE1_CS_n),
  .IDE2_CS_n (IDE2_CS_n),
  .IDE_ROMEN (IDE_ROMEN),
  .ROM_BANK (ROM_BANK)
);

assign DBUS[15:12] = (autoconfig_cycle) && RW && RESET_n ? autoconfig_dout : 'bZ;

assign DTACK_n = 1'bZ;
assign OVR_n_1 = 1'bZ;
assign OVR_n_2 = 1'bZ;

assign SLAVE_n = !((autoconfig_cycle || ide_access) && !AS_n);

assign IDEBUF_OE = !(!RW || ((autoconfig_cycle || ide_access) && !AS_n && !AS_n_S4 && BERR_n && RESET_n));

endmodule
