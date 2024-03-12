////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	memscopc
// {{{
// Project:	WBScope, a wishbone hosted scope
//
// Purpose:	Very similar to the memscope core: capturing data into an AXI
//		based memory.  The difference is ... this core run-length
//	compresses the capture data coming in before writing it to memory.
//	As such, it can capture *exceptionally* long recordings.
//
// Known Issues:
//	The run-length compressor isn't well integrated into the memscope
//	logic analyzer (yet):
//
//	1. The run-length compressor won't see any manual triggers, so
//		manual triggers might end up getting compressed.
//
//	2. The run-length compressor isn't paying attention to overflow.
//		Overflow will happen there, rather than within the internal
//		memscope.
//
//	3. The run-length compressor doesn't truly know if the internal scope
//		is primed or not.  As a result, it won't start compressing until
//		some time *after* the scope has been primed and is ready to go.
//
//	4. The run-length compressor should only ever trigger once, and ever
//		after run-length encode samples where the trigger is active.
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
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype none
// }}}
module	memscopc #(
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
		localparam	C_AXIL_DATA_WIDTH = 32
		// localparam	AXILLSB = $clog2(C_AXIL_DATA_WIDTH)-3,
		// localparam	ADDRLSB = $clog2(C_AXI_DATA_WIDTH)-3
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
		input	wire	[C_AXI_DATA_WIDTH-2:0]		S_AXIS_TDATA,
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

	// Signal declarations
	// {{{
	reg				active, primed;
	wire				rle_trigger, rle_tvalid, rle_tready;
	wire	[C_AXI_DATA_WIDTH-1:0]	rle_tdata;
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// The Run-length compressor
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// primed, active
	// {{{
	initial	{ primed, active } = 2'b00;
	always @(posedge S_AXI_ACLK)
	if (!S_AXI_ARESETN || o_int)
		{ primed, active } <= 2'b00;
	else if (M_AXI_AWVALID && M_AXI_AWADDR == 0)
		{ primed, active } <= { active, 1'b1 };
	// }}}

	axisrle #(
		// {{{
		.C_AXIS_DATA_WIDTH(C_AXI_DATA_WIDTH)
		// }}}
	) encoder (
		// {{{
		.S_AXI_ACLK(S_AXI_ACLK),
		.S_AXI_ARESETN(S_AXI_ARESETN),
		//
		// The raw incoming stream
		// {{{
		.S_AXIS_TVALID(S_AXIS_TVALID),
		.S_AXIS_TREADY(S_AXIS_TREADY),
		.S_AXIS_TDATA(S_AXIS_TDATA),
		// }}}
		//
		// The compressed stream
		// {{{
		.M_AXIS_TVALID(rle_tvalid),
		.M_AXIS_TREADY(rle_tready),
		.M_AXIS_TDATA(rle_tdata),
		// }}}
		//
		// Control inputs
		// {{{
		.i_trigger(i_trigger),
		.i_encode(!primed),
		.o_trigger(rle_trigger)
		// }}}
		// }}}
	);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Repacking
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// ??

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// The memory subcore
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	memscope #(
		// {{{
		.C_AXI_ADDR_WIDTH(C_AXI_ADDR_WIDTH),
		.C_AXI_DATA_WIDTH(C_AXI_DATA_WIDTH),
		.C_AXI_ID_WIDTH(C_AXI_ID_WIDTH),
		.OPT_TREADY_WHILE_IDLE(OPT_TREADY_WHILE_IDLE),
		.LGFIFO(LGFIFO),
		.LGLEN(LGLEN),
		.AXI_ID(AXI_ID),
		.HOLDOFFBITS(HOLDOFFBITS),
		.DEF_HOLDOFF(DEF_HOLDOFF)
		// }}}
	) innerscope (
		// {{{
		.S_AXI_ACLK(S_AXI_ACLK),
		.S_AXI_ARESETN(S_AXI_ARESETN),
		//
		// The stream interface
		// {{{
		.i_trigger(rle_trigger),
		.S_AXIS_TVALID(rle_tvalid),
		.S_AXIS_TREADY(rle_tready),
		.S_AXIS_TDATA(rle_tdata),
		// }}}
		//
		// The control interface
		// {{{
		.S_AXIL_AWVALID(S_AXIL_AWVALID),
		.S_AXIL_AWREADY(S_AXIL_AWREADY),
		.S_AXIL_AWADDR(S_AXIL_AWADDR),
		.S_AXIL_AWPROT(S_AXIL_AWPROT),
		//
		.S_AXIL_WVALID(S_AXIL_WVALID),
		.S_AXIL_WREADY(S_AXIL_WREADY),
		.S_AXIL_WDATA(S_AXIL_WDATA),
		.S_AXIL_WSTRB(S_AXIL_WSTRB),
		//
		.S_AXIL_BVALID(S_AXIL_BVALID),
		.S_AXIL_BREADY(S_AXIL_BREADY),
		.S_AXIL_BRESP(S_AXIL_BRESP),
		//
		.S_AXIL_ARVALID(S_AXIL_ARVALID),
		.S_AXIL_ARREADY(S_AXIL_ARREADY),
		.S_AXIL_ARADDR(S_AXIL_ARADDR),
		.S_AXIL_ARPROT(S_AXIL_ARPROT),
		//
		.S_AXIL_RVALID(S_AXIL_RVALID),
		.S_AXIL_RREADY(S_AXIL_RREADY),
		.S_AXIL_RDATA(S_AXIL_RDATA),
		.S_AXIL_RRESP(S_AXIL_RRESP),
		// }}}
		//

		//
		// The AXI (full) interface
		// {{{
		.M_AXI_AWVALID(M_AXI_AWVALID),
		.M_AXI_AWREADY(M_AXI_AWREADY),
		.M_AXI_AWID(   M_AXI_AWID),
		.M_AXI_AWADDR( M_AXI_AWADDR),
		.M_AXI_AWLEN(  M_AXI_AWLEN),
		.M_AXI_AWSIZE( M_AXI_AWSIZE),
		.M_AXI_AWBURST(M_AXI_AWBURST),
		.M_AXI_AWLOCK( M_AXI_AWLOCK),
		.M_AXI_AWCACHE(M_AXI_AWCACHE),
		.M_AXI_AWPROT( M_AXI_AWPROT),
		.M_AXI_AWQOS(  M_AXI_AWQOS),
		//
		.M_AXI_WVALID(M_AXI_WVALID),
		.M_AXI_WREADY(M_AXI_WREADY),
		.M_AXI_WDATA( M_AXI_WDATA),
		.M_AXI_WSTRB( M_AXI_WSTRB),
		.M_AXI_WLAST( M_AXI_WLAST),
		//
		.M_AXI_BVALID(M_AXI_BVALID),
		.M_AXI_BREADY(M_AXI_BREADY),
		.M_AXI_BID(   M_AXI_BID),
		.M_AXI_BRESP( M_AXI_BRESP),
		//
		.M_AXI_ARVALID(M_AXI_ARVALID),
		.M_AXI_ARREADY(M_AXI_ARREADY),
		.M_AXI_ARID(   M_AXI_ARID),
		.M_AXI_ARADDR( M_AXI_ARADDR),
		.M_AXI_ARLEN(  M_AXI_ARLEN),
		.M_AXI_ARSIZE( M_AXI_ARSIZE),
		.M_AXI_ARBURST(M_AXI_ARBURST),
		.M_AXI_ARLOCK( M_AXI_ARLOCK),
		.M_AXI_ARCACHE(M_AXI_ARCACHE),
		.M_AXI_ARPROT( M_AXI_ARPROT),
		.M_AXI_ARQOS(  M_AXI_ARQOS),
		//
		.M_AXI_RVALID(M_AXI_RVALID),
		.M_AXI_RREADY(M_AXI_RREADY),
		.M_AXI_RID(   M_AXI_RID),
		.M_AXI_RDATA( M_AXI_RDATA),
		.M_AXI_RLAST( M_AXI_RLAST),
		.M_AXI_RRESP( M_AXI_RRESP),
		// }}}
		//
		//
		// Create an output signal to indicate that we've finished
		.o_int(o_int)
		// }}}
	);

	// }}}
	////////////////////////////////////////////////////////////////////////
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
// Formal property section follows
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	////////////////////////////////////////////////////////////////////////
	//
	// This core has not (yet) been formally verified, although the
	// subcores have.
	//
	////////////////////////////////////////////////////////////////////////

`endif
	// }}}
endmodule
