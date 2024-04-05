////////////////////////////////////////////////////////////////////////////////
//
// Filename:	qflashxpress.v
//
// Project:	CMod S6 System on a Chip, ZipCPU demonstration project
//
// Purpose:	To provide wishbone controlled read access (and read access
//		*only*) to the QSPI flash, using a flash clock of 80MHz, and
//	nothing more.  Indeed, this is designed to be a *very* stripped down
//	version of a flash driver, with the goal of providing 1) very fast
//	access for 2) very low logic count.
//
//	Two modes/states of operation:
//
//	STARTUP
//	 1. Waits for the flash to come on line
//		Start out idle for 300 uS
//	 2. Sends a signal to remove the flash from any QSPI read mode.  In our
//		case, we'll send several clocks of an empty command.  In SPI
//		mode, it'll get ignored.  In QSPI mode, it'll remove us from
//		QSPI mode.
//	 3. Explicitly places and leaves the flash into QSPI mode
//		0xEB 3(0xa0) 0xa0 0xa0 0xa0 4(0x00)
//	 4. All done
//
//	NORMAL-OPS
//	ODATA <- ?, 3xADDR, 0xa0, 0x00, 0x00 | 0x00, 0x00, 0x00, 0x00 ? (22nibs)
//	STALL <- TRUE until closed at the end
//	MODE  <- 2'b10 for 4 clks, then 2'b11
//	CLK   <- 2'b10 before starting, then 2'b01 until the end
//	CSN   <- 0 any time CLK != 2'b11
//
//
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
`default_nettype	none
//
`define	OPT_FLASH_PIPELINE
module	qflashxpress(i_clk, i_reset,
		i_wb_cyc, i_wb_stb, i_wb_addr,
			o_wb_ack, o_wb_stall, o_wb_data,
		o_qspi_sck, o_qspi_cs_n, o_qspi_mod, o_qspi_dat, i_qspi_dat);
	parameter [0:0]	OPT_FLASH_PIPELINE = 1'b1;
	localparam	AW=24-2;
	input			i_clk, i_reset;
	//
	input			i_wb_cyc, i_wb_stb;
	input		[(AW-1):0] i_wb_addr;
	//
	output	reg		o_wb_ack, o_wb_stall;
	output	reg	[31:0]	o_wb_data;
	//
	output	wire	[1:0]	o_qspi_sck;
	output	wire		o_qspi_cs_n;
	output	wire	[1:0]	o_qspi_mod;
	output	wire	[3:0]	o_qspi_dat;
	input	wire	[3:0]	i_qspi_dat;

	//
	//
	// Maintenance / startup portion
	//
	//
	reg	maintenance;
	reg	[14:0]	m_counter;
	reg	[1:0]	m_state;
	reg	[1:0]	m_mod;
	reg		m_cs_n;
	reg	[1:0]	m_clk;
	reg	[31:0]	m_data;
	wire	[3:0]	m_dat;

	initial	maintenance = 1'b1;
	initial	m_counter   = 0;
	initial	m_state     = 2'b00;
	always @(posedge i_clk)
	if (i_reset)
	begin
		maintenance <= 1'b1;
		m_counter   <= 0;
		m_state     <= 2'b00;
	end else begin
		if (maintenance)
			m_counter <= m_counter + 1'b1;
		m_mod <= 2'b00; // SPI mode always for maintenance
		case(m_state)
		2'b00: begin
			// Step one: wait for the flash device to initialize.
			// Perhaps this is more for form than anything else,
			// especially if we just loaded our configuration from
			// the flash, but in case we did not--we do this anyway.
			maintenance <= 1'b1;
			if (m_counter[14:0]==15'h7fff) // 24000 is the limit
				m_state <= 2'b01;
			m_cs_n <= 1'b1;
			m_clk  <= 2'b11;
			end
		2'b01: begin
			// Now that the flash has had a chance to start up, feed
			// it with chip selects with no clocks.   This is
			// guaranteed to remove us from any XIP mode we might
			// be in upon startup.  We do this so that we might be
			// placed into a known mode--albeit the wrong one, but
			// a known one.
			maintenance <= 1'b1;
			//
			// 1111 0000 1111 0000 1111 0000 1111 0000
			// 1111 0000 1111 0000 1111 0000 1111 0000
			// 1111 ==> 17 * 4 clocks, or 68 clocks in total
			//
			if (m_counter[14:0] == 15'd138)
				m_state <= 2'b10;
			m_cs_n <= 1'b0;
			m_clk  <= {(2){!m_counter[2]}};
			m_data <= { 32'hfff0f0ff }; // EB command
			m_data[31:28] <= 0; // just ... not yet
			end
		2'b10: begin
			// Rest, before issuing our initial read command
			maintenance <= 1'b1;
			if (m_counter[14:0] == 15'd138 + 15'd48)
				m_state <= 2'b11;
			m_cs_n <= 1'b1;	// Rest the interface
			m_clk  <= 2'b11;
			m_data <= { 32'hfff0f0ff }; // EB command
			end
		2'b11: begin
			if (m_counter[14:0] == 15'd138+15'd48+15'd10)
				maintenance <= 1'b0;
			m_cs_n <= 1'b0;
			m_clk  <= (m_clk == 2'b11)? 2'b10 : 2'b01;
			if (m_clk == 2'b01) // EB QuadIO Read Cmd
				m_data <= {m_data[27:0], 4'h0};
			// We depend upon the non-maintenance code to provide
			// our first (bogus) address, mode, dummy cycles, and
			// data bits.
			end
		endcase
	end
	assign	m_dat = m_data[31:28];

	//
	//
	// Data / access portion
	//
	//
	reg	[21:0]	busy_pipe;
	reg	[31:0]	data_pipe;
	reg		pre_ack;
	initial	data_pipe = 0;
	always @(posedge i_clk)
		if (((i_wb_stb)&&(!o_wb_stall))||(maintenance))
			data_pipe <= { i_wb_addr, 2'b00, 8'ha0 };
		else if (o_qspi_sck == 2'b01)
			data_pipe <= { data_pipe[27:0], 4'h0 };
	assign	o_qspi_dat = (maintenance)? m_dat : data_pipe[31:28];

	wire	pipe_req, w_pipe_condition;

	generate
	if (OPT_FLASH_PIPELINE)
	begin
		reg	r_pipe_req;

		reg	[(AW-1):0]	last_addr;
		always  @(posedge i_clk)
			if ((i_wb_stb)&&(!o_wb_stall))
				last_addr <= i_wb_addr;

		assign	w_pipe_condition = (pre_ack)&&(i_wb_stb)
				&&(last_addr + 1'b1 == i_wb_addr);

		initial	r_pipe_req = 1'b0;
		always @(posedge i_clk)
			r_pipe_req <= w_pipe_condition;

		assign	pipe_req = r_pipe_req;
	end else begin
		assign	pipe_req = 1'b0;
	end endgenerate


	initial	pre_ack = 0;
	always @(posedge i_clk)
		if ((maintenance)||(!i_wb_cyc))
			pre_ack <= 1'b0;
		else if ((i_wb_stb)&&(!o_wb_stall))
			pre_ack <= 1'b1;
		else if ((o_wb_ack)&&(!pipe_req))
			pre_ack <= 1'b0;

	reg	[43:0]	clk_pipe;
	initial	clk_pipe = -1;
	always @(posedge i_clk)
		if (((i_wb_stb)&&(!o_wb_stall)&&(!pipe_req))||(maintenance))
			clk_pipe <= { 2'b00, {(21){2'b01}}};
		else if (((i_wb_stb)&&(!o_wb_stall))||(maintenance))
			clk_pipe <= { {(8){2'b01}}, {(14){2'b11}} };
		else
			clk_pipe <= { clk_pipe[41:0], 2'b11 };
	assign	o_qspi_sck = (maintenance)? m_clk : clk_pipe[43:42];
	assign	o_qspi_cs_n= (maintenance)?m_cs_n : (clk_pipe[43:42] == 2'b11);

	reg	[9:0]	mod_pipe;
	always @(posedge i_clk)
		if(((i_wb_stb)&&(!o_wb_stall)&&(!pipe_req))||(maintenance))
			mod_pipe <= { 10'h0 }; // Always quad, but in/out
		else
			mod_pipe <= { mod_pipe[8:0], 1'b1 }; // Add input at end
	assign	o_qspi_mod = (maintenance) ? m_mod :(mod_pipe[9]? 2'b11:2'b10);

	initial	busy_pipe = 22'h3fffff;
	always @(posedge i_clk)
		if (((i_wb_stb)&&(!o_wb_stall)&&(!pipe_req))||(maintenance))
			busy_pipe <= { 22'h3fffff };
		else if ((i_wb_stb)&&(!o_wb_stall))
			busy_pipe <= { 22'h3fc000 };
		else
			busy_pipe <= { busy_pipe[20:0], 1'b0 };

	initial	o_wb_stall = 1'b1;
	always @(posedge i_clk)
		o_wb_stall <= ((i_wb_stb)&&(!o_wb_stall))
			||(busy_pipe[19])||((busy_pipe[20])&&(!pipe_req));

	reg	ack_pipe;
	initial	ack_pipe = 1'b0;
	always @(posedge i_clk)
		ack_pipe <= (pre_ack)&&(busy_pipe[20:19] == 2'b10);
	initial	o_wb_ack = 1'b0;
	always @(posedge i_clk)
		o_wb_ack <= (pre_ack)&&(ack_pipe);

	always @(posedge i_clk)
		o_wb_data <= { o_wb_data[27:0], i_qspi_dat };

`ifdef	FORMAL
	localparam	F_LGDEPTH=3;
	reg	f_past_valid;
	wire	[(F_LGDEPTH-1):0]	f_nreqs, f_nacks,
					f_outstanding;
	reg	[(AW-1):0]	f_last_pc;
	reg			f_last_pc_valid;
	reg	[(AW-1):0]	f_req_addr;
//
//
// Generic setup
//
//
`ifdef	PREFETCH
`define	ASSUME	assume
	reg	f_last_clk;
	initial	assume(f_last_clk == 1);
	initial	assume(i_clk == 0);
	always @($global_clock)
	begin
		assume(i_clk != f_last_clk);
		f_last_clk <= !f_last_clk;
	end
`else
`define	ASSUME	assert
`endif

	// Assume a clock

	// Keep track of a flag telling us whether or not $past()
	// will return valid results
	initial	f_past_valid = 1'b0;
	always @(posedge i_clk)
		f_past_valid = 1'b1;

	/////////////////////////////////////////////////
	//
	//
	// Assumptions about our inputs
	//
	//
	/////////////////////////////////////////////////

	//
	// Nothing changes, but on the positive edge of a clock
	//
	always @($global_clock)
	if (!$rose(i_clk))
	begin
		// Control inputs from the CPU
		`ASSUME($stable(i_reset));
		`ASSUME($stable(i_new_pc));
		`ASSUME($stable(i_clear_cache));
		`ASSUME($stable(i_stalled_n));
		`ASSUME($stable(i_pc));
	end


	formal_slave #(.AW(AW), .DW(DW),.F_LGDEPTH(F_LGDEPTH),
			.F_LGDEPTH(7),
			.F_MAX_REQUESTS(2),
			.F_MAX_STALL(25),
			.F_MAX_ACK_DELAY(25),
			.F_OPT_RMW_BUS_OPTION(0),
			.F_OPT_DISCONTINUOUS(1))
		f_wbm(i_clk, i_reset,
			o_wb_cyc, o_wb_stb, 1'b0, o_wb_addr, o_wb_data, 4'h0,
			i_wb_ack, i_wb_stall, i_wb_data, i_wb_err,
			f_nreqs, f_nacks, f_outstanding);


	always @(posedge i_clk)
		if ((f_past_valid)&&($past(pipe_req))&&($past(o_wb_stall))
				&&(i_wb_stb))
			assert($stable(pipe_req));

	always @(*)
		if (maintenance)
			assert(o_wb_stall);;

	always @(posedge i_clk)
		if ((f_past_valid)&&(!$past(i_reset))&&($past(maintenance)))
			assert(m_counter == $past(m_counter)+1'b1);

	always @(posedge i_clk)
		if ((f_past_valid)&&($past(maintenance)))
			assert(m_counter <= 15'd138+15'd48+15'd10);
		else
			assert(m_counter == 15'd138+15'd48+15'd10);

	always @(*)
		if (!maintenance)
			assert(o_qspi_mod[1]);

	assign	f_rd = (!o_qspi_mod[0]);
	assign	f_wr = ( o_qspi_mod[0]);

	localparam	FD = 32;

	initial	f_cs_n = {(FD){1'b1}};
	initial	f_sck  = {(2*FD){1'b1}};
	initial	f_qdat = {(4*FD){1'b1}};
	initial	f_dir  = {(FD){1'b1}};
	always @(posedge i_clk)
		if ((!f_past_valid)||(i_reset)||(maintenance))
		begin
			f_cs_n <= {(FD){1'b1}};
			f_sck  <= {(2*FD){1'b1}};
			f_qdat <= {(4*FD){1'b1}};
			f_dir  <= {(FD){1'b1}};
		end else if ((f_past_valid)&&(!$past(o_wb_stall))&&($past(o_wb_cyc)))
		begin
			f_cs_n <= {(FD){1'b1}};
			f_sck  <= {(2*FD){1'b1}};
			f_qdat <= {(4*FD){1'b1}};
			f_dir  <= {(FD){1'b1}};
		end else begin
			f_cs_n <= { f_cs_n[  (FD-2):0], o_qspi_cs_n };
			f_sck  <= { f_sck[ (2*FD-3):0],  o_qspi_sck  };
			f_qdat <= { f_qdat[(4*FD-5):0],
					(f_rd) ? i_qspi_dat : o_qspi_dat };
			f_dir  <= { f_dir[   (FD-2):0],  f_wr };
		end

	always @(posedge i_clk)
		if (f_sck[3:2] == 2'b11)
		begin
			asssert(f_cs_n[1]);
			assert((f_sck[1:0] == 2'b10)||(f_sck[1:0] == 2'b11));
			assert(f_cs_n[0] == f_sck[0]);
		end else if (f_sck[3:2] == 2'b10)
		begin
			assert(f_cs_n[1:0] == 2'b00);
			assert(f_sck[1:0] == 2'b01)
		end else if (f_sck[3:2] == 2'b01);
		begin
			assert(f_cs_n[1:0] == 2'b01);
			assert(f_sck[1:0] == 2'b11);
		else
			// Should *NEVER* be here.
			assert(f_sck[3:2] != 2'b00);

	always @(posedge i_clk)
		for(k=2; k<32; k=k+1)
			if (f_cs_n[k:(k-1)]==2'b10)
				assert(f_cs_n[(k-1):0] == 0);


	initial	f_phase <= 0;
	always @(posedge i_clk)
		if (o_qspi_cs_n)
			f_phase <= 0;
		else if (f_phase == 4'hc)
			f_phase <= 4'h2;
		else
			f_phase <= f_phase + 1'b1;

`endif
endmodule
// Originally:			   (XPRS)
//   Number of wires:                135
//   Number of wire bits:            556
//   Number of public wires:          30
//   Number of public wire bits:     265
//   Number of memories:               0
//   Number of memory bits:            0
//   Number of processes:              0	(R/O)	(FULL)
//   Number of cells:                413	889	1248
//     FDRE                          168	231	 281
//     LUT1                            6	 23	  23
//     LUT2                           61	 83	 203
//     LUT3                           60	 67	 166
//     LUT4                            9	 29	  57
//     LUT5                            6	 50	  95
//     LUT6                           24	215	 256
//     MUXCY                          35	 59	  59
//     MUXF7                           5	 60	  31
//     MUXF8                           2	  5	  10
//     XORCY                          37	 67	  67

