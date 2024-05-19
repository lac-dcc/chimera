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

module cic_comb#(
  parameter WIDTH  = "mandatory",
  parameter CHANNELS = "mandatory"
)(
  input  clk,
  input  resetn,
  input  read_en,
  input  wr_en,
  input  [$clog2(CHANNELS)-1:0] channel,
  input  signed [WIDTH-1:0] data_in,
  output reg signed [WIDTH-1:0] data_out
);

  reg signed [WIDTH-1:0] data_in_prev [0:CHANNELS-1];
  reg signed [WIDTH-1:0] data_out_prev[0:CHANNELS-1];

  localparam [2:0] S_IDLE  = 2'd0;
  localparam [2:0] S_READ  = 2'd1;
  localparam [2:0] S_STORE = 2'd2;

  reg  signed [WIDTH-1:0] prev;
  wire signed [WIDTH-1:0] diff;

  assign diff = data_in - prev;

  always @(posedge clk or posedge resetn) begin
    if (resetn) begin
      data_out <= 0;
      prev     <= 0;
    end
    else begin
      case({read_en,wr_en})
        2'b10 :
          begin
            data_out <= data_out_prev[channel];
            prev     <= data_in_prev[channel];
          end
        2'b01 :
          begin
            data_in_prev[channel]  <= data_in;
            data_out_prev[channel] <= diff;
          end
        default :
          data_out <= data_out;
      endcase
    end
  end

  integer i;
  initial begin
    for (i=0; i<CHANNELS; i=i+1) begin
      data_in_prev[i] = 0;
      data_out_prev[i] = 0;
    end
  end

endmodule
