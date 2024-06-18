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


module mux_io#(
  parameter GPIO_WIDTH   = 16)(
  input  [GPIO_WIDTH-1:0]  sig1,
  input  [GPIO_WIDTH-1:0]  sig2,
  input  [GPIO_WIDTH-1:0]  select,
  output [GPIO_WIDTH-1:0]  mux_out);

genvar i;
generate
  for ( i = 0; i < GPIO_WIDTH; i = i + 1 ) 
    begin:gpio_selector
      single_mux mux0(
        .sig1(sig1[i]),
        .sig2(sig2[i]),
        .select(select[i]),
        .mux_output(mux_out[i])
      );
    end
endgenerate


endmodule
