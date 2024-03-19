/*
** -----------------------------------------------------------------------------**
** macros353.v
**
** temporary, modules to be moved
**
** Copyright (C) 2002 Elphel, Inc
**
** -----------------------------------------------------------------------------**
**  This file is part of X353
**  X353 is free software - hardware description language (HDL) code.
** 
**  This program is free software: you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation, either version 3 of the License, or
**  (at your option) any later version.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License
**  along with this program.  If not, see <http://www.gnu.org/licenses/>.
** -----------------------------------------------------------------------------**
**
*/


module ram_WxD
#(
  parameter integer DATA_WIDTH=16,
  parameter integer DATA_DEPTH=4,
  parameter integer DATA_2DEPTH=(1<<DATA_DEPTH)-1
)
    (
  input  [DATA_WIDTH-1:0] D,
  input                   WE,
  input                   clk,
  input  [DATA_DEPTH-1:0] AW,
  input  [DATA_DEPTH-1:0] AR,
  output [DATA_WIDTH-1:0] QW,
  output [DATA_WIDTH-1:0] QR);
  
    reg	 [DATA_WIDTH-1:0]	ram [0:DATA_2DEPTH];
    always @(posedge clk) if (WE) ram[AW] <= D; 
    assign	QW= ram[AW];
    assign	QR= ram[AR];
endmodule


