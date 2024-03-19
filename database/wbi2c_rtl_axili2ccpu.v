////////////////////////////////////////////////////////////////////////////////
//
// Filename:	axili2ccpu.v
// {{{
// Project:	WBI2C ... a set of Wishbone controlled I2C controller(s)
//
// Purpose:	This is a copy of the WBI2CCPU, save that it has been modified
//		to work with AXI4 instead of Wishbone.
//
// Registers
// {{{
//	0. Stop control
//		[31:28]: half_insn.  If the half_valid flag is true, there
//			is another half to this instruction contained in these
//			bits.
//		[27:24]: Unused/Reserved
//		[23]: r_wait - True if the controller is waiting on a
//			synchronization signal before issuing its next command
//		[22]: Soft halt request (halt on STOP or o.w. inactive)
//			Writes that set the soft halt bit will cause the I2C
//			port to halt once the current command is complete.
//		[21]: r_aborted - a user instruction was aborted.  Further
//			user (bus) instructions will be ignored until this
//			bit is cleared by writing to it.
//		[20]: Err bit
//			True if an instruction read has returned a bus error.
//			The error may be cleared by writing a '1' to this bit,
//			or by writing to the address register.
//		[19]: Hard halt request (halt in any state)
//			Writes that set this bit will cause the controller
//			to immediately halt in whatever state the controller
//			is in.  Any currently issued command will run to
//			completion.
//			Reads return 1'b1 if the controller is not running a
//			script from memory.  This is almost the same as if it
//			were halted, but not quite, since this bit will not
//			clear following an override request.
//		[18]: insn_valid - An instruction has been read and queued that
//			hasn't been issued.  An attempt to write to the override
//			register might override this instruction
//		[17]: half_valid - a half instruction is waiting to be issued.
//		[16]: imm_cycle - the next word the controller receives will
//			be an immediate byte
//		[15:14]: Currently output/commanded SCL, SDA respectivvely
//		[13:12]: Input/incoming SCL, SDA respectively
//		[11: 0]: Returns the currently running instruction.
//	1. Override
//		Writes instructions to bits [7:0] of this port
//		bit [9] will be true on read if a valid byte can be read
//			This bit will be cleared on any write to ADR_OVERRIDE
//		bit [8] will be true on read if TLAST is set on a valid request
//		bit [7:0] on read will return the last data read from the device
//	2. Address control
//		Writes set the address, unstop the CPU, and cause a jump to that
//			address.  Writes will also set the abort address and
//			the jump target, so that on either an abort abort or a
//			the command restarts right where the CPU set it up to
//			start.
//		Reads return the current address
//	3. Clock control
//		(May not be required)
// }}}
//
// Instruction set:
// {{{
//	4'h,4'h		Two instructions per byte
//
//	4'h0		NOP
//	4'h1		START
//	4'h2		STOP
//	4'h3		SEND
//	4'h4		RXK
//	4'h5		RXN	// RX byte, NAK result
//	4'h6		RXLK	// Cn't include STOP, bc we might want rptd strt
//	4'h7		RXLN	// ditto
//	4'h8		WAIT
//	4'h9		HALT
//	4'ha		ABORT
//	4'hb		TARGET
//	4'hc		JUMP
//	4'hd		CHANNEL
//	4'he		(Undef/Illegal Insn)
//	4'hf		(Undef/Illegal Insn)
// }}}
//
// Dependencies:
//	axilfetch.v	From the wb2axip repo, rtl/ directory
//	skidbuffer.v	From the wb2axip repo, rtl/ directory
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2021-2024, Gisselquist Technology, LLC
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
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype none
// }}}
module	axili2ccpu #(
		// {{{
		parameter	ADDRESS_WIDTH = 32,
		parameter	DATA_WIDTH = 32,
		parameter	I2C_WIDTH = 8,
		parameter	AXIS_ID_WIDTH = 0,
		parameter	C_AXI_ADDR_WIDTH = ADDRESS_WIDTH,
		parameter	C_AXI_DATA_WIDTH = DATA_WIDTH,
		localparam	RW = I2C_WIDTH,
		localparam	AW = C_AXI_ADDR_WIDTH,
		localparam	DW = C_AXI_DATA_WIDTH,
		parameter [AW-1:0]	RESET_ADDRESS = 0,
		parameter [0:0]	OPT_START_HALTED = (RESET_ADDRESS == 0),
		// If OPT_MANUAL is set, the override register may be used
		// to take direct and manual control over the I2C ports, and
		// so to directly control the wires without any logic in the
		// way.
		parameter [0:0]	OPT_MANUAL = 1'b1,
		parameter		OPT_WATCHDOG = 0,
		parameter [((AXIS_ID_WIDTH > 0) ? (AXIS_ID_WIDTH-1):0):0]
					DEF_CHANNEL = 0,
`ifdef	FORMAL
		parameter [11:0]	DEF_CKCOUNT = 2,
`else
		parameter [11:0]	DEF_CKCOUNT = -1,
`endif
		parameter [0:0]	OPT_LOWPOWER = 1'b0
		// }}}
	) (
		// {{{
		input	wire		S_AXI_ACLK, S_AXI_ARESETN,
		// Bus slave interface
		// {{{
		input	wire		S_AXI_AWVALID,
		output	wire		S_AXI_AWREADY,
		input	wire	[3:0]	S_AXI_AWADDR,
		input	wire	[2:0]	S_AXI_AWPROT,
		//
		input	wire		S_AXI_WVALID,
		output	wire		S_AXI_WREADY,
		input	wire	[31:0]	S_AXI_WDATA,
		input	wire	[3:0]	S_AXI_WSTRB,
		//
		output	wire		S_AXI_BVALID,
		input	wire		S_AXI_BREADY,
		output	wire	[1:0]	S_AXI_BRESP,
		//
		input	wire		S_AXI_ARVALID,
		output	wire		S_AXI_ARREADY,
		input	wire	[3:0]	S_AXI_ARADDR,
		input	wire	[2:0]	S_AXI_ARPROT,
		//
		output	wire		S_AXI_RVALID,
		input	wire		S_AXI_RREADY,
		output	wire	[31:0]	S_AXI_RDATA,
		output	wire	[1:0]	S_AXI_RRESP,
		// }}}
		// Bus master interface
		// {{{
		output	wire		M_INSN_ARVALID,
		input	wire		M_INSN_ARREADY,
		output	wire [AW-1:0]	M_INSN_ARADDR,
		output	wire	[2:0]	M_INSN_ARPROT,
		//
		input	wire		M_INSN_RVALID,
		output	wire		M_INSN_RREADY,
		input	wire [DW-1:0]	M_INSN_RDATA,
		input	wire	[1:0]	M_INSN_RRESP,
		// }}}
		// I2C interfacce
		// {{{
		input	wire			i_i2c_sda, i_i2c_scl,
		output	wire			o_i2c_sda, o_i2c_scl,
		// }}}
		// Outgoing stream interface
		//  {{{
		output	wire			M_AXIS_TVALID,
		input	wire			M_AXIS_TREADY,
		output	wire	[RW-1:0]	M_AXIS_TDATA,
		output	wire			M_AXIS_TLAST,
		output	wire [((AXIS_ID_WIDTH > 0) ? (AXIS_ID_WIDTH-1):0):0]
						M_AXIS_TID,
		// OPT output wire		M_AXIS_TABORT,
		// }}}
		input	wire		i_sync_signal,
		output	wire	[31:0]	o_debug
		// }}}
	);

	// Local declarations
	// {{{
	localparam	BAW = AW; // Byte address width

	wire	i_clk = S_AXI_ACLK;
	wire	i_reset = !S_AXI_ARESETN;

	// Addresses
	// {{{
	localparam	[1:0]	ADR_CONTROL = 2'b00,
				ADR_OVERRIDE= 2'b01,
				ADR_ADDRESS = 2'b10,
				ADR_CKCOUNT = 2'b11;
	// }}}

	// Command register bit enumeration(s)
	// {{{
	localparam	// IMMCYCLE_BIT = 16,
			// HALFVLD_BIT  = 17,
			// INSNVLD_BIT  = 18,
			HALT_BIT     = 19,
			ERR_BIT      = 20,
			ABORT_BIT    = 21,
			SOFTHALT_BIT = 22;
			// WAIT_BIT  = 23;
	// }}}
	localparam	OVW_VALID  =  9;
	localparam	MANUAL_BIT = 11;

	// Instruction set / Commands
	// {{{
	localparam	[3:0]	CMD_NOOP  = 4'h0,
				// CMD_START = 4'h1,
				CMD_STOP  = 4'h2,
				CMD_SEND  = 4'h3,
				CMD_RXK   = 4'h4,
				CMD_RXN   = 4'h5,
				CMD_RXLK  = 4'h6,
				CMD_RXLN  = 4'h7,
				CMD_WAIT  = 4'h8,
				CMD_HALT  = 4'h9,
				CMD_ABORT = 4'ha,
				CMD_TARGET= 4'hb,
				CMD_JUMP  = 4'hc,
				CMD_CHANNEL = 4'hd;
	// }}}

	wire			cpu_reset, cpu_clear_cache;
	reg			cpu_new_pc;
	reg	[BAW-1:0]	pf_jump_addr;
	wire			pf_valid;
	wire			pf_ready;
	wire	[7:0]		pf_insn;
	wire	[BAW-1:0]	pf_insn_addr;
	wire			pf_illegal;

	reg			half_valid, imm_cycle;

	reg			next_valid;
	reg	[7:0]		next_insn;

	wire			insn_ready, half_ready, i2c_abort;
	reg			insn_valid;
	reg	[11:0]		insn;
	reg	[3:0]		half_insn;
	reg			i2c_ckedge;
	wire			i2c_stretch;
	reg	[11:0]		i2c_ckcount, ckcount;
	reg	[BAW-1:0]	abort_address, jump_target;
	reg			r_wait, soft_halt_request, r_halted, r_err,
				r_aborted;
	wire			r_manual, r_sda, r_scl;
	wire			w_stopped, w_sda, w_scl;

	reg		s_axi_bvalid, s_axi_rvalid;
	wire		skd_awvalid, skd_wvalid, skd_arvalid;
	wire		bus_read, bus_write, bus_override, bus_manual,
			ovw_ready, bus_jump;
	wire	[1:0]	bus_write_addr, bus_read_addr;
	wire	[31:0]	bus_write_data;
	wire	[3:0]	bus_write_strb;
	reg	[31:0]	bus_read_data;

	wire		s_tvalid, s_tready;
	reg	[9:0]	ovw_data;
	wire	[31:0]	w_control;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// AXI4-lite Bus handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// Write address skid buffer
	skidbuffer #(
		// {{{
		.OPT_LOWPOWER(OPT_LOWPOWER),
		.OPT_OUTREG(0),
		.DW(2)
		// }}}
	) awskd (
		// {{{
		.i_clk(S_AXI_ACLK), .i_reset(!S_AXI_ARESETN),
		.i_valid(S_AXI_AWVALID), .o_ready(S_AXI_AWREADY),
			.i_data(S_AXI_AWADDR[3:2]),
		.o_valid(skd_awvalid), .i_ready(bus_write),
			.o_data(bus_write_addr)
		// }}}
	);

	// Write data skid buffer
	skidbuffer #(
		// {{{
		.OPT_LOWPOWER(OPT_LOWPOWER),
		.OPT_OUTREG(0),
		.DW(32+32/8)
		// }}}
	) wskd (
		// {{{
		.i_clk(S_AXI_ACLK), .i_reset(!S_AXI_ARESETN),
		.i_valid(S_AXI_WVALID), .o_ready(S_AXI_WREADY),
			.i_data({ S_AXI_WDATA, S_AXI_WSTRB }),
		.o_valid(skd_wvalid), .i_ready(bus_write),
			.o_data({ bus_write_data, bus_write_strb })
		// }}}
	);

	// Read address skid buffer
	skidbuffer #(
		// {{{
		.OPT_LOWPOWER(OPT_LOWPOWER),
		.OPT_OUTREG(0),
		.DW(2)
		// }}}
	) arskd (
		// {{{
		.i_clk(S_AXI_ACLK), .i_reset(!S_AXI_ARESETN),
		.i_valid(S_AXI_ARVALID), .o_ready(S_AXI_ARREADY),
			.i_data(S_AXI_ARADDR[3:2]),
		.o_valid(skd_arvalid), .i_ready(bus_read),
			.o_data(bus_read_addr)
		// }}}
	);

	assign	bus_write       = skd_awvalid && skd_wvalid && (!S_AXI_BVALID || S_AXI_BREADY);
	assign	bus_read        = skd_arvalid && (!S_AXI_RVALID || S_AXI_RREADY);

	// Write response
	// {{{
	initial	s_axi_bvalid = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		s_axi_bvalid <= 1'b0;
	else if (bus_write)
		s_axi_bvalid <= 1'b1;
	else if (S_AXI_BREADY)
		s_axi_bvalid <= 1'b0;

	assign	S_AXI_BVALID = s_axi_bvalid;
	// }}}

	assign	S_AXI_BRESP = 2'b00;
	assign	S_AXI_RRESP = 2'b00;

	// Read handling
	// {{{
	initial	s_axi_rvalid = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		s_axi_rvalid <= 0;
	else if (bus_read)
		s_axi_rvalid <= 1;
	else if (S_AXI_RREADY)
		s_axi_rvalid <= 0;

	assign	w_control = {
			half_insn, 3'h0, r_manual,
			//
			r_wait, soft_halt_request,
				r_aborted, r_err, r_halted,
			insn_valid, half_valid, imm_cycle,
			//
			o_i2c_scl, o_i2c_sda,
				i_i2c_scl, i_i2c_sda,
			//
			insn	// 12 bits
		};

	always @(posedge i_clk)
	if (OPT_LOWPOWER && i_reset)
		bus_read_data <= 0;
	else if (bus_read)
	begin
		bus_read_data <= 0;
		case(bus_read_addr)
		ADR_CONTROL:	bus_read_data <= w_control;
		ADR_OVERRIDE:	bus_read_data[15:0] <= {
					r_scl, r_sda, i_i2c_scl, i_i2c_sda,
					r_manual, r_aborted, ovw_data };
		ADR_ADDRESS:	bus_read_data[BAW-1:0] <= pf_insn_addr;
		ADR_CKCOUNT:	bus_read_data[11:0] <= ckcount;
		// default:	bus_read_data <= 0;
		endcase

		// if(OPT_LOWPOWER && !bus_read)
		//	bus_read_data <= 0;
	end else if (OPT_LOWPOWER && S_AXI_RREADY)
		bus_read_data <= 0;

	assign	S_AXI_RVALID = s_axi_rvalid;
	assign	S_AXI_RDATA  = bus_read_data;
	// }}}

	assign	bus_override   = r_halted && !r_aborted && bus_write
			&& bus_write_addr == ADR_OVERRIDE && bus_write_strb[0];
	assign	bus_manual   = OPT_MANUAL && bus_write
				&& bus_write_addr == ADR_OVERRIDE
				&& bus_write_data[MANUAL_BIT]
				&& bus_write_strb[MANUAL_BIT/8];
	assign	bus_jump = bus_write && bus_write_addr == ADR_ADDRESS
				&& (&bus_write_strb) && r_halted && !r_aborted;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Instruction fetch
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	assign	cpu_reset = r_halted;
	assign	cpu_clear_cache = 1'b0;

`ifndef	FORMAL
	axilfetch #(
		// {{{
		.C_AXI_ADDR_WIDTH(AW),
		.C_AXI_DATA_WIDTH(DW),
		.INSN_WIDTH(8),
		.FETCH_LIMIT(2)
		// }}}
	) u_fetch (
		// {{{
		.S_AXI_ACLK(S_AXI_ACLK), .S_AXI_ARESETN(S_AXI_ARESETN),
		// {{{
		.i_cpu_reset(cpu_reset),
		.i_new_pc(cpu_new_pc), .i_clear_cache(cpu_clear_cache),
		.i_ready(pf_ready), .i_pc(pf_jump_addr),
		.o_valid(pf_valid), .o_illegal(pf_illegal),
		.o_insn(pf_insn), .o_pc(pf_insn_addr),
		// }}}
		// AXI-lite bus master interface
		// {{{
		.M_AXI_ARVALID(M_INSN_ARVALID), .M_AXI_ARREADY(M_INSN_ARREADY),
		.M_AXI_ARADDR(M_INSN_ARADDR), .M_AXI_ARPROT(M_INSN_ARPROT),
		.M_AXI_RVALID(M_INSN_RVALID), .M_AXI_RREADY(M_INSN_RREADY),
		.M_AXI_RDATA(M_INSN_RDATA), .M_AXI_RRESP(M_INSN_RRESP)
		// }}}
		// }}}
	);
`endif

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Decode pipeline, and non-i2c handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// next_valid, next_insn
	// {{{
	always @(*)
	begin
		if (r_halted)
		begin
			next_valid = bus_override && ovw_ready;
			if (bus_manual)
				next_valid = 1'b0;
			next_insn  = bus_write_data[7:0];
		end else begin
			next_valid = pf_valid && pf_ready;
			if (insn_valid && insn[11:8] == CMD_HALT)
				next_valid = 1'b0;
			next_insn  = pf_insn;
		end

		if (!imm_cycle && next_insn[7:4] == CMD_NOOP)
			next_insn = { next_insn[3:0], CMD_NOOP };

		if (bus_jump)
			next_valid = 1'b0;
	end
`ifdef	FORMAL
	always @(*)
	if (insn_valid && !s_tready)
	begin
		assert(!next_valid);
		assert(!pf_ready);
		assert(!ovw_ready);
	end

	always @(*)
	if (!i_reset && !insn_valid && !r_manual)
	begin
		assert(pf_ready  == (!r_halted && !r_wait && !cpu_new_pc && !r_manual));
		assert(ovw_ready);
	end
`endif
	// }}}

	// half_valid
	// {{{
	initial	half_valid = 1'b0;
	always @(posedge i_clk)
	if (i_reset || i2c_abort || r_manual || bus_manual)
		half_valid <= 1'b0;
	else if (!imm_cycle && next_valid)
	begin
		half_valid <= 1'b0;

		if (next_insn[7:4] != CMD_SEND
				&& next_insn[7:4] != CMD_CHANNEL
				&& next_insn[3:0] != CMD_NOOP
				&& next_insn[7:4] != CMD_HALT)
			half_valid <= 1'b1;
	end else if (half_ready)
		half_valid <= 1'b0;
`ifdef	FORMAL
	always @(posedge i_clk)
	if (!i_reset && $past(!i_reset && !i2c_abort && next_valid && !imm_cycle))
	begin
		if (half_insn[3:0] == CMD_NOOP)
			assert(!half_valid);
	end
`endif
	// }}}

	// imm_cycle
	// {{{
	initial	imm_cycle = 1'b0;
	always @(posedge i_clk)
	if (i_reset || cpu_new_pc || cpu_clear_cache || i2c_abort)
		imm_cycle <= 1'b0;
	else if (!imm_cycle && (
		(next_valid && (next_insn[7:4]== CMD_SEND
				|| next_insn[7:4]== CMD_CHANNEL))
		||(half_valid && half_ready && (half_insn[3:0] == CMD_SEND
					||half_insn[3:0] == CMD_CHANNEL))))
		imm_cycle <= 1'b1;
	else begin
		if (bus_jump)
			imm_cycle <= 1'b0;
		if ((pf_valid && pf_ready) || (bus_override && ovw_ready))
			imm_cycle <= 1'b0;
	end
`ifdef	FORMAL
	always @(*)
	if (!i_reset && imm_cycle)
		assert(insn[11:8] == CMD_SEND || insn[11:8] == CMD_CHANNEL);
`endif
	// }}}

	// cpu_new_pc, pf_jump_addr
	// {{{
	always @(posedge i_clk)
	if (i_reset)
	begin
		cpu_new_pc   <= !OPT_START_HALTED;
		pf_jump_addr <= RESET_ADDRESS;
	end else begin

		cpu_new_pc <= 1'b0;
		if (cpu_new_pc || (pf_valid && pf_ready))
			pf_jump_addr <= pf_jump_addr + 1;

		// Jump instruction
		// {{{
		if ((pf_valid && pf_ready && !imm_cycle
						&& pf_insn[7:4] == CMD_JUMP)
			||(half_valid && half_ready
						&& half_insn[3:0] == CMD_JUMP))
		begin
			cpu_new_pc   <= 1'b1;
			pf_jump_addr <= jump_target;
		end
		// }}}

		// Abort an I2C command
		// {{{
		if (i2c_abort)
		begin
			cpu_new_pc   <= 1'b1;
			pf_jump_addr <= abort_address;
		end
		// }}}

		// CPU commanded jump
		// {{{
		if (bus_jump)
		begin
			cpu_new_pc   <= 1'b1;
			pf_jump_addr <= bus_write_data[BAW-1:0];
		end
		// }}}
	end
	// }}}

	assign	pf_ready = !w_stopped && !half_valid
			&& (!insn_valid || s_tready) && !cpu_new_pc;
	assign	half_ready = s_tready;

	assign	ovw_ready = !half_valid && (!insn_valid || s_tready);

	// insn_valid
	// {{{
	initial	insn_valid = 1'b0;
	always @(posedge i_clk)
	if (i_reset || i2c_abort)
		insn_valid <= 1'b0;
	else if (OPT_MANUAL && (r_manual || bus_manual))
		insn_valid <= 1'b0;
	else if (next_valid)
		insn_valid <= imm_cycle || (next_insn[7:4] != CMD_SEND
					&& next_insn[7:4] != CMD_CHANNEL);
	else if ((!half_valid || half_insn == CMD_SEND || half_insn == CMD_CHANNEL) && s_tready)
		insn_valid <= 1'b0;

`ifdef	FORMAL
	always @(posedge i_clk)
	if (!i_reset && half_valid)
	begin
		assert(insn_valid);
		assert(insn[11:8] != CMD_HALT && insn[11:8] != CMD_SEND
				&& insn[11:8] != CMD_CHANNEL);
		assert(!imm_cycle);
	end
`endif
	// }}}

	// insn
	// {{{
	always @(posedge i_clk)
	if (i_reset)
	begin
		// {{{
		half_insn <= CMD_NOOP;
		insn <= 0;
		// }}}
	end else if (next_valid)
	begin
		// {{{
		if (imm_cycle)
		begin
			insn[7:0] <= next_insn;
			half_insn <= CMD_NOOP;
		end else
			{ insn[11:8], half_insn } <= next_insn;
		// }}}
	end else if (!imm_cycle && s_tready)
		{ insn[11:8], half_insn } <= { half_insn, CMD_NOOP };

`ifdef	FORMAL
	always @(*)
	if (!i_reset && imm_cycle)
		assert(!half_valid);
`endif
	// }}}

	// ckcount
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		ckcount <= DEF_CKCOUNT;
	else if (bus_write && bus_write_addr == ADR_CKCOUNT && (&bus_write_strb))
		ckcount <= bus_write_data[11:0];
	// }}}

	// i2c_ckedge
	// {{{
	always @(posedge i_clk)
	if (i_reset)
	begin
		i2c_ckedge <= 0;
		i2c_ckcount <= DEF_CKCOUNT;
	end else if (!i2c_ckedge || !i2c_stretch)
	begin
		if (i2c_ckcount > 0)
			i2c_ckcount <= i2c_ckcount - 1;
		else
			i2c_ckcount <= ckcount;

		if (i2c_ckedge)
		begin
			i2c_ckedge  <= (ckcount == 0);
		end else
			i2c_ckedge  <= (i2c_ckcount <= 1);
	end
`ifdef	FORMAL
	always @(*)
	if (!i_reset)
		assert(i2c_ckedge == (i2c_ckcount == 0));

`ifdef	COVER
	(* anyconst *)	reg	f_cvrspeed;
	reg	cvr_active;

	initial	cvr_active <= 0;
	always @(posedge i_clk)
	if (insn_valid)
		cvr_active <= 1;

	always @(*)
		assume(f_cvrspeed);

	always @(posedge i_clk)
	if (cvr_active && f_cvrspeed)
		assume(ckcount == 1);
`endif
`endif
	// }}}

	// abort_address
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		abort_address <= RESET_ADDRESS;
	else if (bus_jump)
		abort_address <= bus_write_data[BAW-1:0];
	else if (pf_valid && pf_ready && !imm_cycle && pf_insn[7:4]== CMD_ABORT)
			// || pf_insn == { CMD_START, CMD_SEND })
		abort_address <= pf_insn_addr + 1;
	// }}}

	// jump_target
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		jump_target <= RESET_ADDRESS;
	else if (bus_jump)
		jump_target <= bus_write_data[BAW-1:0];
	else if (pf_valid && pf_ready && !imm_cycle
			&& pf_insn[7:4] == CMD_TARGET)
		jump_target <= pf_insn_addr + 1;
	// }}}

	// r_wait
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		r_wait <= 1'b0;
	else if (r_halted || i_sync_signal)
		r_wait <= 1'b0;
	else begin
		if (insn_valid && insn[11:8] == CMD_WAIT)
			r_wait <= 1'b1;
		if (bus_jump)
			r_wait <= 1'b0;
	end
	// }}}

	// soft_halt_request
	// {{{
	always @(posedge i_clk)
	if (i_reset || r_halted)
		soft_halt_request <= 1'b0;
	else if (bus_write && bus_write_addr == ADR_CONTROL
			&& bus_write_data[SOFTHALT_BIT]
			&& bus_write_strb[SOFTHALT_BIT/8])
		soft_halt_request <= 1'b1;
	// }}}

	// r_halted
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		r_halted <= OPT_START_HALTED;
	else begin
		if (insn_valid && s_tready && insn[11:8] == CMD_STOP
				&& soft_halt_request)
			r_halted <= 1'b1;
		if (soft_halt_request && i2c_abort)
			r_halted <= 1'b1;
		if (pf_valid && pf_ready && pf_illegal)
			r_halted <= 1'b1;
		if (insn_valid && s_tready && insn[11:8] == CMD_HALT)
			r_halted <= 1'b1;

		if (bus_write)
		begin
			if (bus_write_addr == ADR_CONTROL
					&& bus_write_data[HALT_BIT]
					&& bus_write_strb[HALT_BIT/8])
				r_halted <= 1'b1;
			if (bus_manual)
				r_halted <= 1'b1;
			if (bus_jump && r_halted)
				r_halted <= 1'b0;
		end
	end
	// }}}

	// r_aborted
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		r_aborted <= 1'b0;
	else begin
		if (i2c_abort && !r_halted)
			r_aborted <= 1'b1;

		if (bus_write)
		begin
			if (bus_write_addr == ADR_CONTROL
					&& bus_write_data[ABORT_BIT]
					&& bus_write_strb[ABORT_BIT/8])
				r_aborted <= 1'b0;
			if (bus_jump && r_halted)
				r_aborted <= 1'b0;
		end
	end
	// }}}

	// r_err
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		r_err <= 1'b0;
	else begin
		if (pf_valid && pf_ready && pf_illegal)
			r_err <= 1'b1;

		if (bus_write)
		begin
			if (bus_write_addr == ADR_CONTROL && bus_write_data[ERR_BIT]
						&& bus_write_strb[ERR_BIT/8])
				r_err <= 1'b0;
			if (bus_jump && r_halted)
				r_err <= 1'b0;
		end
	end
	// }}}

	// ovw_data
	// {{{
	always @(posedge i_clk)
	if (i_reset)
		ovw_data <= 10'h00;
	else if (!r_halted)
		ovw_data[OVW_VALID] <= 1'b0;
	else begin
		if (M_AXIS_TVALID)
			ovw_data <= { 1'b1, M_AXIS_TLAST, M_AXIS_TDATA };
		if (bus_jump)
			ovw_data[OVW_VALID] <= 1'b0;
	end
`ifdef	FORMAL
	always @(*)
	if (!i_reset && !r_halted)
		assert(ovw_data[OVW_VALID] == 1'b0);
`endif
	// }}}

	// r_manual override, and r_scl, r_sda, manual override values
	// {{{
	generate if (OPT_MANUAL)
	begin : GEN_MANUAL
		// {{{
		reg	manual, scl, sda, o_scl, o_sda;

		initial	{ manual, scl, sda } = 3'b011;
		always @(posedge i_clk)
		if (i_reset)
		begin
			{ manual, scl, sda } <= 3'b011;
		end else if (bus_write && bus_write_addr == ADR_OVERRIDE
				&& bus_write_strb[MANUAL_BIT/8])
		begin
			manual <= bus_write_data[MANUAL_BIT];
			if (!bus_write_data[MANUAL_BIT])
				{ scl, sda } <= 2'b11;
			else
				{ scl, sda } <= bus_write_data[15:14];
		end else if (bus_jump)
			{ manual, scl, sda } <= 3'b011;

		// o_i2c_[sda|scl], muxed based upon r_manual
		// {{{
		initial	{ o_scl, o_sda } = 2'b11;
		always @(posedge i_clk)
		if (i_reset)
			{ o_scl, o_sda } <= 2'b11;
		else if (r_manual)
			{ o_scl, o_sda } <= { r_scl, r_sda };
		else
			{ o_scl, o_sda } <= { w_scl, w_sda };

		assign { o_i2c_scl, o_i2c_sda } = { o_scl, o_sda };
		// }}}

		assign	{ r_manual, r_scl, r_sda } = { manual, scl, sda };
		// }}}
	end else begin : NO_MANUAL
		// {{{
		assign	{ o_i2c_scl, o_i2c_sda } = { w_scl, w_sda };
		assign	{ r_manual, r_scl, r_sda } = { 1'b0, w_scl, w_sda };
		// }}}
	end endgenerate
	// }}}

	assign	w_stopped = r_wait || r_halted;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// I2C Sub-module
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	assign	s_tvalid =  insn_valid && !insn[11]  && !r_wait;
	assign	s_tready =((insn_ready ||  insn[11]) && !r_wait) || r_manual;

`ifndef	FORMAL
	axisi2c #(
		// {{{
		.OPT_WATCHDOG(OPT_WATCHDOG),
		.OPT_LOWPOWER(OPT_LOWPOWER)
		// }}}
	) u_axisi2c (
		// {{{
		.S_AXI_ACLK(i_clk), .S_AXI_ARESETN(!i_reset && !r_manual),
		//
		// Incoming instruction stream
		// {{{
		.S_AXIS_TVALID(s_tvalid), .S_AXIS_TREADY(insn_ready),
			.S_AXIS_TDATA(insn[10:0]),
		// }}}
		// Outgoing received data stream
		// {{{
		.M_AXIS_TVALID(M_AXIS_TVALID), .M_AXIS_TREADY(M_AXIS_TREADY),
			.M_AXIS_TDATA(M_AXIS_TDATA),
			.M_AXIS_TLAST(M_AXIS_TLAST),
		// }}}
		// Control interface
		// {{{
		.i_ckedge(i2c_ckedge),
		.o_stretch(i2c_stretch),
		.o_abort(i2c_abort),
		// }}}
		.i_scl(i_i2c_scl), .i_sda(i_i2c_sda),
		.o_scl(w_scl), .o_sda(w_sda)
		// }}}
	);
`endif
	// }}}

	// mid_axis_pkt, r_channel
	// {{{
	generate if (AXIS_ID_WIDTH > 0)
	begin : GEN_TID
		reg	mid_axis_pkt;
		reg	[AXIS_ID_WIDTH-1:0]	r_channel, axis_tid;

		always @(posedge i_clk)
		if (i_reset || r_halted)
			mid_axis_pkt <= 0;
		else if (s_tvalid && insn_ready
				&& (insn[10:8] == CMD_RXK[2:0]
					||insn[10:8] == CMD_RXN[2:0]
					||insn[10:8] == CMD_RXLK[2:0]
					||insn[10:8] == CMD_RXLN[2:0]))
			mid_axis_pkt <= 1;
		else if (M_AXIS_TVALID && M_AXIS_TREADY)
			mid_axis_pkt <= !M_AXIS_TLAST;

		always @(posedge i_clk)
		if (i_reset || r_halted)
			r_channel <= DEF_CHANNEL;
		else if (insn_valid && insn[11:8] == CMD_CHANNEL && s_tready)
			r_channel <= insn[AXIS_ID_WIDTH-1:0];

		initial	axis_tid = 0;
		always @(posedge i_clk)
		if (i_reset)
			axis_tid <= 0;
		else if (!M_AXIS_TVALID || M_AXIS_TREADY)
		begin
			if (insn_valid && insn[11:8] == CMD_CHANNEL
					&& s_tready && !mid_axis_pkt)
				axis_tid <= insn[AXIS_ID_WIDTH-1:0];
			else if (M_AXIS_TVALID && M_AXIS_TREADY && M_AXIS_TLAST)
				axis_tid <= r_channel;
			else if (!mid_axis_pkt)
				axis_tid <= r_channel;
		end

		assign	M_AXIS_TID = axis_tid;
	end else begin : NO_TID
		assign	M_AXIS_TID = 1'b0;
	end endgenerate
	// }}}

	assign	o_debug = {
			!r_halted || insn_valid,
			ovw_data[OVW_VALID],
			i2c_abort, i2c_stretch, half_insn,
			r_wait, soft_halt_request,
			w_control[21:0] };

	// Keep Verilator happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, S_AXI_AWADDR[1:0], S_AXI_ARADDR[1:0],
			S_AXI_AWPROT, S_AXI_ARPROT };
	// Verilator lint_off UNUSED
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
	reg	f_past_valid;
	wire	[1:0]	faxil_rd_outstanding, faxil_wr_outstanding,
			faxil_awr_outstanding;
	wire	[7:0]	f_const_insn;
	wire		f_const_illegal;
	wire [AW-1:0]	f_address, f_const_addr;


	initial	f_past_valid = 1'b0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;

	always @(*)
	if (!f_past_valid)
		assume(i_reset);

	////////////////////////////////////////////////////////////////////////
	//
	// Assert bus compliance
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	faxil_slave #(
		// {{{
		.C_AXI_DATA_WIDTH(32), .C_AXI_ADDR_WIDTH(4),
		// .F_MAX_ACK_DELAY(2),
		.F_LGDEPTH(2)
		// }}}
	) slv (
		// {{{
		.i_clk(i_clk), .i_axi_reset_n(S_AXI_ARESETN),
		.i_axi_awvalid(S_AXI_AWVALID), .i_axi_awready(S_AXI_AWREADY),
			.i_axi_awaddr(S_AXI_AWADDR),.i_axi_awprot(S_AXI_AWPROT),
		.i_axi_wvalid(S_AXI_WVALID), .i_axi_wready(S_AXI_WREADY),
			.i_axi_wdata(S_AXI_WDATA),.i_axi_wstrb(S_AXI_WSTRB),
		.i_axi_bvalid(S_AXI_BVALID), .i_axi_bready(S_AXI_BREADY),
			.i_axi_bresp(S_AXI_BRESP),
		.i_axi_arvalid(S_AXI_ARVALID), .i_axi_arready(S_AXI_ARREADY),
			.i_axi_araddr(S_AXI_ARADDR),.i_axi_arprot(S_AXI_ARPROT),
		.i_axi_rvalid(S_AXI_RVALID), .i_axi_rready(S_AXI_RREADY),
			.i_axi_rdata(S_AXI_RDATA),.i_axi_rresp(S_AXI_RRESP),
		//
		.f_axi_rd_outstanding(faxil_rd_outstanding),
		.f_axi_wr_outstanding(faxil_wr_outstanding),
		.f_axi_awr_outstanding(faxil_awr_outstanding)
		// }}}
	);

	always @(*)
	if (f_past_valid)
	begin
		assert(faxil_awr_outstanding == (s_axi_bvalid ? 1:0)
			+ (S_AXI_AWREADY ? 0:1));
		assert(faxil_wr_outstanding  == (s_axi_bvalid ? 1:0)
			+ (S_AXI_WREADY ? 0:1));
		assert(faxil_rd_outstanding  == (s_axi_rvalid ? 1:0)
			+ (S_AXI_ARREADY ? 0:1));
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Fetch interface compliance
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	ffetch #(
		// {{{
		.ADDRESS_WIDTH(AW),
		.INSN_WIDTH(8)
		// }}}
	) f_fetch (
		// {{{
		.i_clk(i_clk), .i_reset(i_reset || cpu_reset),
		.cpu_new_pc(cpu_new_pc), .cpu_clear_cache(cpu_clear_cache),
		.cpu_pc(pf_jump_addr), .pf_valid(pf_valid),.cpu_ready(pf_ready),
		.pf_pc(pf_insn_addr),.pf_insn(pf_insn), .pf_illegal(pf_illegal),
		.fc_illegal(f_const_illegal), .fc_insn(f_const_insn),
		.fc_pc(f_const_addr), .f_address(f_address)
		// }}}
	);

	/*
	wire	[AW-1:0]	f_next_addr;
	assign	f_next_addr = f_address + 1;
	always @(*)
	if (!i_reset && !cpu_reset && !cpu_new_pc && !cpu_clear_cache)
		assert(pf_jump_addr == f_next_addr);
	*/
	// }}}

	// Follow commands

	// First, the prefetch and decoding

	always @(*)
	if (f_past_valid)
		assert(!imm_cycle || !half_valid);

	////////////////////////////////////////////////////////////////////////
	//
	// Model the (missing) I2C controller
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
`ifndef	I2CCPU
	(* anyseq *) wire	m_tvalid, m_tlast;
	(* anyseq *) wire [7:0]	m_tdata;

	always @(posedge i_clk)
	if (!f_past_valid)
	begin
		assert(!insn_valid);
	end else if ($past(i_reset || i2c_abort || (OPT_MANUAL && r_manual)
			||bus_manual))
	begin
		assert(!insn_valid);
		assert(!half_valid);
	end else if ($past(s_tvalid && !insn_ready))
	begin
		assert(s_tvalid);
		assert($stable(insn[10:0]));
	end

	always @(posedge i_clk)
	if (!f_past_valid)
	begin
		assume(!m_tvalid);
	end else if ($past(i_reset))
	begin
		assume(!m_tvalid);
	end else if ($past(m_tvalid && !M_AXIS_TREADY))
	begin
		assume(m_tvalid);
		assume($stable(m_tdata));
		assume($stable(m_tlast));
	end

	always @(posedge i_clk)
	if (!f_past_valid || $past(i_reset))
	begin
	end else if ($past(m_tvalid && !M_AXIS_TREADY))
		assert($stable(M_AXIS_TID));

	assign	M_AXIS_TVALID = m_tvalid;
	assign	M_AXIS_TDATA  = m_tdata;
	assign	M_AXIS_TLAST  = m_tlast;
`endif
	// }}}
`endif
// }}}
endmodule
