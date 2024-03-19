////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	spirxdata.v
//
// Project:	SD-Card controller, using a shared SPI interface
//
// Purpose:	To handle all of the processing associated with receiving data
//		from an SD card via the lower-level SPI processor, and then
//	issuing write commands to our internal memory store (external to this
//	module).
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
`default_nettype none
//
module spirxdata(i_clk, i_reset, i_start, i_lgblksz, i_fifo, o_busy,
		i_ll_stb, i_ll_byte,
		o_write, o_addr, o_data,
		o_rxvalid, o_response);
	parameter	DW = 32, AW = 8;
	localparam	CRC_POLYNOMIAL = 16'h1021;
	//
	input	wire		i_clk, i_reset;
	//
	input	wire		i_start;
	input	wire	[3:0]	i_lgblksz;
	input	wire		i_fifo;
	output	reg		o_busy;
	//
	input	wire		i_ll_stb;
	input	wire [7:0]	i_ll_byte;
	//
	output	reg 		o_write;
	output	reg [AW-1:0]	o_addr;
	output	reg [DW-1:0]	o_data;
	//
	output	reg 		o_rxvalid;
	output	reg [7:0]	o_response;


	reg		error_token, start_token, token, received_token, done,
			lastaddr;
	reg		all_mem_written, lastdata;

	reg	[1:0]	crc_byte;
	reg	[2:0]	r_lgblksz_m3;
	reg	new_data_byte;
	reg	[3:0]	crc_fill;
	reg	[7:0]	crc_gearbox;
	reg	[15:0]	next_crc_data;
	reg	[15:0]	crc_data;
	reg		crc_err, crc_active;
	reg	[2:0]	fill;
	reg	[23:0]	gearbox;


	always @(*)
	begin
		error_token = 0;

		if (i_ll_byte[7:4] == 0)
			error_token = 1;
		if (!i_ll_stb || received_token)
			error_token = 0;
	end

	always @(*)
	begin
		start_token = 0;

		if (!i_ll_byte[0])
			start_token = 1;
		if (!i_ll_stb || received_token)
			start_token = 0;
	end

	always @(*)
		token = (start_token || error_token);

	always @(*)
		done = (i_ll_stb && (crc_byte>1));


	initial	received_token = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		received_token <= 0;
	else if (token)
		received_token <= 1;

	initial	o_busy = 0;
	always @(posedge i_clk)
	if (i_reset)
		o_busy <= 0;
	else if (!o_busy)
		o_busy <= i_start;
	else if (error_token || done)
		o_busy <= 0;

	initial	o_rxvalid = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		o_rxvalid <= 0;
	else if (error_token || done)
		o_rxvalid <= 1;

	initial	o_response = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		o_response <= 0;
	else if (error_token)
		o_response <= i_ll_byte;
	else if (done)
		o_response <= (crc_err || (crc_data[7:0] != i_ll_byte)) ? 8'h10 : 0;

	initial	o_write = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		o_write <= 0;
	else if (received_token && !all_mem_written)
		o_write <= (&fill) && i_ll_stb;
	else
		o_write <= 0;

	initial	o_write = 0;
	always @(posedge i_clk)
	if (received_token && !all_mem_written)
		o_data <= { gearbox, i_ll_byte };

	always @(posedge i_clk)
	if (!o_busy)
		o_addr <= { i_fifo, {(AW-1){1'b0}} };
	else if (o_write && !lastaddr)
		o_addr <= o_addr + 1;

	initial	fill = 0;
	always @(posedge i_clk)
	begin
		if (i_ll_stb)
			gearbox <= { gearbox[15:0], i_ll_byte };

		if (!o_busy || !received_token)
			fill <= 0;
		else if ((&fill) && i_ll_stb)
			fill <= 0;
		else if (i_ll_stb)
			fill <= { fill[1:0], 1'b1 };
	end

	always @(posedge i_clk)
	if (!o_busy)
		lastdata <= 0;
	else if (!lastdata)
		lastdata <= (lastaddr && (&fill));

	initial	all_mem_written = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		all_mem_written <= 0;
	else if (o_write && lastaddr)
		all_mem_written <= 1;

	initial	crc_byte = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		crc_byte <= 0;
	else if (i_ll_stb && lastaddr && lastdata)
		crc_byte <= crc_byte + 1;

	initial	r_lgblksz_m3 = 0;
	initial	lastaddr = 0;
	always @(posedge i_clk)
	if (!o_busy)
	begin
		lastaddr <= (i_lgblksz < 4);
		// Verilator lint_off WIDTH
		r_lgblksz_m3 <= i_lgblksz-3;
		// Verilator lint_on WIDTH
	end else if (o_write && !lastaddr)
	begin
		case(r_lgblksz_m3)
		0: lastaddr <= 1;		//   8 bytes
		1: lastaddr <= (&o_addr[1:1]);	//  16 bytes
		2: lastaddr <= (&o_addr[2:1]);	//  32 bytes
		3: lastaddr <= (&o_addr[3:1]);	//  64 bytes
		4: lastaddr <= (&o_addr[4:1]);	// 128 bytes
		5: lastaddr <= (&o_addr[5:1]);	// 256 bytes
		default: lastaddr <= (&o_addr[6:1]);	// 512 bytes
		endcase
	end

	////////////////////////////////////////////////////////////////////////
	//
	// CRC calculation
	//

	always @(*)
		new_data_byte = (i_ll_stb && !all_mem_written);


	initial	crc_fill   = 0;
	initial	crc_active = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy || !received_token)
	begin
		crc_fill <= 0;
		crc_active <= 0;
	end else if (crc_active || new_data_byte)
	begin
		// Verilator lint_off WIDTH
		crc_fill <= crc_fill - (crc_active ? 1:0)
					+ (new_data_byte ? 4:0);
		// Verilator lint_on WIDTH
		if (new_data_byte)
			crc_active <= 1;
		else
			crc_active <= (crc_fill > 1);
	end

	always @(posedge i_clk)
	if (!crc_active)
		crc_gearbox <= i_ll_byte;
	else
		crc_gearbox <= { crc_gearbox[8-3:0], 2'b00 };


	reg	[15:0]	first_crc_data;

	always @(*)
	begin
		first_crc_data = crc_data << 1;;

		if (crc_data[15] ^ crc_gearbox[7])
			first_crc_data = first_crc_data ^ CRC_POLYNOMIAL;

		if (first_crc_data[15] ^ crc_gearbox[6])
			next_crc_data = (first_crc_data << 1) ^ CRC_POLYNOMIAL;
		else
			next_crc_data = (first_crc_data << 1);
	end

	initial	crc_data = 0;
	always @(posedge i_clk)
	if (!o_busy)
		crc_data <= 0;
	else if (crc_active)
		crc_data <= next_crc_data;

	initial	crc_err = 0;
	always @(posedge i_clk)
	if (i_reset || !o_busy)
		crc_err <= 0;
	else if (i_ll_stb && (crc_byte == 1))
		crc_err <= (crc_data[15:8] != i_ll_byte);
	// else if (i_ll_stb && (crc_byte == 2)
	//	crc_err <= (crc_data[7:0] != i_ll_byte);

`ifdef	FORMAL
`endif	// FORMAL
endmodule
