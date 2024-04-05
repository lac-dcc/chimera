/*
 * Milkymist SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 * Copyright (C) 2011 CERN
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

`include "setup.v"

module system(
	input clkin_p,
	input clkin_n,
	input resetin_n,
	
	// UART
	input uart_rxd,
	output uart_txd,

	// GPIO
	input btn,
	output [3:0] led,
	inout onewire,
	output sdc,
	inout sda,
	
	// TDC
	output test_clk_oe_n,
	output test_clk_p,
	output test_clk_n,
	output [1:0] tdc_signal_oe_n,
	output [1:0] tdc_signal_term_en,
	input [1:0] tdc_signal_p,
	input [1:0] tdc_signal_n
);

//------------------------------------------------------------------
// Clock and Reset Generation
//------------------------------------------------------------------
wire sys_clk;
wire resetin = ~resetin_n;
wire hard_reset;

IBUFGDS clkbuf(
	.I(clkin_p),
	.IB(clkin_n),
	.O(sys_clk)
);

`ifndef SIMULATION
/* Synchronize the reset input */
reg rst0;
reg rst1;
always @(posedge sys_clk) rst0 <= resetin;
always @(posedge sys_clk) rst1 <= rst0;

/* Debounce it
 * and generate power-on reset.
 */
reg [19:0] rst_debounce;
reg sys_rst;
initial rst_debounce <= 20'hFFFFF;
initial sys_rst <= 1'b1;
always @(posedge sys_clk) begin
	if(rst1 | hard_reset)
		rst_debounce <= 20'hFFFFF;
	else if(rst_debounce != 20'd0)
		rst_debounce <= rst_debounce - 20'd1;
	sys_rst <= rst_debounce != 20'd0;
end

`else
wire sys_rst;
assign sys_rst = resetin;
`endif

//------------------------------------------------------------------
// Wishbone master wires
//------------------------------------------------------------------
wire [31:0]	cpuibus_adr,
		cpudbus_adr;

wire [2:0]	cpuibus_cti,
		cpudbus_cti;

wire [31:0]	cpuibus_dat_r,
		cpudbus_dat_r,
		cpudbus_dat_w;

wire [3:0]	cpudbus_sel;

wire		cpudbus_we;

wire		cpuibus_cyc,
		cpudbus_cyc;

wire		cpuibus_stb,
		cpudbus_stb;

wire		cpuibus_ack,
		cpudbus_ack;

//------------------------------------------------------------------
// Wishbone slave wires
//------------------------------------------------------------------
wire [31:0]	brg_adr,
		bram_adr,
		sram_adr,
		csrbrg_adr,
		tdc_adr;

wire [2:0]	brg_cti,
		bram_cti,
		sram_cti;

wire [31:0]	bram_dat_r,
		sram_dat_r,
		sram_dat_w,
		csrbrg_dat_r,
		csrbrg_dat_w,
		tdc_dat_r,
		tdc_dat_w;

wire [3:0]	bram_sel,
		sram_sel,
		tdc_sel;

wire		csrbrg_we,
		sram_we,
		tdc_we;

wire		bram_cyc,
		sram_cyc,
		csrbrg_cyc,
		tdc_cyc;

wire		bram_stb,
		sram_stb,
		csrbrg_stb,
		tdc_stb;

wire		bram_ack,
		sram_ack,
		csrbrg_ack,
		tdc_ack;

//---------------------------------------------------------------------------
// Wishbone switch
//---------------------------------------------------------------------------
conbus #(
	.s_addr_w(3),
	.s0_addr(3'b000),	// bram		0x00000000
	.s1_addr(3'b001),	// free		0x20000000
	.s2_addr(3'b010),	// sram		0x40000000
	.s3_addr(3'b100),	// CSR bridge	0x80000000
	.s4_addr(3'b101),	// TDC		0xa0000000
	.s5_addr(3'b110),	// free		0xc0000000
) conbus (
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),

	// Master 0
	.m0_dat_i(32'hx),
	.m0_dat_o(cpuibus_dat_r),
	.m0_adr_i(cpuibus_adr),
	.m0_cti_i(cpuibus_cti),
	.m0_we_i(1'b0),
	.m0_sel_i(4'hf),
	.m0_cyc_i(cpuibus_cyc),
	.m0_stb_i(cpuibus_stb),
	.m0_ack_o(cpuibus_ack),
	// Master 1
	.m1_dat_i(cpudbus_dat_w),
	.m1_dat_o(cpudbus_dat_r),
	.m1_adr_i(cpudbus_adr),
	.m1_cti_i(cpudbus_cti),
	.m1_we_i(cpudbus_we),
	.m1_sel_i(cpudbus_sel),
	.m1_cyc_i(cpudbus_cyc),
	.m1_stb_i(cpudbus_stb),
	.m1_ack_o(cpudbus_ack),
	// Master 2
	.m2_dat_i(32'bx),
	.m2_dat_o(),
	.m2_adr_i(32'bx),
	.m2_cti_i(3'bx),
	.m2_we_i(1'bx),
	.m2_sel_i(4'bx),
	.m2_cyc_i(1'b0),
	.m2_stb_i(1'b0),
	.m2_ack_o(),
	// Master 3
	.m3_dat_i(32'bx),
	.m3_dat_o(),
	.m3_adr_i(32'bx),
	.m3_cti_i(3'bx),
	.m3_we_i(1'bx),
	.m3_sel_i(4'bx),
	.m3_cyc_i(1'b0),
	.m3_stb_i(1'b0),
	.m3_ack_o(),
	// Master 4
	.m4_dat_i(32'bx),
	.m4_dat_o(),
	.m4_adr_i(32'bx),
	.m4_cti_i(3'bx),
	.m4_we_i(1'bx),
	.m4_sel_i(4'bx),
	.m4_cyc_i(1'b0),
	.m4_stb_i(1'b0),
	.m4_ack_o(),
	// Master 5
	.m5_dat_i(32'bx),
	.m5_dat_o(),
	.m5_adr_i(32'bx),
	.m5_cti_i(3'bx),
	.m5_we_i(1'bx),
	.m5_sel_i(4'bx),
	.m5_cyc_i(1'b0),
	.m5_stb_i(1'b0),
	.m5_ack_o(),

	// Slave 0
	.s0_dat_i(bram_dat_r),
	.s0_dat_o(),
	.s0_adr_o(bram_adr),
	.s0_cti_o(bram_cti),
	.s0_sel_o(bram_sel),
	.s0_we_o(),
	.s0_cyc_o(bram_cyc),
	.s0_stb_o(bram_stb),
	.s0_ack_i(bram_ack),
	// Slave 1
	.s1_dat_i(32'bx),
	.s1_adr_o(),
	.s1_cyc_o(),
	.s1_stb_o(),
	.s1_ack_i(1'b0),
	// Slave 2
	.s2_dat_i(sram_dat_r),
	.s2_dat_o(sram_dat_w),
	.s2_adr_o(sram_adr),
	.s2_cti_o(sram_cti),
	.s2_sel_o(sram_sel),
	.s2_we_o(sram_we),
	.s2_cyc_o(sram_cyc),
	.s2_stb_o(sram_stb),
	.s2_ack_i(sram_ack),
	// Slave 3
	.s3_dat_i(csrbrg_dat_r),
	.s3_dat_o(csrbrg_dat_w),
	.s3_adr_o(csrbrg_adr),
	.s3_we_o(csrbrg_we),
	.s3_cyc_o(csrbrg_cyc),
	.s3_stb_o(csrbrg_stb),
	.s3_ack_i(csrbrg_ack),
	// Slave 4
	.s4_dat_i(tdc_dat_r),
	.s4_dat_o(tdc_dat_w),
	.s4_adr_o(tdc_adr),
	.s4_we_o(tdc_we),
	.s4_cyc_o(tdc_cyc),
	.s4_stb_o(tdc_stb),
	.s4_sel_o(tdc_sel),
	.s4_ack_i(tdc_ack),
	// Slave 5
	.s5_dat_i(32'bx),
	.s5_adr_o(),
	.s5_cyc_o(),
	.s5_stb_o(),
	.s5_ack_i(1'b0)
);

//------------------------------------------------------------------
// CSR bus
//------------------------------------------------------------------
wire [13:0]	csr_a;
wire		csr_we;
wire [31:0]	csr_dw;
wire [31:0]	csr_dr_uart,
		csr_dr_sysctl;

//---------------------------------------------------------------------------
// WISHBONE to CSR bridge
//---------------------------------------------------------------------------
csrbrg csrbrg(
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),
	
	.wb_adr_i(csrbrg_adr),
	.wb_dat_i(csrbrg_dat_w),
	.wb_dat_o(csrbrg_dat_r),
	.wb_cyc_i(csrbrg_cyc),
	.wb_stb_i(csrbrg_stb),
	.wb_we_i(csrbrg_we),
	.wb_ack_o(csrbrg_ack),
	
	.csr_a(csr_a),
	.csr_we(csr_we),
	.csr_do(csr_dw),
	/* combine all slave->master data lines with an OR */
	.csr_di(
		 csr_dr_uart
		|csr_dr_sysctl
	)
);

//---------------------------------------------------------------------------
// Interrupts
//---------------------------------------------------------------------------
wire gpio_irq;
wire timer0_irq;
wire timer1_irq;
wire uartrx_irq;
wire uarttx_irq;
wire tdc_irq;

wire [31:0] cpu_interrupt;
assign cpu_interrupt = {26'd0,
	tdc_irq,
	uarttx_irq,
	uartrx_irq,
	timer1_irq,
	timer0_irq,
	gpio_irq
};

//---------------------------------------------------------------------------
// LM32 CPU
//---------------------------------------------------------------------------
lm32_top cpu(
	.clk_i(sys_clk),
	.rst_i(sys_rst),
	.interrupt(cpu_interrupt),

	.I_ADR_O(cpuibus_adr),
	.I_DAT_I(cpuibus_dat_r),
	.I_DAT_O(),
	.I_SEL_O(),
	.I_CYC_O(cpuibus_cyc),
	.I_STB_O(cpuibus_stb),
	.I_ACK_I(cpuibus_ack),
	.I_WE_O(),
	.I_CTI_O(cpuibus_cti),
	.I_LOCK_O(),
	.I_BTE_O(),
	.I_ERR_I(1'b0),
	.I_RTY_I(1'b0),

	.D_ADR_O(cpudbus_adr),
	.D_DAT_I(cpudbus_dat_r),
	.D_DAT_O(cpudbus_dat_w),
	.D_SEL_O(cpudbus_sel),
	.D_CYC_O(cpudbus_cyc),
	.D_STB_O(cpudbus_stb),
	.D_ACK_I(cpudbus_ack),
	.D_WE_O (cpudbus_we),
	.D_CTI_O(cpudbus_cti),
	.D_LOCK_O(),
	.D_BTE_O(),
	.D_ERR_I(1'b0),
	.D_RTY_I(1'b0)
);

//---------------------------------------------------------------------------
// BRAM/SRAM
//---------------------------------------------------------------------------
bram #(
	.adr_width(15),
	.init0("../../../software/demo/demo.h0"),
	.init1("../../../software/demo/demo.h1"),
	.init2("../../../software/demo/demo.h2"),
	.init3("../../../software/demo/demo.h3")
) bram (
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),

	.wb_adr_i(bram_adr),
	.wb_dat_o(bram_dat_r),
	.wb_dat_i(32'bx),
	.wb_sel_i(bram_sel),
	.wb_stb_i(bram_stb),
	.wb_cyc_i(bram_cyc),
	.wb_ack_o(bram_ack),
	.wb_we_i(1'b0)
);

bram #(
	.adr_width(14)
) sram (
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),

	.wb_adr_i(sram_adr),
	.wb_dat_o(sram_dat_r),
	.wb_dat_i(sram_dat_w),
	.wb_sel_i(sram_sel),
	.wb_stb_i(sram_stb),
	.wb_cyc_i(sram_cyc),
	.wb_ack_o(sram_ack),
	.wb_we_i(sram_we)
);

//---------------------------------------------------------------------------
// UART
//---------------------------------------------------------------------------
uart #(
	.csr_addr(4'h0),
	.clk_freq(`CLOCK_FREQUENCY),
	.baud(`BAUD_RATE)
) uart (
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),

	.csr_a(csr_a),
	.csr_we(csr_we),
	.csr_di(csr_dw),
	.csr_do(csr_dr_uart),
	
	.rx_irq(uartrx_irq),
	.tx_irq(uarttx_irq),
	
	.uart_rxd(uart_rxd),
	.uart_txd(uart_txd)
);

//---------------------------------------------------------------------------
// System Controller
//---------------------------------------------------------------------------
wire onewire_drivelow;
wire sdc_gpio;
wire sda_drivelow;
sysctl #(
	.csr_addr(4'h1),
	.ninputs(3),
	.noutputs(8),
	.systemid(32'h53504543) /* SPEC */
) sysctl (
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),

	.gpio_irq(gpio_irq),
	.timer0_irq(timer0_irq),
	.timer1_irq(timer1_irq),

	.csr_a(csr_a),
	.csr_we(csr_we),
	.csr_di(csr_dw),
	.csr_do(csr_dr_sysctl),

	.gpio_inputs({sda, onewire, btn}),
	.gpio_outputs({sda_drivelow, sdc_gpio, onewire_drivelow, led}),

	.hard_reset(hard_reset)
);
assign onewire = onewire_drivelow ? 1'b0 : 1'bz;
assign sdc = ~sdc_gpio ? 1'b0 : 1'bz;
assign sda = sda_drivelow ? 1'b0 : 1'bz;

//---------------------------------------------------------------------------
// TDC
//---------------------------------------------------------------------------
wire [1:0] tdc_signal;
wire [1:0] tdc_calib;

tdc_hostif #(
	.g_CHANNEL_COUNT(2),
	.g_CARRY4_COUNT(124),
	.g_RAW_COUNT(9),
	.g_FP_COUNT(13),
	.g_EXHIS_COUNT(5),
	.g_COARSE_COUNT(25),
	.g_RO_LENGTH(31),
	.g_FCOUNTER_WIDTH(13),
	.g_FTIMER_WIDTH(14)
) tdc (
	.rst_n_i(~sys_rst),
	.wb_clk_i(sys_clk),

	.wb_addr_i(tdc_adr[7:2]),
	.wb_data_i(tdc_dat_w),
	.wb_data_o(tdc_dat_r),
	.wb_cyc_i(tdc_cyc),
	.wb_sel_i(tdc_sel),
	.wb_stb_i(tdc_stb),
	.wb_we_i(tdc_we),
	.wb_ack_o(tdc_ack),
	.wb_irq_o(tdc_irq),

	.cc_rst_i(1'b0),
	.cc_cy_o(),
	.signal_i(tdc_signal),
	.calib_i(tdc_calib)
);

// startup calibration oscillator
wire cal_clk16x;
wire cal_clk;
wire test_clk;
tdc_ringosc #(
	.g_LENGTH(31)
) calib_osc (
	.en_i(~sys_rst),
	.clk_o(cal_clk16x)
);
reg [18:0] cal_clkdiv;
always @(posedge cal_clk16x) cal_clkdiv <= cal_clkdiv + 4'd1;
assign cal_clk = cal_clkdiv[3];
assign test_clk = cal_clkdiv[18];

assign tdc_calib = {2{cal_clk}};

// IO
assign test_clk_oe_n = 1'b0;
OBUFDS obuf_test_clk(
	.O(test_clk_p),
	.OB(test_clk_n),
	.I(test_clk)
);

assign tdc_signal_oe_n[0] = 1'b1;
assign tdc_signal_term_en[0] = 1'b1;
IBUFDS ibuf_tdc_signal0(
	.I(tdc_signal_p[0]),
	.IB(tdc_signal_n[0]),
	.O(tdc_signal[0])
);
assign tdc_signal_oe_n[1] = 1'b1;
assign tdc_signal_term_en[1] = 1'b0;
IBUFDS ibuf_tdc_signal1(
	.I(tdc_signal_p[1]),
	.IB(tdc_signal_n[1]),
	.O(tdc_signal[1])
);

endmodule
