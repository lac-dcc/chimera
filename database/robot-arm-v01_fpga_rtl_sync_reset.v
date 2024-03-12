//=============================================================================================
// 6-Axis Robot Arm Motion Engine
// Copyright 2015 by Glen Akins.
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

module sync_reset
(
	input	wire			clk,
	input	wire			arst_n,
	input	wire			locked,
	output	reg				rst
);

reg rst_pre0, rst_pre1;

always @ (posedge clk or negedge arst_n)
begin
	if (!arst_n)
	begin
		rst_pre0 <= 1;
		rst_pre1 <= 1;
		rst <= 1;
	end
	else
	begin
		rst_pre0 <= !locked;
		rst_pre1 <= rst_pre0;
		rst <= rst_pre1;
	end
end

endmodule
