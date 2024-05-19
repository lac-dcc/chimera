// This program was cloned from: https://github.com/mcleod-ideafix/divtiesus
// License: GNU General Public License v3.0

/*
 * This file is part of the DIVtiesus project
 * Copyright (c) 2021 Miguel Angel Rodriguez Jodar.
 * 
 * This program is free software: you can redistribute it and/or modify  
 * it under the terms of the GNU General Public License as published by  
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License 
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

`timescale 1ns / 1ps
`default_nettype none

module tres_e (
  input wire clk,
  input wire rst_n,
  input [15:0] a,
  input wire mreq_n,
  input wire iorq_n,
  input wire rd_n,
  input wire wr_n,
  input wire [7:0] din,
  output wire allramplus3,
  output wire [1:0] banco_rom,
  // DivMMC onboard memory control
  output reg sram_cs,
  output reg [5:0] sram_hiaddr  // up to 512KB of SRAM can be addressed
  );

  wire ADDR_7FFD_PLUS2A = (!a[1] && a[15:14]==2'b01);
  wire ADDR_1FFD        = (!a[1] && a[15:12]==4'b0001);  // ojo! colisiona con 7FFD en el 128K por culpa de que solo decodifica a[15]=0 y a[1]=0 (wilco2009)
  // Standard 128K memory manager
  reg [7:0] bank128 = 8'h00;
  reg [7:0] bankplus3 = 8'h00;
  wire puerto_bloqueado = bank128[5];
  assign banco_rom = {bankplus3[2], bank128[4]};
  wire amstrad_allram_page_mode = bankplus3[0];
  assign allramplus3 = amstrad_allram_page_mode;

  wire iorq_wr = iorq_n | wr_n;
  always @(posedge iorq_wr or negedge rst_n) begin
    if (rst_n == 1'b0) begin
      bank128 <= 8'h00;
      bankplus3 <= 8'h00;
    end
    else begin
      if (ADDR_7FFD_PLUS2A && puerto_bloqueado == 1'b0)
        bank128 <= din;
      else if (ADDR_1FFD && puerto_bloqueado == 1'b0)
        bankplus3 <= din;
    end
  end

  always @* begin
    sram_hiaddr = {3'b111, banco_rom, a[13]};
    if (mreq_n == 1'b0 && a[15:14] == 1'b0 && rd_n == 1'b0 && amstrad_allram_page_mode == 1'b0)
      sram_cs = 1'b1;
    else
      sram_cs = 1'b0;
  end  
endmodule
