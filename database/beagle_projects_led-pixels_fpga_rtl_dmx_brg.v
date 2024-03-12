//=============================================================================================
// DMX-512 Transmitter
// Copyright 2014 by Glen Akins.
// All rights reserved.
// 
// Set editor width to 96 and tab stop to 4.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//=============================================================================================

module dmx_brg
(
	input	wire			rst_n,
	input	wire			clk,
	output	reg				baudEn
);

parameter DIVISOR = 4;

reg [7:0] baudCount;

always @ (posedge clk or negedge rst_n)
begin
    if (!rst_n)
    begin
        baudCount <= 0;
        baudEn <= 0;
    end
    else
    begin
        if (baudCount == DIVISOR)
        begin
            baudCount <= 0;
            baudEn <= 1;
        end
        else
        begin
            baudCount <= baudCount + 1;
            baudEn <= 0;
        end
    end
end

endmodule
