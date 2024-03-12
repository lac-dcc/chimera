////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	memscope
// {{{
// Project:	WBScope, a wishbone hosted scope
//
// Purpose:	Operates with a WBScope interface, but uses a memory based AXI
//		back end.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2020-2021, Gisselquist Technology, LLC
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
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype none
// }}}
module	memscope #(
		// {{{
		//
		// Downstream AXI (MM) address width.  Remember, this is *byte*
		// oriented, so an address width of 32 means this core can
		// interact with a full 2^(C_AXI_ADDR_WIDTH) *bytes*.
		parameter	C_AXI_ADDR_WIDTH = 32,
		// ... and the downstream AXI (MM) data width.  High speed can
		// be achieved by increasing this data width.
		parameter	C_AXI_DATA_WIDTH = 32,
		parameter	C_AXI_ID_WIDTH = 1,
		//
		// OPT_TREADY_WHILE_IDLE controls how the stream idle is set
		// when the memory copy isn't running.  If 1, then TREADY will
		// be 1 and the core will ignore/throw out data when the core
		// isn't busy.  Otherwise, if this is set to 0, the core will
		// force the stream to stall if ever no data is being copied.
		parameter [0:0]	OPT_TREADY_WHILE_IDLE = 1,
		//
		// The size of the FIFO, log-based two.  Hence LGFIFO=9 gives
		// you a FIFO of size 2^(LGFIFO) or 512 elements.  This is about
		// as big as the FIFO should ever need to be, since AXI bursts
		// can be 256 in length.
		parameter	LGFIFO = 9,
		//
		// Maximum number of bytes that can ever be outstanding, in
		// log-base 2.  Hence LGLEN=20 will transfer 1MB of data.
		parameter	LGLEN  = (C_AXI_ADDR_WIDTH > 16) ? 16
						: C_AXI_ADDR_WIDTH-1,
		//
		// We only ever use one AXI ID for all of our transactions.
		// Here it is given as 0.  Feel free to change it as necessary.
		parameter [C_AXI_ID_WIDTH-1:0]	AXI_ID = 0,
	//
		parameter 			HOLDOFFBITS = 20,
		parameter [HOLDOFFBITS-1:0]	DEF_HOLDOFF = 0,
		//
		// Size of the AXI-lite bus.  These are fixed, since 1) AXI-lite
		// is fixed at a width of 32-bits by Xilinx def'n, and 2) since
		// we only ever have 4 configuration words.
		localparam	C_AXIL_ADDR_WIDTH = 4,
		localparam	C_AXIL_DATA_WIDTH = 32,
		localparam	AXILLSB = $clog2(C_AXIL_DATA_WIDTH)-3,
		localparam	ADDRLSB = $clog2(C_AXI_DATA_WIDTH)-3
		// }}}
	) (
		// {{{
		input	wire					S_AXI_ACLK,
		input	wire					S_AXI_ARESETN,
		//
		// The stream interface
		// {{{
		input	wire					i_trigger,
		input	wire					S_AXIS_TVALID,
		output	wire					S_AXIS_TREADY,
		input	wire	[C_AXI_DATA_WIDTH-1:0]		S_AXIS_TDATA,
		// }}}
		//
		// The control interface
		// {{{
		input	wire					S_AXIL_AWVALID,
		output	wire					S_AXIL_AWREADY,
		input	wire	[C_AXIL_ADDR_WIDTH-1:0]		S_AXIL_AWADDR,
		input	wire	[2:0]				S_AXIL_AWPROT,
		//
		input	wire					S_AXIL_WVALID,
		output	wire					S_AXIL_WREADY,
		input	wire	[C_AXIL_DATA_WIDTH-1:0]		S_AXIL_WDATA,
		input	wire	[C_AXIL_DATA_WIDTH/8-1:0]	S_AXIL_WSTRB,
		//
		output	wire					S_AXIL_BVALID,
		input	wire					S_AXIL_BREADY,
		output	wire	[1:0]				S_AXIL_BRESP,
		//
		input	wire					S_AXIL_ARVALID,
		output	wire					S_AXIL_ARREADY,
		input	wire	[C_AXIL_ADDR_WIDTH-1:0]		S_AXIL_ARADDR,
		input	wire	[2:0]				S_AXIL_ARPROT,
		//
		output	wire					S_AXIL_RVALID,
		input	wire					S_AXIL_RREADY,
		output	wire	[C_AXIL_DATA_WIDTH-1:0]		S_AXIL_RDATA,
		output	wire	[1:0]				S_AXIL_RRESP,
		// }}}
		//

		//
		// The AXI (full) interface
		// {{{
		output	wire				M_AXI_AWVALID,
		input	wire				M_AXI_AWREADY,
		output	wire	[C_AXI_ID_WIDTH-1:0]	M_AXI_AWID,
		output	wire	[C_AXI_ADDR_WIDTH-1:0]	M_AXI_AWADDR,
		output	wire	[7:0]			M_AXI_AWLEN,
		output	wire	[2:0]			M_AXI_AWSIZE,
		output	wire	[1:0]			M_AXI_AWBURST,
		output	wire				M_AXI_AWLOCK,
		output	wire	[3:0]			M_AXI_AWCACHE,
		output	wire	[2:0]			M_AXI_AWPROT,
		output	wire	[3:0]			M_AXI_AWQOS,
		//
		output	wire				M_AXI_WVALID,
		input	wire				M_AXI_WREADY,
		output	wire	[C_AXI_DATA_WIDTH-1:0]	M_AXI_WDATA,
		output	wire	[C_AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB,
		output	wire				M_AXI_WLAST,
		//
		input	wire				M_AXI_BVALID,
		output	wire				M_AXI_BREADY,
		input	wire	[C_AXI_ID_WIDTH-1:0]	M_AXI_BID,
		input	wire	[1:0]			M_AXI_BRESP,
		//
		output	wire				M_AXI_ARVALID,
		input	wire				M_AXI_ARREADY,
		output	wire	[C_AXI_ID_WIDTH-1:0]	M_AXI_ARID,
		output	wire	[C_AXI_ADDR_WIDTH-1:0]	M_AXI_ARADDR,
		output	wire	[7:0]			M_AXI_ARLEN,
		output	wire	[2:0]			M_AXI_ARSIZE,
		output	wire	[1:0]			M_AXI_ARBURST,
		output	wire				M_AXI_ARLOCK,
		output	wire	[3:0]			M_AXI_ARCACHE,
		output	wire	[2:0]			M_AXI_ARPROT,
		output	wire	[3:0]			M_AXI_ARQOS,
		//
		input	wire				M_AXI_RVALID,
		output	wire				M_AXI_RREADY,
		input	wire	[C_AXI_ID_WIDTH-1:0]	M_AXI_RID,
		input	wire	[C_AXI_DATA_WIDTH-1:0]	M_AXI_RDATA,
		input	wire				M_AXI_RLAST,
		input	wire	[1:0]			M_AXI_RRESP,
		// }}}
		//
		//
		// Create an output signal to indicate that we've finished
		output	reg				o_int
		// }}}
	);

	// Local parameters
	// {{{
	localparam [1:0]	CMD_CONTROL   = 2'b00,
				CMD_DATA      = 2'b01,
				CMD_ADDRLO    = 2'b10,
				CMD_ADDRHI    = 2'b11;
				// CMD_RESERVED = 2'b11;
	localparam	LGMAXBURST=(LGFIFO > 8) ? 8 : LGFIFO-1;
	localparam	LGLENW  = LGLEN  - ($clog2(C_AXI_DATA_WIDTH)-3);
	//
	// Useful, but unused localparam's:
	// localparam	LGFIFOB = LGFIFO + ($clog2(C_AXI_DATA_WIDTH)-3);
	// localparam [ADDRLSB-1:0] LSBZEROS = 0;
	// }}}


	// Signal declarations
	// {{{
	wire	i_clk   =  S_AXI_ACLK;

	reg			r_busy, r_err, w_complete, scope_reset,
				read_reset, read_busy, s_stopped, primed,
				disable_trigger, manual_trigger, triggered,
				trigger;
	reg [HOLDOFFBITS-1:0]	holdoff;
	reg	[HOLDOFFBITS:0]	s_counter;
	reg	[1:0]		axil_rresp;

	reg	[LGLENW-1:0]	aw_bursts_outstanding;
	reg	[LGMAXBURST:0]	wr_writes_pending;

	reg	[2*C_AXIL_DATA_WIDTH-1:0]	wide_address;

	// FIFO signals
	wire				reset_fifo, write_to_fifo,
					read_from_fifo;
	wire	[C_AXI_DATA_WIDTH-1:0]	fifo_data;
	reg 	[C_AXIL_DATA_WIDTH-1:0]	scope_data;
	wire	[LGFIFO:0]		fifo_fill;
	wire				fifo_full, fifo_empty;

	wire				awskd_valid, axil_write_ready;
	wire	[C_AXIL_ADDR_WIDTH-AXILLSB-1:0]	awskd_addr;
	//
	wire				wskd_valid;
	wire	[C_AXIL_DATA_WIDTH-1:0]	wskd_data;
	wire [C_AXIL_DATA_WIDTH/8-1:0]	wskd_strb;
	reg				axil_bvalid;
	//
	wire				arskd_valid, axil_read_ready;
	wire	[C_AXIL_ADDR_WIDTH-AXILLSB-1:0]	arskd_addr;
	reg	[C_AXIL_DATA_WIDTH-1:0]	axil_read_data;
	reg				axil_read_valid;
	reg				last_stalled, overflow;
	reg	[C_AXI_DATA_WIDTH-1:0]	last_tdata;
	reg	[C_AXIL_DATA_WIDTH-1:0]	w_control_word;
	wire	[C_AXIL_DATA_WIDTH-1:0]	new_control_word;
	reg				aw_full_pipeline;

	reg				axi_awvalid, axi_arvalid;
	reg	[C_AXI_ADDR_WIDTH-1:0]	axi_awaddr, oldest_addr, axi_araddr,
					count_valid;
	reg	[7:0]			axi_awlen;
	reg				axi_wvalid, axi_wlast;

	// Speed up checking for zeros
	reg				wr_none_pending;

	reg				w_phantom_start, phantom_start;

	//
	// Option processing
	reg	[LGFIFO:0]	data_available;


	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// AXI-lite signaling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// This is mostly the skidbuffer logic, and handling of the VALID
	// and READY signals for the AXI-lite control logic in the next
	// section.
	//

	//
	// Write signaling
	//
	// {{{

	skidbuffer #(.OPT_OUTREG(0), .DW(C_AXIL_ADDR_WIDTH-AXILLSB))
	axilawskid(//
		.i_clk(S_AXI_ACLK), .i_reset(!S_AXI_ARESETN),
		.i_valid(S_AXIL_AWVALID), .o_ready(S_AXIL_AWREADY),
		.i_data(S_AXIL_AWADDR[C_AXIL_ADDR_WIDTH-1:AXILLSB]),
		.o_valid(awskd_valid), .i_ready(axil_write_ready),
		.o_data(awskd_addr));

	skidbuffer #(.OPT_OUTREG(0), .DW(C_AXIL_DATA_WIDTH+C_AXIL_DATA_WIDTH/8))
	axilwskid(//
		.i_clk(S_AXI_ACLK), .i_reset(!S_AXI_ARESETN),
		.i_valid(S_AXIL_WVALID), .o_ready(S_AXIL_WREADY),
		.i_data({ S_AXIL_WDATA, S_AXIL_WSTRB }),
		.o_valid(wskd_valid), .i_ready(axil_write_ready),
		.o_data({ wskd_data, wskd_strb }));

	assign	axil_write_ready = awskd_valid && wskd_valid
			&& (!S_AXIL_BVALID || S_AXIL_BREADY);

	initial	axil_bvalid = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		axil_bvalid <= 0;
	else if (axil_write_ready)
		axil_bvalid <= 1;
	else if (S_AXIL_BREADY)
		axil_bvalid <= 0;

	assign	S_AXIL_BVALID = axil_bvalid;
	assign	S_AXIL_BRESP = 2'b00;
	// }}}

	//
	// Read signaling
	//
	// {{{

	skidbuffer #(.OPT_OUTREG(0), .DW(C_AXIL_ADDR_WIDTH-AXILLSB))
	axilarskid(//
		.i_clk(S_AXI_ACLK), .i_reset(!S_AXI_ARESETN),
		.i_valid(S_AXIL_ARVALID), .o_ready(S_AXIL_ARREADY),
		.i_data(S_AXIL_ARADDR[C_AXIL_ADDR_WIDTH-1:AXILLSB]),
		.o_valid(arskd_valid), .i_ready(axil_read_ready),
		.o_data(arskd_addr));

	assign	axil_read_ready = arskd_valid && !read_busy
				&& (!axil_read_valid || S_AXIL_RREADY);

	initial	axil_read_valid = 1'b0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		axil_read_valid <= 1'b0;
	else if (axil_read_ready && ((arskd_addr != CMD_DATA)|| r_busy))
		axil_read_valid <= 1'b1;
	else if (M_AXI_RVALID)
		axil_read_valid <= 1'b1;
	else if (S_AXIL_RREADY)
		axil_read_valid <= 1'b0;

	initial	axil_rresp = 2'b00;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		axil_rresp <= 2'b00;
	else if (!S_AXIL_RVALID || S_AXIL_RREADY)
	begin
		axil_rresp <= 2'b00;

		if (M_AXI_RVALID)
			axil_rresp <= M_AXI_RRESP;
	end

	assign	S_AXIL_RVALID = axil_read_valid;
	assign	S_AXIL_RDATA  = axil_read_data;
	assign	S_AXIL_RRESP = axil_rresp;
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// AXI-lite controlled logic
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// trigger and triggered -- set the trigger
	// {{{
	always @(*)
	begin
		trigger = triggered;
		if (manual_trigger)
			trigger = 1'b1;
		if (i_trigger && !disable_trigger)
			trigger = 1'b1;
		if (!primed)
			trigger = triggered;
	end

	initial	triggered = 0;
	always @(posedge i_clk)
	if (scope_reset)
		triggered <= 0;
	else if (trigger)
		triggered <= 1;
	// }}}

	// s_stopped: Stop holdoff counts after the trigger
	// {{{
	generate if (HOLDOFFBITS > 1)
	begin
		initial	s_counter = 0;
		always @(posedge i_clk)
		if (scope_reset)
			s_counter <= 0;
		else if (S_AXIS_TVALID && S_AXIS_TREADY && trigger
					&& !s_stopped)
			s_counter <= s_counter + 1;

		initial	s_stopped = 0;
		always @(posedge i_clk)
		if (scope_reset)
			s_stopped <= !r_busy || !r_err;
		else if (r_err)
			s_stopped <= 1;
		else if (trigger && !s_stopped)
			s_stopped <= (s_counter >= { 1'b0, holdoff });

`ifdef	FORMAL
		always @(*)
		if (!s_stopped && !trigger)
			assert(s_counter == 0);
`endif
	end else begin

		assign	s_counter = s_stopped;

		initial	s_stopped = 0;
		always @(posedge i_clk)
		if (scope_reset)
			s_stopped <= 0;
		else
			s_stopped <= (S_AXIS_TVALID && S_AXIS_TREADY && trigger);
	end endgenerate
	// }}}

	//
	// Calculate the busy flag.
	// {{{
	// We are busy until HOLDOFF counts after the trigger, and even then
	// until the last burst has been written to memory
	//
	initial	r_busy     = 1;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		r_busy     <= 1;
	else if (scope_reset && !r_err)
		r_busy     <= 1;
	else begin
		if ((aw_bursts_outstanding == 0)&&(s_stopped)&&(fifo_empty))
		begin
			// Clear busy once the transaction is complete
			//  This includes clearing busy on any error
			r_busy <= 1'b0;
		end
	end
	// }}}

	//
	// Interrupts
	// {{{
	// Generate an interrupt once we complete writing the last value.
	initial	o_int = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		o_int <= 0;
	else
		o_int <= (r_busy && w_complete);
	// }}}

	//
	// Error conditions
	// {{{
	// Here we check for a hard error condition--one that we only clear
	// on a scope reset.  This will be the case of a write that returns
	// a bus error.  Unlike an overflow, which will clear itself, bus
	// errors require user intevention to clear.
	initial	r_err = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN || (scope_reset && (!r_err || !r_busy)))
		r_err <= 0;
	else if (M_AXI_BVALID && M_AXI_BREADY && M_AXI_BRESP[1])
		r_err <= 1'b1;
	// }}}

	//
	// Handle bus writes
	// {{{
	always @(*)
	begin
		wide_address = 0;
		wide_address[C_AXI_ADDR_WIDTH-1:0] = axi_araddr;
	end

	assign	new_control_word = apply_wstrb(w_control_word,
				wskd_data, wskd_strb);

	initial	scope_reset = 1;
	initial	read_reset  = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
	begin
		scope_reset     <= 1'b1;
		read_reset      <= 0;
		holdoff         <= DEF_HOLDOFF;
		manual_trigger  <= 1'b0;
		disable_trigger <= 1'b0;
	end else begin
		if (r_busy || (!M_AXI_ARVALID || M_AXI_ARREADY))
			read_reset  <= 1'b0;

		if (axil_write_ready)
		begin
			case(awskd_addr)
			CMD_CONTROL: begin
				if (!new_control_word[31])
					scope_reset <= 1'b1;
				if (!new_control_word[31])
					holdoff     <= new_control_word[HOLDOFFBITS-1:0];
				manual_trigger  <= new_control_word[27];
				disable_trigger <= new_control_word[26];
				end
			CMD_DATA:
				read_reset  <= 1'b1;
			CMD_ADDRLO: begin end
			CMD_ADDRHI: begin end
			default: begin end
			endcase
		end

		if (scope_reset && !r_busy && (!M_AXI_AWVALID || M_AXI_AWREADY))
			scope_reset <= 1'b0;
	end
	// }}}

	// Build the control word for subsequent reading
	// {{{
	always @(*)
	begin
		w_control_word = 0;

		w_control_word[HOLDOFFBITS-1:0] = holdoff;
		// Verilator lint_off WIDTH
		w_control_word[24:20] = C_AXI_ADDR_WIDTH-2;	// Up to 16GB
		// Verilator lint_on  WIDTH
		w_control_word[25] = 1'b0; // (read_addr == 0);
		w_control_word[26] = disable_trigger;
		w_control_word[27] = manual_trigger;
		//
		// Here's where we depart from the normal WBScope interface.
		// Instead of returning 0 (not primed), 1 (primed, not
		// triggered), 3 (triggered and primed, but not yet stopped), or
		// 7 (primed, triggered, and stopped), we have a more complex
		// encoding designed to also return if we've encountered
		// either a bus error or an overflow.
		//
		casez({ s_stopped && !r_busy, triggered, primed,
						(r_err||overflow) })
		4'b0000: w_control_word[30:28] = 3'h0;
		4'b0010: w_control_word[30:28] = 3'h1;
		4'b0110: w_control_word[30:28] = 3'h2;
		4'b1110: w_control_word[30:28] = 3'h3;
		4'b???1: w_control_word[30:28] = { 1'b1, overflow, r_err };
		default
			w_control_word[28:26] = 3'h0;
		endcase
		w_control_word[31] = scope_reset;
	end
	// }}}

	// Read memory data from the downstream memory upon AXI-lite request
	// {{{
	generate if (C_AXI_DATA_WIDTH <= C_AXIL_DATA_WIDTH)
	begin

		always @(*)
			scope_data = M_AXI_RDATA;

	end else begin

		reg	[ADDRLSB-AXILLSB-1:0]	shift;
		reg	[C_AXI_DATA_WIDTH-1:0]	shift_reg;

		always @(posedge i_clk)
		if (M_AXI_ARVALID && M_AXI_ARREADY)
			shift <= M_AXI_ARADDR[ADDRLSB-1:AXILLSB];

		always @(*)
			shift_reg = (M_AXI_RDATA >> (shift*8));

		always @(*)
			scope_data = shift_reg[C_AXIL_DATA_WIDTH-1:0];

	end endgenerate
	// }}}

	// Now that we have our two data words, return them
	// {{{
	// This core also supports another two data ports, containing the
	// address (in memory) of where the core is either currently writing
	// to or where it stopped at.
	always @(posedge i_clk)
	if (M_AXI_RVALID)
		axil_read_data <= scope_data;
	else if (!axil_read_valid || S_AXIL_RREADY)
	begin
		case(arskd_addr)
		CMD_CONTROL: axil_read_data <= w_control_word;
		CMD_DATA:    axil_read_data <= S_AXIS_TDATA; // w_data_word;
		CMD_ADDRLO:  axil_read_data <= wide_address[C_AXIL_DATA_WIDTH-1:0];
		CMD_ADDRHI:  axil_read_data <= wide_address[2*C_AXIL_DATA_WIDTH-1:C_AXIL_DATA_WIDTH];
		default:     axil_read_data <= 0;
		endcase
	end
	// }}}

	// apply_wstrb -- used for handling WSTRB signals
	// {{{
	function [C_AXIL_DATA_WIDTH-1:0] apply_wstrb;
		input   [C_AXIL_DATA_WIDTH-1:0]  prior_data;
		input   [C_AXIL_DATA_WIDTH-1:0]  new_data;
		input   [C_AXIL_DATA_WIDTH/8-1:0]   wstrb;

		integer k;
		for(k=0; k<C_AXIL_DATA_WIDTH/8; k=k+1)
		begin
			apply_wstrb[k*8 +: 8]
				= wstrb[k] ? new_data[k*8 +: 8] : prior_data[k*8 +: 8];
		end
	endfunction
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// The data FIFO section
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	assign	reset_fifo     = !S_AXI_ARESETN || !r_busy;
	assign	write_to_fifo  = S_AXIS_TVALID && S_AXIS_TREADY&& !s_stopped;
	assign	read_from_fifo = M_AXI_WVALID  && M_AXI_WREADY;

	// We are ready if the FIFO isn't full and ...
	//	if OPT_TREADY_WHILE_IDLE is true
	//		at which point we ignore incoming data once the scope
	//		has stopped collecting, or
	//	if we aren't resetting the FIFO--that is, if data is actually
	//		going into the FIFO
	assign	S_AXIS_TREADY  = !fifo_full && (OPT_TREADY_WHILE_IDLE
					|| !reset_fifo);

	sfifo #(.BW(C_AXI_DATA_WIDTH), .LGFLEN(LGFIFO))
	sfifo(i_clk, reset_fifo,
		write_to_fifo, S_AXIS_TDATA, fifo_full, fifo_fill,
		read_from_fifo, fifo_data, fifo_empty);

	assign	M_AXI_WDATA = fifo_data;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// The outgoing AXI (full) protocol section
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	//
	// Write interface
	// {{{
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////

	// Outstanding write burst counting
	// {{{
	// Count the number of bursts outstanding--these are the number of
	// AWVALIDs that have been accepted, but for which the BVALID has not
	// (yet) been returned.  Since we never stop issuing bursts, we'll also
	// need to keep track of a flag to help prevent us from overflowing this
	// counter.
	initial	aw_bursts_outstanding = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
	begin
		aw_bursts_outstanding <= 0;
		aw_full_pipeline <= 0;
	end else case ({ phantom_start, M_AXI_BVALID && M_AXI_BREADY })
	2'b01:	begin
		aw_bursts_outstanding <= aw_bursts_outstanding - 1;
		aw_full_pipeline <= 0;
		end
	2'b10:	begin
		aw_bursts_outstanding <= aw_bursts_outstanding + 1;
		aw_full_pipeline <= (aw_bursts_outstanding > -2);
		end
	default: begin end
	endcase

	// Are we there yet?
	always @(*)
	if (!r_busy || !s_stopped || M_AXI_AWVALID || aw_full_pipeline)
		w_complete = 0;
	else
		w_complete = (aw_bursts_outstanding == 0);
	// }}}

	// Count the number of WVALIDs yet to be sent on the write channel
	// {{{
	initial	wr_none_pending = 1;
	initial	wr_writes_pending = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
	begin
		wr_writes_pending <= 0;
		wr_none_pending   <= 1;
	end else case ({ phantom_start,
			M_AXI_WVALID && M_AXI_WREADY })
	2'b00: begin end
	2'b01: begin
		wr_writes_pending <= wr_writes_pending - 1;
		wr_none_pending   <= (wr_writes_pending == 1);
		end
	2'b10: begin
		wr_writes_pending <= wr_writes_pending + (M_AXI_AWLEN + 1);
		wr_none_pending   <= 0;
		end
	2'b11: begin
		wr_writes_pending <= wr_writes_pending + (M_AXI_AWLEN);
		wr_none_pending   <= (M_AXI_WLAST);
		end
	endcase
	// }}}

	// Phantom starts
	// {{{

	always @(*)
	begin
		// We start again if there's more information to transfer
		w_phantom_start = (data_available >= (1<<LGMAXBURST))
				||(s_stopped && (data_available != 0)
					&& !M_AXI_WVALID);

		// If the address channel is stalled, then we can't issue any
		// new requests
		if (M_AXI_AWVALID && !M_AXI_AWREADY)
			w_phantom_start = 0;

		// If we're still writing the last burst, then don't start
		// any new ones
		if (M_AXI_WVALID && (!M_AXI_WLAST || !M_AXI_WREADY))
			w_phantom_start = 0;

		if (scope_reset || !r_busy)
			w_phantom_start = 0;

		// Finally, don't start any new bursts if we aren't haven't
		// yet adjusted our counters from the last burst
		if (phantom_start)
			w_phantom_start = 0;
	end

	initial	phantom_start = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		phantom_start <= 0;
	else
		phantom_start <= w_phantom_start;
	/// }}}

	//
	// WLAST
	// {{{
	always @(posedge i_clk)
	if (!M_AXI_WVALID || M_AXI_WREADY)
	begin
		if (w_phantom_start)
			axi_wlast <= (data_available == 1);
		else if (phantom_start)
			axi_wlast <= (fifo_fill == 2);
		else
			axi_wlast <= (wr_writes_pending == 1 + (M_AXI_WVALID ? 1:0));
	end
	// }}}

	// Calculate AWLEN and AWADDR for the next AWVALID
	// {{{
	//
	initial	data_available = 0;
	always @(posedge i_clk)
	if (reset_fifo)
		data_available <= 0;
	else case({ write_to_fifo, phantom_start })
	2'b10: data_available <= data_available + 1;
	// Verilator lint_off WIDTH
	2'b01: data_available <= data_available - (M_AXI_AWLEN+1);
	2'b11: data_available <= data_available - (M_AXI_AWLEN);
	// Verilator lint_on  WIDTH
	default: begin end
	endcase

	//
	//
	initial	axi_awaddr = 0;
	always @(posedge i_clk)
	begin
		if (!M_AXI_AWVALID || M_AXI_AWREADY)
		begin
			if (|data_available[LGFIFO:LGMAXBURST])
				axi_awlen <= (1<<LGMAXBURST)-1;
			else
				axi_awlen  <= data_available[7:0] - 1;
		end

		if (M_AXI_AWVALID && M_AXI_AWREADY)
		begin
			axi_awaddr[ADDRLSB-1:0] <= 0;
			// Verilator lint_off WIDTH
			axi_awaddr[C_AXI_ADDR_WIDTH-1:ADDRLSB]
				    <= axi_awaddr[C_AXI_ADDR_WIDTH-1:ADDRLSB]
						+ (M_AXI_AWLEN+1);
			// Verilator lint_on WIDTH
		end

		if (!s_stopped)
			axi_awaddr[LGMAXBURST+ADDRLSB-1:0] <= 0;

		if (!S_AXI_ARESETN || (!r_busy && scope_reset))
			axi_awaddr <= 0;

		axi_awaddr[ADDRLSB-1:0] <= 0;
	end
	// }}}

	// Check for FIFO overflow if the data comes in too fast
	// {{{
	// Overflow is defined as an incoming AXI stream protocol violation.
	// Following overflow, recording will continue until it's gone all the
	// way around memory.  Once around, it will clear the overflow flag
	// and allow the design to be "primed" for its trigger once again
	initial	last_stalled = 1'b0;
	always @(posedge i_clk)
		last_stalled <= (S_AXI_ARESETN) && (S_AXIS_TVALID && !S_AXIS_TREADY);

	always @(posedge i_clk)
		last_tdata <= S_AXIS_TDATA;


	initial	primed = 0;
	initial	count_valid = 0;
	always @(posedge i_clk)
	if (reset_fifo)
		{ overflow, primed, count_valid } <= 0;
	else if (last_stalled && (!S_AXIS_TVALID
			|| (S_AXIS_TDATA != last_tdata)))
	begin
		{ primed, count_valid } <= 0;
		overflow <= 1;
	end else if (!primed)
		{ primed, count_valid } <= count_valid + 1;
	else
		overflow <= 0;
	// }}}

	// AWVALID
	// {{{
	initial	axi_awvalid = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		axi_awvalid <= 0;
	else if (!M_AXI_AWVALID || M_AXI_AWREADY)
		axi_awvalid <= w_phantom_start;
	// }}}

	// WVALID
	// {{{
	initial	axi_wvalid = 0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		axi_wvalid <= 0;
	else if (!M_AXI_WVALID || M_AXI_WREADY)
	begin
		if (M_AXI_WVALID && !M_AXI_WLAST)
			axi_wvalid <= 1;
		else
			axi_wvalid <= w_phantom_start;
	end
	// }}}

	// {{{
	assign	M_AXI_AWVALID= axi_awvalid;
	assign	M_AXI_AWID   = AXI_ID;
	assign	M_AXI_AWADDR = axi_awaddr;
	assign	M_AXI_AWLEN  = axi_awlen;
	// Verilator lint_off WIDTH
	assign	M_AXI_AWSIZE = $clog2(C_AXI_DATA_WIDTH)-3;
	// Verilator lint_on  WIDTH
	assign	M_AXI_AWBURST= 2'b01;
	assign	M_AXI_AWLOCK = 0;
	assign	M_AXI_AWCACHE= 0;
	assign	M_AXI_AWPROT = 0;
	assign	M_AXI_AWQOS  = 0;

	assign	M_AXI_WVALID = axi_wvalid;
	assign	M_AXI_WSTRB  = -1;
	assign	M_AXI_WLAST  = axi_wlast;
	// M_AXI_WLAST = ??

	assign	M_AXI_BREADY = 1;
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	//
	// Read interface
	// {{{
	////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	//
	//

	// ARVALID
	// {{{
	initial	axi_arvalid = 1'b0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		axi_arvalid <= 0;
	else if (!M_AXI_ARVALID || M_AXI_ARREADY)
		axi_arvalid <= axil_read_ready && (arskd_addr == CMD_DATA)
				&& !r_busy;
	// }}}

	// read_busy -- are we busy reading a value?
	// {{{
	initial	read_busy = 1'b0;
	always @(posedge i_clk)
	if (!S_AXI_ARESETN)
		read_busy <= 0;
	else if (!read_busy)
		read_busy <= axil_read_ready
				&& (arskd_addr == CMD_DATA) && !r_busy;
	else if (M_AXI_RVALID)
		read_busy <= 1'b0;
	// }}}

	// oldest_addr--where do we start reading from?
	// {{{
	always @(posedge i_clk)
	begin
		if (r_busy)
		begin
			// Verilator lint_off WIDTH
			if (M_AXI_AWVALID)
				oldest_addr <= M_AXI_AWADDR
						+ (M_AXI_AWLEN<<ADDRLSB);
			else
				oldest_addr <= M_AXI_AWADDR - (1 << ADDRLSB);
			// Verilator lint_on  WIDTH
		end

		oldest_addr[ADDRLSB-1:0] <= 0;
	end
	// }}}

	// ARADDR
	// {{{
	always @(posedge i_clk)
	begin
		if (!M_AXI_ARVALID || M_AXI_ARREADY)
		begin
			if (read_reset || r_busy)
				axi_araddr <= oldest_addr;
			else if (!r_busy && axil_read_ready && arskd_addr == CMD_DATA)
			begin
				if (ADDRLSB <= AXILLSB)
					axi_araddr <= M_AXI_ARADDR + (1 << ADDRLSB);
				else
					axi_araddr <= M_AXI_ARADDR + (1 << AXILLSB);
			end
		end

		if (ADDRLSB <= AXILLSB)
			axi_araddr[ADDRLSB-1:0] <= 0;
		else
			axi_araddr[AXILLSB-1:0] <= 0;
	end
	// }}}

	// The rest of the read address bus control wires
	// {{{
	assign	M_AXI_ARVALID= axi_arvalid;
	assign	M_AXI_ARID   = AXI_ID;
	assign	M_AXI_ARADDR = axi_araddr;
	assign	M_AXI_ARLEN  = 8'h0;
	assign	M_AXI_ARBURST= 2'b00;
	// Verilator lint_off WIDTH
	assign	M_AXI_ARSIZE = $clog2(C_AXI_DATA_WIDTH)-3;
	// Verilator lint_on  WIDTH
	assign	M_AXI_ARLOCK = 1'b0;
	assign	M_AXI_ARCACHE= 4'b0011;
	assign	M_AXI_ARPROT = 3'b000;
	assign	M_AXI_ARQOS  = 0;

	assign	M_AXI_RREADY= 1'b1;
	// }}}
	// }}}

	// }}}
	////////////////////////////////////////////////////////////////////////
	// Make Verilator happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, S_AXIL_AWPROT, S_AXIL_ARPROT,
			M_AXI_BID, M_AXI_RID, M_AXI_RLAST,
			M_AXI_BRESP[0], fifo_empty,
			wr_none_pending, S_AXIL_ARADDR[AXILLSB-1:0],
			new_control_word,
			S_AXIL_AWADDR[AXILLSB-1:0] };
	// Verilator lint_on  UNUSED
	// }}}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal property section follows
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	////////////////////////////////////////////////////////////////////////
	//
	// The following contain a sampling of the formal properties used to
	// verify this core.
	//
	////////////////////////////////////////////////////////////////////////
	localparam	F_MEMDLY = 3;
	reg	f_full, f_align, f_next_aligned, f_next_same;
	reg	[C_AXI_ADDR_WIDTH-1:0]	f_next_awaddr;


	reg	f_past_valid;
	initial	f_past_valid = 0;
	always @(posedge i_clk)
		f_past_valid <= 1;
	////////////////////////////////////////////////////////////////////////
	//
	// The AXI-stream data interface
	// {{{
	//
	////////////////////////////////////////////////////////////////////////
	//
	//

	// (These are captured by the FIFO within)

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// The AXI-lite control interface
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	localparam	F_AXIL_LGDEPTH = 4;
	wire	[F_AXIL_LGDEPTH-1:0]	faxil_rd_outstanding,
			faxil_wr_outstanding, faxil_awr_outstanding;

	faxil_slave #(
		// {{{
		.C_AXI_DATA_WIDTH(C_AXIL_DATA_WIDTH),
		.C_AXI_ADDR_WIDTH(C_AXIL_ADDR_WIDTH),
		.F_LGDEPTH(F_AXIL_LGDEPTH),
		.F_AXI_MAXWAIT(2*F_MEMDLY+1),
		.F_AXI_MAXDELAY(2*F_MEMDLY+1),
		.F_AXI_MAXRSTALL(3)
		// }}}
	) faxil(
		// {{{
		.i_clk(S_AXI_ACLK), .i_axi_reset_n(S_AXI_ARESETN),
		//
		.i_axi_awvalid(S_AXIL_AWVALID),
		.i_axi_awready(S_AXIL_AWREADY),
		.i_axi_awaddr( S_AXIL_AWADDR),
		.i_axi_awcache(4'h0),
		.i_axi_awprot( S_AXIL_AWPROT),
		//
		.i_axi_wvalid(S_AXIL_WVALID),
		.i_axi_wready(S_AXIL_WREADY),
		.i_axi_wdata( S_AXIL_WDATA),
		.i_axi_wstrb( S_AXIL_WSTRB),
		//
		.i_axi_bvalid(S_AXIL_BVALID),
		.i_axi_bready(S_AXIL_BREADY),
		.i_axi_bresp( S_AXIL_BRESP),
		//
		.i_axi_arvalid(S_AXIL_ARVALID),
		.i_axi_arready(S_AXIL_ARREADY),
		.i_axi_araddr( S_AXIL_ARADDR),
		.i_axi_arcache(4'h0),
		.i_axi_arprot( S_AXIL_ARPROT),
		//
		.i_axi_rvalid(S_AXIL_RVALID),
		.i_axi_rready(S_AXIL_RREADY),
		.i_axi_rdata( S_AXIL_RDATA),
		.i_axi_rresp( S_AXIL_RRESP),
		//
		.f_axi_rd_outstanding(faxil_rd_outstanding),
		.f_axi_wr_outstanding(faxil_wr_outstanding),
		.f_axi_awr_outstanding(faxil_awr_outstanding)
		// }}}
		);

	always @(*)
	begin
		assert(faxil_rd_outstanding ==
			((S_AXIL_RVALID || read_busy) ? 1:0)
			+(S_AXIL_ARREADY ? 0:1));
		assert(faxil_wr_outstanding == (S_AXIL_BVALID ? 1:0)
			+(S_AXIL_WREADY ? 0:1));
		assert(faxil_awr_outstanding== (S_AXIL_BVALID ? 1:0)
			+(S_AXIL_AWREADY ? 0:1));
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// The AXI master memory interface
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	localparam	F_AXI_LGDEPTH = 11; // LGLENW-LGMAXBURST+2 ??

	//
	// ...
	//

	faxi_master #(
		// {{{
		.C_AXI_ID_WIDTH(C_AXI_ID_WIDTH),
		.C_AXI_ADDR_WIDTH(C_AXI_ADDR_WIDTH),
		.C_AXI_DATA_WIDTH(C_AXI_DATA_WIDTH),
		//
		.OPT_EXCLUSIVE(1'b0),
		.OPT_NARROW_BURST(1'b0)
		//
		// ...
		//
		// }}}
	) faxi(
		// {{{
		.i_clk(S_AXI_ACLK), .i_axi_reset_n(S_AXI_ARESETN),
		//
		.i_axi_awvalid(M_AXI_AWVALID),
		.i_axi_awready(M_AXI_AWREADY),
		.i_axi_awid(   M_AXI_AWID),
		.i_axi_awaddr( M_AXI_AWADDR),
		.i_axi_awlen(  M_AXI_AWLEN),
		.i_axi_awsize( M_AXI_AWSIZE),
		.i_axi_awburst(M_AXI_AWBURST),
		.i_axi_awlock( M_AXI_AWLOCK),
		.i_axi_awcache(M_AXI_AWCACHE),
		.i_axi_awprot( M_AXI_AWPROT),
		.i_axi_awqos(  M_AXI_AWQOS),
		//
		.i_axi_wvalid(M_AXI_WVALID),
		.i_axi_wready(M_AXI_WREADY),
		.i_axi_wdata( M_AXI_WDATA),
		.i_axi_wstrb( M_AXI_WSTRB),
		.i_axi_wlast( M_AXI_WLAST),
		//
		.i_axi_bvalid(M_AXI_BVALID),
		.i_axi_bready(M_AXI_BREADY),
		.i_axi_bid(   M_AXI_BID),
		.i_axi_bresp( M_AXI_BRESP),
		//
		.i_axi_arvalid(M_AXI_ARVALID),
		.i_axi_arready(M_AXI_ARREADY),
		.i_axi_arid(   M_AXI_ARID),
		.i_axi_araddr( M_AXI_ARADDR),
		.i_axi_arlen(  M_AXI_ARLEN),
		.i_axi_arsize( M_AXI_ARSIZE),
		.i_axi_arburst(M_AXI_ARBURST),
		.i_axi_arlock( M_AXI_ARLOCK),
		.i_axi_arcache(M_AXI_ARCACHE),
		.i_axi_arprot( M_AXI_ARPROT),
		.i_axi_arqos(  M_AXI_ARQOS),
		//
		.i_axi_rvalid(M_AXI_RVALID),
		.i_axi_rready(M_AXI_RREADY),
		.i_axi_rdata( M_AXI_RDATA),
		.i_axi_rlast( M_AXI_RLAST),
		.i_axi_rresp( M_AXI_RRESP)
		//
		//
		// ...
		//
		// }}}
	);

	//
	// ...
	//

	always @(posedge i_clk)
	if (M_AXI_AWVALID)
	begin
		// ...
		if (phantom_start)
		begin
			assert(wr_writes_pending == 0);
			assert(wr_none_pending);
		end else if ($past(phantom_start))
			assert(wr_writes_pending <= M_AXI_AWLEN+1);
	end else begin
		// ...
		assert(wr_none_pending == (wr_writes_pending == 0));
	end

	//
	// ...
	//

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Other formal properties
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	// The following is (sadly) a big jumbled mess of properties that needs
	// some amount of order added to it.  For now, it "works".  More still
	// needs to be done to make it more presentable.

	always @(*)
	if (!r_busy)
	begin
		assert(!M_AXI_AWVALID);
		assert(!M_AXI_WVALID);
		assert(!M_AXI_BVALID);
		// ...
	end

	always @(*)
	if (phantom_start)
		assert(data_available >= (M_AXI_AWLEN+1));
	else if (M_AXI_AWVALID)
		assert(data_available >= 0 && data_available <= (1<<LGFIFO));

	always @(*)
	if (!reset_fifo)
	begin
		assert(data_available == fifo_fill - wr_writes_pending);
		assert(data_available <= fifo_fill);
		assert(wr_writes_pending <= fifo_fill);
	end else if (S_AXI_ARESETN)
		assert(wr_writes_pending == 0);

	always @(*)
	if (phantom_start)
		assert(wr_writes_pending == 0);

	always @(*)
	if (phantom_start)
		assert(fifo_fill >= (M_AXI_AWLEN+1));

	always @(*)
	// if (!r_err)
		assert(fifo_fill >= wr_writes_pending);

	always @(*)
	if (phantom_start)
	begin
		assert(M_AXI_AWVALID && M_AXI_WVALID);
		assert(wr_none_pending);
		// assert(drain_triggered);
	end

	always @(*)
	if ((LGMAXBURST < 8) && (r_busy))
		assert(M_AXI_AWLEN+1 <= (1<<LGMAXBURST));

	always @(*)
		assert(M_AXI_AWADDR[ADDRLSB-1:0] == 0);

	always @(*)
	if (data_available > 0)
		assert(M_AXI_AWADDR[ADDRLSB +: LGMAXBURST] == 0);
	else if (M_AXI_AWADDR[ADDRLSB +: LGMAXBURST] != 0)
		assert(s_stopped || scope_reset);
	else if (!s_stopped && !scope_reset)
		assert(M_AXI_AWADDR[ADDRLSB +: LGMAXBURST] == 0);

	always @(*)
	begin
		f_next_awaddr = M_AXI_AWADDR;
		if (M_AXI_AWVALID && !phantom_start)
		begin
			f_next_awaddr[C_AXI_ADDR_WIDTH-1:ADDRLSB]
				= f_next_awaddr[C_AXI_ADDR_WIDTH-1:ADDRLSB]
					+ (M_AXI_AWLEN+1);
			f_next_awaddr[ADDRLSB-1:0] = 0;
		end
	end

	// Make sure our aw_bursts_outstanding counter never overflows
	always @(*)
	if (&aw_bursts_outstanding[LGLENW-1:0])
		assert(!phantom_start);

	// }}}

	//
	// Synchronization properties
	// {{{
	always @(*)
	if (fifo_full)
		assert(!S_AXIS_TREADY);
	else if (OPT_TREADY_WHILE_IDLE)
		// If we aren't full, and we set TREADY whenever idle,
		// then we should otherwise have TREADY set at all times
		assert(S_AXIS_TREADY);
	else if (reset_fifo)
		// If we aren't accepting any data, but are idling with TREADY
		// low, then make sure we drop TREADY when idle
		assert(!S_AXIS_TREADY);
	else
		// In all other cases, assert TREADY
		assert(S_AXIS_TREADY);

	// }}}

	//
	// Error logic checking
	// {{{

	always @(posedge S_AXI_ACLK)
	if (!f_past_valid || $past(!S_AXI_ARESETN))
		assert(!r_err);
	else if ($past(scope_reset && !r_err))
		assert(!r_err);
	else if ($past(scope_reset && !r_busy))
		assert(!r_err);
	else if ($past(M_AXI_BVALID && M_AXI_BREADY && M_AXI_BRESP[1]))
		assert(r_err);
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Cover checks
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// None (yet)

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Constraining assumptions
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// }}}
	// This ends our formal property set
`endif
	// }}}
endmodule
