////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	i2cio.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2019-2024, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
// }}}
module	i2cio(i_data, o_data, io_pin);
	input	wire	i_data;
	output	wire	o_data;
	inout	wire	io_pin;

	SB_IO #(.PULLUP(1'b1),
		.PIN_TYPE(6'b101001))
	theio(
		.OUTPUT_ENABLE(!i_data),
		.PACKAGE_PIN(io_pin),
		.D_OUT_0(1'b0),
		.D_IN_0(o_data)
	);

endmodule
