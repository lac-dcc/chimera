//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------


module nukv_Feedback #(
	parameter KEY_WIDTH = 128,
	parameter META_WIDTH = 96
	)
    (
	// Clock
	input wire         clk,
	input wire         rst,

	input  wire [KEY_WIDTH+META_WIDTH-1:0] fb_in_data,
	input  wire         fb_in_valid,
	output wire         fb_in_ready,

	output  wire [KEY_WIDTH+META_WIDTH-1:0] fb_out_data,
	output  wire         fb_out_valid,
	input wire         fb_out_ready,

	input  wire [KEY_WIDTH+META_WIDTH-1:0] reg_in_data,
	input  wire         reg_in_valid,
	output wire         reg_in_ready,

	output  wire [KEY_WIDTH+META_WIDTH-1:0] reg_out_data,
	output  wire         reg_out_valid,
	input wire         reg_out_ready 
	);
	
endmodule