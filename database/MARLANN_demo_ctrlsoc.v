/*
 *  Copyright (C) 2018  Clifford Wolf <clifford@symbioticeda.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

`timescale 1 ns / 1 ps

module ctrlsoc (
	// 12 MHz clock
	input clk,

	// RS232
	input  ser_rx,
	output ser_tx,

	// SPI Flash
	output flash_clk,
	output flash_csb,
	inout  flash_io0,
	inout  flash_io1,
	inout  flash_io2,
	inout  flash_io3,

	// Status LEDs
	output ledr_n,
	output ledg_n,

	// LEDs and Buttons (PMOD 2)
	output led1,
	output led2,
	output led3,
	output led4,
	output led5,

	// marlann ctrl pins
	output ml_csb,
	output ml_clk,
	output ml_dbg,

	// Camera interface (PMOD 1A/1B)
	input dphy_clk,
	input [1:0] dphy_data,
	input dphy_lp,

	inout cam_sda, cam_scl,
	output cam_enable
);
	reg resetn = 0;
	reg [5:0] reset_cnt = 0;
	reg trigger_reset = 0;

	always @(posedge clk) begin
		reset_cnt <= reset_cnt + !(&reset_cnt);
		resetn <= &reset_cnt;

		if (trigger_reset) begin
			reset_cnt <= 0;
			resetn <= 0;
		end
	end

	wire trap;
	reg buserror = 0;

	reg [7:0] last_flash_clk;

	always @(posedge clk) begin
		last_flash_clk <= {last_flash_clk, flash_clk};
	end

	assign ledr_n = !(trap || buserror);
	assign ledg_n = flash_csb || ((|last_flash_clk) == (&last_flash_clk));

	reg led5_r, led4_r, led3_r, led2_r, led1_r;
	wire camera_heartbeat;

	//assign led1 = led1_r;
	assign led1 = camera_heartbeat;
	assign led2 = led2_r;
	assign led3 = led3_r;
	assign led4 = led4_r;
	assign led5 = led5_r;

	wire        mem_valid;
	wire        mem_instr;
	reg         mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0]  mem_wstrb;
	reg  [31:0] mem_rdata;

	reg spram0_rselect;
	reg spram1_rselect;
	wire [31:0] spram0_rdata;
	wire [31:0] spram1_rdata;

	wire flash_ready;
	wire [31:0] flash_rdata;

	wire rxtx_ready;
	wire [31:0] rxtx_rdata;

	wire camera_ready;
	wire [31:0] camera_rdata;

	picorv32 #(
		.ENABLE_COUNTERS(0),
		.CATCH_MISALIGN(1),
		.CATCH_ILLINSN(1),
		.PROGADDR_RESET(1024*1024),
		.STACKADDR(128*1024)
	) cpu (
		.clk       (clk      ),
		.resetn    (resetn   ),
		.trap      (trap     ),
		.mem_valid (mem_valid),
		.mem_instr (mem_instr),
		.mem_ready (mem_ready || flash_ready || rxtx_ready || camera_ready),
		.mem_addr  (mem_addr ),
		.mem_wdata (mem_wdata),
		.mem_wstrb (mem_wstrb),

		.mem_rdata (
			spram0_rselect ? spram0_rdata :
			spram1_rselect ? spram1_rdata :
			flash_ready    ? flash_rdata  :
			rxtx_ready     ? rxtx_rdata   :
			camera_ready   ? camera_rdata :
			mem_rdata
		)
	);

	wire addr_spram0 = mem_addr < 64*1024;
	wire addr_spram1 = (mem_addr < 128*1024) && !(mem_addr < 64*1024);
	wire addr_flash = (mem_addr < 2*16*1024*1024) && !(mem_addr < 128*1024);
	wire addr_camera = mem_addr[31:24] == 8'h03;

	ctrlsoc_rxtx rxtx (
		.clk    (clk      ),
		.resetn (resetn   ),
		.rx     (ser_rx   ),
		.tx     (ser_tx   ),

		.mem_wvalid (mem_valid && (mem_addr == 32'h 02000004) && |mem_wstrb),
		.mem_wdata  (mem_wdata),
		.mem_rvalid (mem_valid && (mem_addr == 32'h 02000004) && !mem_wstrb),
		.mem_rdata  (rxtx_rdata),
		.mem_ready  (rxtx_ready)
	);

	reg ml_csb_r;
	reg ml_clk_r;

	wire flash_clk_do, flash_csb_do;
	wire flash_io0_oe, flash_io1_oe, flash_io2_oe, flash_io3_oe;
	wire flash_io0_do, flash_io1_do, flash_io2_do, flash_io3_do;
	wire flash_io0_di, flash_io1_di, flash_io2_di, flash_io3_di;

	reg flash_overwrite;
	reg [3:0] flash_overwrite_oe;
	reg [3:0] flash_overwrite_do;

	assign flash_clk = flash_overwrite ? 1'b 1 : flash_clk_do;
	assign flash_csb = flash_overwrite ? 1'b 1 : flash_csb_do;

	assign ml_csb = flash_overwrite ? ml_csb_r : 1'b 1;
	assign ml_clk = ml_clk_r;
	assign ml_dbg = !flash_overwrite;

	SB_IO #(
		.PIN_TYPE(6'b 1010_01),
		.PULLUP(1'b 0)
	) flash_io_buf [3:0] (
		.PACKAGE_PIN({flash_io3, flash_io2, flash_io1, flash_io0}),
		.OUTPUT_ENABLE(flash_overwrite ? flash_overwrite_oe : {flash_io3_oe, flash_io2_oe, flash_io1_oe, flash_io0_oe}),
		.D_OUT_0(flash_overwrite ? flash_overwrite_do : {flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do}),
		.D_IN_0({flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di})
	);

	always @(posedge clk) begin
		mem_ready <= 0;
		spram0_rselect <= 0;
		spram1_rselect <= 0;
		trigger_reset <= 0;

		if (!resetn) begin
			buserror <= 0;
			flash_overwrite <= 0;
			ml_csb_r <= 1;
			ml_clk_r <= 1;
		end else
		if (mem_valid && !mem_ready && !buserror) begin
			(* parallel_case *)
			case (1'b1)
				addr_spram0: begin
					mem_ready <= 1;
					spram0_rselect <= 1;
				end
				addr_spram1: begin
					mem_ready <= 1;
					spram1_rselect <= 1;
				end
				addr_flash: begin
					buserror <= |mem_wstrb;
				end
                addr_camera: begin
                    /* nothing to do here */
                end
				mem_addr == 32'h 02000000: begin
					mem_ready <= 1;
					if (mem_wstrb[0]) begin
						{led5_r, led4_r, led3_r, led2_r, led1_r} <= mem_wdata;
					end
					mem_rdata <= {led5, led4, led3, led2, led1};
				end
				mem_addr == 32'h 02000004: begin
					/* nothing to do here */
				end
				mem_addr == 32'h 02000008: begin
					mem_ready <= 1;
					if (mem_wstrb[3]) begin
						flash_overwrite <= mem_wdata[31];
					end
					if (mem_wstrb[2]) begin
						ml_csb_r <= mem_wdata[17];
						ml_clk_r <= mem_wdata[16];
					end
					if (mem_wstrb[1]) begin
						flash_overwrite_oe <= mem_wdata[11:8];
					end
					if (mem_wstrb[0]) begin
						flash_overwrite_do <= mem_wdata[3:0];
					end
					mem_rdata[31:24] <= {flash_overwrite, 7'b 0000000};
					mem_rdata[23:16] <= {ml_csb_r, ml_clk_r};
					mem_rdata[15:8] <= flash_overwrite_oe;
					mem_rdata[7:0] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
				end
				mem_addr == 32'h 0200000c: begin
					mem_ready <= 1;
					trigger_reset <= |mem_wstrb;
				end
				default: begin
					buserror <= 1;
				end
			endcase
		end
	end

	ctrlsoc_spram spram0 (
		.clk    (clk),
		.enable (addr_spram0 && mem_valid && !mem_ready),
		.addr   (mem_addr[15:0]),
		.wstrb  (mem_wstrb),
		.wdata  (mem_wdata),
		.rdata  (spram0_rdata)
	);

	ctrlsoc_spram spram1 (
		.clk    (clk),
		.enable (addr_spram1 && mem_valid && !mem_ready),
		.addr   (mem_addr[15:0]),
		.wstrb  (mem_wstrb),
		.wdata  (mem_wdata),
		.rdata  (spram1_rdata)
	);

	ctrlsoc_flashio flashio (
		.clk       (clk      ),
		.resetn    (resetn && !flash_overwrite),

		.valid     (addr_flash && mem_valid && !flash_ready),
		.ready     (flash_ready),
		.addr      (mem_addr[23:0]),
		.rdata     (flash_rdata),

		.flash_clk    (flash_clk_do),
		.flash_csb    (flash_csb_do),

		.flash_io0_di (flash_io0_di),
		.flash_io1_di (flash_io1_di),
		.flash_io2_di (flash_io2_di),
		.flash_io3_di (flash_io3_di),

		.flash_io0_do (flash_io0_do),
		.flash_io1_do (flash_io1_do),
		.flash_io2_do (flash_io2_do),
		.flash_io3_do (flash_io3_do),

		.flash_io0_oe (flash_io0_oe),
		.flash_io1_oe (flash_io1_oe),
		.flash_io2_oe (flash_io2_oe),
		.flash_io3_oe (flash_io3_oe)
	);

	cameraif cam (
		.dphy_clk(dphy_clk),
		.dphy_data(dphy_data),
		.dphy_lp(dphy_lp),

		.cam_sda(cam_sda),
		.cam_scl(cam_scl),
		.cam_enable(cam_enable),

		.cam_heartbeat(camera_heartbeat),

		.sys_clk(clk),
		.resetn(resetn),
		.addr(mem_addr[15:0]),
		.wdata(mem_wdata),
		.wstrb(mem_wstrb),
		.valid(addr_camera && mem_valid && !camera_ready),
		.rdata(camera_rdata),
		.ready(camera_ready)
	);
endmodule

module ctrlsoc_spram (
	input         clk,
	input         enable,
	input  [15:0] addr,
	input  [ 3:0] wstrb,
	input  [31:0] wdata,
	output [31:0] rdata
);
	SB_SPRAM256KA spram_hi (
		.ADDRESS(addr[15:2]),
		.DATAIN(wdata[31:16]),
		.MASKWREN({{2{wstrb[3]}}, {2{wstrb[2]}}}),
		.WREN(|wstrb),
		.CHIPSELECT(enable),
		.CLOCK(clk),
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1),
		.DATAOUT(rdata[31:16])
	);

	SB_SPRAM256KA spram_lo (
		.ADDRESS(addr[15:2]),
		.DATAIN(wdata[15:0]),
		.MASKWREN({{2{wstrb[1]}}, {2{wstrb[0]}}}),
		.WREN(|wstrb),
		.CHIPSELECT(enable),
		.CLOCK(clk),
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1),
		.DATAOUT(rdata[15:0])
	);
endmodule

module ctrlsoc_flashio (
	input             clk,
	input             resetn,

	input             valid,
	output reg        ready,
	input      [23:0] addr,
	output reg [31:0] rdata,

	output reg        flash_clk,
	output reg        flash_csb,

	input             flash_io0_di,
	input             flash_io1_di,
	input             flash_io2_di,
	input             flash_io3_di,

	output reg        flash_io0_do,
	output reg        flash_io1_do,
	output reg        flash_io2_do,
	output reg        flash_io3_do,

	output reg        flash_io0_oe,
	output reg        flash_io1_oe,
	output reg        flash_io2_oe,
	output reg        flash_io3_oe
);
	reg [15:0] init_sequence_rom [0:255];
	reg [8:0] init_sequence_cnt;
	reg [15:0] init_sequence_word;
	wire init_sequence_done = init_sequence_cnt[8];

	initial begin
		$readmemh("flashinit.hex", init_sequence_rom);
	end

	always @(posedge clk) begin
		if (!resetn) begin
			init_sequence_cnt <= 0;
		end else begin
			init_sequence_cnt <= init_sequence_cnt + !init_sequence_done;
		end
		init_sequence_word <= init_sequence_rom[init_sequence_cnt[7:0]];
	end

	reg [4:0] state;
	reg [31:0] next_addr;

	always @(posedge clk) begin
		ready <= 0;
		if (!init_sequence_done) begin
			state <= 0;
			flash_clk <= init_sequence_word[9];
			flash_csb <= init_sequence_word[8];
			{flash_io3_oe, flash_io2_oe, flash_io1_oe, flash_io0_oe} <= init_sequence_word[7:4];
			{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= init_sequence_word[3:0];
		end else begin
			case (state)
				0: begin
					next_addr <= addr;
					if (valid && flash_csb) begin
						flash_clk <= 0;
						flash_csb <= 0;
						{flash_io0_oe, flash_io1_oe, flash_io2_oe, flash_io3_oe} <= 4'b 1111;
						{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= addr[23:20];
						state <= 1;
					end else begin
						flash_clk <= 0;
						flash_csb <= 1;
						{flash_io0_oe, flash_io1_oe, flash_io2_oe, flash_io3_oe} <= 0;
						{flash_io0_do, flash_io1_do, flash_io2_do, flash_io3_do} <= 0;
					end
				end
				1: begin
					flash_clk <= 1;
					state <= 2;
				end
				2: begin
					flash_clk <= 0;
					{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= addr[19:16];
					state <= 3;
				end
				3: begin
					flash_clk <= 1;
					state <= 4;
				end
				4: begin
					flash_clk <= 0;
					{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= addr[15:12];
					state <= 5;
				end
				5: begin
					flash_clk <= 1;
					state <= 6;
				end
				6: begin
					flash_clk <= 0;
					{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= addr[11:8];
					state <= 7;
				end
				7: begin
					flash_clk <= 1;
					state <= 8;
				end
				8: begin
					flash_clk <= 0;
					{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= addr[7:4];
					state <= 9;
				end
				9: begin
					flash_clk <= 1;
					state <= 10;
				end
				10: begin
					flash_clk <= 0;
					{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= addr[3:0];
					state <= 11;
				end
				11: begin
					flash_clk <= 1;
					state <= 12;
				end
				12: begin
					flash_clk <= 0;
					{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= 4'h A;
					state <= 13;
				end
				13: begin
					flash_clk <= 1;
					state <= 14;
				end
				14: begin
					flash_clk <= 0;
					{flash_io3_do, flash_io2_do, flash_io1_do, flash_io0_do} <= 4'h 5;
					state <= 15;
				end
				15: begin
					flash_clk <= 1;
					{flash_io0_oe, flash_io1_oe, flash_io2_oe, flash_io3_oe} <= 4'b 0000;
					state <= 16;
				end
				16: begin
					flash_clk <= 0;
					state <= 17;
				end
				17: begin
					flash_clk <= 1;
					rdata[7:4] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
					state <= 18;
				end
				18: begin
					flash_clk <= 0;
					state <= 19;
				end
				19: begin
					flash_clk <= 1;
					rdata[3:0] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
					state <= 20;
				end
				20: begin
					flash_clk <= 0;
					state <= 21;
				end
				21: begin
					flash_clk <= 1;
					rdata[15:12] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
					state <= 22;
				end
				22: begin
					flash_clk <= 0;
					state <= 23;
				end
				23: begin
					flash_clk <= 1;
					rdata[11:8] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
					state <= 24;
				end
				24: begin
					flash_clk <= 0;
					state <= 25;
				end
				25: begin
					flash_clk <= 1;
					rdata[23:20] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
					state <= 26;
				end
				26: begin
					flash_clk <= 0;
					state <= 27;
				end
				27: begin
					flash_clk <= 1;
					rdata[19:16] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
					state <= 28;
				end
				28: begin
					flash_clk <= 0;
					state <= 29;
				end
				29: begin
					flash_clk <= 1;
					rdata[31:28] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
					state <= 30;
				end
				30: begin
					flash_clk <= 0;
					state <= 31;
				end
				31: begin
					flash_clk <= 1;
					rdata[27:24] <= {flash_io3_di, flash_io2_di, flash_io1_di, flash_io0_di};
					if (valid && next_addr == addr) begin
						next_addr <= next_addr + 4;
						ready <= 1;
						state <= 16;
					end
				end
			endcase
			if (valid && next_addr != addr && state != 0) begin
				state <= 0;
				ready <= 0;
			end
		end
	end
endmodule

module ctrlsoc_rxtx (
	input             clk,
	input             resetn,
	input             rx,
	output            tx,

	input             mem_wvalid,
	input      [31:0] mem_wdata,
	input             mem_rvalid,
	output reg [31:0] mem_rdata,
	output reg        mem_ready
);
	localparam [7:0] clkdiv_cnt_steps = 104;

	reg [7:0] clkdiv_cnt = 0;
	reg clkdiv_pulse = 0;

	always @(posedge clk) begin
		clkdiv_cnt <= clkdiv_pulse ? 0 : clkdiv_cnt + 1;
		clkdiv_pulse <= clkdiv_cnt == (104-2);
	end

	reg [7:0] recv_byte;
	reg [7:0] recv_cnt;
	reg [3:0] recv_state;
	reg recv_valid;

	reg rxq;
	reg this_rx;
	reg last_rx;

	always @(posedge clk) begin
		rxq <= rx;
		this_rx <= rxq;
		last_rx <= this_rx;
		recv_cnt <= recv_cnt - |recv_cnt;
		recv_valid <= 0;

		case (recv_state)
			0: begin
				if (last_rx && !this_rx) begin
					recv_cnt <= clkdiv_cnt_steps / 2;
					recv_state <= 1;
				end
			end
			10: begin
				if (!recv_cnt) begin
					recv_valid <= 1;
					recv_state <= 0;
				end
			end
			default: begin
				if (!recv_cnt) begin
					recv_cnt <= clkdiv_cnt_steps;
					recv_byte <= {last_rx, recv_byte[7:1]};
					recv_state <= recv_state + 1;
				end
			end
		endcase

		if (!resetn) begin
			recv_state <= 0;
			recv_valid <= 0;
		end
	end

	reg [31:0] rbuf;
	reg [3:0] rbuf_valid;

	reg [8:0] sbuf;
	reg [3:0] sbuf_cnt;

	assign tx = sbuf[0];

	always @(posedge clk) begin
		mem_rdata <= 'bx;
		mem_ready <= 0;

		if (recv_valid) begin
			if (!rbuf_valid[0])
				rbuf[7:0] <= recv_byte;
			else if (!rbuf_valid[1])
				rbuf[15:8] <= recv_byte;
			else if (!rbuf_valid[2])
				rbuf[23:16] <= recv_byte;
			else if (!rbuf_valid[3])
				rbuf[31:24] <= recv_byte;
			rbuf_valid <= {rbuf_valid, 1'b1};
		end else
		if (mem_rvalid && !mem_ready) begin
			rbuf <= rbuf >> 8;
			rbuf_valid <= rbuf_valid >> 1;
			mem_rdata <= rbuf[7:0] | {32{!rbuf_valid[0]}};
			mem_ready <= 1;
		end

		if (mem_wvalid && !mem_ready) begin
			if (clkdiv_pulse) begin
				if (!sbuf_cnt) begin
					sbuf <= {mem_wdata[7:0], 1'b0};
					sbuf_cnt <= 9;
				end else begin
					sbuf <= {1'b1, sbuf[8:1]};
					sbuf_cnt <= sbuf_cnt - 1;
					mem_ready <= sbuf_cnt == 1;
				end
			end
		end

		if (!resetn) begin
			rbuf_valid <= 0;
			sbuf_cnt <= 0;
			sbuf <= -1;
			mem_ready <= 0;
		end
	end
endmodule
