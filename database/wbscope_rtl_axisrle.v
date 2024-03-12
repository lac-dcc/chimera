////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	axisrle
// {{{
// Project:	WBScope, a wishbone hosted scope
//
// Purpose:	Run-length encode an incoming AXI-stream, using the top
//		bit of TDATA to indicate a run-length vs a data register.
//	Two exceptions are offered to the basic RLL algorithm: 1) If a trigger
//	flag is present on any input, than the data word having the trigger
//	is not incorporated into a RLL word.  2) For the first N samples
//	following any reset, as indicated by the !i_encode input, input
//	samples will not be RLL encoded either
//
//	RLL Encoding:
//		1'b0, 31'bits of data	-- Encodes 31-bits of data
//		1'b1, 31'bits of counter-- Last data value repeats count times
//
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2020-2024, Gisselquist Technology, LLC
// {{{
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
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module	axisrle #(
		// {{{
		parameter	C_AXIS_DATA_WIDTH = 32-1,
		localparam	W = C_AXIS_DATA_WIDTH
		// }}}
	) (
		// {{{
		input	wire		S_AXI_ACLK, S_AXI_ARESETN,
		// Incoming AXI data stream
		// {{{
		input	wire		S_AXIS_TVALID,
		output	wire		S_AXIS_TREADY,
		input	wire [W-2:0]	S_AXIS_TDATA,
		// }}}
		// Outgoing AXI data stream
		// {{{
		output	reg		M_AXIS_TVALID,
		input	wire		M_AXIS_TREADY,
		output	reg [W-1:0]	M_AXIS_TDATA,
		// }}}
		// Control inputs--may or may not be synchronous with the
		// AXI stream data above
		input	wire		i_trigger, i_encode,
		output	reg		o_trigger
		// }}}
	);

	// Register/net declarations
	// {{{
	//
	reg		sticky_trigger, sticky_encode, r_trigger, r_encode;
	wire		skd_valid;
	reg		skd_encode, skd_trigger, skd_ready, r_triggered;
	wire	[W-2:0]	skd_data;

	reg		mid_valid, mid_same, mid_trigger;
	reg	[W-2:0]	mid_data;
	//
	reg		run_valid, run_active, run_overflow, run_ready,
			run_trigger;
	reg	[W-2:0]	run_length, run_data;
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Skid buffer stage
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// sticky_encode, sticky_trigger
	// {{{
	// Make !sticky_encode and sticky_trigger sticky
	initial	sticky_encode  = 1;
	initial	sticky_trigger = 0;
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
	begin
		sticky_encode <= 1;
		sticky_trigger <= 0;
	end else if (S_AXIS_TVALID && S_AXIS_TREADY)
	begin
		sticky_encode  <= 1;
		sticky_trigger <= 0;
	end else begin
		sticky_encode <= sticky_encode && i_encode;
		sticky_trigger <= sticky_trigger || i_trigger;
	end
	// }}}

	// Incoming skid buffer
	// {{{
	skidbuffer #(
		.DW(W-1), .OPT_OUTREG(1'b0)
	) skid(
		// {{{
		.i_clk(S_AXI_ACLK), .i_reset(!S_AXI_ARESETN),
		.i_valid(S_AXIS_TVALID), .o_ready(S_AXIS_TREADY),
			.i_data(S_AXIS_TDATA),
		.o_valid(skd_valid), .i_ready(skd_ready),
			.o_data(skd_data)
		// }}}
	);
	// }}}

	// skd_ready
	// {{{
	always @(*)
		skd_ready = !mid_valid || run_ready;
	// }}}

	// r_trigger, r_encode
	// {{{
	always @(posedge S_AXI_ACLK)
	if (S_AXIS_TVALID && S_AXIS_TREADY)
	begin
		r_trigger <= (i_trigger || sticky_trigger);
		r_encode  <= i_encode && sticky_encode;
	end
	// }}}

	// skd_trigger, skd_encode
	// {{{
	always @(*)
	if (S_AXIS_TREADY)
		{ skd_trigger, skd_encode } = { (i_trigger || sticky_trigger),
					(i_encode && sticky_encode) };
	else
		{ skd_trigger, skd_encode } = { r_trigger, r_encode };
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// mid-stage: determine if we'll run-length compress or not
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	initial	mid_valid   = 0;
	initial	mid_trigger = 0;
	initial	r_triggered = 0;
	always @(posedge S_AXI_ACLK)
	begin
		if (skd_valid && skd_ready)
		begin
			mid_valid <= 1'b1;
			mid_data <= skd_data;
			mid_same <= (mid_valid || run_valid) && (skd_data == mid_data);
			mid_trigger <= skd_trigger && !r_triggered;
			r_triggered <= r_triggered || skd_trigger;
			if (!skd_encode || (skd_trigger && !r_triggered))
				mid_same <= 1'b0;
		end else if (run_ready)
		begin
			mid_valid   <= 1'b0;
			mid_trigger <= 1'b0;
		end

		if (!S_AXI_ARESETN)
		begin
			mid_valid   <= 1'b0;
			mid_trigger <= 1'b0;
			r_triggered <= 1'b0;
		end
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Run-length accumulation and compression stage
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// {{{
	initial	run_valid    = 1'b0;
	initial	run_active   = 1'b0;
	initial	run_overflow = 1'b0;
	initial	run_length   = 0;
	initial	run_trigger  = 0;
	always @(posedge S_AXI_ACLK)
	begin
		if (run_ready)
		begin
			run_valid  <= mid_valid;
			run_trigger<= mid_trigger;
			run_data   <= mid_data;

			run_active <= mid_valid && mid_same;
			if (run_active && mid_same)
				run_length <= run_length + 1;
			else
				run_length <= 0;

			run_overflow <= (run_length >= {
				{(W-2){1'b1}}, 1'b0 });
			if (!mid_same || run_overflow)
				run_overflow <= 1'b0;
		end

		if (!S_AXI_ARESETN)
		begin
			run_valid    <= 1'b0;
			run_active   <= 1'b0;
			run_overflow <= 1'b0;
			run_length   <= 0;
			run_trigger  <= 0;
		end
	end
	// }}}

	// run_ready
	// {{{
	always @(*)
	begin
		run_ready = (!M_AXIS_TVALID || M_AXIS_TREADY);

		// Can always accumulate into the current run--as long
		// as we aren't going to overflow our counter
		if (run_active && !run_overflow && mid_same)
			run_ready = 1;

		if (!mid_valid)
			run_ready = 0;
	end
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Final AXI stream output stage
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// M_AXIS_TVALID
	// {{{
	initial	M_AXIS_TVALID = 1'b0;
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
		M_AXIS_TVALID <= 1'b0;
	else if (!M_AXIS_TVALID || M_AXIS_TREADY)
	begin
		M_AXIS_TVALID <= 0;

		if (run_valid && run_ready)
		begin
			// Always valid if our counter is overflowing
			if (run_active && run_overflow)
				M_AXIS_TVALID <= 1'b1;

			// Always valid if a new item comes in on mid that
			// *isn't* the same, or if we aren't in an active run
			// yet
			if (!mid_same || !run_active)
				M_AXIS_TVALID <= 1'b1;
		end
	end
	// }}}

	// M_AXIS_TDATA
	// {{{
	always @(posedge S_AXI_ACLK)
	if (!M_AXIS_TVALID || M_AXIS_TREADY)
	begin
		if (run_active)
			M_AXIS_TDATA <= { 1'b1, run_length };
		else
			M_AXIS_TDATA <= { 1'b0, run_data };
	end
	// }}}

	// o_trigger
	// {{{
	initial	o_trigger = 0;
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
		o_trigger <= 1'b0;
	else if (!M_AXIS_TVALID || M_AXIS_TREADY)
		o_trigger <= run_trigger && run_ready;
	// }}}
	// }}}
	// Make Verilator happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0 };
	// Verilator lint_on  UNUSED
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	// {{{
	localparam	MSB = W-1;
	reg		f_past_valid;
	reg	[W:0]	f_outstanding, f_special_count,
			f_recount, f_special_recount, f_non_specials;
	reg		f_special_tdata;
	(* anyconst *)	reg		f_never_check;
	(* anyconst *)	reg	[W-2:0]	f_never_data;
	(* anyconst *)	reg	[W-2:0]	f_special_data;

	initial	f_past_valid = 1'b0;
	always @(posedge S_AXI_ACLK)
		f_past_valid <= 1'b1;

	always @(*)
	if (!f_past_valid)
		assume(!S_AXI_ARESETN);
	// }}}

	// Incoming AXI stream properties 
	// {{{
	always @(posedge S_AXI_ACLK)
	if (!f_past_valid || $past(!S_AXI_ARESETN))
		assume(!S_AXIS_TVALID);
	else if ($past(S_AXIS_TVALID && !S_AXIS_TREADY))
	begin
		assume(S_AXIS_TVALID);
		assume($stable(S_AXIS_TDATA));
	end
	// }}}

	// Outgoing AXI stream properties
	// {{{
	always @(posedge S_AXI_ACLK)
	if (!f_past_valid || $past(!S_AXI_ARESETN))
		assert(!M_AXIS_TVALID);
	else if ($past(M_AXIS_TVALID && !M_AXIS_TREADY))
	begin
		assert(M_AXIS_TVALID);
		assert($stable(M_AXIS_TDATA));
	end
	// }}}

	// f_outstanding: Count number in - number out
	// {{{
	initial	f_outstanding = 0;
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
		f_outstanding <= 0;
	else case({ (S_AXIS_TVALID && S_AXIS_TREADY),
			(M_AXIS_TVALID && M_AXIS_TREADY) })
	2'b00: begin end
	2'b01: if (M_AXIS_TDATA[MSB])
			f_outstanding <= f_outstanding - M_AXIS_TDATA[W-2:0]-1;
		else
			f_outstanding <= f_outstanding - 1;
	2'b10: f_outstanding <= f_outstanding + 1;
	2'b11: if (M_AXIS_TDATA[MSB])
		f_outstanding <= f_outstanding - M_AXIS_TDATA[W-2:0];
	endcase
	// }}}

	// f_outstanding -- contract checks
	// {{{
	always @(*)
	if (M_AXIS_TVALID)
	begin
		if (M_AXIS_TDATA[MSB])
			assert(f_outstanding > M_AXIS_TDATA[W-2:0]);
		else
			assert(f_outstanding > 0);
	end
	// }}}

	// f_outstanding -- induction check
	// {{{
	always @(*)
	begin
		f_recount = 0;
		if (!S_AXIS_TREADY && skd_valid)
			f_recount = f_recount + 1;
		if (mid_valid)
			f_recount = f_recount + 1;
		if (run_valid && run_active)
			f_recount = f_recount + run_length + 1;
		else if (run_valid)
			f_recount = f_recount + 1;
		if (M_AXIS_TVALID && M_AXIS_TDATA[MSB])
			f_recount = f_recount + M_AXIS_TDATA[W-2:0] + 1;
		else if (M_AXIS_TVALID)
			f_recount = f_recount + 1;

		if (S_AXI_ARESETN)
			assert(f_recount == f_outstanding);

		if (M_AXIS_TVALID && M_AXIS_TDATA[MSB] && !(&M_AXIS_TDATA))
			assert(!run_active);
	end
	// }}}

	// f_special_count: Count number special data in - number out
	// {{{
	always @(posedge S_AXI_ACLK)
	if (!M_AXIS_TVALID || M_AXIS_TREADY)
		f_special_tdata <= (run_data == f_special_data);

	always @(*)
	if (M_AXIS_TVALID && !M_AXIS_TDATA[MSB])
		assert(f_special_tdata == (M_AXIS_TDATA[W-2:0] == f_special_data));

	initial	f_special_count = 0;
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
		f_special_count <= 0;
	else case({ (S_AXIS_TVALID && S_AXIS_TREADY && S_AXIS_TDATA == f_special_data),
			(M_AXIS_TVALID && M_AXIS_TREADY && f_special_tdata) })
	2'b00: begin end
	2'b01: if (M_AXIS_TDATA[MSB])
			f_special_count <= f_special_count - M_AXIS_TDATA[W-2:0] - 1;
		else
			f_special_count <= f_special_count - 1;
	2'b10: f_special_count <= f_special_count + 1;
	2'b11: if (M_AXIS_TDATA[MSB])
		f_special_count <= f_special_count - M_AXIS_TDATA[W-2:0];
	endcase
	// }}}

	// f_special_count -- contract checks
	// {{{
	always @(*)
	begin
		if (M_AXIS_TVALID && f_special_tdata)
		begin
			if (M_AXIS_TDATA[MSB])
				assert(f_special_count > M_AXIS_TDATA[W-2:0]);
			else
				assert(f_special_count > 0);
		end

		// assert(f_special_count + f_non_specials == f_outstanding);
		assert(f_special_count <= f_outstanding);
	end
	// }}}

	// f_special_recount
	// {{{
	always @(*)
	begin
		f_special_recount = 0;

		if (!S_AXIS_TREADY && skd_valid && skd_data == f_special_data)
			f_special_recount = f_special_recount + 1;
		if (mid_valid && mid_data == f_special_data)
			f_special_recount = f_special_recount + 1;
		if (run_valid && run_data == f_special_data)
		begin
			f_special_recount = f_special_recount + 1;
			if (run_active)
				f_special_recount = f_special_recount + run_length;
		end
		if (M_AXIS_TVALID && f_special_tdata)
		begin
			f_special_recount = f_special_recount + 1;
			if (M_AXIS_TDATA[MSB])
				f_special_recount = f_special_recount + M_AXIS_TDATA[W-2:0];
		end

		assert(!S_AXI_ARESETN || f_special_recount == f_special_count);
	end
	// }}}

	// run_valid
	// {{{
	always @(posedge S_AXI_ACLK)
	if (!f_past_valid || !$past(S_AXI_ARESETN))
		assert(!run_valid);
	else if ($past(run_valid))
		assert(run_valid);
	else if ($past(mid_valid))
		assert(run_valid);

	always @(*)
	if (M_AXIS_TVALID)
		assert(run_valid);
	// }}}

	// mid_same
	// {{{
	always @(*)
	if (mid_valid && mid_same)
		assert(run_valid && mid_data == run_data);
	else if (!mid_valid && run_valid)
		assert(mid_data == run_data);
	// }}}

	// run_active
	// {{{
	always @(*)
	if (!run_valid)
	begin
		assert(!run_active);
		assert(run_length == 0);
	end else if (!run_active)
		assert(run_length == 0);
	// }}}

	// r_overflow
	// {{{
	always @(*)
		assert(run_overflow == (&run_length));
	// }}}

	// mid_trigger
	// {{{
	always @(*)
	if (!mid_valid || mid_same || !r_triggered)
		assert(!mid_trigger);
	// }}}

	// run_trigger
	// {{{
	always @(*)
	if (!run_valid || run_active || !r_triggered)
		assert(!run_trigger);
	// }}}

	// o_trigger
	// {{{
	always @(*)
	if (!M_AXIS_TVALID)
		assert(!o_trigger);
	else if (M_AXIS_TDATA[MSB])
		assert(!o_trigger);
	// }}}

	// Never data check
	// {{{
	always @(*)
	if (f_never_check)
	begin
		if (S_AXIS_TVALID)
			assume(S_AXIS_TDATA != f_never_data);
		if (M_AXIS_TVALID)
			assert(M_AXIS_TDATA != { 1'b0, f_never_data });

		if (skd_valid)
			assert(skd_data != f_never_data);

		if (mid_valid)
			assert(mid_data != f_never_data);

		if (run_valid)
			assert(run_data != f_never_data);
	end
	// }}}

	// Never data specials
	// {{{
	always @(*)
	if (f_never_check && f_never_data == f_special_data)
	begin
		assert(!M_AXIS_TVALID || !f_special_tdata);
		assert(f_special_count == 0);
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Cover checks
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	reg	[W-1:0]	cvr_index;

	initial	cvr_index = 0;
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN)
		cvr_index <= 0;
	else if (M_AXIS_TVALID && M_AXIS_TREADY
			&& M_AXIS_TDATA == { cvr_index[0], cvr_index[W-2:0] })
		cvr_index <= cvr_index + 1;

	always @(*)
	begin
		cover(cvr_index == 1);
		cover(cvr_index == 2);
		cover(cvr_index == 3);
		cover(cvr_index == 4);
		cover(cvr_index == 5);
		cover(cvr_index == 6);
		cover(cvr_index == 7 && o_trigger);
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// "Careless" assumptions
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// No undue assumptions have been made
	// }}}
`endif
// }}}
endmodule
