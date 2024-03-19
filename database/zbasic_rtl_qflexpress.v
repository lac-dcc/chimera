////////////////////////////////////////////////////////////////////////////////
//
// Filename:	qflexpress.v
//
// Project:	A Set of Wishbone Controlled SPI Flash Controllers
//
// Purpose:	To provide wishbone controlled read access (and read access
//		*only*) to the QSPI flash, using a flash clock equal to the
//	system clock, and nothing more.  Indeed, this is designed to be a
//	*very* stripped down version of a flash driver, with the goal of
//	providing 1) very fast access for 2) very low logic count.
//
//	Three modes/states of operation:
//	1. Startup/maintenance, places the device in the Quad XIP mode
//	2. Normal operations, takes 12+8N clocks to read a value
//	3. Configuration--useful to allow an external controller issue erase
//		or program commands (or other) without requiring us to
//		clutter up the logic with a giant state machine
//
//	STARTUP
//	 1. Waits for the flash to come on line
//		Start out idle for 300 uS
//	 2. Sends a signal to remove the flash from any QSPI read mode.  In our
//		case, we'll send several clocks of an empty command.  In SPI
//		mode, it'll get ignored.  In QSPI mode, it'll remove us from
//		QSPI mode.
//	 3. Explicitly places and leaves the flash into QSPI mode
//		0xEB 3(0x00) 0xa0 6(0x00)
//	 4. All done
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2018-2020, Gisselquist Technology, LLC
//
// This file is part of the set of Wishbone controlled SPI flash controllers
// project
//
// The Wishbone SPI flash controller project is free software (firmware):
// you can redistribute it and/or modify it under the terms of the GNU Lesser
// General Public License as published by the Free Software Foundation, either
// version 3 of the License, or (at your option) any later version.
//
// The Wishbone SPI flash controller project is distributed in the hope
// that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTIBILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  (It's in the $(ROOT)/doc directory.  Run make
// with no target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	LGPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/lgpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
//
// 290 raw, 372 w/ pipe, 410 cfg, 499 cfg w/pipe
module	qflexpress(i_clk, i_reset,
		i_wb_cyc, i_wb_stb, i_wb_we, i_wb_addr, i_wb_data, i_wb_sel,
			o_wb_stall, o_wb_ack, o_wb_data,
		i_cfg_cyc, i_cfg_stb, i_cfg_we, i_cfg_data, i_cfg_sel,
			o_cfg_stall, o_cfg_ack, o_cfg_data,
		o_qspi_sck, o_qspi_cs_n, o_qspi_mod, o_qspi_dat, i_qspi_dat,
		o_dbg_trigger, o_debug);
	//
	// LGFLASHSZ is the size of the flash memory.  It defines the number
	// of bits in the address register and more.  This controller will support
	// flash sizes up to 2^LGFLASHSZ, where LGFLASHSZ goes up to 32.
	parameter	LGFLASHSZ=24;
	//
	// OPT_PIPE makes it possible to string multiple requests together,
	// with no intervening need to shutdown the QSPI connection and send a
	// new address
	parameter [0:0]	OPT_PIPE    = 1'b1;
	//
	// OPT_CFG enables the configuration logic port, and hence the
	// ability to erase and program the flash, as well as the ability
	// to perform other commands such as read-manufacturer ID, adjust
	// configuration registers, etc.
	parameter [0:0]	OPT_CFG     = 1'b1;
	//
	// OPT_STARTUP enables the startup logic
	parameter [0:0]	OPT_STARTUP = 1'b1;
	//
	// OPT_ADDR32 enables 32 bit addressing, rather than 24bit
	// Control this by controlling the LGFLASHSZ parameter above.  Anything
	// greater than 24 will use 32-bit addressing, otherwise the regular
	// 24-bit addressing
	localparam [0:0]	OPT_ADDR32 = (LGFLASHSZ > 24);
	//
	parameter	OPT_CLKDIV = 0;
	//
	// Normally, I place the first byte read from the flash, and the lowest
	// flash address, into bits [7:0], and then shift it up--to where upon
	// return it is found in bits [31:24].  This is ideal for a big endian
	// systems, not so much for little endian systems.  The endian swap
	// allows the bus to swap the return values in order to support little
	// endian systems.
	parameter [0:0]	OPT_ENDIANSWAP = 1'b0;
	//
	// OPT_ODDR will be true any time the clock has no clock division
	localparam [0:0]	OPT_ODDR = (OPT_CLKDIV == 0);
	//
	// CKDV_BITS is the number of bits necessary to represent a counter
	// that can do the CLKDIV division
	localparam 	CKDV_BITS = (OPT_CLKDIV == 0) ? 0
				: ((OPT_CLKDIV <   2) ? 1
				: ((OPT_CLKDIV <   4) ? 2
				: ((OPT_CLKDIV <   8) ? 3
				: ((OPT_CLKDIV <  16) ? 4
				: ((OPT_CLKDIV <  32) ? 5
				: ((OPT_CLKDIV <  64) ? 6
				: ((OPT_CLKDIV < 128) ? 7
				: ((OPT_CLKDIV < 256) ? 8 : 9))))))));
	//
	// RDDELAY is the number of clock cycles from when o_qspi_dat is valid
	// until i_qspi_dat is valid.  Read delays from 0-4 have been verified.
	// DDR Registered I/O on a Xilinx device can be done with a RDDELAY=3
	// On Intel/Altera devices, RDDELAY=2 works
	// I'm using RDDELAY=0 for my iCE40 devices
	//
	parameter	RDDELAY = 0;
	//
	// NDUMMY is the number of "dummy" clock cycles between the 24-bits of
	// the Quad I/O address and the first data bits.  This includes the
	// two clocks of the Quad output mode byte, 0xa0.  The default is 10
	// for a Micron device.  Windbond seems to want 2.  Note your flash
	// device carefully when you choose this value.
	// 
	parameter	NDUMMY = 10;
	//
	// For dealing with multiple flash devices, the OPT_STARTUP_FILE allows
	// a hex file to be provided containing the necessary script to place
	// the design into the proper initial configuration.
	parameter	OPT_STARTUP_FILE="spansion.hex";
	//
	//
	//
	//
	localparam [4:0]	CFG_MODE =	12;
	localparam [4:0]	QSPEED_BIT = 	11;
	// localparam [4:0]	DSPEED_BIT = 	10; // Not supported
	localparam [4:0]	DIR_BIT	= 	 9;
	localparam [4:0]	USER_CS_n = 	 8;
	//
	localparam [1:0]	NORMAL_SPI = 	2'b00;
	localparam [1:0]	QUAD_WRITE = 	2'b10;
	localparam [1:0]	QUAD_READ = 	2'b11;
	// Verilator lint_off UNUSED
	// localparam [7:0] DIO_READ_CMD = 8'hbb;
	localparam [7:0] QIO_READ_CMD = OPT_ADDR32 ? 8'hec : 8'heb;
	// Verilator lint_on  UNUSED
	//
	localparam	AW=LGFLASHSZ-2;
	localparam	DW=32;
	//
	input	wire			i_clk, i_reset;
	//
	// Flash memory port
	input	wire			i_wb_cyc, i_wb_stb, i_wb_we;
	input	wire	[(AW-1):0]	i_wb_addr;
	input	wire	[(DW-1):0]	i_wb_data;
	input	wire	[DW/8-1:0]	i_wb_sel;
	//
	output	wire			o_wb_stall, o_wb_ack;
	output	reg	[(DW-1):0]	o_wb_data;
	//
	// Configuration port
	input	wire			i_cfg_cyc, i_cfg_stb, i_cfg_we;
	input	wire	[(DW-1):0]	i_cfg_data;
	input	wire	[DW/8-1:0]	i_cfg_sel;
	//
	output	wire			o_cfg_stall, o_cfg_ack;
	output	wire	[(DW-1):0]	o_cfg_data;
	//
	output	reg		o_qspi_sck;
	output	reg		o_qspi_cs_n;
	output	reg	[1:0]	o_qspi_mod;
	output	wire	[3:0]	o_qspi_dat;
	input	wire	[3:0]	i_qspi_dat;
	//
	// Debugging port
	output	wire		o_dbg_trigger;
	output	wire	[31:0]	o_debug;

	//
	//
	// Arbitrated bus registers and inputs
	//
	wire		bus_cyc, bus_stb, bus_we, ign_wb_err, ign_cfg_err;
	wire	[(AW-1):0]	bus_addr;
	wire	[31:0]	bus_data;
	wire	[3:0]	bus_sel;
	reg		bus_stall, bus_ack;
	wire		cfg_bus_stb, mem_bus_stb;

	generate if (OPT_CFG)
	begin
		wire	cfg_bus_grant;
		//
		// Memory vs Configuration bus arbiter
		//
		wbarbiter #(.DW(DW), .AW(AW+1), .SCHEME("PRIORITY"),
				.F_MAX_STALL(0),
				.F_MAX_ACK_DELAY(0))
		arbiter(i_clk, i_reset,
			i_wb_cyc, i_wb_stb, i_wb_we, { 1'b0, i_wb_addr },
				i_wb_data, i_wb_sel,
				o_wb_stall, o_wb_ack, ign_wb_err,
			i_cfg_cyc, i_cfg_stb, i_cfg_we, { 1'b1, i_wb_addr },
				i_cfg_data, i_cfg_sel,
				o_cfg_stall, o_cfg_ack, ign_cfg_err,
			bus_cyc, bus_stb, bus_we, { cfg_bus_grant, bus_addr }, bus_data, bus_sel,
				bus_stall, bus_ack, 1'b0);

		assign	cfg_bus_stb = bus_stb &&  cfg_bus_grant;
		assign	mem_bus_stb = bus_stb && !cfg_bus_grant;
		assign	o_cfg_data = o_wb_data;

		// verilator lint_off UNUSED
		wire	unused;
		assign	unused = &{ 1'b0, bus_data, bus_addr, ign_cfg_err,
					ign_wb_err };
		// verilator lint_on  UNUSED
	end else begin
		assign	bus_cyc  = i_wb_cyc;
		assign	bus_stb  = i_wb_stb;
		assign	bus_we   = i_wb_we;
		assign	bus_addr = i_wb_addr;
		assign	bus_data = i_wb_data;
		assign	bus_sel  = i_wb_sel;

		assign	o_wb_ack   = bus_ack;
		assign	o_wb_stall = bus_stall;

		assign	mem_bus_stb = bus_stb;
		assign	cfg_bus_stb = 0;
		assign	o_cfg_ack   = i_cfg_stb;
		assign	o_cfg_stall = 0;
		assign	o_cfg_data  = 0;
	end endgenerate


	reg		dly_ack, read_sck, xtra_stall;
	// clk_ctr must have enough bits for ...
	//	6		address clocks, 4-bits each
	//	NDUMMY		dummy clocks, including two mode bytes
	//	8		data clocks
	//	(RDDELAY clocks not counted here)
	reg	[4:0]	clk_ctr;

	//
	// User override logic
	//
	reg	cfg_mode, cfg_speed, cfg_dir, cfg_cs;
	wire	cfg_write, cfg_hs_write, cfg_ls_write, cfg_hs_read,
		user_request, bus_request, pipe_req, cfg_noop, cfg_stb;
	//
	assign	bus_request  = (mem_bus_stb)&&(!bus_stall)
					&&(!bus_we)&&(!cfg_mode);
	assign	cfg_stb      = (OPT_CFG)&&(cfg_bus_stb)&&(!bus_stall);
	assign	cfg_noop     = ((cfg_stb)&&((!bus_we)||(!i_cfg_data[CFG_MODE])
					||(i_cfg_data[USER_CS_n])))
				||((!OPT_CFG)&&(cfg_bus_stb)&&(!bus_stall));
	assign	user_request = (cfg_stb)&&(i_cfg_we)&&(i_cfg_data[CFG_MODE]);

	assign	cfg_write    = (user_request)&&(!i_cfg_data[USER_CS_n]);
	assign	cfg_hs_write = (cfg_write)&&(i_cfg_data[QSPEED_BIT])
					&&(i_cfg_data[DIR_BIT]);
	assign	cfg_hs_read  = (cfg_write)&&(i_cfg_data[QSPEED_BIT])
					&&(!i_cfg_data[DIR_BIT]);
	assign	cfg_ls_write = (cfg_write)&&(!i_cfg_data[QSPEED_BIT]);


	reg		ckstb, ckpos, ckneg, ckpre;
	reg		maintenance;
	reg	[1:0]	m_mod;
	reg		m_cs_n;
	reg		m_clk;
	reg	[3:0]	m_dat;


	generate if (OPT_ODDR)
	begin

		always @(*)
		begin
			ckstb = 1'b1;
			ckpos = 1'b1;
			ckneg = 1'b1;
			ckpre = 1'b1;
		end

	end else if (OPT_CLKDIV == 1)
	begin : CKSTB_ONE

		reg	clk_counter;

		initial	clk_counter = 1'b1;
		always @(posedge i_clk)
		if (i_reset)
			clk_counter <= 1'b1;
		else if (clk_counter != 0)
			clk_counter <= 1'b0;
		else if (bus_request)
			clk_counter <= (pipe_req);
		else if ((maintenance)||(!o_qspi_cs_n && bus_stall))
			clk_counter <= 1'b1;

		always @(*)
		begin
			ckpre = (clk_counter == 1);
			ckstb = (clk_counter == 0);
			ckpos = (clk_counter == 1);
			ckneg = (clk_counter == 0);
		end

	end else begin : CKSTB_GEN

		reg	[CKDV_BITS-1:0]	clk_counter;

		initial	clk_counter = OPT_CLKDIV;
		always @(posedge i_clk)
		if (i_reset)
			clk_counter <= OPT_CLKDIV;
		else if (clk_counter != 0)
			clk_counter <= clk_counter - 1;
		else if (bus_request)
			clk_counter <= (pipe_req ? OPT_CLKDIV : 0);
		else if ((maintenance)||(!o_qspi_cs_n && bus_stall))
			clk_counter <= OPT_CLKDIV;

		initial	ckpre = (OPT_CLKDIV == 1);
		initial	ckstb = 1'b0;
		initial	ckpos = (OPT_CLKDIV == 1);
		always @(posedge i_clk)
		if (i_reset)
		begin
			ckpre <= (OPT_CLKDIV == 1);
			ckstb <= 1'b0;
			ckpos <= (OPT_CLKDIV == 1);
		end else // if (OPT_CLKDIV > 1)
		begin
			ckpre <= (clk_counter == 2);
			ckstb <= (clk_counter == 1);
			ckpos <= (clk_counter == (OPT_CLKDIV+1)/2+1);
		end

		always @(*)
			ckneg = ckstb;
	end endgenerate

	//
	//
	// Maintenance / startup portion
	//
	//
	generate if (OPT_STARTUP)
	begin : GEN_STARTUP
		localparam	M_WAITBIT=10;
		localparam	M_LGADDR=5;
		localparam	M_FIRSTIDX=0;

		reg	[M_WAITBIT:0]	m_this_word;
		reg	[M_WAITBIT:0]	m_cmd_word	[0:(1<<M_LGADDR)-1];
		reg	[M_LGADDR-1:0]	m_cmd_index;

		reg	[M_WAITBIT-1:0]	m_counter;
		reg			m_midcount;
		reg	[3:0]		m_bitcount;
		reg	[7:0]		m_byte;

		// Let's script our startup with a series of commands.
		// These commands are specific to the Micron Serial NOR flash
		// memory that was on the original Arty A7 board.  Switching
		// from one memory to another should only require adjustments
		// to this startup sequence, and to the flashdrvr.cpp module
		// found in sw/host.
		//
		// The format of the data words is ...
		//	1'bit (MSB) to indicate this is a counter word.
		//		Counter words count a number of idle cycles,
		//		in which the port is unused (CSN is high)
		//
		//	2'bit mode.  This is either ...
		//	    NORMAL_SPI, for a normal SPI interaction:
		//			MOSI, MISO, WPn and HOLD
		//	    QUAD_READ, all four pins set as inputs.  In this
		//			startup, the input values will be
		//			ignored.
		//	or  QUAD_WRITE, all four pins are outputs.  This is
		//			important for getting the flash into
		//			an XIP mode that we can then use for
		//			all reads following.
		//
		//	8'bit data	To be sent 1-bit at a time in NORMAL_SPI
		//			mode, or 4-bits at a time in QUAD_WRITE
		//			mode.  Ignored otherwis
		//
		integer k;
		initial if (OPT_STARTUP_FILE != 0)
			$readmemh(OPT_STARTUP_FILE, m_cmd_word);
		else begin
		for(k=0; k<(1<<M_LGADDR); k=k+1)
			m_cmd_word[k] = -1;
		// cmd_word= m_ctr_flag, m_mod[1:0],
		//			m_cs_n, m_clk, m_data[3:0]
		// Start off idle
		//	This is really redundant since all of our commands are
		//	idle's.
		m_cmd_word[5'h07] = -1;
		//
		// Since we don't know what mode we started in, whether the
		// device was left in XIP mode or some other mode, we'll start
		// by exiting any mode we might have been in.
		//
		// The key to doing this is to issue a non-command, that can
		// also be interpreted as an XIP address with an incorrect
		// mode bit.  That will get us out of any XIP mode, and back
		// into a SPI mode we might use.  The command is issued in
		// NORMAL_SPI mode, however, since we don't know if the device
		// is initially in XIP or not.
		//
		// Exit any QSPI mode we might've been in
		m_cmd_word[5'h08] = { 1'b0, NORMAL_SPI, 8'hff }; // Addr 1
		m_cmd_word[5'h09] = { 1'b0, NORMAL_SPI, 8'hff }; // Addr 2
		m_cmd_word[5'h0a] = { 1'b0, NORMAL_SPI, 8'hff }; // Addr 2
		// Idle
		m_cmd_word[5'h0b] = { 1'b1, 10'h3f };
		//
		// Write configuration register
		//
		// The write enable must come first: 06
		m_cmd_word[5'h0c] = { 1'b0, NORMAL_SPI, 8'h06 };
		//
		// Idle
		m_cmd_word[5'h0d] = { 1'b1, 10'h3ff };
		//
		// Write configuration register, follows a write-register
		m_cmd_word[5'h0e] = { 1'b0, NORMAL_SPI, 8'h01 };	// WRR
		m_cmd_word[5'h0f] = { 1'b0, NORMAL_SPI, 8'h00 };	// status register
		m_cmd_word[5'h10] = { 1'b0, NORMAL_SPI, 8'h02 };	// Config register
		//
		// Idle
		m_cmd_word[5'h11] = { 1'b1, 10'h3ff };
		m_cmd_word[5'h12] = { 1'b1, 10'h3ff };
		//
		//
		// WRDI: write disable: 04
		m_cmd_word[5'h13] = { 1'b0, NORMAL_SPI, 8'h04 };
		//
		// Idle
		m_cmd_word[5'h14] = { 1'b1, 10'h3ff };
		//
		// Enter into QSPI mode, 0xeb, 0,0,0
		// 0xeb
		m_cmd_word[5'h15] = { 1'b0, NORMAL_SPI, 8'heb };
		// Addr #1
		m_cmd_word[5'h16] = { 1'b0, QUAD_WRITE, 8'h00 };
		// Addr #2
		m_cmd_word[5'h17] = { 1'b0, QUAD_WRITE, 8'h00 };
		// Addr #3
		m_cmd_word[5'h18] = { 1'b0, QUAD_WRITE, 8'h00 };
		// Mode byte
		m_cmd_word[5'h19] = { 1'b0, QUAD_WRITE, 8'ha0 };
		// Dummy clocks, x6 for this flash
		m_cmd_word[5'h1a] = { 1'b0, QUAD_WRITE, 8'h00 };
		m_cmd_word[5'h1b] = { 1'b0, QUAD_WRITE, 8'h00 };
		m_cmd_word[5'h1c] = { 1'b0, QUAD_WRITE, 8'h00 };
		// Now read a byte for form
		m_cmd_word[5'h1d] = { 1'b0, QUAD_READ, 8'h00 };
		//
		// Idle -- These last two idles are *REQUIRED* and not optional
		// (although they might be able to be trimmed back a bit...)
		m_cmd_word[5'h1e] = -1;
		m_cmd_word[5'h1f] = -1;
		// Then we are in business!
		end

		reg	m_final;

		wire	m_ce, new_word;
		assign	m_ce = (!m_midcount)&&(ckstb);
		assign	new_word = (m_ce && m_bitcount == 0);

		//
		initial	maintenance = 1'b1;
		initial	m_cmd_index = M_FIRSTIDX;
		always @(posedge i_clk)
		if (i_reset)
		begin
			m_cmd_index <= M_FIRSTIDX;
			maintenance <= 1'b1;
		end else if (new_word)
		begin
			maintenance <= (maintenance)&&(!m_final);
			if (!(&m_cmd_index))
				m_cmd_index <= m_cmd_index + 1'b1;
		end

		initial	m_this_word = -1;
		always @(posedge i_clk)
		if (new_word)
			m_this_word <= m_cmd_word[m_cmd_index];

		initial	m_final = 1'b0;
		always @(posedge i_clk)
		if (i_reset)
			m_final <= 1'b0;
		else if (new_word)
			m_final <= (m_final || (&m_cmd_index));

		//
		// m_midcount .. are we in the middle of a counter/pause?
		//
		initial	m_midcount = 1;
		initial	m_counter   = -1;
		always @(posedge i_clk)
		if (i_reset)
		begin
			m_midcount <= 1'b1;
			m_counter <= -1;
		end else if (new_word)
		begin
			m_midcount <= m_this_word[M_WAITBIT]
					&& (|m_this_word[M_WAITBIT-1:0]);
			if (m_this_word[M_WAITBIT])
			begin
				m_counter <= m_this_word[M_WAITBIT-1:0];
			end
		end else begin
			m_midcount <= (m_counter > 1);
			if (m_counter > 0)
				m_counter <= m_counter - 1'b1;
		end

		initial	m_cs_n      = 1'b1;
		initial	m_mod       = NORMAL_SPI;
		always @(posedge i_clk)
		if (i_reset)
		begin
			m_cs_n <= 1'b1;
			m_mod  <= NORMAL_SPI;
			m_bitcount <= 0;
		end else if (ckstb)
		begin
			if (m_bitcount != 0)
				m_bitcount <= m_bitcount - 1;
			else if ((m_ce)&&(m_final))
			begin
				m_cs_n <= 1'b1;
				m_mod  <= NORMAL_SPI;
				m_bitcount <= 0;
			end else if ((m_midcount)||(m_this_word[M_WAITBIT]))
			begin
				m_cs_n <= 1'b1;
				m_mod  <= NORMAL_SPI;
				m_bitcount <= 0;
			end else begin
				m_cs_n <= 1'b0;
				m_mod  <= m_this_word[M_WAITBIT-1:M_WAITBIT-2];
				m_bitcount <= (!OPT_ODDR && m_cs_n) ? 4'h2 : 4'h1;
				if (!m_this_word[M_WAITBIT-1])
					m_bitcount <= (!OPT_ODDR && m_cs_n) ? 4'h8 : 4'h7;//i.e.7
			end
		end

		always @(posedge i_clk)
		if (m_ce)
		begin
			if (m_bitcount == 0)
			begin
				if (!OPT_ODDR && m_cs_n)
				begin
					m_dat <= {(4){m_this_word[7]}};
					m_byte <= m_this_word[7:0];
				end else begin
					m_dat <= m_this_word[7:4];
					m_byte <= { m_this_word[3:0], 4'h0};
					if (!m_this_word[M_WAITBIT-1])
					begin
						// Slow speed
						m_dat[0]  <= m_this_word[7];
						m_byte <= { m_this_word[6:0], 1'b0 };
					end
				end
			end else begin
				m_dat <= m_byte[7:4];
				m_byte <= { m_byte[3:0], 4'h0 };
				if (!m_mod[1])
				begin
					// Slow speed
					m_dat[0] <= m_byte[7];
					m_byte <= { m_byte[6:0], 1'b0 };
				end else begin
					m_byte <= { m_byte[3:0], 4'b00 };
				end
			end
		end

		if (OPT_ODDR)
		begin
			always @(*)
				m_clk = !m_cs_n;
		end else begin

			always @(posedge i_clk)
			if (i_reset)
				m_clk <= 1'b1;
			else if (m_cs_n)
				m_clk <= 1'b1;
			else if ((!m_clk)&&(ckpos))
				m_clk <= 1'b1;
			else if (m_midcount)
				m_clk <= 1'b1;
			else if (new_word && m_this_word[M_WAITBIT])
				m_clk <= 1'b1;
			else if (ckneg)
				m_clk <= 1'b0;
		end

	end else begin : NO_STARTUP_OPT

		always @(*)
		begin
			maintenance = 0;
			m_mod       = 2'b00;
			m_cs_n      = 1'b1;
			m_clk       = 1'b0;
			m_dat       = 4'h0;
		end

		// verilator lint_off UNUSED
		wire	[8:0] unused_maintenance;
		assign	unused_maintenance = { maintenance,
					m_mod, m_cs_n, m_clk, m_dat };
		// verilator lint_on  UNUSED
	end endgenerate


	reg	[32+(OPT_ADDR32 ? 8:0)+4*(OPT_ODDR ? 0:1)-1:0]	data_pipe;
	reg	pre_ack = 1'b0;
	reg	actual_sck;

	//
	//
	// Data / access portion
	//
	//
	initial	data_pipe = 0;
	always @(posedge i_clk)
	begin
		if (!bus_stall)
		begin
			// Set the high bits to zero initially
			data_pipe <= 0;

			data_pipe[8+LGFLASHSZ-1:0] <= {
					i_wb_addr, 2'b00, 4'ha, 4'h0 };

			if (cfg_bus_stb)
				// High speed configuration I/O
				data_pipe[24+(OPT_ADDR32 ? 8:0) +: 8] <= i_cfg_data[7:0];

			if ((i_cfg_stb)&&(!i_cfg_data[QSPEED_BIT]))
			begin // Low speed configuration I/O
				data_pipe[28+(OPT_ADDR32 ? 8:0)] <= i_cfg_data[7];
				data_pipe[24+(OPT_ADDR32 ? 8:0)] <= i_cfg_data[6];
			end

			if (i_cfg_stb)
			begin // These can be set independent of speed
				data_pipe[20+(OPT_ADDR32 ? 8:0)] <= i_cfg_data[5];
				data_pipe[16+(OPT_ADDR32 ? 8:0)] <= i_cfg_data[4];
				data_pipe[12+(OPT_ADDR32 ? 8:0)] <= i_cfg_data[3];
				data_pipe[ 8+(OPT_ADDR32 ? 8:0)] <= i_cfg_data[2];
				data_pipe[ 4+(OPT_ADDR32 ? 8:0)] <= i_cfg_data[1];
				data_pipe[ 0+(OPT_ADDR32 ? 8:0)] <= i_cfg_data[0];
			end
		end else if (ckstb)
			data_pipe <= { data_pipe[(32+(OPT_ADDR32 ? 8:0)+4*((OPT_ODDR ? 0:1)-1))-1:0], 4'h0 };

		if (maintenance)
			data_pipe[28+(OPT_ADDR32 ? 8:0)+4*(OPT_ODDR ? 0:1) +: 4] <= m_dat;
	end

	assign	o_qspi_dat = data_pipe[28+(OPT_ADDR32 ? 8:0)+4*(OPT_ODDR ? 0:1) +: 4];

	// Since we can't abort any transaction once started, without
	// risking losing XIP mode or any other mode we might be in, we'll
	// keep track of whether this operation should be ack'd upon
	// completion
	always @(posedge i_clk)
	if ((i_reset)||(!bus_cyc))
		pre_ack <= 1'b0;
	else if ((bus_request)||(cfg_write))
		pre_ack <= 1'b1;

	generate if (OPT_PIPE)
	begin : OPT_PIPE_BLOCK
		reg	r_pipe_req;
		wire	w_pipe_condition;

		reg	[(AW-1):0]	next_addr;
		always  @(posedge i_clk)
		if (!bus_stall)
			next_addr <= i_wb_addr + 1'b1;

		assign	w_pipe_condition = (mem_bus_stb)
				&&(!i_wb_we)&&(pre_ack)
				&&(!maintenance)
				&&(!cfg_mode)
				&&(!o_qspi_cs_n)
				&&(|clk_ctr[2:0])
				&&(next_addr == i_wb_addr);

		initial	r_pipe_req = 1'b0;
		always @(posedge i_clk)
		if ((clk_ctr == 1)&&(ckstb))
			r_pipe_req <= 1'b0;
		else
			r_pipe_req <= w_pipe_condition;

		assign	pipe_req = r_pipe_req;
	end else begin
		assign	pipe_req = 1'b0;
	end endgenerate


	initial	clk_ctr = 0;
	always @(posedge i_clk)
	if ((i_reset)||(maintenance))
		clk_ctr <= 0;
	else if ((bus_request)&&(!pipe_req))
		// Notice that this is only for
		// regular bus reads, and so the check for
		// !pipe_req
		clk_ctr <= 5'd14 + NDUMMY + (OPT_ADDR32 ? 2:0)+(OPT_ODDR ? 0:1);
	else if (bus_request) // && pipe_req
		// Otherwise, if this is a piped read, we'll
		// reset the counter back to eight.
		clk_ctr <= 5'd8;
	else if (cfg_ls_write)
		clk_ctr <= 5'd8 + ((OPT_ODDR) ? 0:1);
	else if (cfg_write)
		clk_ctr <= 5'd2 + ((OPT_ODDR) ? 0:1);
	else if ((ckstb)&&(|clk_ctr))
		clk_ctr <= clk_ctr - 1'b1;

	initial	o_qspi_sck = (!OPT_ODDR);
	always @(posedge i_clk)
	if (i_reset)
		o_qspi_sck <= (!OPT_ODDR);
	else if (maintenance)
		o_qspi_sck <= m_clk;
	else if ((!OPT_ODDR)&&(bus_request)&&(pipe_req))
		o_qspi_sck <= 1'b0;
	else if ((bus_request)||(cfg_write))
		o_qspi_sck <= 1'b1;
	else if (OPT_ODDR)
	begin
		if ((cfg_mode)&&(clk_ctr <= 1))
			// Config mode has no pipe instructions
			o_qspi_sck <= 1'b0;
		else if (clk_ctr[4:0] > 5'd1)
			o_qspi_sck <= 1'b1;
		else
			o_qspi_sck <= 1'b0;
	end else if (((ckpos)&&(!o_qspi_sck))||(o_qspi_cs_n))
	begin
		o_qspi_sck <= 1'b1;
	end else if ((ckneg)&&(o_qspi_sck)) begin

		if ((cfg_mode)&&(clk_ctr <= 1))
			// Config mode has no pipe instructions
			o_qspi_sck <= 1'b1;
		else if (clk_ctr[4:0] > 5'd1)
			o_qspi_sck <= 1'b0;
		else
			o_qspi_sck <= 1'b1;
	end

	initial	o_qspi_cs_n = 1'b1;
	always @(posedge i_clk)
	if (i_reset)
		o_qspi_cs_n <= 1'b1;
	else if (maintenance)
		o_qspi_cs_n <= m_cs_n;
	else if ((cfg_stb)&&(i_cfg_we))
		o_qspi_cs_n <= (!i_cfg_data[CFG_MODE])||(i_cfg_data[USER_CS_n]);
	else if ((OPT_CFG)&&(cfg_cs))
		o_qspi_cs_n <= 1'b0;
	else if ((bus_request)||(cfg_write))
		o_qspi_cs_n <= 1'b0;
	else if (ckstb)
		o_qspi_cs_n <= (clk_ctr <= 1);

	// Control the mode of the external pins
	// 	NORMAL_SPI: i_miso is an input,  o_mosi is an output
	// 	QUAD_READ:  i_miso is an input,  o_mosi is an input
	// 	QUAD_WRITE: i_miso is an output, o_mosi is an output
	initial	o_qspi_mod =  NORMAL_SPI;
	always @(posedge i_clk)
	if (i_reset)
		o_qspi_mod <= NORMAL_SPI;
	else if (maintenance)
		o_qspi_mod <= m_mod;
	else if ((bus_request)&&(!pipe_req))
		o_qspi_mod <= QUAD_WRITE;
	else if ((bus_request)||(cfg_hs_read))
		o_qspi_mod <= QUAD_READ;
	else if (cfg_hs_write)
		o_qspi_mod <= QUAD_WRITE;
	else if ((cfg_ls_write)||((cfg_mode)&&(!cfg_speed)))
		o_qspi_mod <= NORMAL_SPI;
	else if ((ckstb)&&(clk_ctr <= 5'd9)&&((!cfg_mode)||(!cfg_dir)))
		o_qspi_mod <= QUAD_READ;

	initial	bus_stall = 1'b1;
	always @(posedge i_clk)
	if (i_reset)
		bus_stall <= 1'b1;
	else if (maintenance)
		bus_stall <= 1'b1;
	else if ((RDDELAY > 0)&&(bus_stb)&&(!bus_stall))
		bus_stall <= 1'b1;
	else if ((RDDELAY == 0)&&((cfg_write)||(bus_request)))
		bus_stall <= 1'b1;
	else if (ckstb || clk_ctr == 0)
	begin
		if (ckpre && (mem_bus_stb)&&(pipe_req)&&(clk_ctr == 5'd2))
			bus_stall <= 1'b0;
		else if ((clk_ctr > 1)||(xtra_stall))
			bus_stall <= 1'b1;
		else
			bus_stall <= 1'b0;
	end else if (ckpre && (mem_bus_stb)&&(pipe_req)&&(clk_ctr == 5'd1))
		bus_stall <= 1'b0;

	initial	dly_ack = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		dly_ack <= 1'b0;
	else if ((ckstb)&&(clk_ctr == 1))
		dly_ack <= (bus_cyc)&&(pre_ack);
	else if ((!cfg_bus_stb && bus_stb)&&(!bus_stall)&&(!bus_request))
		dly_ack <= 1'b1;
	else if (cfg_noop)
		dly_ack <= 1'b1;
	else
		dly_ack <= 1'b0;

	generate if (OPT_ODDR)
	begin : SCK_ACTUAL

		always @(*)
			actual_sck = o_qspi_sck;

	end else if (OPT_CLKDIV == 1)
	begin : SCK_ONE

		initial	actual_sck = 1'b0;
		always @(posedge i_clk)
		if (i_reset)
			actual_sck <= 1'b0;
		else
			actual_sck <= (!o_qspi_sck)&&(clk_ctr > 0);

	end else begin : SCK_ANY

		initial	actual_sck = 1'b0;
		always @(posedge i_clk)
		if (i_reset)
			actual_sck <= 1'b0;
		else
			actual_sck <= (o_qspi_sck)&&(ckpre)&&(clk_ctr > 0);

	end endgenerate


`ifdef	FORMAL
	reg	[F_LGDEPTH-1:0]	f_extra;
`endif

	generate if (RDDELAY == 0)
	begin : RDDELAY_NONE

		always @(*)
		begin
			read_sck = actual_sck;
			bus_ack = dly_ack;
			xtra_stall = 1'b0;
		end


	end else
	begin : RDDELAY_NONZERO

		reg	[RDDELAY-1:0]	sck_pipe, ack_pipe, stall_pipe;
		reg	not_done;

		initial	sck_pipe = 0;
		initial	ack_pipe = 0;
		initial	stall_pipe = -1;
		if (RDDELAY > 1)
		begin
			always @(posedge i_clk)
			if (i_reset)
				sck_pipe <= 0;
			else
				sck_pipe <= { sck_pipe[RDDELAY-2:0], actual_sck };

			always @(posedge i_clk)
			if (i_reset || !bus_cyc)
				ack_pipe <= 0;
			else
				ack_pipe <= { ack_pipe[RDDELAY-2:0], dly_ack };

			always @(posedge i_clk)
			if (i_reset)
				stall_pipe <= -1;
			else
				stall_pipe <= { stall_pipe[RDDELAY-2:0], not_done };


		end else begin
			always @(posedge i_clk)
			if (i_reset)
				sck_pipe <= 0;
			else
				sck_pipe <= actual_sck;

			always @(posedge i_clk)
			if (i_reset || !bus_cyc)
				ack_pipe <= 0;
			else
				ack_pipe <= dly_ack;

			always @(posedge i_clk)
			if (i_reset)
				stall_pipe <= -1;
			else
				stall_pipe <= not_done;
		end

		always @(*)
		begin
			not_done = bus_stb && !bus_stall;
			if (clk_ctr > 1)
				not_done = 1'b1;
			if ((clk_ctr == 1)&&(!ckstb))
				not_done = 1'b1;
		end

		always @(*)
			bus_ack = ack_pipe[RDDELAY-1];

		always @(*)
			read_sck = sck_pipe[RDDELAY-1];

		always @(*)
			xtra_stall = |stall_pipe;

	end endgenerate

	always @(posedge i_clk)
	begin
		if (read_sck)
		begin
			if (OPT_ENDIANSWAP)
			begin
				if (!o_qspi_mod[1])
				begin
					o_wb_data <= { o_wb_data[30:24], i_qspi_dat[1],
						o_wb_data[22:16], o_wb_data[31],
						o_wb_data[14:8], o_wb_data[23],
						o_wb_data[6:0], o_wb_data[15] };
				end else begin
					o_wb_data <= { o_wb_data[27:24], i_qspi_dat,
						o_wb_data[19:16], o_wb_data[31:28],
						o_wb_data[11:8], o_wb_data[23:20],
						o_wb_data[3:0], o_wb_data[15:12]};
				end

				if (cfg_mode)
				begin
					// No endian-swapping in config mode
					if (!o_qspi_mod[1])
					o_wb_data[7:0]<= { o_wb_data[6:0], i_qspi_dat[1] };
					else
					o_wb_data[7:0]<= { o_wb_data[3:0], i_qspi_dat };
				end

			end else if (!o_qspi_mod[1])
				// No endian-swapping
				o_wb_data <= { o_wb_data[30:0], i_qspi_dat[1] };
			else
				o_wb_data <= { o_wb_data[27:0], i_qspi_dat };
		end // read_sck

		if ((OPT_CFG)&&(cfg_mode))
			o_wb_data[16:8] <= { 4'b0, cfg_mode, cfg_speed, 1'b0,
				cfg_dir, cfg_cs };
	end


	//
	//
	//  User override access
	//
	//
	initial	cfg_mode = 1'b0;
	always @(posedge i_clk)
	if ((i_reset)||(!OPT_CFG))
		cfg_mode <= 1'b0;
	else if ((cfg_bus_stb)&&(!bus_stall)&&(i_cfg_we))
		cfg_mode <= i_cfg_data[CFG_MODE];

	initial	cfg_cs = 1'b0;
	always @(posedge i_clk)
	if ((i_reset)||(!OPT_CFG))
		cfg_cs <= 1'b0;
	else if ((cfg_bus_stb)&&(!bus_stall)&&(i_cfg_we))
		cfg_cs    <= (!i_cfg_data[USER_CS_n])&&(i_cfg_data[CFG_MODE]);

	initial	cfg_speed = 1'b0;
	initial	cfg_dir   = 1'b0;
	always @(posedge i_clk)
	if (!OPT_CFG)
	begin
		cfg_speed <= 1'b0;
		cfg_dir   <= 1'b0;
	end else if ((cfg_bus_stb)&&(!bus_stall)&&(i_cfg_we))
	begin
		cfg_speed <= i_cfg_data[QSPEED_BIT];
		cfg_dir   <= i_cfg_data[DIR_BIT];
	end

	reg	r_last_cfg;

	initial	r_last_cfg = 1'b0;
	always @(posedge i_clk)
		r_last_cfg <= cfg_mode;
	assign	o_dbg_trigger = (!cfg_mode)&&(r_last_cfg);
	assign	o_debug = { o_dbg_trigger,
			bus_cyc, cfg_bus_stb, mem_bus_stb, bus_ack, bus_stall,//6
			o_qspi_cs_n, o_qspi_sck, o_qspi_dat, o_qspi_mod,// 8
			i_qspi_dat, cfg_mode, cfg_cs, cfg_speed, cfg_dir,// 8
			actual_sck, bus_we,
			(((cfg_bus_stb)||(i_cfg_stb))
				&&(bus_we)&&(!bus_stall)&&(!bus_ack))
				? i_cfg_data[7:0] : o_wb_data[7:0]
			};

	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_wb_data, i_cfg_data[31:12], bus_sel };
	// verilator lint_on  UNUSED

`ifdef	FORMAL
// The formal properties for this module are maintained elsewhere
`endif
endmodule
