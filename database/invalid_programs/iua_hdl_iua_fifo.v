/*
 * iua_fifo.v
 *
 * ice40 USB Analyzer - Large FIFO with variable length write / byte reads
 *
 * Copyright (C) 2008  Sylvain Munaut <tnt@246tNt.com>
 *
 * vim: ts=4 sw=4
 */

`ifdef SIM
`default_nettype none
`endif

module iua_fifo (
	input  wire [31:0] di,
	input  wire [ 1:0] diw,
	input  wire wren,
	output wire full,
	output wire [ 7:0] do,
	output wire empty,
	input  wire rden,
	input  wire clk,
	input  wire rst
);
	// Signals
	// -------

	// Input shift register
	reg  [87:0] isr_data;
	reg  [ 3:0] isr_cnt;
	wire [ 3:0] isr_cnt_add;
	wire isr_write;

	reg  [87:0] isr_in_mux;
	reg  [63:0] isr_out_mux;

	wire [ 1:0] isr_in_mux_ctl;
	wire [ 2:0] isr_out_mux_ctl;

	// FIFO core write interface
	wire [63:0] fi_data;
	wire fi_valid;
	wire fi_ready;

	// FIFO core
	reg fc_phase;	// 0=RAM read 1=RAM write
	reg [13:0] fc_wr_ptr;
	reg [13:0] fc_rd_ptr;
	reg [14:0] fc_cnt;
	wire fc_cnt_ce;
	wire fc_cnt_inc;

	// FIFO core read interface
	wire [63:0] fo_data;
	wire fo_valid;
	wire fo_ack;

	// RAM
	wire [13:0] ram_addr;
	wire [63:0] ram_di;
	wire [63:0] ram_do;
	wire ram_wren;

	// Output Shift Register
	reg  [71:0] osr_data;
	reg  [ 3:0] osr_cnt;	// 0xf = Empty, 0x0 = 1 word, 0x1 = 2 bytes, ...
	reg  osr_last;
	wire osr_empty;
	wire osr_ce;
	wire osr_load;
	wire osr_sel;


	// Input shift register
	// --------------------

	// Control
		// Input mux control is trivial
	assign isr_in_mux_ctl = diw;

		// # Valid bytes if we did a load
	assign isr_cnt_add = isr_cnt + diw + 1;

		// Write if we either have enough in buffer, or there
		// is a write and it provides enough to have 64 bits
	assign isr_write = isr_cnt[3] | (wren & isr_cnt_add[3]);

		// Selection of data to write depends on count
	assign isr_out_mux_ctl = isr_cnt[2:0];

	// Data muxes
	always @(*)
		case (isr_in_mux_ctl)
			2'h0:    isr_in_mux <= { di[ 7:0], isr_data[87: 8] };
			2'h1:    isr_in_mux <= { di[15:0], isr_data[87:16] };
			2'h2:    isr_in_mux <= { di[23:0], isr_data[87:24] };
			2'h3:    isr_in_mux <= { di[31:0], isr_data[87:32] };
			default: isr_in_mux <= 88'hxxxxxxxxxxxxxxxxxxxxxx;
		endcase

	always @(*)
		case (isr_out_mux_ctl)
			3'h4:    isr_out_mux <= { di[31:0], isr_data[87:56] };
			3'h5:    isr_out_mux <= { di[23:0], isr_data[87:48] };
			3'h6:    isr_out_mux <= { di[15:0], isr_data[87:40] };
			3'h7:    isr_out_mux <= { di[ 7:0], isr_data[87:32] };
			3'h0:    isr_out_mux <= {           isr_data[87:24] };
			3'h1:    isr_out_mux <= {           isr_data[79:16] };
			3'h2:    isr_out_mux <= {           isr_data[71: 8] };
			3'h3:    isr_out_mux <= {           isr_data[63: 0] };
			default: isr_out_mux <= 64'hxxxxxxxxxxxxxxxx;
		endcase

	// Data register
	always @(posedge clk)
		if (rst)
			isr_data <= 64'h0000000000000000;
		else if (wren)
			isr_data <= isr_in_mux;

	// Counter
	always @(posedge clk)
		if (rst)
			isr_cnt <= 0;
		else
			isr_cnt <= isr_cnt + (wren ? diw + 1 : 4'h0) + ((isr_write & fi_ready) ? 4'h8 : 4'h0);


	// Core FIFO interface
	assign fi_data  = isr_out_mux;
	assign fi_valid = isr_write;


	// Core 64b FIFO logic
	// -------------------

	// Counter
	always @(posedge clk)
		if (rst)
			fc_cnt <= 15'h7fff;
		else if (fc_cnt_ce)
			fc_cnt <= fc_cnt + (fc_cnt_inc ? 15'h0001 : 15'h7fff);

	assign fc_cnt_ce  =  (fo_valid & fo_ack) ^ (fi_valid & fi_ready);
	assign fc_cnt_inc = ~(fo_valid & fo_ack);

	// Alternate phase
	always @(posedge clk)
		if (rst)
			fc_phase <= 1'b0;
		else
			fc_phase <= ~fc_phase;

	// Write
		// Interface
	assign fi_ready = fc_phase;
	assign ram_wren = fi_valid & fi_ready;
	assign ram_di   = fi_data;

		// Pointer
	always @(posedge clk)
		if (rst)
			fc_wr_ptr <= 14'h0000;
		else if (fi_valid & fi_ready)
			fc_wr_ptr <= fc_wr_ptr + 1;

	// Read interface
		// Interface
	assign fo_data  = ram_do;
	assign fo_valid = fc_phase & ~fc_cnt[14];

		// Pointer
	always @(posedge clk)
		if (rst)
			fc_rd_ptr <= 14'h0000;
		else if (fo_valid & fo_ack)
			fc_rd_ptr <= fc_rd_ptr + 1;

	// RAM address mux
	assign ram_addr = fc_phase ? fc_wr_ptr : fc_rd_ptr;


	// RAM storage
	// -----------

	genvar i;
	generate
		for (i=0; i<4; i=i+1)
`ifdef SIM
			SB_SPRAM256KA_SIM mem_I (
`else
			SB_SPRAM256KA mem_I (
`endif
				.DATAIN(ram_di[16*i+15:16*i]),
				.ADDRESS(ram_addr),
				.MASKWREN(4'hf),
				.WREN(ram_wren),
				.CHIPSELECT(1'b1),
				.CLOCK(clk),
				.STANDBY(1'b0),
				.SLEEP(1'b0),
				.POWEROFF(1'b1),
				.DATAOUT(ram_do[16*i+15:16*i])
			);
	endgenerate


	// Output shift register
	// ---------------------

	// Control
	assign osr_empty = osr_cnt[3] & osr_cnt[2];
	assign osr_ce    = rden | (fo_valid & (osr_last | osr_empty));
	assign osr_load  = fo_valid & (osr_last | osr_empty);
	assign osr_sel   = osr_last & ~rden;

	// Core FIFO interface
	assign fo_ack = osr_load;

	// Counter
	always @(posedge clk)
		if (rst)
			osr_cnt <= 4'hf;
		else if (osr_ce)
			if (osr_load)
				osr_cnt <= osr_sel ? 8'h8 : 8'h7;
			else
				osr_cnt <= osr_cnt - 1;

	always @(posedge clk)
		if (rst)
			osr_last <= 1'b0;
		else if (osr_ce)
			if (osr_load)
				osr_last <= 1'b0;
			else
				osr_last <= (osr_cnt == 8'h1);

	// Data
	always @(posedge clk)
		if (rst)
			osr_data <= 0;
		else if (osr_ce)
			if (osr_load)
				osr_data <= osr_sel ? { ram_do, osr_data[7:0] } : { 8'h00, ram_do };
			else
				osr_data <= { 8'h00, osr_data[71:8] };

	// Output
	assign do = osr_data[7:0];
	assign empty = osr_empty;

endmodule // iua_fifo
