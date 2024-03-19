////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	deppbyte.v
//
// Project:	CMod S6 System on a Chip, ZipCPU demonstration project
//
// Purpose:	This is a very simple DEPP to synchronous byte transfer.  It
//		is used in place of a serial port.
//
//	This approach uses address zero *only*.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2017, Gisselquist Technology, LLC
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
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
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
module deppbyte(i_clk,
	i_astb_n, i_dstb_n, i_write_n,i_depp, o_depp, o_wait,
	o_rx_stb, o_rx_data,
	i_tx_stb, i_tx_data, o_tx_busy);
	input	i_clk;
	// DEPP interface
	input			i_astb_n, i_dstb_n, i_write_n;
	input		[7:0]	i_depp;
	output	reg	[7:0]	o_depp;
	output	wire		o_wait;
	// Byte-wise interface to the rest of the world
	output	reg		o_rx_stb;
	output	reg	[7:0]	o_rx_data;
	input			i_tx_stb;
	input		[7:0]	i_tx_data;
	output	reg		o_tx_busy;

	// Synchronize the incoming signals
	reg	x_dstb_n, x_astb_n, x_write_n,
		r_dstb_n, r_astb_n, r_write_n,
		l_dstb_n, l_astb_n, l_write_n;
	reg	[7:0]	x_depp, r_depp;
	initial	x_dstb_n = 1'b1;
	initial	r_dstb_n = 1'b1;
	initial	l_dstb_n = 1'b1;
	initial	x_astb_n = 1'b1;
	initial	r_astb_n = 1'b1;
	initial	l_astb_n = 1'b1;
	always @(posedge i_clk)
	begin
		{ x_dstb_n, x_astb_n, x_write_n, x_depp }
			<= { i_dstb_n, i_astb_n, i_write_n, i_depp };
		{ r_dstb_n, r_astb_n, r_write_n, r_depp }
			<= { x_dstb_n, x_astb_n, x_write_n, x_depp };
		{ l_dstb_n, l_astb_n, l_write_n } <= { r_dstb_n, r_astb_n, r_write_n };
	end

	reg	[7:0]	addr;
	wire	astb, dstb, w_write;
	assign	astb = (!r_astb_n)&&(l_astb_n);
	assign	dstb = (!r_dstb_n)&&(l_dstb_n);
	assign	w_write= (!r_write_n);


	initial	addr = 8'h00;
	initial	o_rx_stb = 1'b0;
	always @(posedge i_clk)
	begin
		if ((w_write)&&(astb))
			addr <= r_depp;

		if ((w_write)&&(dstb)&&(addr==0))
		begin
			o_rx_stb  <= 1'b1;
			o_rx_data <= r_depp;
		end else
			o_rx_stb <= 1'b0;
	end

	// Much as I hate to use signals that have not been synchronized with a 
	// two clock transfer, this line needs to be brought low within 10ms
	// (less than one clock) of when the strobe lines are brought low, and
	// raised high again within 10 ms of when the strobe lines are raised
	// again.
	assign	o_wait = ((!i_dstb_n)||(!i_astb_n));

	// For one clock, following any read from address zero, we allow the
	// port to write one new byte into our interface.  This works because
	// the interface will guarantee that the strobe signals are inactive
	// (high) for at least 40ns before attempting a new transaction.
	//
	// Just about nothing else works.  'cause we can't allow changes
	// in the middle of a transaction, and we won't know if the clock
	// involved is in the middle of a transaction until after the time
	// has passed.  Therefore, we're going to be busy most of the time
	// and just allow a byte to pass through on the one (and only) clock
	// following a transaction.
	always @(posedge i_clk)
		o_tx_busy <= ((~l_dstb_n)&&(r_dstb_n)&&(l_write_n)&&(addr == 0))
				? 1'b0 : 1'b1;

	// If we don't have a byte to write, stuff it with all ones.  The high
	// bit will then indicate that there's nothing available to the 
	// interface when it next reads.
	//
	// Okay, new philosophy.  Stuff the high bit with ones, allow the other
	// bits to contain status level information --- should any one wish to
	// send such.
	initial	o_depp = 8'hff;
	always @(posedge i_clk)
		if (~o_tx_busy)
			o_depp <= {((i_tx_stb)? i_tx_data[7] : 1'b1),
					i_tx_data[6:0] };

endmodule
