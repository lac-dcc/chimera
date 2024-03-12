/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// Simplest ROM for Xilinx inferred BRAM
module ROM(CLK, ADDR, DO);
  parameter  WIDTH      = 1;
  parameter  SIZE       = 1;
  parameter  INITFILE   = "";

  input                     CLK;
  input  [$clog2(SIZE)-1:0] ADDR;
  output [WIDTH-1:0]        DO;

  reg [WIDTH-1:0]           ROM[0:SIZE-1];
  reg [WIDTH-1:0]           DO_R;

  initial
  begin : init_block
    $readmemh(INITFILE, ROM);
  end

  // having a clocked output register infers BRAM
  always @(posedge CLK) begin
    DO_R <= ROM[ADDR];
  end

  assign DO = DO_R;

endmodule // ROM
