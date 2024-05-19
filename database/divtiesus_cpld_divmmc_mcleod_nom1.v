// This program was cloned from: https://github.com/mcleod-ideafix/divtiesus
// License: GNU General Public License v3.0

/*
 * This file is part of the DivTIESUS project
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

module divmmc_mcleod (
  // Interface with CPU
  input wire clk,
  input wire rst_n,
  input wire enable_autopage,  // jumper E = 1 (closed). = 0 (open)  
  input wire [15:0] a,
  inout tri [7:0] d,
  input wire mreq_n,
  input wire iorq_n,
  input wire rd_n,
  input wire wr_n,
  input wire rfsh_n,
  //input wire m1_n,
  input wire nmi_button_n,  // Button push connects to GND
  output wire nmi_to_cpu_n, // Actual NMI signal to CPU
  // Spectrum ROM shadowing
  input wire inrom48k,  
  output reg zxromcs,   // 1 to disable ZX ROM.
  // DivMMC onboard memory control
  output reg eeprom_cs,
  output reg eeprom_we_n,
  output reg sram_cs,
  output reg sram_write_n,
  output reg [5:0] sram_hiaddr,  // up to 512KB of SRAM can be addressed
  // SPI interface
  output wire sd_cs0_n,
  output wire sd_cs1_n,
  output wire sd_sclk,
  output wire sd_mosi,
  input wire sd_miso  
  );

  localparam
    DIVMMC_CTRL = 8'hE3;

  // DIVMMC control register
  reg mapram_mode = 1'b0;
  reg conmem = 1'b0;
  reg [5:0] divmmc_sram_page = 6'b000000;
  wire iorq_wr = iorq_n | wr_n;
  always @(posedge iorq_wr or negedge rst_n) begin
    if (rst_n == 1'b0) begin
      conmem <= 1'b0;
      divmmc_sram_page <= 6'b000000;
    end
    else if (a[7:0]==DIVMMC_CTRL) begin
      conmem <= d[7];
      mapram_mode <= mapram_mode | d[6];
      divmmc_sram_page <= d[5:0];
    end
  end

  // DIVMMC automapper
  reg divmmc_is_autopaged = 1'b1;
  reg [15:0] addr_latched;
  
  wire memory_read_n = mreq_n | rd_n;
  
  always @(negedge memory_read_n or negedge rst_n) begin
    if (rst_n == 1'b0)
      addr_latched <= 16'h0000;
    else
      addr_latched <= a;
  end
  
  reg [3:0] cnt = 4'b0000;
  reg page_inmediately = 1'b0;
  reg [7:0] data_from_system_rom;
  
  always @(posedge clk) begin
    if (memory_read_n == 1'b1) begin
      cnt <= 4'b0000;
      page_inmediately <= 1'b0;
    end
    else if (memory_read_n == 1'b0 && divmmc_is_autopaged == 1'b0 && conmem == 1'b0 && addr_latched[15:8]==8'h3D && inrom48k)
      cnt <= cnt + 4'd1;
    if (cnt == 4'd5)  // era 5
      data_from_system_rom <= d;
    if (cnt == 4'd6)  // era 6
      page_inmediately <= 1'b1;
    if (cnt == 4'd11)   // estamos usando 11 como tope minimo
      page_inmediately <= 1'b0;
  end
  assign d = (cnt >= 4'd11)? data_from_system_rom : 8'hZZ;  

  always @(negedge mreq_n or negedge rst_n) begin
    if (rst_n == 1'b0) begin
      divmmc_is_autopaged <= 1'b1;
    end
    else begin
      if (rfsh_n == 1'b0) begin
        if (addr_latched==16'h0000 || inrom48k && (addr_latched==16'h0008 || 
                                                   addr_latched==16'h0038 || 
                                                   addr_latched==16'h0066 || 
                                                   addr_latched==16'h04C6 || 
                                                   addr_latched==16'h0562 )) begin  // Deferred automapping (maps at the next CPU clock cycle)
          divmmc_is_autopaged <= 1'b1;
        end
        else if (addr_latched[15:8]==8'h3D && inrom48k) begin  // Non deferred automapping (Current CPU clock cycle)
          divmmc_is_autopaged <= 1'b1;
        end
        else if (addr_latched[15:3]==13'b0001_1111_1111_1) begin  // Deferred automapping deactivation
          divmmc_is_autopaged <= 1'b0;
        end
      end
    end
  end

  // Signal NMI only when DivMMC memory is not paged. This prevents signal bouncing
  assign nmi_to_cpu_n = (nmi_button_n == 1'b0 && divmmc_is_autopaged == 1'b0)? 1'b0 : 1'b1;
  
  // EEPROM, ROMCS and SRAM control and address lines
  always @* begin
    eeprom_cs = 1'b0;
    sram_cs = 1'b0;
    sram_hiaddr = {2'b11,divmmc_sram_page[3:0]};
    sram_write_n = 1'b1;
    eeprom_we_n = 1'b1;

    if (conmem == 1'b1 || (enable_autopage == 1'b1 && (divmmc_is_autopaged == 1'b1 || page_inmediately == 1'b1)))
      zxromcs = 1'b1;
    else
      zxromcs = 1'b0;
   
    if (mreq_n == 1'b0 && a[15:14] == 2'b00 /*&& (rd_n == 1'b0 || wr_n == 1'b0)*/ ) begin
   
    //So, when CONMEM is set, there is:
    //0000-1fffh - EEPROM/EPROM/NOTHING(if empty socket), and this area is
    //	   flash-writable if EPROM jumper is open.
    //2000-3fffh - 8k bank, selected by BANK 0..1 bits, always writable.
    if (conmem == 1'b1) begin
      if (a[13] == 1'b0) begin
        if (rd_n == 1'b0) 
          eeprom_cs = 1'b1;
        if (enable_autopage == 1'b0)
          eeprom_we_n = wr_n;
      end  
      else begin
        if (rd_n == 1'b0)
          sram_cs = 1'b1;
        sram_write_n = wr_n;
        sram_hiaddr = {2'b11,divmmc_sram_page[3:0]};
      end
    end
    
    //When MAPRAM is set, but CONMEM is zero, and entrypoint was reached:
    //0000-1fffh - Bank No.3, read-only
    //2000-3fffh - 8k bank, selected by BANK 0..1. If it's different from Bank No.3,
    //	   it's writable.
    else if (enable_autopage == 1'b1 && mapram_mode == 1'b1 && conmem == 1'b0 && (divmmc_is_autopaged == 1'b1 || page_inmediately == 1'b1)) begin
      if (a[13] == 1'b0) begin
        if (rd_n == 1'b0) begin
          sram_cs = 1'b1;
          sram_hiaddr = 6'd3;
          sram_write_n = 1'b1;
        end
      end
      else begin
        if (rd_n == 1'b0)
          sram_cs = 1'b1;
        sram_hiaddr = {2'b11,divmmc_sram_page[3:0]};
        if (divmmc_sram_page != 6'd3) begin
          sram_write_n = wr_n;
        end
        else begin
          sram_write_n = 1'b1;
        end
      end
    end
   
    //When MAPRAM is zero, CONMEM is zero, EPROM jumper is closed and entrypoint was
    //reached:
    //0000-1fffh - EEPROM/EPROM/NOTHING(if empty socket, so open jumper in this case),
    //	   read-only.
    //2000-3fffh - 8k bank, selected by BANK 0..1, always writable.
    else if (enable_autopage == 1'b1 && mapram_mode == 1'b0 && conmem == 1'b0 && (divmmc_is_autopaged == 1'b1 || page_inmediately == 1'b1)) begin
      if (a[13] == 1'b0) begin
        if (rd_n == 1'b0)
          eeprom_cs = 1'b1;
      end
      else begin
        if (rd_n == 1'b0)
          sram_cs = 1'b1;
        sram_write_n = wr_n;
        sram_hiaddr = {2'b11,divmmc_sram_page[3:0]};
      end
    end
    
    //Otherwise, there's normal speccy memory layout. No modified ROM, no shit.  
    else begin
      eeprom_cs = 1'b0;
      sram_cs = 1'b0;
      sram_write_n = 1'b1;
    end
   
    end // del IF que nos dice si estamos accediendo a los primeros 16KB
  end // del always

  sd_card_control sd (
    .clk(clk),
    .rst_n(rst_n),
    .a(a[7:0]),
    .iorq_n(iorq_n),
    .rd_n(rd_n),
    .wr_n(wr_n),
    .d(d),
    
    .sd_cs0_n(sd_cs0_n),
    .sd_cs1_n(sd_cs1_n),
    .sd_sclk(sd_sclk),
    .sd_mosi(sd_mosi),
    .sd_miso(sd_miso)
    );

endmodule

module sd_card_control (
  input wire clk,
  input wire rst_n,
  input wire [7:0] a,     //
  input wire iorq_n,      // Señales de control de E/S estandar
  input wire rd_n,        // para manejar los puertos DIVMMC
  input wire wr_n,        //
  inout tri [7:0] d,      // 
  
  output wire sd_cs0_n,   //
  output wire sd_cs1_n,   //
  output wire sd_sclk,    // Interface SPI con la SD/MMC
  output wire sd_mosi,    //
  input wire sd_miso      //
  );

  parameter
   DIVCS   = 8'hE7,   //
   DIVSPI  = 8'hEB;   // Puertos del DIVMMC

  reg [1:0] sdpincs = 2'b11;
  assign sd_cs0_n = sdpincs[0];
  assign sd_cs1_n = sdpincs[1];
  
  // Control del pin CS de la SD
  wire iorq_wr = iorq_n | wr_n;
  always @(posedge iorq_wr or negedge rst_n) begin
    if (rst_n == 1'b0)
      sdpincs <= 2'b11;
    else if (a == DIVCS && d[1:0] != 2'b00)
      sdpincs <= d[1:0];
  end
  
  // Control del modulo SPI
  reg recibir_dato;
  reg enviar_dato;
  
  always @* begin
    recibir_dato = (a==DIVSPI && !rd_n && !iorq_n);
    enviar_dato  = (a==DIVSPI && !wr_n && !iorq_n);
  end
  
  // Instanciacion del modulo SPI  
  spi mi_spi (
   .clk(clk),
   .rst_n(rst_n),
   .enviar_dato(enviar_dato),
   .recibir_dato(recibir_dato),
   .d(d),
  
   .spi_clk(sd_sclk),
   .spi_mosi(sd_mosi),
   .spi_miso(sd_miso)
   );
  
endmodule

module spi (
  input wire clk,         // 
  input wire rst_n,
  input wire enviar_dato, // a 1 para indicar que queremos enviar un dato por SPI
  input wire recibir_dato,// a 1 para indicar que queremos recibir un dato
  inout tri [7:0] d,
  
  output wire spi_clk,    // Interface SPI
  output wire spi_mosi,   //
  input wire spi_miso     //
  );

  localparam
    IDLE     = 2'd0,
	  SAMPLE   = 2'd1,
	  WAIT     = 2'd2,
	  TRANSFER = 2'd3;
  
  // Modulo SPI.
  reg [3:0] contador = 4'd0; // contador del FSM (ciclos)
  reg [7:0] data_spi;        // dato a enviar a la spi por DI
  reg [7:0] data_to_cpu;     // ultimo dato recibido correctamente
  
  assign spi_clk = contador[0];  // spi_CLK es la mitad que el reloj del modulo
  assign spi_mosi = data_spi[7]; // la transmision es del bit 7 al 0
  reg [1:0] estado = IDLE;

  always @(posedge clk) begin
    if (rst_n == 1'b0) begin
      contador <= 4'd0;
      data_spi <= 8'hFF;
		  estado <= IDLE;
    end
    else begin
      case (estado)
        IDLE:
		    begin
          if (enviar_dato || recibir_dato) begin  // si se pide enviar o recibir, iniciar ciclo SPI
				    estado <= SAMPLE;
			    end
		    end
		  
        SAMPLE:
        begin
          estado <= WAIT;
          if (enviar_dato)   // si se pide enviar un dato, pues se copia en el reg. desplaz. de SPI
            data_spi <= d;
          else begin              // recibir dato.
            data_spi <= 8'hFF;  // mientras leemos, MOSI debe estar a nivel alto!    
            data_to_cpu <= data_spi;
          end
		    end
		  
        WAIT:
        begin
          if (!enviar_dato && !recibir_dato)
			      estado <= TRANSFER;
        end

        TRANSFER:
        begin
          contador <= contador + 4'd1;
          if (contador == 4'd15)
            estado <= IDLE;
          if (spi_clk == 1'b1)
            data_spi <= {data_spi[6:0], spi_miso};
        end

      endcase
	  end
  end
  
  assign d = (recibir_dato)? data_to_cpu : 8'bZZ;
endmodule
