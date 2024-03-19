////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	spicmd.v
//
// Project:	SD-Card controller, using a shared SPI interface
//
// Purpose:	
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2019-2020, Gisselquist Technology, LLC
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
`default_nettype	none
//
module	spicmd(i_clk, i_reset, i_cmd_stb, i_cmd_type, i_cmd, i_cmd_data, o_busy,
		o_ll_stb, o_ll_byte, i_ll_busy, i_ll_stb, i_ll_byte,
		o_cmd_sent, o_rxvalid, o_response);
	input	wire	i_clk, i_reset;
	//
	input	wire		i_cmd_stb;
	input	wire	[1:0]	i_cmd_type;
	input	wire	[5:0]	i_cmd;
	input	wire	[31:0]	i_cmd_data;
	//
	output	reg		o_busy;
	output	wire		o_ll_stb;
	output	wire	[7:0]	o_ll_byte;
	input	wire		i_ll_busy;
	//
	input	wire		i_ll_stb;
	input	wire	[7:0]	i_ll_byte;
	//
	output	reg		o_cmd_sent;
	output	reg		o_rxvalid;
	output	reg	[39:0]	o_response;

	reg		almost_sent;
	reg	[4:0]	crc_valid_sreg;
	reg		crc_busy;
	reg	[4:0]	crc_bit_counter;
	reg	[39:0]	crc_shift_reg, shift_data;
	reg	[7:0]	crc_byte;
	reg		rx_r1_byte, rx_check_busy, rxvalid;
	reg	[2:0]	rx_counter;

	initial	o_busy = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		o_busy <= 1'b0;
	else if (!o_busy && i_cmd_stb)
		o_busy <= 1'b1;
	// else if (o_rxvalid)
	else if (rxvalid && !rx_check_busy)
		o_busy <= 1'b0;

	initial	shift_data = -1;
	always @(posedge i_clk)
	if (!o_busy && i_cmd_stb)
		shift_data <= { 2'b01, i_cmd, i_cmd_data };
	else if (!i_ll_busy)
	begin
		shift_data <= { shift_data[31:0], 8'hff };
		if (crc_valid_sreg[0])
			shift_data[39:32] <= crc_byte;
	end

	assign	o_ll_stb  = o_busy;
	assign	o_ll_byte = shift_data[39:32];

	initial	o_cmd_sent = 1'b0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		{ o_cmd_sent, almost_sent } <= 2'b00;
	else if (!o_cmd_sent && !i_ll_busy)
		{ o_cmd_sent, almost_sent } <= { almost_sent, crc_valid_sreg[0] };
	initial	crc_valid_sreg = 5'b10000;
	always @(posedge i_clk)
	if (!o_busy)
		crc_valid_sreg <= 5'b10000;
	else if (!i_ll_busy)
		crc_valid_sreg <= crc_valid_sreg >> 1;

	initial crc_busy = 1'b0;
	initial	crc_bit_counter = 20;
	always @(posedge i_clk)
	if (!o_busy)
	begin
		crc_bit_counter <= 20;
		crc_busy <= (i_cmd_stb);
	end else if (crc_busy)
	begin
		crc_bit_counter <= crc_bit_counter - 1;
		crc_busy <= (crc_bit_counter > 1);
	end

	always @(posedge i_clk)
	if (!o_busy)
		crc_shift_reg <= { 2'b01, i_cmd, i_cmd_data };
	else if (crc_busy)
		crc_shift_reg <= crc_shift_reg << 2;

	localparam	CRC_POLYNOMIAL = 7'h09; // Was 8'h12
	reg	[6:0]	next_crc_byte;
	always @(*)
	begin
		next_crc_byte = { crc_byte[6:1], 1'b0 };
		if (crc_byte[7] ^ crc_shift_reg[39])
			next_crc_byte = next_crc_byte ^ CRC_POLYNOMIAL;
		if (next_crc_byte[6] ^ crc_shift_reg[38])
			next_crc_byte = (next_crc_byte<<1) ^ CRC_POLYNOMIAL;
		else
			next_crc_byte = (next_crc_byte<<1);
	end

	initial	crc_byte = 0;
	always @(posedge i_clk)
	if (!o_busy)
		crc_byte <= 1;
	else if (crc_busy)
		crc_byte <= { next_crc_byte, 1'b1 };

	initial	rxvalid = 1'b0;
	initial	rx_counter = 1;
	always @(posedge i_clk)
	if (!o_busy)
	begin
		rx_r1_byte <= 1'b0;
		rx_counter <= (i_cmd_type[1]) ? 5 : 1;
		rx_check_busy <= (i_cmd_type == 2'b01);
		rxvalid <= 1'b0;
	end else if (o_cmd_sent && i_ll_stb)
	begin
		if (!rx_r1_byte)
			rx_r1_byte <= (!i_ll_byte[7]);

		if ((rx_r1_byte || !i_ll_byte[7]) && !rxvalid)
		begin
			rx_counter <= rx_counter - 1;
			rxvalid <= (rx_counter <= 1);
		end

		if (rx_r1_byte && i_ll_byte != 0)
			rx_check_busy <= 1'b0;
	end

	initial	o_rxvalid = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		o_rxvalid <= 0;
	else if (rxvalid && !rx_check_busy)
		o_rxvalid <= 1;

	initial	o_response = -1;
	always @(posedge i_clk)
	if (!o_busy)
		o_response <= -1;
	else if (i_ll_stb)
	begin
		if (!rx_r1_byte)
			o_response[39:32] <= i_ll_byte;
		else
			o_response[31:0] <= { o_response[23:0], i_ll_byte };
	end

`ifdef	FORMAL
`endif
endmodule
