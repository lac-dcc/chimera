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

module wb_zwave_gpio #(
  parameter ADDR_WIDTH = "mandatory",
  parameter DATA_WIDTH = "mandatory"
) (
  input                       clk         ,
  input                       resetn      ,
  // Wishbone interface
  input                       wb_stb_i    ,
  input                       wb_cyc_i    ,
  input                       wb_we_i     ,
  input      [           3:0] wb_sel_i    ,
  input      [ADDR_WIDTH-1:0] wb_adr_i    ,
  input      [DATA_WIDTH-1:0] wb_dat_i    ,
  output reg [DATA_WIDTH-1:0] wb_dat_o    ,
  output reg                  wb_ack_o    ,
  // Serial Wires
  input                       zwave_cs    ,
  inout                       zwave_sck   ,
  inout                       zwave_mosi  ,
  input                       zwave_miso  ,
  output reg                  zwave_nreset
);

  wire wb_rd = wb_stb_i & wb_cyc_i & ~wb_we_i & ~wb_ack_o;
  wire wb_wr = wb_cyc_i & wb_stb_i & wb_we_i & ~wb_ack_o ;

  // Internal Register
  reg                   zwave_dir ;
  wire [DATA_WIDTH-1:0] zwave_data;

  // Internal GPIO registers
  reg zwave_sck_o ;
  reg zwave_mosi_o;

  assign zwave_data = {12'b0,zwave_miso,3'b0};

// Tristate logic for IO
  assign zwave_sck  = zwave_dir ? zwave_sck_o : 1'bz;
  assign zwave_mosi = zwave_dir ? zwave_mosi_o : 1'bz;

  always @(posedge clk or posedge resetn)
    begin
      if (resetn) begin
        wb_ack_o     <= 0;
        zwave_dir    <= 0;
        zwave_nreset <= 1;
        wb_dat_o     <= 0;
        {zwave_mosi_o,zwave_sck_o} <= 2'b0;
      end else begin
        wb_ack_o <= 0;
        if (wb_rd) begin
          wb_ack_o <= 1;
          case (wb_adr_i[1:0])
            2'b00 : begin
              wb_dat_o[DATA_WIDTH-1:0] <= zwave_data;
            end
            2'b01 : begin
              wb_dat_o[DATA_WIDTH-1:0] <= {14'b0,zwave_nreset,zwave_dir};
            end
            default : begin
              wb_dat_o[DATA_WIDTH-1:0] <= 0;
            end
          endcase
        end else if (wb_wr) begin
          wb_ack_o <= 1;
          case (wb_adr_i[1:0])
            2'b00 : begin
              {zwave_mosi_o,zwave_sck_o} <= wb_dat_i[2:1];
            end
            2'b01 : begin
              zwave_dir    <= wb_dat_i[0];
              zwave_nreset <= wb_dat_i[1];
            end
            default : begin
              {zwave_mosi_o,zwave_sck_o} <= {zwave_mosi_o,zwave_sck_o};
              zwave_nreset <= zwave_nreset;
              zwave_dir    <= zwave_dir;
            end
          endcase
        end
      end
    end

endmodule // wb_zwave_gpio
