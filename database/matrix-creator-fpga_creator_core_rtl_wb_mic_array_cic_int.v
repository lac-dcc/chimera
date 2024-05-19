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

module cic_int#(
  parameter WIDTH  = "mandatory",
  parameter CHANNELS = "mandatory"
)(
  input  clk,
  input  resetn,
  input  wr_en,
  input  read_en,
  input  [$clog2(CHANNELS)-1:0] channel,
  input  signed [WIDTH-1:0] data_in,
  output reg signed [WIDTH-1:0] data_out
);

  wire signed [WIDTH-1:0] sum                      ;
  reg  signed [WIDTH-1:0] accumulator[0:CHANNELS-1];

  assign sum = data_out + data_in;

  always @(posedge clk or posedge resetn) begin
    if (resetn)
      data_out <= 0;
    else begin
      case({read_en,wr_en})
        2'b10 : begin
            data_out <= accumulator[channel];
          end
        2'b01 : begin
            accumulator[channel] <= sum;
            data_out             <= data_out;
          end
        default :
          data_out <= data_out;
      endcase
    end
  end

  integer i;
  initial begin
    for (i=0; i<CHANNELS; i=i+1) begin
      accumulator[i] = 0;
    end
  end

endmodule
