// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// system_bus.v - wrapper for wishbone master and system bus IP cores
// 03-21-19 E. Brombaugh

`default_nettype none

module system_bus(
	input clk,				// system clock
	input rst,				// system reset
	input cs,				// chip select
	input we,				// write enable
	input [7:0] addr,		// register select
	input [7:0] din,		// data bus input
	output [7:0] dout,		// data bus output
	output rdy,				// low-true processor stall
	output irq,				// high-true interrupt request
	inout spi0_mosi,		// spi core 0 mosi
	inout spi0_miso,		// spi core 0 miso
	inout spi0_sclk,		// spi core 0 sclk
	inout spi0_cs0			// spi core 0 cs
);

	// the wishbone master
	wire sbstbi, sbrwi, sbacko;
	wire [7:0] sbadri, sbdato, sbdati;
	wishbone uwish(
		.clk(clk),
		.rst(rst),
		.cs(cs),
		.we(we),
		.addr(addr),
		.din(din),
		.dout(dout),
		.rdy(rdy),
		.wb_stbo(sbstbi),
		.wb_adro(sbadri),
		.wb_rwo(sbrwi),
		.wb_dato(sbdati),
		.wb_acki(sbacko),
		.wb_dati(sbdato)
	);
	
	// temporary
	assign irq = 1'b0;
	
	// SPI IP Core
	wire moe_0, mo_0, si_0;			// MOSI components
	wire soe_0, mi_0, so_0;			// MISO components
	wire sckoe_0, scko_0, scki_0;	// SCLK components
	wire mcsnoe_00, mcsno_00, scsni_0;		// CS0 components
	SB_SPI #(
		.BUS_ADDR74("0b0000")
	) 
	spiInst0 (
		.SBCLKI(clk),
		.SBRWI(sbrwi),
		.SBSTBI(sbstbi),
		.SBADRI7(sbadri[7]),
		.SBADRI6(sbadri[6]),
		.SBADRI5(sbadri[5]),
		.SBADRI4(sbadri[4]),
		.SBADRI3(sbadri[3]),
		.SBADRI2(sbadri[2]),
		.SBADRI1(sbadri[1]),
		.SBADRI0(sbadri[0]),
		.SBDATI7(sbdati[7]),
		.SBDATI6(sbdati[6]),
		.SBDATI5(sbdati[5]),
		.SBDATI4(sbdati[4]),
		.SBDATI3(sbdati[3]),
		.SBDATI2(sbdati[2]),
		.SBDATI1(sbdati[1]),
		.SBDATI0(sbdati[0]),
		.MI(mi_0),
		.SI(si_0),
		.SCKI(scki_0),
		.SCSNI(scsni_0),		// must be pulled high to prevent SOE
		.SBDATO7(sbdato[7]),
		.SBDATO6(sbdato[6]),
		.SBDATO5(sbdato[5]),
		.SBDATO4(sbdato[4]),
		.SBDATO3(sbdato[3]),
		.SBDATO2(sbdato[2]),
		.SBDATO1(sbdato[1]),
		.SBDATO0(sbdato[0]),
		.SBACKO(sbacko),
		.SPIIRQ(),
		.SPIWKUP(),
		.SO(so_0),
		.SOE(soe_0),
		.MO(mo_0),
		.MOE(moe_0),
		.SCKO(scko_0),
		.SCKOE(sckoe_0),
		.MCSNO3(),
		.MCSNO2(),
		.MCSNO1(),
		.MCSNO0(mcsno_00),
		.MCSNOE3(),
		.MCSNOE2(),
		.MCSNOE1(),
		.MCSNOE0(mcsnoe_00)
	);
	
	// I/O drivers are tri-state output w/ simple input
	// MOSI driver
	SB_IO #(
		.PIN_TYPE(6'b101001),
		.PULLUP(1'b1),
		.NEG_TRIGGER(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) umosi (
		.PACKAGE_PIN(spi0_mosi),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b0),
		.INPUT_CLK(1'b0),
		.OUTPUT_CLK(1'b0),
		.OUTPUT_ENABLE(moe_0),
		.D_OUT_0(mo_0),
		.D_OUT_1(1'b0),
		.D_IN_0(si_0),
		.D_IN_1()
	);
	
	// MISO driver
	SB_IO #(
		.PIN_TYPE(6'b101001),
		.PULLUP(1'b1),
		.NEG_TRIGGER(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) umiso (
		.PACKAGE_PIN(spi0_miso),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b0),
		.INPUT_CLK(1'b0),
		.OUTPUT_CLK(1'b0),
		.OUTPUT_ENABLE(soe_0),
		.D_OUT_0(so_0),
		.D_OUT_1(1'b0),
		.D_IN_0(mi_0),
		.D_IN_1()
	);

	// SCK driver
	SB_IO #(
		.PIN_TYPE(6'b101001),
		.PULLUP(1'b1),
		.NEG_TRIGGER(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) usclk (
		.PACKAGE_PIN(spi0_sclk),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b0),
		.INPUT_CLK(1'b0),
		.OUTPUT_CLK(1'b0),
		.OUTPUT_ENABLE(sckoe_0),
		.D_OUT_0(scko_0),
		.D_OUT_1(1'b0),
		.D_IN_0(scki_0),
		.D_IN_1()
	);

	// CS0 driver
	SB_IO #(
		.PIN_TYPE(6'b101001),
		.PULLUP(1'b1),
		.NEG_TRIGGER(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) ucs0 (
		.PACKAGE_PIN(spi0_cs0),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b0),
		.INPUT_CLK(1'b0),
		.OUTPUT_CLK(1'b0),
		.OUTPUT_ENABLE(1'b1),	// or mcsnoe_00 for hi-z when inactive
		.D_OUT_0(mcsno_00),
		.D_OUT_1(1'b0),
		.D_IN_0(scsni_0),		// unused to prevent accidental slave mode
		.D_IN_1()
	);
endmodule
