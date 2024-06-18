// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`timescale 1ns / 100ps

module topModule(
    // Inputs
	top_rst_n,
	top_clk,
    // Outputs
	osc_en,
    serial_iq,
	serial_clk,
	LED,
	clk_test
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         top_clk;
input         top_rst_n;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output	osc_en;
output	serial_iq /* synthesis IO_TYPES="LVDS*/;
output	serial_clk /* synthesis IO_TYPES="LVDS*/;
output	wire  LED;
output	wire clk_test;

//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire        	clockDivider_0_clkLock;
wire       		clockDivider_0_clk_4M;

wire        	pll_clko;
wire        	pll_lock;
wire 			pll_clki;

wire 			counter_0_countDone;

wire        	loraModulator_0_symDone;
wire   	[2:0]  	loraPacketGenerator_0_BW_select;
wire          	loraPacketGenerator_0_chirpReset;
wire   	[2:0]  	loraPacketGenerator_0_SF_select;
wire   	[1:0]  	loraPacketGenerator_0_symType;
wire   	[11:0] 	loraPacketGenerator_0_symVal;

wire          	loraModulator_0_IQStart;
wire	[13:0] 	I;
wire 	[13:0] 	Q;

//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign	osc_en = 1'b1;
assign pll_clki = top_clk;

//debugg
assign clk_test = clockDivider_0_clk_4M;

//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LED = 1'b1;

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
my_pll_64mhz my_pll_instance (
	// Inputs
	.SEL	(1'b1),
	.CLKI	(), 
	.CLKI2	(pll_clki),
	.RST	(~top_rst_n),
	// Outputs
	.CLKOP	(pll_clko),
	.LOCK	(pll_lock)
);

//--------clockDivider
clockDivider clockDivider_0(
	// Inputs
	.clk      (pll_clko),
	.pll_lock (pll_lock),
	// Outputs
	.clkOut   (clockDivider_0_clk_4M),
	.clkLock  (clockDivider_0_clkLock) 
);

//--------counter
counter counter_0(
	// Inputs
	.clk       (clockDivider_0_clk_4M),
	.clkLock   (clockDivider_0_clkLock),
	// Outputs
	.countDone (counter_0_countDone) 
);

//--------loraPacketGenerator
loraPacketGenerator loraPacketGenerator_0(
	// Inputs
	.clk        (clockDivider_0_clk_4M),
	.clkLock    (clockDivider_0_clkLock),
	.rst        (counter_0_countDone),
	.symDone    (loraModulator_0_symDone),
	// Outputs
	.chirpReset (loraPacketGenerator_0_chirpReset),
	.SF_select  (loraPacketGenerator_0_SF_select),
	.BW_select  (loraPacketGenerator_0_BW_select),
	.symVal     (loraPacketGenerator_0_symVal),
	.symType    (loraPacketGenerator_0_symType) 
);

//--------loraModulator
loraModulator loraModulator_0(
	// Inputs
	.clk       (clockDivider_0_clk_4M),
	.rst       (loraPacketGenerator_0_chirpReset),
	.symVal    (loraPacketGenerator_0_symVal),
	.symType   (loraPacketGenerator_0_symType),
	.SF_select (loraPacketGenerator_0_SF_select),
	.BW_select (loraPacketGenerator_0_BW_select),
	// Outputs
	.IQStart   (loraModulator_0_IQStart),
	.symDone   (loraModulator_0_symDone),
	.I         (I),
	.Q         (Q) 
);
		
//--------IQSerializer
IQSerializer IQSerializer_0(
	// Inputs
	.clk        (pll_clko),
	.start      (loraModulator_0_IQStart),
	.I          (I),
	.Q          (Q),
	// Outputs
	.serial_N   (serial_iq),
	.serial     ( ),
	.serial_clk (serial_clk) 
);
	
endmodule
