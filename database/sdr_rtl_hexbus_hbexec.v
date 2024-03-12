////////////////////////////////////////////////////////////////////////////////
//
// Filename:	hbexec.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	An example debug bus.  This bus takes commands from an incoming
//		34-bit command word, and issues those commands across a wishbone
//	bus, returning the result from the bus command.  Basic bus commands are:
//
//	2'b00	Read
//	2'b01	Write (lower 32-bits are the value to be written)
//	2'b10	Set address
//		Next 30 bits are the address
//		bit[1] is an address difference bit
//		bit[0] is an increment bit
//	2'b11	Special command
//
//	In the interests of code simplicity, this memory operator is 
//	susceptible to unknown results should a new command be sent to it
//	before it completes the last one.  Unpredictable results might then
//	occurr.
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
`define	CMD_SUB_RD	2'b00
`define	CMD_SUB_WR	2'b01
`define	CMD_SUB_BUS	1'b0
`define	CMD_SUB_ADDR	2'b10
`define	CMD_SUB_SPECIAL	2'b11
//
`define	RSP_SUB_DATA	2'b00
`define	RSP_SUB_ACK	2'b01
`define	RSP_SUB_ADDR	2'b10
`define	RSP_SUB_SPECIAL	2'b11
//
`define	RSP_WRITE_ACKNOWLEDGEMENT { `RSP_SUB_ACK, 32'h0 }
`define	RSP_RESET		{ `RSP_SUB_SPECIAL, 3'h0, 29'h00 }
`define	RSP_BUS_ERROR		{ `RSP_SUB_SPECIAL, 3'h1, 29'h00 }

module	hbexec(i_clk, i_reset,
		// The input command channel
		i_cmd_stb, i_cmd_word, o_cmd_busy,
		// The return command channel
		o_rsp_stb, o_rsp_word,
		// Our wishbone outputs
		o_wb_cyc, o_wb_stb,
			o_wb_we, o_wb_addr, o_wb_data, o_wb_sel,
		// The return wishbone path
		i_wb_ack, i_wb_stall, i_wb_err, i_wb_data);
	parameter	ADDRESS_WIDTH=30;
	localparam	AW=ADDRESS_WIDTH,	// Shorthand for address width
			CW=34;	// Command word width
	input	wire		i_clk, i_reset;
	//
	input	wire			i_cmd_stb;
	input	wire	[(CW-1):0]	i_cmd_word;
	output	wire			o_cmd_busy;
	//
	output	reg			o_rsp_stb;
	output	reg	[(CW-1):0]	o_rsp_word;
	// Wishbone outputs
	output	reg			o_wb_cyc, o_wb_stb, o_wb_we;
	output	reg	[(AW-1):0]	o_wb_addr;
	output	reg	[31:0]		o_wb_data;
	output	wire	[3:0]		o_wb_sel;
	// Wishbone inputs
	input	wire		i_wb_ack, i_wb_stall, i_wb_err;
	input	wire	[31:0]	i_wb_data;

	//
	//
	reg	newaddr, inc;

	//
	// Decode our input commands
	//
	wire	i_cmd_addr, i_cmd_wr, i_cmd_rd, i_cmd_bus;
	assign	i_cmd_addr = (i_cmd_stb)&&(i_cmd_word[33:32] == `CMD_SUB_ADDR);
	assign	i_cmd_rd   = (i_cmd_stb)&&(i_cmd_word[33:32] == `CMD_SUB_RD);
	assign	i_cmd_wr   = (i_cmd_stb)&&(i_cmd_word[33:32] == `CMD_SUB_WR);
	assign	i_cmd_bus  = (i_cmd_stb)&&(i_cmd_word[33]    == `CMD_SUB_BUS);

	//
	// CYC and STB
	//
	// These two linse control our state
	initial	o_wb_cyc = 1'b0;
	initial	o_wb_stb = 1'b0;
	always @(posedge i_clk)
	if ((i_reset)||((i_wb_err)&&(o_wb_cyc)))
	begin
		// On any error or reset, then clear the bus.
		o_wb_cyc <= 1'b0;
		o_wb_stb <= 1'b0;
	end else if (o_wb_stb)
	begin
		//
		// BUS REQUEST state
		//
		if (!i_wb_stall)
			// If we are only going to do one transaction,
			// then as soon as the stall line is lowered, we are
			// done.
			o_wb_stb <= 1'b0;

		// While not likely, it is possible that a slave might ACK
		// our request on the same clock it is received.  In that
		// case, drop the CYC line.
		//
		// We gate this with the stall line in case we receive an
		// ACK while our request has yet to go out.  This may make
		// more sense later, when we are sending multiple back to back
		// requests across the bus, but we'll leave this gate here
		// as a placeholder until then.
		if ((!i_wb_stall)&&(i_wb_ack))
			o_wb_cyc <= 1'b0;
	end else if (o_wb_cyc)
	begin
		//
		// BUS WAIT
		//
		if (i_wb_ack)
			// Once the slave acknowledges our request, we are done.
			o_wb_cyc <= 1'b0;
	end else begin
		//
		// IDLE state
		//
		if (i_cmd_bus)
		begin
			// We've been asked to start a bus cycle from our
			// command word, either RD or WR
			o_wb_cyc <= 1'b1;
			o_wb_stb <= 1'b1;
		end
	end

	// For now, we'll use the bus cycle line as an indication of whether
	// or not we are too busy to accept anything else from the command
	// port.  This will change if we want to accept multiple write
	// commands per bus cycle, but that will be a bus master that's
	// not nearly so simple.
	assign	o_cmd_busy = o_wb_cyc;


	//
	// The bus WE (write enable) line, governing wishbone direction
	//
	// We'll never change direction mid bus-cycle--at least not in this
	// implementation (atomic accesses may require it at a later date). 
	// Hence, if CYC is low we can set the direction.
	always @(posedge i_clk)
		if (!o_wb_cyc)
			o_wb_we <= (i_cmd_wr);

	//
	// The bus ADDRESS lines
	//
	initial	newaddr = 1'b0;
	always @(posedge i_clk)
	begin
		if ((i_cmd_addr)&&(!o_cmd_busy))
		begin
			// If we are in the idle state, we accept address
			// setting commands.  Specifically, we'll allow the
			// user to either set the address, or add a difference
			// to our address.  The difference may not make sense
			// now, but if we ever wish to compress our command bus,
			// sending an address difference can drastically cut
			// down the number of bits required in a set address
			// request.
			if (!i_cmd_word[1])
				o_wb_addr <= i_cmd_word[AW+1:2];
			else
				o_wb_addr <= i_cmd_word[AW+1:2] + o_wb_addr;

			//
			// We'll allow that bus requests can either increment
			// the address, or leave it the same.  One bit in the
			// command word will tell us which, and we'll set this
			// bit on any set address command.
			inc <= !i_cmd_word[0];
		end else if ((o_wb_stb)&&(!i_wb_stall))
			// The address lines are used while the bus is active,
			// and referenced any time STB && !STALL are true.
			//
			// However, once STB and !STALL are both true, then the
			// bus is ready to move to the next request.  Hence,
			// we add our increment (one or zero) here.
			o_wb_addr <= o_wb_addr + {{(AW-1){1'b0}}, inc};


		// We'd like to respond to the bus with any address we just
		// set.  The goal here is that, upon any read from the bus,
		// we should be able to know what address the bus was set to.
		// For this reason, we want to return the bus address up the
		// command stream.
		//
		// The problem is that the add (above) when setting the address
		// takes a clock to do.  Hence, we'll use "newaddr" as a flag
		// that o_wb_addr has a new value in it that needs to be
		// returned via the command link.
		newaddr <= ((!i_reset)&&(i_cmd_addr)&&(!o_cmd_busy));
	end

	//
	// The bus DATA (output) lines
	//
	always @(posedge i_clk)
	begin
		// This may look a touch confusing ... what's important is that:
		//
		// 1. No one cares what the bus data lines are, unless we are
		//	in the middle of a write cycle.
		// 2. Even during a write cycle, these lines are don't cares
		//	if the STB line is low, indicating no more requests
		// 3. When a request is received to write, and so we transition
		//	to a bus write cycle, that request will come with data.
		// 4. Hence, we set the data words in the IDLE state on the
		//	same clock we go to BUS REQUEST.  While in BUS REQUEST,
		//	these lines cannot change until the slave has accepted
		//	our inputs.
		//
		// Thus we force these lines to be constant any time STB and
		// STALL are both true, but set them otherwise.
		//
		if ((!o_wb_stb)||(!i_wb_stall))
			o_wb_data <= i_cmd_word[31:0];
	end

	//
	// For this command bus channel, we'll only ever direct word addressing.
	//
	assign	o_wb_sel = 4'hf;

	//
	// The COMMAND RESPONSE return channel
	//
	// This is where we set o_rsp_stb and o_rsp_word for the return channel.
	// The logic is set so that o_rsp_stb will be true for any one clock
	// where we have data to reutrn, and zero otherwise.  If o_rsp_stb is
	// true, then o_rsp_word is the response we want to return.  In all
	// other cases, o_rsp_word is a don't care.
	initial	o_rsp_stb = 1'b1;
	initial	o_rsp_word = `RSP_RESET;
	always @(posedge i_clk)
	if (i_reset)
	begin
		o_rsp_stb <= 1'b1;
		o_rsp_word <= `RSP_RESET;
	end else if (i_wb_err)
	begin
		o_rsp_stb <= 1'b1;
		o_rsp_word <= `RSP_BUS_ERROR;
	end else if (o_wb_cyc) begin
		//
		// We're either in the BUS REQUEST or BUS WAIT states
		//
		// Either way, we want to return a response on our command
		// channel if anything gets ack'd
		o_rsp_stb <= (i_wb_ack);
		//
		//
		if (o_wb_we)
			o_rsp_word <= `RSP_WRITE_ACKNOWLEDGEMENT;
		else
			o_rsp_word <= { `RSP_SUB_DATA, i_wb_data };
	end else begin
		//
		// We are in the IDLE state.
		//
		// Echo any new addresses back up the command chain
		//
		o_rsp_stb  <= newaddr;
		o_rsp_word <= { `RSP_SUB_ADDR,
			{(30-ADDRESS_WIDTH){1'b0}}, o_wb_addr, 1'b0, !inc };
	end

	// verilator lint_off UNUSED
	// Make Verilator happy
	wire	unused;
	assign	unused = i_cmd_rd;
	// verilator lint_on UNUSED
`ifdef	FORMAL
`ifdef	HBEXEC
`define	ASSUME	assume
`define	ASSERT	assert
`else
`define	ASSUME	assert
`define	ASSERT	assert
`endif

	reg	f_past_valid;
	initial	f_past_valid = 1'b0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	initial	`ASSUME(i_reset);

	localparam	F_LGDEPTH=2;
	wire	[F_LGDEPTH-1:0]	f_nreqs, f_nacks, f_outstanding;

	fwb_master #( .AW(AW),.F_MAX_STALL(3),.F_MAX_ACK_DELAY(3),
			.F_LGDEPTH(F_LGDEPTH)
		) fwbi(i_clk, i_reset,
			o_wb_cyc, o_wb_stb, o_wb_we, o_wb_addr, o_wb_data,
				o_wb_sel, i_wb_ack, i_wb_stall, i_wb_data,
				i_wb_err,
			f_nreqs, f_nacks, f_outstanding);

	always @(posedge i_clk)
	if ((f_outstanding > 1)||(o_wb_stb))
		assume(!i_cmd_stb);

	always @(posedge i_clk)
	if ((!f_past_valid)||($past(i_reset)))
	begin
		`ASSUME(!i_cmd_stb);
		//
		`ASSERT(o_rsp_stb);
		`ASSERT(o_rsp_word == `RSP_RESET);
	end

	always @(*)
	if (o_wb_cyc)
		`ASSERT(o_cmd_busy);

	always @(posedge i_clk)
	if ((f_past_valid)&&($past(o_cmd_busy))&&($past(i_cmd_stb)))
	begin
		assume($stable(i_cmd_stb));
		assume($stable(i_cmd_word));
	end

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))
			&&($past(i_cmd_addr))&&(!$past(o_cmd_busy)))
	begin
		`ASSERT(newaddr);
		if ($past(i_cmd_word[1]))
			`ASSERT(o_wb_addr == $past(i_cmd_word[AW+1:2]+o_wb_addr));
		else
			`ASSERT(o_wb_addr == $past(i_cmd_word[AW+1:2]));
	end

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(newaddr)))
	begin
		`ASSERT(o_rsp_stb  == 1'b1);
		`ASSERT(o_rsp_word == { `RSP_SUB_ADDR,
				$past(o_wb_addr), 1'b0, !$past(inc) });
	end

	always @(posedge i_clk)
	if ((f_past_valid)&&($past(o_wb_cyc))&&(o_wb_cyc))
		`ASSERT($stable(o_wb_we));

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))
			&&($past(o_wb_cyc))&&($past(i_wb_ack)))
	begin
		if ($past(o_wb_we))
			`ASSERT(o_rsp_word == `RSP_WRITE_ACKNOWLEDGEMENT);
		else
			`ASSERT(o_rsp_word == { `RSP_SUB_DATA, $past(i_wb_data) });
	end

	always @(posedge i_clk)
	if ((f_past_valid)&&($past(i_reset)))
		`ASSERT((o_rsp_stb)&&(o_rsp_word == `RSP_RESET));

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))
			&&($past(o_wb_cyc))&&($past(i_wb_err)))
		`ASSERT((o_rsp_stb)&&(o_rsp_word == `RSP_BUS_ERROR));

	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))
			&&($past(i_cmd_addr))&&(!$past(o_cmd_busy)))
	begin
		if ($past(i_cmd_wr))
			`ASSERT((o_wb_cyc)&&(o_wb_stb)&&(o_wb_we));
		if ($past(i_cmd_rd))
			`ASSERT((o_wb_cyc)&&(o_wb_stb)&&(!o_wb_we));
	end

`endif
endmodule
