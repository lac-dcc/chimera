////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	spio.v
//
// Project:	CMod S6 System on a Chip, ZipCPU demonstration project
//
// Purpose:	To provide a bare minimum level of access to the two on-board
//		buttons, the 4 LED's, and the external 4x4 keypad.  This
//	routine does *nothing* to debounce either buttons or keypad.  Any such
//	debouncing *must* be done in software.  As with the rest of the S6
//	project, the goal is to keep the logic small and simple, and this
//	module is no different.
//
//	With the USB cord on top, the board facing you, LED[0] is on the left.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2016, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory, run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//

module	spio(i_clk, i_wb_cyc, i_wb_stb, i_wb_we, i_wb_data, o_wb_data,
	o_kp_col, i_kp_row, i_btn, o_led,
	o_kp_int, o_btn_int);
	//
	input			i_clk;
	//
	input			i_wb_cyc, i_wb_stb, i_wb_we;
	input		[31:0]	i_wb_data;
	output	wire	[31:0]	o_wb_data;
	//
	output	reg	[3:0]	o_kp_col;
	input		[3:0]	i_kp_row;
	input		[1:0]	i_btn;
	output	reg	[3:0]	o_led;
	output	reg		o_kp_int, o_btn_int;

	initial	o_kp_col = 4'h0;
	initial	o_led    = 4'h0;
	always @(posedge i_clk)
		if ((i_wb_stb)&&(i_wb_we))
		begin
			o_kp_col <= ((o_kp_col)&(~i_wb_data[11:8]))
					|((i_wb_data[15:12])&(i_wb_data[11:8]));
			// o_led <= ((o_led)&(~i_wb_data[7:4]))
					// |((i_wb_data[3:0])&(i_wb_data[7:4]));
			o_led[0] <= (i_wb_data[4])?i_wb_data[0]:o_led[0];
			o_led[1] <= (i_wb_data[5])?i_wb_data[1]:o_led[1];
			o_led[2] <= (i_wb_data[6])?i_wb_data[2]:o_led[2];
			o_led[3] <= (i_wb_data[7])?i_wb_data[3]:o_led[3];
		end

	reg	[3:0]	x_kp_row, r_kp_row;
	reg	[1:0]	x_btn, r_btn;

	initial	x_kp_row  = 4'h0;
	initial	r_kp_row  = 4'b0;
	initial	x_btn     = 2'b0;
	initial	r_btn     = 2'b0;
	initial	o_kp_int  = 1'b0;
	initial	o_btn_int = 1'b0;
	always @(posedge i_clk)
	begin
		x_kp_row <= i_kp_row;
		x_btn    <= i_btn;
		r_kp_row <= x_kp_row;
		r_btn    <= x_btn;
		o_kp_int <= ~(&r_kp_row);
		o_btn_int <= |(r_btn);
	end

	assign	o_wb_data = { 16'h00, o_kp_col, r_kp_row, 2'b00, r_btn, o_led };

endmodule
