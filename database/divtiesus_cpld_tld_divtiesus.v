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

module tld_divtiesus (
  input wire clk25mhz,
  // Bus de expansion ZX Spectrum
  input wire rst_n,
  input wire [15:0] a,
  input wire mreq_n,
  input wire iorq_n,
  input wire rd_n,
  input wire wr_n,
  input wire m1_n,
  input wire rfsh_n,
  inout tri [7:0] d,
  input wire notplus3,
  output tri romcs,
  output tri romoe1,
  output tri romoe2,
  output tri nmi_n,
  // Interfaz de usuario
  input wire nmi_button_n,
  input wire jumper_e,  // 1 = closed
  // Interfaz SPI
  output wire sclk,
  output wire mosi,
  input wire miso,
  output wire sd_cs0,
  output wire sd_cs1,
  // Bus de control EEPROM y SRAM
  output wire eeprom_oe_n,
  output wire eeprom_we_n,
  output wire sram_oe_n,
  output wire sram_we_n,
  output wire [5:0] sram_hiaddr
  );

  wire divmmc_zxromcs, divmmc_eeprom_cs, divmmc_sram_cs, divmmc_sram_write_n;
  wire [5:0] divmmc_sram_hiaddr;
  wire trese_sram_cs;
  wire [5:0] trese_sram_hiaddr;
  wire nmi_to_cpu_n;
  wire allramplus3;
  
  wire zxuno_regrd, zxuno_regwr;
  wire [7:0] zxuno_addr;
  
  wire [1:0] banco_rom;
  wire inrom48k = (banco_rom[1] | notplus3) & banco_rom[0];
  
  // NMI es colector abierto
  assign nmi_n = (nmi_to_cpu_n == 1'b0)? 1'b0 : 1'bz;  

  // RESET y MASTER RESET
  wire mrst_n = rst_n | nmi_button_n;
  
  // Gestion ROMCS para todos los modelos  
  wire zxromcs;
  assign romcs = (zxromcs == 1'b1 && notplus3 == 1'b1)? 1'b1 : 1'bz;
  assign romoe1 = (zxromcs == 1'b1 && notplus3 == 1'b0)? 1'b1 : 1'bz;
  assign romoe2 = (zxromcs == 1'b1 && notplus3 == 1'b0)? 1'b1 : 1'bz;
  
  divmmc_mcleod el_divmmc (
    // Interface with CPU
    .clk(clk25mhz),
    .rst_n(rst_n),
    .enable_autopage(jumper_e),
    .a(a),
    .d(d),
    .mreq_n(mreq_n),
    .iorq_n(iorq_n),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .m1_n(m1_n),
    //.rfsh_n(rfsh_n),
    .nmi_button_n(nmi_button_n),  // Button push connects to GND
    .nmi_to_cpu_n(nmi_to_cpu_n),  // Actual NMI signal to CPU
    .inrom48k(inrom48k),
    // Spectrum ROM shadowing
    .zxromcs(divmmc_zxromcs),      // 1 to disable ZX ROM. Use with emitter follower transistor
    // DivMMC onboard memory control
    .eeprom_cs(divmmc_eeprom_cs),
    .eeprom_we_n(eeprom_we_n),
    .sram_cs(divmmc_sram_cs),
    .sram_write_n(divmmc_sram_write_n),
    .sram_hiaddr(divmmc_sram_hiaddr),  // up to 512KB of SRAM can be addressed
    // SPI interface
    .sd_cs0_n(sd_cs0),
    .sd_cs1_n(sd_cs1),
    .sd_sclk(sclk),
    .sd_mosi(mosi),
    .sd_miso(miso)
    );

  tres_e el_3e (
    .clk(clk25mhz),
    .rst_n(rst_n),
    .a(a),
    .mreq_n(mreq_n),
    .iorq_n(iorq_n),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .din(d),
    .allramplus3(allramplus3),
    .banco_rom(banco_rom),
    // DivMMC onboard memory control
    .sram_cs(trese_sram_cs),
    .sram_hiaddr(trese_sram_hiaddr)  // up to 512KB of SRAM can be addressed
  );

  modo modo_operacion (
    .clk(clk25mhz),
    .mrst_n(mrst_n),
    .zxuno_addr(zxuno_addr),
    .zxuno_regrd(zxuno_regrd),
    .zxuno_regwr(zxuno_regwr),
    .d(d),
    .allramplus3(allramplus3),
    
    .divmmc_zxromcs(divmmc_zxromcs),
    .divmmc_eeprom_cs(divmmc_eeprom_cs),
    .divmmc_sram_cs(divmmc_sram_cs),
    .divmmc_sram_write_n(divmmc_sram_write_n),
    .divmmc_sram_hiaddr(divmmc_sram_hiaddr),
    
    .trese_sram_cs(trese_sram_cs),
    .trese_sram_hiaddr(trese_sram_hiaddr),

    .zxromcs(zxromcs),
    .eeprom_oe_n(eeprom_oe_n),
    .sram_oe_n(sram_oe_n),
    .sram_write_n(sram_we_n),
    .sram_hiaddr(sram_hiaddr)  
  );
  
  zxunoregs el_zxuno_esta_por_aqui (
    .clk(clk25mhz),
    .rst_n(rst_n),    
    .a(a),
    .iorq_n(iorq_n),
    .rd_n(rd_n),
    .wr_n(wr_n),
    //.m1_n(m1_n),
    .d(d),
    .addr(zxuno_addr),
    .read_from_reg(zxuno_regrd),
    .write_to_reg(zxuno_regwr)
  );  
  
endmodule
