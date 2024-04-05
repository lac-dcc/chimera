/*
 * top.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2019-2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none
`include "boards.vh"

module top (
	// Special features
`ifdef MISC_SEL
	output wire [($bits(`MISC_SEL)/2)-1:0] misc,
`endif

	// LED
`ifdef HAS_1LED
	output wire led,
`endif
`ifdef HAS_RGB
	output wire [2:0] rgb,
`endif

	// Debug UART
`ifdef ENABLE_UART
	input  wire uart_rx,
	output wire uart_tx,
`endif

	// Clock
`ifndef USE_HF_OSC
	input  wire clk_in,
`endif

	// Button
	input  wire btn,

	// USB
	inout  wire usb_dp,
	inout  wire usb_dn,
	output wire usb_pu,

	// SPI
	inout  wire spi_mosi,
	inout  wire spi_miso,
	inout  wire spi_clk,
	inout  wire spi_cs_n
);

	localparam WB_N  =  6;
	localparam WB_DW = 32;
	localparam WB_AW = 16;
	localparam WB_AI =  2;

	localparam SPRAM_AW = 14; /* 14 => 64k, 15 => 128k */

	genvar i;


	// Signals
	// -------

	// Memory bus
	wire        mem_valid;
	wire        mem_instr;
	wire        mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_rdata;
	wire [31:0] mem_wdata;
	wire [ 3:0] mem_wstrb;

	// RAM
		// BRAM
	wire [ 7:0] bram_addr;
	wire [31:0] bram_rdata;
	wire [31:0] bram_wdata;
	wire [ 3:0] bram_wmsk;
	wire        bram_we;

		// SPRAM
	wire [14:0] spram_addr;
	wire [31:0] spram_rdata;
	wire [31:0] spram_wdata;
	wire [ 3:0] spram_wmsk;
	wire        spram_we;

	// Wishbone
	wire [ WB_AW   -1:0] wb_addr;
	wire [ WB_DW-1   :0] wb_rdata [0:WB_N-1];
	wire [ WB_DW   -1:0] wb_wdata;
	wire [(WB_DW/8)-1:0] wb_wmsk;
	wire                 wb_we;
	wire [ WB_N    -1:0] wb_cyc;
	wire [ WB_N    -1:0] wb_ack;

	wire [(WB_DW*WB_N)-1:0] wb_rdata_flat;

	// USB Core
		// EP Buffer
	wire [ 8:0] ep_tx_addr_0;
	wire [31:0] ep_tx_data_0;
	wire        ep_tx_we_0;

	wire [ 8:0] ep_rx_addr_0;
	wire [31:0] ep_rx_data_1;
	wire        ep_rx_re_0;

		// Bus interface
	wire [11:0] ub_addr;
	wire [15:0] ub_wdata;
	wire [15:0] ub_rdata;
	wire        ub_cyc;
	wire        ub_we;
	wire        ub_ack;

	// WarmBoot
	reg         boot_now;
	reg   [1:0] boot_sel;

	// Single led
	reg         led_ena;
	reg  [10:0] led_off;
	reg  [10:0] led_on;
	wire        led_i;

	// Clock / Reset logic
	wire clk_24m;
	wire clk_48m;
	wire rst;


	// SoC
	// ---

	// CPU
	picorv32 #(
		.PROGADDR_RESET(32'h 0000_0000),
		.STACKADDR(32'h 0000_0400),
		.BARREL_SHIFTER(0),
		.COMPRESSED_ISA(0),
		.ENABLE_COUNTERS(0),
		.ENABLE_MUL(0),
		.ENABLE_DIV(0),
		.ENABLE_IRQ(0),
		.ENABLE_IRQ_QREGS(0),
		.CATCH_MISALIGN(0),
		.CATCH_ILLINSN(0)
	) cpu_I (
		.clk       (clk_24m),
		.resetn    (~rst),
		.mem_valid (mem_valid),
		.mem_instr (mem_instr),
		.mem_ready (mem_ready),
		.mem_addr  (mem_addr),
		.mem_wdata (mem_wdata),
		.mem_wstrb (mem_wstrb),
		.mem_rdata (mem_rdata)
	);

	// Bus interface
	soc_picorv32_bridge #(
		.WB_N  (WB_N),
		.WB_DW (WB_DW),
		.WB_AW (WB_AW),
		.WB_AI (WB_AI)
	) pb_I (
		.pb_addr     (mem_addr),
		.pb_rdata    (mem_rdata),
		.pb_wdata    (mem_wdata),
		.pb_wstrb    (mem_wstrb),
		.pb_valid    (mem_valid),
		.pb_ready    (mem_ready),
		.bram_addr   (bram_addr),
		.bram_rdata  (bram_rdata),
		.bram_wdata  (bram_wdata),
		.bram_wmsk   (bram_wmsk),
		.bram_we     (bram_we),
		.spram_addr  (spram_addr),
		.spram_rdata (spram_rdata),
		.spram_wdata (spram_wdata),
		.spram_wmsk  (spram_wmsk),
		.spram_we    (spram_we),
		.wb_addr     (wb_addr),
		.wb_wdata    (wb_wdata),
		.wb_wmsk     (wb_wmsk),
		.wb_rdata    (wb_rdata_flat),
		.wb_cyc      (wb_cyc),
		.wb_we       (wb_we),
		.wb_ack      (wb_ack),
		.clk         (clk_24m),
		.rst         (rst)
	);

	for (i=0; i<WB_N; i=i+1)
		assign wb_rdata_flat[i*WB_DW+:WB_DW] = wb_rdata[i];

	// Boot memory
	soc_bram #(
		.INIT_FILE("boot.hex")
	) bram_I (
		.addr  (bram_addr),
		.rdata (bram_rdata),
		.wdata (bram_wdata),
		.wmsk  (bram_wmsk),
		.we    (bram_we),
		.clk   (clk_24m)
	);

	// Main memory
	soc_spram #(
		.AW(SPRAM_AW)
	) spram_I (
		.addr  (spram_addr[SPRAM_AW-1:0]),
		.rdata (spram_rdata),
		.wdata (spram_wdata),
		.wmsk  (spram_wmsk),
		.we    (spram_we),
		.clk   (clk_24m)
	);


	// Misc [0]
	// ----

	// Bus interface
	assign wb_rdata[0] = 0;
	assign wb_ack[0] = wb_cyc[0];

	always @(posedge clk_24m or posedge rst)
		if (rst) begin
			boot_now <= 1'b0;
			boot_sel <= 2'b00;
		end else if (wb_cyc[0] & wb_we & (wb_addr[2:0] == 3'b000)) begin
			boot_now <= wb_wdata[2];
			boot_sel <= wb_wdata[1:0];
		end

	always @(posedge clk_24m or posedge rst)
		if (rst) begin
			led_ena <= 1'b0;
			led_off <= 0;
			led_on  <= 0;
		end else if (wb_cyc[0] & wb_we & (wb_addr[2:0] == 3'b001)) begin
			led_ena <= wb_wdata[31];
			led_off <= wb_wdata[26:16];
			led_on  <= wb_wdata[10: 0];
		end

	// Helper
	dfu_helper #(
		.TIMER_WIDTH(24),
		.BTN_MODE(3),
		.DFU_MODE(1)
	) dfu_helper_I (
		.boot_now (boot_now),
		.boot_sel (boot_sel),
		.btn_pad  (btn),
		.btn_val  (),
		.rst_req  (),
		.clk      (clk_24m),
		.rst      (rst)
	);

	// Single led : only variable rate
`ifdef HAS_1LED
	led_blinker blinker_I (
		.led  (led_i),
		.ena  (led_ena),
		.off  (led_off),
		.on   (led_on),
		.clk  (clk_24m),
		.rst  (rst)
	);

	assign led = ~led_i;
`endif


	// UART [1]
	// ----

`ifdef ENABLE_UART
	uart_wb #(
		.DIV_WIDTH(12),
		.DW(WB_DW)
	) uart_I (
		.uart_tx  (uart_tx),
		.uart_rx  (uart_rx),
		.wb_addr  (wb_addr[1:0]),
		.wb_rdata (wb_rdata[1]),
		.wb_wdata (wb_wdata),
		.wb_we    (wb_we),
		.wb_cyc   (wb_cyc[1]),
		.wb_ack   (wb_ack[1]),
		.clk      (clk_24m),
		.rst      (rst)
	);
`else
	assign wb_ack[1] = wb_cyc[1];
	assign wb_rdata[1] = { wb_cyc[1], 31'h00000000 };	// Always empty
`endif


	// SPI [2]
	// ---

	ice40_spi_wb #(
		.N_CS(1),
		.WITH_IOB(1),
		.UNIT(0)
	) spi_I (
		.pad_mosi (spi_mosi),
		.pad_miso (spi_miso),
		.pad_clk  (spi_clk),
		.pad_csn  (spi_cs_n),
		.wb_addr  (wb_addr[3:0]),
		.wb_rdata (wb_rdata[2]),
		.wb_wdata (wb_wdata),
		.wb_we    (wb_we),
		.wb_cyc   (wb_cyc[2]),
		.wb_ack   (wb_ack[2]),
		.clk      (clk_24m),
		.rst      (rst)
	);


	// RGB LEDs [3]
	// --------

`ifdef HAS_RGB
	ice40_rgb_wb #(
		.CURRENT_MODE("0b1"),
		.RGB0_CURRENT("0b000001"),
		.RGB1_CURRENT("0b000001"),
		.RGB2_CURRENT("0b000001")
	) rgb_I (
		.pad_rgb    (rgb),
		.wb_addr    (wb_addr[4:0]),
		.wb_rdata   (wb_rdata[3]),
		.wb_wdata   (wb_wdata),
		.wb_we      (wb_we),
		.wb_cyc     (wb_cyc[3]),
		.wb_ack     (wb_ack[3]),
		.clk        (clk_24m),
		.rst        (rst)
	);
`else
	reg rgb_ack;
	always @(posedge clk_24m)
		rgb_ack <= wb_cyc[3] & ~rgb_ack;

	assign wb_ack[3] = rgb_ack;
	assign wb_rdata[3] = 0;
`endif


	// USB Core [4 & 5]
	// --------

	// Core
	usb #(
		.EPDW(32)
	) usb_I (
		.pad_dp       (usb_dp),
		.pad_dn       (usb_dn),
		.pad_pu       (usb_pu),
		.ep_tx_addr_0 (ep_tx_addr_0),
		.ep_tx_data_0 (ep_tx_data_0),
		.ep_tx_we_0   (ep_tx_we_0),
		.ep_rx_addr_0 (ep_rx_addr_0),
		.ep_rx_data_1 (ep_rx_data_1),
		.ep_rx_re_0   (ep_rx_re_0),
		.ep_clk       (clk_24m),
		.wb_addr      (ub_addr),
		.wb_rdata     (ub_rdata),
		.wb_wdata     (ub_wdata),
		.wb_we        (ub_we),
		.wb_cyc       (ub_cyc),
		.wb_ack       (ub_ack),
		.clk          (clk_48m),
		.rst          (rst)
	);

	// Cross clock bridge
	xclk_wb #(
		.DW(16),
		.AW(12)
	)  wb_48m_xclk_I (
		.s_addr  (wb_addr[11:0]),
		.s_rdata (wb_rdata[4][15:0]),
		.s_wdata (wb_wdata[15:0]),
		.s_we    (wb_we),
		.s_cyc   (wb_cyc[4]),
		.s_ack   (wb_ack[4]),
		.s_clk   (clk_24m),
		.m_addr  (ub_addr),
		.m_rdata (ub_rdata),
		.m_wdata (ub_wdata),
		.m_we    (ub_we),
		.m_cyc   (ub_cyc),
		.m_ack   (ub_ack),
		.m_clk   (clk_48m),
		.rst     (rst)
	);

	assign wb_rdata[4][31:16] = 16'h0000;

	// EP buffer interface
	wb_epbuf #(
		.AW(9),
		.DW(32)
	) epbuf_I (
		.wb_addr     (wb_addr),
		.wb_rdata    (wb_rdata[5]),
		.wb_wdata    (wb_wdata),
		.wb_we       (wb_we),
		.wb_cyc      (wb_cyc[5]),
		.wb_ack      (wb_ack[5]),
		.ep_tx_addr_0(ep_tx_addr_0),
		.ep_tx_data_0(ep_tx_data_0),
		.ep_tx_we_0  (ep_tx_we_0),
		.ep_rx_addr_0(ep_rx_addr_0),
		.ep_rx_data_1(ep_rx_data_1),
		.ep_rx_re_0  (ep_rx_re_0),
		.clk         (clk_24m),
		.rst         (rst)
	);


	// Special Features
	// ----------------

	// If the boards needs it, we can tie some pins to
	// High-Z, 50% PDM, High, Low
`ifdef MISC_SEL
	reg        misc_osc = 1'b0;
	wire [3:0] misc_opt;
	wire [$bits(`MISC_SEL)-1:0] misc_sel = `MISC_SEL;

	always @(posedge clk_24m)
		misc_osc <= ~misc_osc;

	assign misc_opt = { 2'b10, misc_osc, 1'bz };

	genvar i;
	generate
		for (i=0; i<$bits(`MISC_SEL); i=i+2)
			assign misc[i/2] = misc_opt[misc_sel[i+:2]];
	endgenerate
`endif


	// Clock / Reset
	// -------------

`ifdef SIM
	reg clk_48m_s = 1'b0;
	reg clk_24m_s = 1'b0;
	reg rst_s = 1'b1;

	always #10.42 clk_48m_s <= !clk_48m_s;
	always #20.84 clk_24m_s <= !clk_24m_s;

	initial begin
		#200 rst_s = 0;
	end

	assign clk_48m = clk_48m_s;
	assign clk_24m = clk_24m_s;
	assign rst = rst_s;
`else

`ifdef USE_HF_OSC
	wire clk_in;

	SB_HFOSC #(
		.CLKHF_DIV("0b10")
	) hfosc_I (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk_in)
	);
`endif

	sysmgr sys_mgr_I (
		.clk_in  (clk_in),
		.rst_in  (1'b0),
		.clk_48m (clk_48m),
		.clk_24m (clk_24m),
		.rst_out (rst)
	);
`endif

endmodule // top
