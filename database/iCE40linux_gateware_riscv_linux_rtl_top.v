/*
 * top.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`timescale 1 ns / 100 ps
`default_nettype none

module top (
	// SPI
	inout  wire spi_mosi,
	inout  wire spi_miso,
	inout  wire spi_clk,
	output wire spi_flash_cs_n,

	// HyperRAM
`ifdef MEM_HRAM
	inout  wire [7:0] hram_dq,
	inout  wire       hram_rwds,
	output wire       hram_ck,
	output wire [3:0] hram_cs_n,
	output wire       hram_rst_n,
`endif

	// QPI
`ifdef MEM_QPI
	inout  wire [3:0] qpi_io,
	output wire       qpi_sck,
	output wire [2:0] qpi_cs_n,
`endif

	// Debug UART
	input  wire uart_rx,
	output wire uart_tx,

	// Button
	input  wire btn,

	// LED
	output wire [2:0] rgb,

	// Clock
	input  wire clk_in
);

	localparam integer WB_N  =  4;

	localparam integer WB_DW = 32;
	localparam integer WB_AW = 22;
	localparam integer WB_RW = WB_DW * WB_N;
	localparam integer WB_MW = WB_DW / 8;

	genvar i;


	// Signals
	// -------

	// Vex Misc
	wire [31:0] vex_externalResetVector;
	wire        vex_timerInterrupt;
	wire        vex_softwareInterrupt;
	wire [31:0] vex_externalInterruptArray;

	// Vex busses
	wire        i_axi_ar_valid;
	wire        i_axi_ar_ready;
	wire [31:0] i_axi_ar_payload_addr;
	wire [ 7:0] i_axi_ar_payload_len;
	wire [ 1:0] i_axi_ar_payload_burst;
	wire [ 3:0] i_axi_ar_payload_cache;
	wire [ 2:0] i_axi_ar_payload_prot;
	wire        i_axi_r_valid;
	wire        i_axi_r_ready;
	wire [31:0] i_axi_r_payload_data;
	wire [ 1:0] i_axi_r_payload_resp;
	wire        i_axi_r_payload_last;

	wire        d_wb_cyc;
	wire        d_wb_stb;
	wire        d_wb_ack;
	wire        d_wb_we;
	wire [29:0] d_wb_adr;
	wire [31:0] d_wb_dat_miso;
	wire [31:0] d_wb_dat_mosi;
	wire [ 3:0] d_wb_sel;
	wire        d_wb_err;
	wire [ 1:0] d_wb_bte;
	wire [ 2:0] d_wb_cti;

	// RAM
	wire [27:0] ram_addr;
	wire [31:0] ram_rdata;
	wire [31:0] ram_wdata;
	wire [ 3:0] ram_wmsk;
	wire        ram_we;

	// Cache Request / Response interface
	wire [27:0] cache_req_addr_pre;
	wire        cache_req_valid;
	wire        cache_req_write;
	wire [31:0] cache_req_wdata;
	wire [ 3:0] cache_req_wmsk;

	wire        cache_resp_ack;
	wire        cache_resp_nak;
	wire [31:0] cache_resp_rdata;

	// Memory interface
	wire [23:0] mi_addr;
	wire [ 6:0] mi_len;
	wire        mi_rw;
	wire        mi_linear;
	wire        mi_valid;
	wire        mi_ready;

	wire [31:0] mi_wdata;
	wire [ 3:0] mi_wmsk;
	wire        mi_wack;
	wire        mi_wlast;

	wire [31:0] mi_rdata;
	wire        mi_rstb;
	wire        mi_rlast;

	// HyperRAM PHY
`ifdef MEM_HRAM
	wire [ 1:0] phy_ck_en;

	wire [ 3:0] phy_rwds_in;
	wire [ 3:0] phy_rwds_out;
	wire [ 1:0] phy_rwds_oe;

	wire [31:0] phy_dq_in;
	wire [31:0] phy_dq_out;
	wire [ 1:0] phy_dq_oe;

	wire [ 3:0] phy_cs_n;
	wire        phy_rst_n;

	wire [ 7:0] phy_cfg_wdata;
	wire [ 7:0] phy_cfg_rdata;
	wire        phy_cfg_stb;
`endif

	// QPI PHY
`ifdef MEM_QPI
	wire [15:0] phy_io_i;
	wire [15:0] phy_io_o;
	wire  [3:0] phy_io_oe;
	wire  [3:0] phy_clk_o;
	wire  [2:0] phy_cs_o;
`endif

	// Wishbone
	wire [WB_AW-1:0] wb_addr;
	wire [WB_DW-1:0] wb_rdata [0:WB_N-1];
	wire [WB_RW-1:0] wb_rdata_flat;
	wire [WB_DW-1:0] wb_wdata;
	wire [WB_MW-1:0] wb_wmsk;
	wire             wb_we;
	wire [WB_N -1:0] wb_cyc;
	wire [WB_N -1:0] wb_ack;

	// Clock / Reset logic
	wire [3:0] clk_rd_delay;
	wire clk_1x;
	wire clk_4x;
	wire clk_rd;
	wire sync_4x;
	wire sync_rd;
	wire rst;


	// SoC
	// ---

	// CPU
	VexRiscv cpu_I (
		.externalResetVector      (vex_externalResetVector),
		.timerInterrupt           (vex_timerInterrupt),
		.softwareInterrupt        (vex_softwareInterrupt),
		.externalInterruptArray   (vex_externalInterruptArray),
		.iBusAXI_ar_valid         (i_axi_ar_valid),
		.iBusAXI_ar_ready         (i_axi_ar_ready),
		.iBusAXI_ar_payload_addr  (i_axi_ar_payload_addr),
		.iBusAXI_ar_payload_len   (i_axi_ar_payload_len),
		.iBusAXI_ar_payload_burst (i_axi_ar_payload_burst),
		.iBusAXI_ar_payload_cache (i_axi_ar_payload_cache),
		.iBusAXI_ar_payload_prot  (i_axi_ar_payload_prot),
		.iBusAXI_r_valid          (i_axi_r_valid),
		.iBusAXI_r_ready          (i_axi_r_ready),
		.iBusAXI_r_payload_data   (i_axi_r_payload_data),
		.iBusAXI_r_payload_resp   (i_axi_r_payload_resp),
		.iBusAXI_r_payload_last   (i_axi_r_payload_last),
		.dBusWishbone_CYC         (d_wb_cyc),
		.dBusWishbone_STB         (d_wb_stb),
		.dBusWishbone_ACK         (d_wb_ack),
		.dBusWishbone_WE          (d_wb_we),
		.dBusWishbone_ADR         (d_wb_adr),
		.dBusWishbone_DAT_MISO    (d_wb_dat_miso),
		.dBusWishbone_DAT_MOSI    (d_wb_dat_mosi),
		.dBusWishbone_SEL         (d_wb_sel),
		.dBusWishbone_ERR         (d_wb_err),
		.dBusWishbone_BTE         (d_wb_bte),
		.dBusWishbone_CTI         (d_wb_cti),
		.clk                      (clk_1x),
		.reset                    (rst)
	);

	// CPU interrupt wiring
	assign vex_externalResetVector    = 32'h00000000;
	assign vex_softwareInterrupt      = 1'b0;
	assign vex_externalInterruptArray = 32'h00000000;

	// Cache bus interface / bridge
	mc_bus_vex #(
		.WB_N(WB_N)
	) cache_bus_I (
		.i_axi_ar_valid         (i_axi_ar_valid),
		.i_axi_ar_ready         (i_axi_ar_ready),
		.i_axi_ar_payload_addr  (i_axi_ar_payload_addr),
		.i_axi_ar_payload_len   (i_axi_ar_payload_len),
		.i_axi_ar_payload_burst (i_axi_ar_payload_burst),
		.i_axi_ar_payload_cache (i_axi_ar_payload_cache),
		.i_axi_ar_payload_prot  (i_axi_ar_payload_prot),
		.i_axi_r_valid          (i_axi_r_valid),
		.i_axi_r_ready          (i_axi_r_ready),
		.i_axi_r_payload_data   (i_axi_r_payload_data),
		.i_axi_r_payload_resp   (i_axi_r_payload_resp),
		.i_axi_r_payload_last   (i_axi_r_payload_last),
		.d_wb_cyc               (d_wb_cyc),
		.d_wb_stb               (d_wb_stb),
		.d_wb_ack               (d_wb_ack),
		.d_wb_we                (d_wb_we),
		.d_wb_adr               (d_wb_adr),
		.d_wb_dat_miso          (d_wb_dat_miso),
		.d_wb_dat_mosi          (d_wb_dat_mosi),
		.d_wb_sel               (d_wb_sel),
		.d_wb_err               (d_wb_err),
		.d_wb_bte               (d_wb_bte),
		.d_wb_cti               (d_wb_cti),
		.wb_addr                (wb_addr),
		.wb_wdata               (wb_wdata),
		.wb_wmsk                (wb_wmsk),
		.wb_rdata               (wb_rdata_flat),
		.wb_cyc                 (wb_cyc),
		.wb_we                  (wb_we),
		.wb_ack                 (wb_ack),
		.ram_addr               (ram_addr),
		.ram_wdata              (ram_wdata),
		.ram_wmsk               (ram_wmsk),
		.ram_rdata              (ram_rdata),
		.ram_we                 (ram_we),
		.req_addr_pre           (cache_req_addr_pre),
		.req_valid              (cache_req_valid),
		.req_write              (cache_req_write),
		.req_wdata              (cache_req_wdata),
		.req_wmsk               (cache_req_wmsk),
		.resp_ack               (cache_resp_ack),
		.resp_nak               (cache_resp_nak),
		.resp_rdata             (cache_resp_rdata),
		.clk                    (clk_1x),
		.rst                    (rst)
	);

	for (i=0; i<WB_N; i=i+1)
		assign wb_rdata_flat[i*WB_DW+:WB_DW] = wb_rdata[i];

	// Boot memory
	soc_bram #(
		.AW(10),
`ifdef SIM
		.INIT_FILE("boot-sim.hex")
`else
		.INIT_FILE("boot.hex")
`endif
	) bram_I (
		.addr  (ram_addr[9:0]),
		.rdata (ram_rdata),
		.wdata (ram_wdata),
		.wmsk  (ram_wmsk),
		.we    (ram_we),
		.clk   (clk_1x)
	);

	// Cache
	mc_core #(
		.N_WAYS(4),
		.ADDR_WIDTH(24),
		.CACHE_LINE(64),
		.CACHE_SIZE(128)
	) cache_I (
		.req_addr_pre (cache_req_addr_pre[23:0]),
		.req_valid    (cache_req_valid),
		.req_write    (cache_req_write),
		.req_wdata    (cache_req_wdata),
		.req_wmsk     (cache_req_wmsk),
		.resp_ack     (cache_resp_ack),
		.resp_nak     (cache_resp_nak),
		.resp_rdata   (cache_resp_rdata),
		.mi_addr      (mi_addr),
		.mi_len       (mi_len),
		.mi_rw        (mi_rw),
		.mi_valid     (mi_valid),
		.mi_ready     (mi_ready),
		.mi_wdata     (mi_wdata),
		.mi_wack      (mi_wack),
		.mi_wlast     (mi_wlast),
		.mi_rdata     (mi_rdata),
		.mi_rstb      (mi_rstb),
		.mi_rlast     (mi_rlast),
		.clk          (clk_1x),
		.rst          (rst)
	);


	// HyperRAM [0]
	// --------

`ifdef SIM
	// Simulation
	mem_sim #(
		.INIT_FILE("firmware.hex"),
		.AW(23)
	) hram_sim (
		.mi_addr  (mi_addr[22:0]),
		.mi_len   (mi_len),
		.mi_rw    (mi_rw),
		.mi_valid (mi_valid),
		.mi_ready (mi_ready),
		.mi_wdata (mi_wdata),
		.mi_wack  (mi_wack),
		.mi_wlast (mi_wlast),
		.mi_rdata (mi_rdata),
		.mi_rstb  (mi_rstb),
		.mi_rlast (mi_rlast),
		.clk      (clk_1x),
		.rst      (rst)
	);

	assign wb_ack[0] = wb_cyc[0];
	assign wb_rdata[0] = 32'h00000000;
`elsif MEM_HRAM
	// Controller
	hbus_memctrl hram_ctrl_I (
		.phy_ck_en     (phy_ck_en),
		.phy_rwds_in   (phy_rwds_in),
		.phy_rwds_out  (phy_rwds_out),
		.phy_rwds_oe   (phy_rwds_oe),
		.phy_dq_in     (phy_dq_in),
		.phy_dq_out    (phy_dq_out),
		.phy_dq_oe     (phy_dq_oe),
		.phy_cs_n      (phy_cs_n),
		.phy_rst_n     (phy_rst_n),
		.phy_cfg_wdata (phy_cfg_wdata),
		.phy_cfg_rdata (phy_cfg_rdata),
		.phy_cfg_stb   (phy_cfg_stb),
		.mi_addr_cs    (mi_addr[22:21]),
		.mi_addr       ({10'd0, mi_addr[20:0], 1'b0}),	/* 32b aligned */
		.mi_len        (mi_len),
		.mi_rw         (mi_rw),
		.mi_linear     (1'b0),
		.mi_valid      (mi_valid),
		.mi_ready      (mi_ready),
		.mi_wdata      (mi_wdata),
		.mi_wmsk       (4'h0),
		.mi_wack       (mi_wack),
		.mi_wlast      (mi_wlast),
		.mi_rdata      (mi_rdata),
		.mi_rstb       (mi_rstb),
		.mi_rlast      (mi_rlast),
		.wb_wdata      (wb_wdata),
		.wb_rdata      (wb_rdata[0]),
		.wb_addr       (wb_addr[3:0]),
		.wb_we         (wb_we),
		.wb_cyc        (wb_cyc[0]),
		.wb_ack        (wb_ack[0]),
		.clk           (clk_1x),
		.rst           (rst)
	);

	// PHY
	hbus_phy_ice40 hram_phy_I (
		.hbus_dq       (hram_dq),
		.hbus_rwds     (hram_rwds),
		.hbus_ck       (hram_ck),
		.hbus_cs_n     (hram_cs_n),
		.hbus_rst_n    (hram_rst_n),
		.phy_ck_en     (phy_ck_en),
		.phy_rwds_in   (phy_rwds_in),
		.phy_rwds_out  (phy_rwds_out),
		.phy_rwds_oe   (phy_rwds_oe),
		.phy_dq_in     (phy_dq_in),
		.phy_dq_out    (phy_dq_out),
		.phy_dq_oe     (phy_dq_oe),
		.phy_cs_n      (phy_cs_n),
		.phy_rst_n     (phy_rst_n),
		.phy_cfg_wdata (phy_cfg_wdata),
		.phy_cfg_rdata (phy_cfg_rdata),
		.phy_cfg_stb   (phy_cfg_stb),
		.clk_rd_delay  (clk_rd_delay),
		.clk_1x        (clk_1x),
		.clk_4x        (clk_4x),
		.clk_rd        (clk_rd),
		.sync_4x       (sync_4x),
		.sync_rd       (sync_rd)
	);
`elsif MEM_QPI
	// Controller
	qpi_memctrl #(
		.CMD_READ   (32'hEBEBEBEB),
		.CMD_WRITE  (32'h02020202),
		.DUMMY_CLK  (6),
		.PAUSE_CLK  (8),
		.FIFO_DEPTH (1),
		.N_CS       (3),
		.MODE_CS    (1),
		.PHY_SPEED  (4),
		.PHY_WIDTH  (1),
		.PHY_DELAY  (4)
	) memctrl_I (
		.phy_io_i   (phy_io_i),
		.phy_io_o   (phy_io_o),
		.phy_io_oe  (phy_io_oe),
		.phy_clk_o  (phy_clk_o),
		.phy_cs_o   (phy_cs_o),
		.mi_addr_cs (mi_addr[22:21]),
		.mi_addr    ({1'b0, mi_addr[20:0], 2'b00 }),	/* 32 bits aligned */
		.mi_len     (mi_len),
		.mi_rw      (mi_rw),
		.mi_valid   (mi_valid),
		.mi_ready   (mi_ready),
		.mi_wdata   (mi_wdata),
		.mi_wack    (mi_wack),
		.mi_wlast   (mi_wlast),
		.mi_rdata   (mi_rdata),
		.mi_rstb    (mi_rstb),
		.mi_rlast   (mi_rlast),
		.wb_wdata   (wb_wdata),
		.wb_rdata   (wb_rdata[0]),
		.wb_addr    (wb_addr[4:0]),
		.wb_we      (wb_we),
		.wb_cyc     (wb_cyc[0]),
		.wb_ack     (wb_ack[0]),
		.clk        (clk_1x),
		.rst        (rst)
	);

	// PHY
	qpi_phy_ice40_4x #(
		.N_CS     (3),
		.WITH_CLK (1),
		.NEG_IN   (0)
	) phy_I (
		.pad_io    (qpi_io),
		.pad_clk   (qpi_sck),
		.pad_cs_n  (qpi_cs_n),
		.phy_io_i  (phy_io_i),
		.phy_io_o  (phy_io_o),
		.phy_io_oe (phy_io_oe),
		.phy_clk_o (phy_clk_o),
		.phy_cs_o  (phy_cs_o),
		.clk_1x    (clk_1x),
		.clk_4x    (clk_4x),
		.clk_sync  (sync_4x)
	);
`endif


	// UART [1]
	// ----

	uart_wb #(
		.DIV_WIDTH(12),
		.DW(WB_DW)
	) uart_I (
		.uart_tx  (uart_tx),
		.uart_rx  (uart_rx),
		.wb_addr  (wb_addr[1:0]),
		.wb_rdata (wb_rdata[1]),
		.wb_we    (wb_we),
		.wb_wdata (wb_wdata),
		.wb_cyc   (wb_cyc[1]),
		.wb_ack   (wb_ack[1]),
		.clk      (clk_1x),
		.rst      (rst)
	);


	// Platform [2]  (SPI + Timer)
	// --------

	platform platform_I (
		.spi_pad_mosi (spi_mosi),
		.spi_pad_miso (spi_miso),
		.spi_pad_clk  (spi_clk),
		.spi_pad_cs_n (spi_flash_cs_n),
		.irqo_timer   (vex_timerInterrupt),
		.wb_addr      (wb_addr[1:0]),
		.wb_rdata     (wb_rdata[2]),
		.wb_wdata     (wb_wdata),
		.wb_we        (wb_we),
		.wb_cyc       (wb_cyc[2]),
		.wb_ack       (wb_ack[2]),
		.clk          (clk_1x),
		.rst          (rst)
	);


	// LEDs [3]
	// ----

`ifndef CXXRTL
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
		.clk        (clk_1x),
		.rst        (rst)
	);
`else
	assign wb_rdata[3] = 0;
	assign wb_ack[3] = wb_cyc[3];
`endif


	// Clock / Reset
	// -------------

`ifdef CXXRTL

	/* CXXRTL Sim: Only 1x passthrough + gen reset */
	reg [7:0] rst_cnt = 0;

	always @(posedge clk_in)
		if (~rst_cnt[7])
			rst_cnt <= rst_cnt + 1;

	assign clk_rd  = 1'b0;
	assign clk_4x  = 1'b0;
	assign clk_1x  = clk_in;
	assign sync_rd = 1'b0;
	assign sync_4x = 1'b0;
	assign rst     = ~rst_cnt[7];

`elsif SIM

	/* iverilog Sim: Generate all signals */
	reg       rst_s = 1'b1;
	reg       clk_4x_s = 1'b0;
	reg       clk_1x_s = 1'b0;
	reg [1:0] clk_sync_cnt = 2'b00;

	always  #5 clk_4x_s <= !clk_4x_s;
	always #20 clk_1x_s <= !clk_1x_s;

	initial
		#200 rst_s = 0;

	always @(posedge clk_4x_s)
		if (rst)
			clk_sync_cnt <= 2'b00;
		else
			clk_sync_cnt <= clk_sync_cnt + 1;

	assign clk_rd  = clk_4x_s;
	assign clk_4x  = clk_4x_s;
	assign clk_1x  = clk_1x_s;
	assign sync_rd = (clk_sync_cnt == 2'b10);
	assign sync_4x = (clk_sync_cnt == 2'b10);
	assign rst     = rst_s;

`else

	/* PLL CRG */
	sysmgr sys_mgr_I (
		.delay   (clk_rd_delay),
		.clk_in  (clk_in),
		.clk_1x  (clk_1x),
		.clk_4x  (clk_4x),
		.clk_rd  (clk_rd),
		.sync_4x (sync_4x),
		.sync_rd (sync_rd),
		.rst     (rst)
	);

`endif

endmodule // top
