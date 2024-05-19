// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016-2020 MATRIX Labs
* MATRIX Labs  [http://creator.matrix.one]
* Authors: Andres Calderon <andres.calderon@admobilize.com>
*          Kevin Patiño    <kevin.patino@admobilize.com>        
*
* This file is part of MATRIX Creator HDL for Spartan 6
*
* MATRIX Creator HDL is like free software: you can redistribute
* it and/or modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.

* This program is distributed in the hope that it will be useful, but
* WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.

* You should have received a copy of the GNU General Public License along
* with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

module wb_mcu_bram #(
  parameter ADDR_WIDTH = "mandatory",
  parameter DATA_WIDTH = "mandatory",
  parameter MCU_ADDR_WIDTH = 11,
  parameter MCU_DATA_WIDTH = 8
) (
  input                       clk_i        ,
  //Wishbone interface
  input                       wb_stb_i     ,
  input                       wb_cyc_i     ,
  input                       wb_we_i      ,
  input  [    ADDR_WIDTH-1:0] wb_adr_i     ,
  output [    DATA_WIDTH-1:0] wb_dat_o     ,
  input  [    DATA_WIDTH-1:0] wb_dat_i     ,
  input  [               1:0] wb_sel_i     ,
  //MCU SAM
  input                       mcu_clk      ,
  input                       mcu_nwe      ,
  input                       mcu_ncs      ,
  input                       mcu_nrd      ,
  input  [MCU_ADDR_WIDTH-1:0] mcu_addr     , //TODO(andres.calderon): parameterize
  inout  [MCU_DATA_WIDTH-1:0] mcu_sram_data, //TODO(andres.calderon): parameterize
  output reg                  wb_ack_o
);

  wire wb_rd = wb_stb_i & wb_cyc_i & ~wb_we_i & ~wb_ack_o;
  wire wb_wr = wb_cyc_i & wb_stb_i & wb_we_i & ~wb_ack_o;

  always @(posedge clk_i) begin 
    wb_ack_o <= 0;
    if(wb_wr|wb_rd)
      wb_ack_o <= 1;
    else
      wb_ack_o <= 0;
  end


/* synchronize signals */
  reg                      mcu_sncs       ;
  reg                      mcu_snwe       ;
  reg [MCU_ADDR_WIDTH-1:0] mcu_buffer_addr;
  reg [MCU_DATA_WIDTH-1:0] mcu_buffer_data;

/* bram interfaz signals */
  reg mcu_we  ;
  reg mcu_w_st;

  reg  [MCU_DATA_WIDTH-1:0] mcu_wdBus;
  wire [MCU_DATA_WIDTH-1:0] mcu_rdBus;

/* interefaz signals assignments */
  wire T = (mcu_nrd | mcu_ncs);
  assign mcu_sram_data = T?8'bZ:mcu_rdBus;


/* synchronize assignment */
  always  @(posedge mcu_clk)
    begin
      mcu_sncs        <= mcu_ncs;
      mcu_snwe        <= mcu_nwe;
      mcu_buffer_data <= mcu_sram_data;
      mcu_buffer_addr <= mcu_addr;
    end

/* write access cpu to bram */
  always @(negedge mcu_clk)
    begin
      mcu_wdBus <= mcu_buffer_data;
      case (mcu_w_st)
        0 : begin
          mcu_we <= 0;
          if (mcu_sncs | mcu_snwe)
            mcu_w_st <= 1;
        end
        1 : begin
          if (~(mcu_sncs | mcu_snwe)) begin
            mcu_we   <= 1;
            mcu_w_st <= 0;
          end
          else mcu_we <= 0;
        end
      endcase
    end

  RAMB16_S9_S18 ram (
    /* MCU port */
    .CLKA (mcu_clk                     ), /* Port A Clock */
    .ENA  (1'b1                        ), /* Port A RAM Enable Input */
    .SSRA (1'b0                        ), /* Port A Synchronous Set/Reset Input */
    .WEA  (mcu_we                      ), /* Port A Write Enable Input */
    .DOA  (mcu_rdBus                   ), /* Port A 8-bit Data Output */
    .DOPA (                            ), /* Port A 1-bit Parity Output */
    .ADDRA(mcu_buffer_addr             ), /* Port A 11-bit Address Input */
    .DIA  (mcu_wdBus                   ), /* Port A 8-bit Data Input */
    .DIPA (1'b0                        ), /* Port A 1-bit parity Input */

    /* Wishbone port */
    .CLKB (clk_i                       ), /* Port B Clock */
    .ENB  (1'b1                        ), /* Port B RAM Enable Input */
    .SSRB (1'b0                        ), /* Port B Synchronous Set/Reset Input */
    .WEB  (wb_wr                       ), /* Port B Write Enable Input */
    .DOB  (wb_dat_o                    ), /* Port B 8-bit Data Output */
    .DOPB (                            ), /* Port B 1-bit Parity Output */
    .ADDRB(wb_adr_i[MCU_ADDR_WIDTH-2:0]), /* Port B MCU_ADDR_WIDTH-1-bit Address Input */
    .DIB  (wb_dat_i                    ), /* Port B 8-bit Data Input */
    .DIPB (2'b00                       )  /* Port B 1-bit parity Input */
  );

endmodule
