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

module modo (
  input wire clk,
  input wire mrst_n,
  input wire [7:0] zxuno_addr,
  input wire zxuno_regrd,
  input wire zxuno_regwr,
  inout wire [7:0] d,
  input wire allramplus3,
  
  input wire divmmc_zxromcs,
  input wire divmmc_eeprom_cs,
  input wire divmmc_sram_cs,
  input wire divmmc_sram_write_n,
  input wire [5:0] divmmc_sram_hiaddr,
  
  input wire trese_sram_cs,
  input wire [5:0] trese_sram_hiaddr,

  output reg zxromcs,
  output reg eeprom_oe_n,
  output reg sram_oe_n,
  output reg sram_write_n,
  output reg [5:0] sram_hiaddr  
  );

  parameter ADDR_MODO = 8'hDF;

  reg rmodo = 1'b0;
  reg rendiv = 1'b0;
  wire oe = (zxuno_regrd == 1'b1 && zxuno_addr == ADDR_MODO);
  assign d[7:6] = (oe == 1'b1)? {rmodo,rendiv} : 2'bzz;
  assign d[5:0] = 6'bzzzzzz;
  
  always @(posedge clk) begin
    if (mrst_n == 1'b0) begin
      rmodo <= 1'b0;
      rendiv <= 1'b0;
    end
    else if (zxuno_regwr == 1'b1 && zxuno_addr == ADDR_MODO) begin
      rmodo <= rmodo | d[7];
      rendiv <= rendiv | d[6];
    end
  end
  
  always @* begin
    if (allramplus3 == 1'b0) begin
      if (rmodo == 1'b0) begin
        zxromcs = divmmc_zxromcs;
        eeprom_oe_n = ~divmmc_eeprom_cs;
        sram_oe_n = ~divmmc_sram_cs;
        sram_write_n = divmmc_sram_write_n;
        sram_hiaddr = divmmc_sram_hiaddr;
      end
      else begin
        zxromcs = 1'b1;        
        if (rendiv == 1'b0 || divmmc_zxromcs == 1'b0) begin
          eeprom_oe_n = 1'b1;
          sram_oe_n = ~trese_sram_cs;
          sram_write_n = 1'b1;
          sram_hiaddr = trese_sram_hiaddr;
        end
        else begin
          eeprom_oe_n = ~divmmc_eeprom_cs;
          sram_oe_n = ~divmmc_sram_cs;
          sram_write_n = divmmc_sram_write_n;
          sram_hiaddr = divmmc_sram_hiaddr;
        end
      end
    end
    else begin
      zxromcs = 1'b0;
      eeprom_oe_n = 1'b1;
      sram_oe_n = 1'b1;
      sram_write_n = 1'b1;
      sram_hiaddr = 6'b110000;
    end    
  end
endmodule
