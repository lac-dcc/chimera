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
/*
Frequency  Default Gain
8000          0
12000         2
16000         3
22500         5
24000         5
32000         6
44100         8
48000         8
*/

module wb_mic_array #(
  parameter                  SYS_FREQ_HZ      = "mandatory",
  parameter                  ADDR_WIDTH       = "mandatory",
  parameter                  DATA_WIDTH       = "mandatory",
  parameter                  PDM_FREQ_HZ      = "mandatory",
  parameter [DATA_WIDTH-1:0] PDM_RATIO        = "mandatory",
  parameter [DATA_WIDTH-1:0] PDM_READING_TIME = "mandatory",
  parameter                  FIR_TAP          = 128        ,
  parameter                  FIR_TAP_WIDTH    = 16         ,
  parameter                  FIR_TAP_ADDR     = $clog2(FIR_TAP)
) (
  input                       clk        ,
  input                       resetn     ,
  // MIC_Interface
  input      [           7:0] pdm_data   ,
  output                      pdm_clk    ,
  output                      irq        ,
  // Wishbone
  input                       wb_clk     ,
  input                       wb_stb_i   ,
  input                       wb_cyc_i   ,
  input                       wb_we_i    ,
  input      [           1:0] wb_sel_i   ,
  input      [ADDR_WIDTH-1:0] wb_adr_i   ,
  input      [DATA_WIDTH-1:0] wb_dat_i   ,
  output     [DATA_WIDTH-1:0] wb_dat_o   ,
  output reg                  wb_ack_o   ,
  //Configuration Register
  input      [DATA_WIDTH-1:0] sample_rate,
  input      [DATA_WIDTH-1:0] data_gain
);

  wire wb_rd = wb_stb_i & wb_cyc_i & ~wb_we_i & ~wb_ack_o;
  wire wb_wr = wb_stb_i & wb_cyc_i & wb_we_i & ~wb_ack_o ;

  wire [DATA_WIDTH-1:0] mic_data;

  wire signed [FIR_TAP_WIDTH-1:0] coeff_data;
  wire signed [ FIR_TAP_ADDR-1:0] coeff_addr;

  mic_array #(
    .SYS_FREQ_HZ     (SYS_FREQ_HZ     ),
    .DATA_WIDTH      (DATA_WIDTH      ),
    .ADDR_WIDTH      (ADDR_WIDTH      ),
    .PDM_FREQ_HZ     (PDM_FREQ_HZ     ),
    .PDM_READING_TIME(PDM_READING_TIME),
    .PDM_RATIO       (PDM_RATIO       ),
    .FIR_TAP_WIDTH   (FIR_TAP_WIDTH   ),
    .FIR_TAP         (FIR_TAP         ),
    .FIR_TAP_ADDR    (FIR_TAP_ADDR    )
  ) mic_array0 (
    .clk            (clk        ),
    .resetn         (resetn     ),
    // MIC_Interface
    .pdm_data       (pdm_data   ),
    .pdm_clk        (pdm_clk    ),
    //Configuration_Register
    .sample_rate    (sample_rate),
    .data_gain      (data_gain  ),
    // Read Interface
    .out_clk        (wb_clk     ),
    .read_en        (wb_rd      ),
    .addr_out       (wb_adr_i   ),
    .data_out       (mic_data   ),
    .buffer_selector(irq        ),
    //FIR Coeff
    .coeff_addr     (coeff_addr ),
    .coeff_data     (coeff_data )
  );

  mic_array_buffer #(
    .ADDR_WIDTH(FIR_TAP_ADDR ),
    .DATA_WIDTH(FIR_TAP_WIDTH)
  ) mic_fir_coeff0 (
    // write port a
    .clk_a(clk       ),
    .we_a (wb_wr     ),
    .adr_a(wb_adr_i  ),
    .dat_a(wb_dat_i  ),
    
    // read port b
    .clk_b(clk       ),
    .adr_b(coeff_addr),
    .en_b (1'b1      ),
    .dat_b(coeff_data)
  );

  assign wb_dat_o = mic_data;

  always @(posedge clk or posedge resetn) begin
    if(resetn) begin
      wb_ack_o <= 0;
    end else begin
      wb_ack_o <= 0;
      if(wb_rd ^ wb_wr)
        wb_ack_o <= 1'b1;
    end
  end

endmodule
