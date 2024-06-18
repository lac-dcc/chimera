// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Milkymist VJ SoC
* Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, version 3 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

module conbus_arb (
  input            sys_clk,
  input            sys_rst,
  input      [1:0] req    ,
  output reg [1:0] gnt
);

  parameter [1:0] grant0 = 2'b01;
  parameter [1:0] grant1 = 2'b10;

  reg [1:0] state     ;
  reg [1:0] next_state;

  initial begin
    state = grant0;
  end

  always @(posedge sys_clk or posedge sys_rst) begin
    if(sys_rst)
      state <= grant0;
    else
      case (state)
        grant0 : begin
          if (~req[0] & req[1])
            state <= grant1;
          else
            state <= grant0;
        end
        grant1 : begin
          if (~req[1] & req[0])
            state <= grant0;
          else
            state <= grant1;
        end
        default : state <= grant0;
      endcase
  end

  always @(state) begin
    case (state)
      grant0  : gnt[1:0] = 2'b01;
      grant1  : gnt[1:0] = 2'b10;
      default : gnt[1:0] = 2'b01;
    endcase
  end
endmodule
