// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016-2020 MATRIX Labs
* MATRIX Labs  [http://creator.matrix.one]
* Authors: Kevin Patiño    <kevin.patino@admobilize.com>        
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

module fir_pipe_fsm #(
  parameter CHANNELS       = "mandatory",
  parameter CHANNELS_WIDTH = "mandatory",
  parameter FIR_TAP        = "mandatory",
  parameter TAP_COUNT_WIDTH = $clog2(FIR_TAP)
) (
  input                            clk             ,
  input                            resetn          ,
  input                            end_write_data  ,
  output reg [TAP_COUNT_WIDTH-1:0] tap_count       ,
  output reg [ CHANNELS_WIDTH-1:0] channel_count   ,
  output reg                       load_data_memory,
  output reg                       reset_tap       ,
  output                           write_data
);

  reg [2:0] state   ;
  reg       count_en,reset_channel;

  assign write_data = count_en;

  localparam [1:0] S_IDLE = 3'd0;
  localparam [1:0] S_PIPE = 3'd1;
  localparam [1:0] S_NEXT = 3'd2;

  always @(state) begin
    case(state)
      S_IDLE : begin
        count_en         = 0;
        reset_tap        = 1;
        reset_channel    = 1;
        load_data_memory = 0;
      end
      S_PIPE : begin
        count_en         = 0;
        reset_tap        = 0;
        reset_channel    = 0;
        load_data_memory = 1;
      end
      S_NEXT : begin
        count_en         = 1;
        reset_tap        = 1;
        reset_channel    = 0;
        load_data_memory = 0;
      end
      default : begin
        count_en         = 0;
        reset_tap        = 1;
        reset_channel    = 1;
        load_data_memory = 0;
      end
    endcase
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn | reset_tap) begin
      tap_count <= 0;
    end else begin
      tap_count <= tap_count + 1;
    end
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn | reset_channel) begin
      channel_count <= 0;
    end else begin
      if(count_en)
        channel_count <= channel_count + 1;
    end
  end

  always @(posedge clk or posedge resetn) begin
    if(resetn)
      state <= S_IDLE;
    else begin
      case(state)
        S_IDLE : begin
          if(end_write_data)
            state <= S_PIPE;
          else
            state <= S_IDLE;
        end
        S_PIPE :
          if(tap_count == FIR_TAP-1) // PipeLine stages
            state <= S_NEXT;
        else
          state <= S_PIPE;
        S_NEXT :
          if(channel_count == CHANNELS-1)
            state <= S_IDLE;
        else
          state <= S_PIPE;
        default :
          state <= S_IDLE;
      endcase
    end
  end

endmodule
