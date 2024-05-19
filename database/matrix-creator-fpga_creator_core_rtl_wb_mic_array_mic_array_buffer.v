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

module mic_array_buffer #(
  parameter ADDR_WIDTH = "mandatory",
  parameter DATA_WIDTH = 16
) (
  // write port a
  input                       clk_a,
  input                       we_a ,
  input      [ADDR_WIDTH-1:0] adr_a,
  input      [DATA_WIDTH-1:0] dat_a,
  // read port b
  input                       clk_b,
  input      [ADDR_WIDTH-1:0] adr_b,
  output reg [DATA_WIDTH-1:0] dat_b,
  input                       en_b
);

  localparam DEPTH = (2 ** ADDR_WIDTH);

  reg [DATA_WIDTH-1:0] ram[0:DEPTH-1];
//------------------------------------------------------------------
// write port A
//------------------------------------------------------------------
  always @(posedge clk_a)
    begin
      if (we_a)
        ram[adr_a] <= dat_a;
    end

//------------------------------------------------------------------
// read port B
//------------------------------------------------------------------
  always @(posedge clk_b) begin
    if(en_b)
      dat_b <= ram[adr_b];
    else
      dat_b <= 0;
  end
endmodule
