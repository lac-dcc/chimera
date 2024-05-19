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

module mic_array #(
  // Simple Integrator
  parameter SYS_FREQ_HZ       = "mandatory",
  parameter PDM_FREQ_HZ       = "mandatory",
  parameter PDM_READING_TIME  = "mandatory",
  parameter DATA_WIDTH        = "mandatory",
  parameter ADDR_WIDTH        = "mandatory",
  parameter PDM_RATIO         = "mandatory",
  parameter FIR_TAP_WIDTH     = "mandatory",
  parameter FIR_TAP           = "mandatory",
  parameter FIR_TAP_ADDR      = "mandatory",
  parameter CIC_DATA_WIDTH    = 23         ,
  parameter STAGES            = 3          ,
  parameter ADDR_WIDTH_BUFFER = 13         ,
  parameter CHANNELS          = 8          ,
  parameter CHANNELS_WIDTH    = $clog2(CHANNELS)
) (
  input                             clk            ,
  input                             resetn         ,
  input         [     CHANNELS-1:0] pdm_data       ,
  output                            pdm_clk        ,
  input                             out_clk        ,
  input                             read_en        ,
  input         [   ADDR_WIDTH-1:0] addr_out       ,
  output                            buffer_selector,
  output        [   DATA_WIDTH-1:0] data_out       ,
  //Configuration_Registers
  input         [   DATA_WIDTH-1:0] sample_rate    ,
  input         [   DATA_WIDTH-1:0] data_gain      ,
  //FIR Coeff
  output        [ FIR_TAP_ADDR-1:0] coeff_addr     ,
  input  signed [FIR_TAP_WIDTH-1:0] coeff_data
);

/* strobe signals */
  wire integrator_enable;
  wire comb_enable      ;
  wire write_memory     ;
  wire pdm_read_enable  ;

  wire signed [CIC_DATA_WIDTH-1:0] data_cic;

  wire [CHANNELS_WIDTH-1:0] channel;

  cic_sync #(
    .SYS_FREQ_HZ     (SYS_FREQ_HZ     ),
    .CHANNELS        (CHANNELS        ),
    .DATA_WIDTH      (DATA_WIDTH      ),
    .PDM_FREQ_HZ     (PDM_FREQ_HZ     ),
    .PDM_READING_TIME(PDM_READING_TIME),
    .PDM_RATIO       (PDM_RATIO       )
  ) cic_sync0 (
    .clk              (clk              ),
    .resetn           (resetn           ),
    .pdm_clk          (pdm_clk          ),
    .channel          (channel          ),
    
    //CIC_Configuration_Registers
    .integrator_enable(integrator_enable),
    .sample_rate      (sample_rate      ),
    .read_enable      (pdm_read_enable  ),
    .comb_enable      (comb_enable      )
  );

  cic #(
    .STAGES  (STAGES        ),
    .WIDTH   (CIC_DATA_WIDTH),
    .CHANNELS(CHANNELS      )
  ) cic0 (
    .clk              (clk              ),
    .resetn           (resetn           ),
    .pdm_data         (pdm_data         ),
    .integrator_enable(integrator_enable),
    .comb_enable      (comb_enable      ),
    .data_out         (data_cic         ),
    .channel          (channel          ),
    .pdm_read_enable  (pdm_read_enable  ),
    .write_memory     (write_memory     )
  );

  wire[DATA_WIDTH-1:0] data_out_p;
  wire                  write_data    ;
  reg  [DATA_WIDTH-1:0] boundered_data;

  mic_fir #(
    .DATA_WIDTH    (DATA_WIDTH    ),
    .CHANNELS      (CHANNELS      ),
    .CHANNELS_WIDTH(CHANNELS_WIDTH),
    .FIR_TAP_WIDTH (FIR_TAP_WIDTH ),
    .FIR_TAP       (FIR_TAP       ),
    .FIR_TAP_ADDR  (FIR_TAP_ADDR  )
  ) mic_fir0 (
    .clk           (clk           ),
    .resetn        (resetn        ),
    .data_load     (write_memory  ),
    .channel       (channel       ),
    .ce            (write_memory  ),
    .data_in       (boundered_data),
    .data_out      (data_out_p    ),
    .write_data_mem(write_data    ),
    //FIR Coeff
    .coeff_addr    (coeff_addr    ),
    .coeff_data    (coeff_data    )
  );

  reg [ADDR_WIDTH_BUFFER-1:0] wr_addr;

  always @(posedge clk or posedge resetn) begin
    if (resetn)
      wr_addr <= 0;
    else begin
      if (write_data)
        wr_addr <= wr_addr + 1;
    end
  end

  assign buffer_selector = wr_addr[ADDR_WIDTH_BUFFER-1];

  /* positive overflow detection */
  reg pof;
  always @(data_cic) begin
    case(data_gain)
      0       : pof = 1'b0;
      1       : pof = data_cic[CIC_DATA_WIDTH-2];
      2       : pof = |data_cic[(CIC_DATA_WIDTH-2)-:2];
      3       : pof = |data_cic[(CIC_DATA_WIDTH-2)-:3];
      4       : pof = |data_cic[(CIC_DATA_WIDTH-2)-:4];
      5       : pof = |data_cic[(CIC_DATA_WIDTH-2)-:5];
      6       : pof = |data_cic[(CIC_DATA_WIDTH-2)-:6];
      7       : pof = |data_cic[(CIC_DATA_WIDTH-2)-:7];
      8       : pof = |data_cic[(CIC_DATA_WIDTH-2)-:8];
      9       : pof = |data_cic[(CIC_DATA_WIDTH-2)-:9];
      10      : pof = |data_cic[(CIC_DATA_WIDTH-2)-:10];
      default : pof = 1'b1;
    endcase
  end

  /* negative overflow detection */
  reg nof;
  always @(data_cic) begin
    case(data_gain)
      0       : nof = 1'b0;
      1       : nof = ~data_cic[CIC_DATA_WIDTH-2];
      2       : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:2]);
      3       : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:3]);
      4       : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:4]);
      5       : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:5]);
      6       : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:6]);
      7       : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:7]);
      8       : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:8]);
      9       : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:9]);
      10      : nof = ~(&data_cic[(CIC_DATA_WIDTH-2)-:10]);
      default : nof = 1'b1;
    endcase
  end

  always @(data_cic) begin
    case({(data_cic[CIC_DATA_WIDTH-1] & nof) , (~data_cic[CIC_DATA_WIDTH-1] & pof) })
      2'b01   : boundered_data = {1'b0,{(DATA_WIDTH-1){1'b1}}}; /* positive overflow*/
      2'b10   : boundered_data = {1'b1,{(DATA_WIDTH-1){1'b0}}}; /* negative overflow */
      default : boundered_data = {data_cic[CIC_DATA_WIDTH-1],data_cic[(CIC_DATA_WIDTH-2-data_gain)-:DATA_WIDTH-1]};
    endcase
  end

  wire [ADDR_WIDTH_BUFFER-1:0] addr_buffer_read;
  assign addr_buffer_read = {~buffer_selector,addr_out[ADDR_WIDTH_BUFFER-2:0]};

  wire [ADDR_WIDTH_BUFFER-1:0] wr_addr_deinterlaced;
  assign wr_addr_deinterlaced = {wr_addr[ADDR_WIDTH_BUFFER-1],wr_addr[CHANNELS_WIDTH-1:0],wr_addr[ADDR_WIDTH_BUFFER-2:CHANNELS_WIDTH]};

  mic_array_buffer #(
    .ADDR_WIDTH(ADDR_WIDTH_BUFFER),
    .DATA_WIDTH(DATA_WIDTH       )
  ) mic_array_buffer0 (
    // write port a
    .clk_a(clk                 ),
    .we_a (write_data          ),
    .adr_a(wr_addr_deinterlaced),
    .dat_a(data_out_p          ),
    
    // read port b
    .clk_b(clk                 ),
    .adr_b(addr_buffer_read    ),
    .en_b (read_en             ),
    .dat_b(data_out            )
  );

endmodule
