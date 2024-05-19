// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016 <Admobilize>
* MATRIX Labs  [http://creator.matrix.one]
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

module wb_everloop #(
  parameter MEM_FILE_NAME = "none" ,
  parameter SYS_FREQ_HZ = "mandatory",
  parameter DATA_WIDTH = "mandatory",
  parameter ADDR_WIDTH = "mandatory",
  parameter N_LEDS = "mandatory",
  parameter MEM_ADDR_WIDTH = 8
) (
  input                   clk         ,
  input                   resetn      ,
  input                   led_fb      ,
  input                   wb_stb_i    ,
  input                   wb_cyc_i    ,
  input                   wb_we_i     ,
  input  [           1:0] wb_sel_i    ,
  input  [ADDR_WIDTH-1:0] wb_adr_i    ,
  input  [DATA_WIDTH-1:0] wb_dat_i    ,
  output [DATA_WIDTH-1:0] wb_dat_o    ,
  output                  wb_ack_o    ,
  //Everloop
  output                  everloop_ctl
);

  wire wb_rd = wb_stb_i & wb_cyc_i & ~wb_we_i & ~wb_ack_o;
  wire wb_wr = wb_stb_i & wb_cyc_i & wb_we_i & ~wb_ack_o ;

  wire [MEM_ADDR_WIDTH-1:0] adr_b;

  wire [DATA_WIDTH-1:0] data_everloop;
  reg  [DATA_WIDTH-1:0] data_a       ;

  wire reset_everloop;
  wire read_en       ;


  everloop #(
    .SYS_FREQ_HZ(SYS_FREQ_HZ),
    .DATA_WIDTH (DATA_WIDTH )
  ) everloop0 (
    .clk             (clk           ),
    .resetn          (resetn        ),
    .send_complete   (send_complete ),
    .data_everloop   (data_everloop ),
    .data_en         (read_en       ),
    .everloop_control(everloop_ctl  ),
    .reset_everloop  (reset_everloop)
  );

  everloop_ram #(
    .ADDR_WIDTH   (MEM_ADDR_WIDTH),
    .DATA_WIDTH   (DATA_WIDTH    ),
    .MEM_FILE_NAME(MEM_FILE_NAME )
  ) everloopram0 (
    // write port a
    .clk  (clk                         ),
    .adr_a(wb_adr_i[MEM_ADDR_WIDTH-1:0]),
    .dat_a(wb_dat_i                    ),
    .we_a (wb_wr                       ),
    .ack_a(wb_ack_o                    ),
    // read port b
    .adr_b(adr_b                       ),
    .dat_b(data_everloop               )
  );

  everloop_fsm #(
    .SYS_FREQ_HZ(SYS_FREQ_HZ),
    .N_LEDS     (N_LEDS     )
  ) everloop_fsm0 (
    .clk           (clk           ),
    .resetn        (resetn        ),
    .send_complete (send_complete ),
    .read_en       (read_en       ),
    .read_count    (adr_b         ),
    .reset_everloop(reset_everloop)
  );


endmodule
