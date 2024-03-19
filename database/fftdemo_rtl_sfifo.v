////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	rtl/sfifo.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	A synchronous data FIFO.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2024, Gisselquist Technology, LLC
// {{{
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
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module sfifo(i_clk, i_reset, i_wr, i_data, o_full, i_rd, o_data, o_empty, o_err);
	parameter	BW=8;		// Byte/data width
	parameter	LGFLEN=4;	// Log of the buffer size
	//
	input	wire		i_clk, i_reset;
	// Write interface
	input	wire		i_wr;
	input	wire [(BW-1):0]	i_data;
	output	reg		o_full;		// True if there's no more space
	// Read interface
	input	wire		i_rd;
	output	wire [(BW-1):0]	o_data;
	output	reg		o_empty;	// True if FIFO is empty
	// 
	output	wire		o_err;		// True following under/overflow


	localparam	FLEN=(1<<LGFLEN);

	reg	[(BW-1):0]	fifo[0:(FLEN-1)];
	reg	[LGFLEN:0]	wraddr, rdaddr, r_next;

	wire	[LGFLEN:0]	w_first_plus_one,
				w_last_plus_one;
	assign	w_first_plus_one = wraddr + {{(LGFLEN){1'b0}},1'b1};
	assign	w_last_plus_one  = r_next; // rdaddr  + 1'b1;


	// Logic defining the full output.  Ideally, we might've said
	//
	// assign o_full == (wraddr[LGFLEN-1:0] == rdaddr[LGFLEN-1:0])
	//			&&(wraddr[LGFLEN] != rdaddr[LGFLEN]);
	//
	// The following logic does the same thing, only using clocked logic,
	// so the logic needs to be set one clock earlier.
	initial	o_full = 1'b0;
	always @(posedge i_clk)
		if (i_reset)
			o_full <= 1'b0;
		else if (i_rd)
			o_full <= (o_full)&&(i_wr);
		else if (i_wr)
			o_full <= (o_full)
				||((w_first_plus_one[LGFLEN-1:0]
						== rdaddr[LGFLEN-1:0])
				&&(w_first_plus_one[LGFLEN]!=rdaddr[LGFLEN]));
		else if ((wraddr[LGFLEN-1:0] == rdaddr[LGFLEN-1:0])
				&&(wraddr[LGFLEN]!=rdaddr[LGFLEN]))
			o_full <= 1'b1;

	//
	// Adjust the Write pointer, and catch any overflows.
	reg	r_ovfl;
	initial	wraddr = 0;
	initial	r_ovfl  = 0;
	always @(posedge i_clk)
		if (i_reset)
		begin
			r_ovfl  <= 1'b0;
			wraddr <= 0;
		end else if (i_wr)
		begin // Cowardly refuse to overflow
			if ((i_rd)||(!o_full))
				wraddr <= wraddr + 1'b1;
			else
				// Set the error flag on any overflow
				r_ovfl <= 1'b1;
		end

	// Actually write to the FIFO
	always @(posedge i_clk)
		if ((i_wr)&&(!o_full))
			fifo[wraddr[(LGFLEN-1):0]] <= i_data;

	// The empty pointer.  This is clocked logic, else we might have
	// written:
	//
	// assign o_empty = (rdaddr == wraddr);
	//
	initial	o_empty = 1'b1;
	always @(posedge i_clk)
		if (i_reset)
			o_empty <= 1'b1;
		else if (i_wr)
			o_empty <= 1'b0;
		else if (i_rd)
			o_empty <= (o_empty)||(w_last_plus_one == wraddr);
		else
			o_empty <= (rdaddr == wraddr);


	//
	// The read pointer (and underflow indication)
	//
	reg		r_unfl;
	initial	r_unfl = 1'b0;
	initial	rdaddr = 0;
	initial	r_next = { {(LGFLEN){1'b0}}, 1'b1 };
	always @(posedge i_clk)
		if (i_reset)
		begin
			rdaddr <= 0;
			r_next <= { {(LGFLEN){1'b0}}, 1'b1 };
			r_unfl <= 1'b0;
		end else if (i_rd)
		begin
			if (!o_empty) // (wraddr != rdaddr)
			begin
				rdaddr <= r_next;
				r_next <= rdaddr +{{(LGFLEN-1){1'b0}},2'b10};
			end else
				// Set the error flag on any attempt to read
				// from an empty fifo
				r_unfl <= 1'b1;
		end

	// Actually read from the FIFO here.
	assign	o_data = fifo[rdaddr[LGFLEN-1:0]];

	// Overflow is an error, as is underflow.
	assign o_err = (r_ovfl)||(r_unfl);

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
//
// FORMAL METHODS
//
//
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
`ifdef	SFIFO
`define	ASSUME	assume
`define	ASSERT	assert
`else
`define	ASSUME	assert
`define	ASSERT	assume
`endif

	reg	f_past_valid;

	initial	f_past_valid = 1'b0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	//
	// Assumptions about our input(s)
	//
	//
	initial `ASSUME(i_reset);

	//
	// Assertions about our outputs
	//
	//

	wire	[LGFLEN:0]	f_fill, f_next, f_empty;

	// Calculate the actual fill level
	assign	f_fill = wraddr - rdaddr;

	// ... Here's the indication of whether or not the FIFO is empty
	assign	f_empty = (wraddr == rdaddr);

	assign	f_next = rdaddr + 1'b1;

	// Test #1
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(o_full)))
		`ASSERT(!o_empty);

	// Test #2
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(o_empty)))
		`ASSERT((!o_full)&&(f_fill <= 1));

	// Test #3, along with some other basic assertions
	always @(*)
	begin
		// Assert that the FIFO never has more than 2^N elements in it
		`ASSERT(f_fill <= { 1'b1, {(LGFLEN){1'b0}}});

		// 3.A
		// o_full should equal whether or not 2^N elements are in FIFO
		`ASSERT(o_full  == (f_fill == {1'b1, {(LGFLEN){1'b0}}}));

		// 3.B
		// o_empty, true if an only if the fill is zero.
		`ASSERT(o_empty == (f_fill == 0));

		`ASSERT(r_next == f_next);
	end

	// Extra--check the error flag.
	always @(posedge i_clk)
	if (f_past_valid)
	begin
		// Following a reset, the error flag should be clear
		if ($past(i_reset))
			`ASSERT(!o_err);
		else begin
			// Check error on underflow
			if (($past(i_rd))&&($past(o_empty)))
				`ASSERT(o_err);

			// Check error on overflow
			if (($past(i_wr))&&(!$past(i_rd))&&($past(o_full)))
				`ASSERT(o_err);

			// Error flag doesn't clear except on reset
			if ($past(o_err))
				`ASSERT(o_err);
		end
	end
`endif // FORMAL
`ifdef	VERIFIC_SVA
	//
	// This contract makes the most sense using the full SVA language
	//
	(* anyconst *) reg	[LGFLEN:0]	f_const_addr;
	wire	 [LGFLEN:0]		f_const_next_addr;
	reg				f_addr_valid, f_next_valid;
	(* anyconst *) reg [BW-1:0]	f_const_first, f_const_next;
	assign	f_const_next_addr = f_const_addr + 1'b1;

	//
	// Check whether or not f_const_addr is a valid address describing
	// an item in the FIFO.
	//
	always @(*)
	begin
		f_addr_valid = 1'b0;

		// The tricky part of this check is that the read and write
		// pointers may wrap around the ends of the FIFO.  It's not
		// quite the simple comparison for this reason.
		//
		if ((wraddr > rdaddr)&&(f_const_addr < wraddr)
				&&(rdaddr <= f_const_addr))
			// If there's no wrapping, then that f_const_addr
			// address will be valid if it's between wraddr and
			// rdaddr
			f_addr_valid = 1'b1;
		else if ((wraddr < rdaddr)&&(f_const_addr < wraddr))
			// The write pointer wrapped, the address in question
			// is after the wrap.
			f_addr_valid = 1'b1;
		else if ((wraddr < rdaddr)&&(rdaddr <= f_const_addr))
			// The write pointer wrapped around, but the address
			// hasn't
			f_addr_valid = 1'b1;
	end

	//
	// Same check, except now for the f_const_next_addr, the address
	// following f_const_addr.
	//
	always @(*)
	begin
		f_next_valid = 1'b0;
		if ((wraddr > rdaddr)&&(f_const_next_addr < wraddr)
				&&(rdaddr <= f_const_next_addr))
			f_next_valid = 1'b1;
		else if ((wraddr < rdaddr)&&(f_const_next_addr < wraddr))
			f_next_valid = 1'b1;
		else if ((wraddr < rdaddr)&&(rdaddr <= f_const_next_addr))
			f_next_valid = 1'b1;
	end

	//
	// Here's the set sequence, that is ... here are the steps involved
	// with setting two values into the FIFO.
	//
	sequence	SETSEQUENCE;
		// Step one: write to the f_const_addr address
		((i_wr)&&(!o_full)&&(wraddr==f_const_addr)
			&&(i_data == f_const_first))
		//
		// Step two: (optional) wait for some period of time, with the
		// 	data in the FIFO, and no other writes to the FIFO.
		//	Also require that this item isn't read out of the FIFO
		//	(yet)
		##1 ((!i_wr)&&((!i_rd)||(rdaddr != f_const_addr))
			&&(fifo[f_const_addr[(LGFLEN-1):0]]==f_const_first)
			&&(f_addr_valid))
			[*0:$]
		// Step three: Write the second value to the FIFO.  May also
		//	read it out on this clock as well--that's captured in
		//	the property later..
		##1 ((i_wr)&&(!o_full)&&(!o_err)
			&&((!i_rd)||(rdaddr != f_const_addr))
			&&(f_addr_valid)
			&&(wraddr == f_const_addr)
			&&(i_data == f_const_next));
	endsequence

	// Here are the four steps to reading from the FIFO once both items
	// have been written to it.
	wire		f_wait_for_first_read,
			f_first_read,
			f_wait_for_second_read,
			f_second_read;


	// The read sequence is rather complex.  Let's look through it in
	// stages.

	//
	// Stage one: Both items are in the FIFO.
	//	The first of these two values isn't being read
	//	Assert that both addresses are within the FIFO
	//	Assert that the FIFO's values at each address match what was
	//	  written
	//
	assign	f_wait_for_first_read = (((!i_rd)||(rdaddr != f_const_addr))&&(!o_empty)&&(!r_unfl)
			&&(f_addr_valid)
			&&(f_next_valid)
			&&(fifo[f_const_addr[(LGFLEN-1):0]] == f_const_first)
			&&(fifo[f_const_next_addr[(LGFLEN-1):0]] == f_const_next));
	//
	// Stage two: Read the first of the two items from the FIFO.
	//	Assert that the next value is still in the FIFO
	//	Assert that the value at the next address matches what was
	//		written earlier
	//
	assign f_first_read
		= ((i_rd)&&(!o_empty)&&(!r_unfl)
			&&(f_addr_valid)&&(rdaddr == f_const_addr)
				&&(o_data == f_const_first)
			&&(f_next_valid)
			&&(fifo[f_const_next_addr[(LGFLEN-1):0]] == f_const_next));

	//
	// Stage three: Wait while the second FIFO element is next to be read
	//	Assert that the second value remains within the FIFO
	//	Assert that the second value will be the value read next
	//	Assert that it's the right value
	//
	assign f_wait_for_second_read
		= ((!i_rd)&&(!o_empty)&&(!r_unfl)
			&&(f_next_valid)&&(rdaddr == f_const_next_addr)
			&&(o_data == f_const_next));

	//
	// Stage four: Read the last item from the FIFO
	//
	assign f_second_read
		= ((i_rd)&&(!o_empty)&&(!r_unfl)
			&&(f_next_valid)&&(rdaddr == f_const_next_addr)
			&&(o_data == f_const_next));

	sequence	READSEQUENCE;
		f_wait_for_first_read [*0:$]
		##1 f_first_read
		##1 f_wait_for_second_read [*0:$]
		##1 f_second_read;
	endsequence

	`ASSERT property (@(posedge i_clk)
		disable iff (i_reset)
		SETSEQUENCE |=> READSEQUENCE);
`endif // VERIFIC_SVA
endmodule
