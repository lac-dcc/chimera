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

module cic_sync #(
  parameter SYS_FREQ_HZ = "mandatory",
  parameter PDM_FREQ_HZ = "mandatory",
  parameter CHANNELS    = "mandatory",
  parameter DATA_WIDTH = "mandatory",
  parameter PDM_READING_TIME = "mandatory",
  parameter PDM_RATIO = "mandatory",
  parameter COUNTER_WIDTH = $clog2(SYS_FREQ_HZ/PDM_FREQ_HZ),
  parameter CHANNELS_WIDTH = $clog2(CHANNELS)
 ) (
  input      clk,
  input      resetn,
  //CIC_Configuration_Register
  input [DATA_WIDTH-1:0]sample_rate,
  input [$clog2(CHANNELS)-1:0] channel,

  input cic_finish,
  output reg pdm_clk,
  output reg read_enable,
  output reg integrator_enable,
  output comb_enable
);

  localparam [2:0] S_IDLE         = 3'd0;
  localparam [2:0] S_READING_TIME = 3'd1;
  localparam [2:0] S_COMPUTE      = 3'd2;
  localparam [2:0] S_HOLD         = 3'd3;


  reg  [COUNTER_WIDTH:0] sys_count                      ;
  reg  [ DATA_WIDTH-1:0] comb_count                     ;
  wire                   pdm_codition                   ;
  wire                   comb_condition                 ;
  wire [COUNTER_WIDTH:0] pdm_half_ratio = PDM_RATIO >> 1;

  assign pdm_conndition = (sys_count == PDM_RATIO);
  assign comb_condition = (comb_count == sample_rate);
  assign comb_enable    = comb_condition;

  reg [2:0] state;

  always @(state) begin
    case(state)
      S_IDLE :
        {integrator_enable,read_enable} = {1'b0,1'b0};

      S_READING_TIME :
        {integrator_enable,read_enable}= {1'b0,1'b1};

      S_COMPUTE :
        {integrator_enable,read_enable} = {1'b1,1'b0};

      S_HOLD :
        {integrator_enable,read_enable} = {1'b1,1'b0};

      default :
        {integrator_enable,read_enable} = {1'b0,1'b0};
    endcase
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn)
      state <= S_IDLE;
    else begin
      case(state)
        S_IDLE :
          if( sys_count == PDM_READING_TIME)
            state <= S_READING_TIME;
        else
          state <= S_IDLE;

        S_READING_TIME :
          state <= S_COMPUTE;

        S_COMPUTE :
          state <= S_HOLD;

        S_HOLD :
          if(channel == (CHANNELS-1))
            state <= S_IDLE;
        else
          state <= S_COMPUTE;
        default :
          state <= S_IDLE;
      endcase
    end
  end

  always @(posedge clk or posedge resetn) begin
    if (resetn)
      sys_count <= {COUNTER_WIDTH{1'b0}};
    else begin
      if (pdm_conndition)
        sys_count <= {COUNTER_WIDTH{1'b0}};
      else
        sys_count <= sys_count + 1'b1;
    end
  end

  always @(posedge clk or posedge resetn) begin
    if (resetn | pdm_conndition)
      pdm_clk <= 1'b1;
    else begin
      if (sys_count == pdm_half_ratio)
        pdm_clk <= 1'b0;
      else
        pdm_clk <= pdm_clk;
    end
  end

  always @(posedge clk or posedge resetn) begin
    if (resetn)
      comb_count <= {COUNTER_WIDTH{1'b0}};
    else
      if (pdm_conndition) begin
        if(comb_condition)
          comb_count <= 0;
        else
          comb_count <= comb_count + 1;
      end
  end

endmodule
