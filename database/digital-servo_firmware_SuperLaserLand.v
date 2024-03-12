///////////////////////////////////////////////////////////////////////////////
// SuperLaserLand.v
//
// 7/12/11
// David Leibrandt
//
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

`define CONFIG_SIMPLEPI // generate firmware for the standard digital servo
// `define CONFIG_TESTHARDWARE // generate firmware for digital servo hardware testing

`define CONFIG_07JUN12 // the target hardware is V1.0 (6/7/12)

`define FW_VER_28MAY15 // we're compiling this FW version

module SuperLaserLand(
	input  wire [7:0]  hi_in,
	output wire [1:0]  hi_out,
	inout  wire [15:0] hi_inout,
	inout  wire        hi_aa,

	output wire        i2c_sda,
	output wire        i2c_scl,
	output wire        hi_muxsel,
   
	input  wire 		 clk1_in, // CY22393 CLKA @ 100MHz
	output wire [7:0]  led,
	
	output wire 		 flash_scs,
	output wire 		 flash_sck,
	input  wire 		 flash_sdo,
	output wire 		 flash_sdi
	
,	inout  wire [15:0] mcb3_dram_dq,
	output wire [12:0] mcb3_dram_a,
	output wire [2:0]  mcb3_dram_ba,
	output wire        mcb3_dram_ras_n,
	output wire        mcb3_dram_cas_n,
	output wire        mcb3_dram_we_n,
	output wire        mcb3_dram_odt,
	output wire        mcb3_dram_cke,
	output wire        mcb3_dram_dm,
	inout  wire        mcb3_dram_udqs,
	inout  wire        mcb3_dram_udqs_n,
	inout  wire        mcb3_rzq,
	inout  wire        mcb3_zio,
	output wire        mcb3_dram_udm,
	inout  wire        mcb3_dram_dqs,
	inout  wire        mcb3_dram_dqs_n,
	output wire        mcb3_dram_ck,
	output wire        mcb3_dram_ck_n,
	output wire        mcb3_dram_cs_n,
	input  wire        c3_sys_rst_n

,	input wire   [2:0] DIN,
	output wire  [2:0] DOUT,
	output wire	 [2:0] LED_G,
	output wire	 [2:0] LED_R

,	output wire			 AD8251_IN_A0,
	output wire			 AD8251_IN_A1,
	output wire			 AD8251_IN_WR0,
	output wire			 AD8251_IN_WR1,
	
	output wire			 LTC2195_SCS,
	output wire			 LTC2195_SCK,
	output wire			 LTC2195_SDI,
	input  wire			 LTC2195_SDO,
	output wire			 LTC2195_ENC_P,
	output wire			 LTC2195_ENC_N,
	input  wire			 LTC2195_FR_P,
	input  wire			 LTC2195_FR_N,
	input  wire			 LTC2195_DCO_P,
	input  wire			 LTC2195_DCO_N,
	input  wire  [3:0] LTC2195_D0_P,
	input  wire  [3:0] LTC2195_D0_N,
	input  wire  [3:0] LTC2195_D1_P,
	input  wire  [3:0] LTC2195_D1_N

,	output wire			 AD8251_OUT_A0,
	output wire			 AD8251_OUT_A1,
	output wire			 AD8251_OUT_WR0,
	output wire			 AD8251_OUT_WR1
	
,	output wire			 AD9783_RST,
	output wire			 AD9783_SCS,
	output wire			 AD9783_SCK,
	input  wire			 AD9783_SDO,
	output wire			 AD9783_SDI,
	output wire			 AD9783_CLK_P,
	output wire			 AD9783_CLK_N,
	output wire			 AD9783_DCI_P,
	output wire			 AD9783_DCI_N,
	output wire [15:0] AD9783_D_P,
	output wire [15:0] AD9783_D_N

,	output wire			 AD5791_SCS,
	output wire			 AD5791_SCK,
	output wire			 AD5791_SDI,
	input  wire			 AD5791_SDO,
	output wire			 AD5791_LDAC,
	output wire			 AD5791_CLR,
	output wire			 AD5791_RST
);

///////////////////////////////////////////////////////////////////////////////
// Opal Kelly wires
wire [15:0] WireIn00, WireIn01, WireIn02;
wire [15:0] WireOut20, WireOut21, WireOut22, WireOut23, WireOut24, WireOut25;
wire [15:0] TrigIn40;

///////////////////////////////////////////////////////////////////////////////
// Wires
wire [15:0] cmd_addr, cmd_data1in, cmd_data2in, cmd_dataout_M25P32_CONFIG, cmd_dataout_AD9783, cmd_dataout_LTC2195_2, cmd_dataout_LTC2195_1, cmd_dataout_LTC2195_0;
wire 			cmd_trig;

///////////////////////////////////////////////////////////////////////////////
// Assigns
assign i2c_sda = 1'bz;
assign i2c_scl = 1'bz;
assign hi_muxsel  = 1'b0; // this always needs to be set to 1'b0 for the OK interface to work

assign cmd_trig = TrigIn40[1];
assign cmd_addr = WireIn00[15:0];
assign cmd_data1in = WireIn01[15:0];
assign cmd_data2in = WireIn02[15:0];
assign WireOut20 = cmd_dataout_M25P32_CONFIG;
assign WireOut21 = cmd_dataout_AD9783;
assign WireOut22 = cmd_dataout_LTC2195_0;
assign WireOut23 = cmd_dataout_LTC2195_1;
assign WireOut24 = cmd_dataout_LTC2195_2;

`ifdef FW_VER_04NOV14
	assign WireOut25 = 16'h0010;
`elsif FW_VER_16JAN15
	assign WireOut25 = 16'h0011;
`elsif FW_VER_28MAY15
	assign WireOut25 = 16'h0012;
`else
	assign WireOut25 = 16'h0000;
`endif

///////////////////////////////////////////////////////////////////////////////
// Register the LEDs and DIN/DOUTs

// LEDs on OK board
reg [7:0] led_f;
always @(posedge clk1) led_f <= ~{cmd_dataout_LTC2195_0[3:0], configuration[3:0]};
assign					  led = led_f;

// LEDs on box front panel
reg [2:0] LED_G_f, LED_R_f;
assign					  LED_G = LED_G_f;
assign					  LED_R = LED_R_f;

// DIN
reg [2:0] DIN_f;
always @(posedge clk1) DIN_f <= DIN;

// DOUT
reg [2:0] DOUT_f;
assign					  DOUT = DOUT_f;

///////////////////////////////////////////////////////////////////////////////
// Clock buffer - this seems to be necessary for the memc3_infrastructure module to work

wire clk1;
BUFG bufg_sys_clk1 (.I(clk1_in), .O(clk1));

///////////////////////////////////////////////////////////////////////////////
// Reset signal
wire rst, power_on_reset, ok_reset;
assign ok_reset = TrigIn40[0];
SRL16 #(.INIT(16'hFFFF)) reset_sr (.D(1'b0), .CLK(clk1), .Q(power_on_reset), .A0(1'b1), .A1(1'b1), .A2(1'b1), .A3(1'b1));
assign rst = power_on_reset | ok_reset;

///////////////////////////////////////////////////////////////////////////////
// External clock buffer and conditioning

// Pick the input line
wire ext_clk_10MHz_w;
assign ext_clk_10MHz_w = DIN[0];

// Register the external clock on the internal clock and condition it to be high for one cycle of the internal clock
reg [3:0] ext_clk_10MHz_f1;
reg ext_clk_10MHz_f2, ext_clk_10MHz;
always @(posedge clk1) begin
	ext_clk_10MHz_f1 <= {ext_clk_10MHz_f1[2:0], ext_clk_10MHz_w}; // register
	ext_clk_10MHz_f2 <= ext_clk_10MHz_f1[3] & (!ext_clk_10MHz_f1[2]); // edge detect
	ext_clk_10MHz <= ext_clk_10MHz_f2; //register
end

///////////////////////////////////////////////////////////////////////////////
// Non-volatile configuration register

wire  [12287:0] configurationNR;
reg   [12287:0] configuration;

M25P32_CONFIG #(
	.CONFIG_SIZE(12288)
)
M25P32_CONFIG1 (
	.clk_in(clk1),
	.rst_in(rst),
	.configuration_out(configurationNR),
	.trig_in(cmd_trig),
	.addr_in(cmd_addr),
	.data1_in(cmd_data1in),
	.data2_in(cmd_data2in),
	.data_out(cmd_dataout_M25P32_CONFIG),
	.spi_scs_out(flash_scs),
	.spi_sck_out(flash_sck),
	.spi_sdo_out(flash_sdi),
	.spi_sdi_in(flash_sdo)
);

always @(posedge clk1) begin
	configuration <= configurationNR;
end

///////////////////////////////////////////////////////////////////////////////
// Slow data logger - pipes data directly out through the OK interface

// These go in the reverse order that they are read out on the PC
reg	[239:0]	LoggerData;

reg 	[31:0]	dummy_counter;
always @(posedge clk1) dummy_counter <= dummy_counter + 1'b1;

`ifdef CONFIG_SIMPLEPI
always @(posedge clk1) LoggerData <= {
	ADCraw[1], ADCraw[0], // these are really only for debugging and could be taken out if we want to output another variable
	TRANSFERcos, TRANSFERsin, 
	DACin[2][SIGNAL_SIZE-1:SIGNAL_SIZE-16], DACin[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16], DACin[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16], 
	PHASEDETraw, LOCKINout[SIGNAL_SIZE-1:SIGNAL_SIZE-16], 
	ADCout[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16], ADCout[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16],
	{10'b0, DOUT_f, DIN_f}, dummy_counter
	};
`endif // CONFIG_SIMPLEPI
`ifdef CONFIG_TESTHARDWARE
always @(posedge clk1) LoggerData <= {
	ADCraw[1], ADCraw[0], // these are really only for debugging and could be taken out if we want to output another variable
	16'b0, 16'b0, 
	DACin[2][SIGNAL_SIZE-1:SIGNAL_SIZE-16], DACin[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16], DACin[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16], 
	32'b0, 16'b0, 
	ADCout[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16], ADCout[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16],
	{10'b0, 3'b0, 3'b0}, dummy_counter
	};
`endif // CONFIG_TESTHARDWARE

wire				PipeOutA0Write;
wire	[15:0]	PipeOutA0DataIn;
wire  			PipeOutA0Empty;
wire  			PipeOutA0Full;

Logger Logger1(
	.clk_in(clk1),
	.rst_in(rst),
	.data_in(LoggerData),
	.PipeFull_in(PipeOutA0Full),
	.PipeEmpty_in(PipeOutA0Empty),
	.PipeWrite_out(PipeOutA0Write),
	.PipeData_out(PipeOutA0DataIn)
);

///////////////////////////////////////////////////////////////////////////////
// Fast data logger - stores data to the DDR2 RAM to be piped out later

wire        PipeOutA1Reset;
wire        PipeOutA1WriteClock;
wire        PipeOutA1Write;
wire [63:0] PipeOutA1DataIn;
wire [8:0]  PipeOutA1Count;

DDR2Logger Logger2(
	.clk_in(clk1),
	.rst_in(rst),
	
	.cmd_trig_in(cmd_trig),
	.cmd_addr_in(cmd_addr),
	.cmd_data_in(cmd_data1in),
	
	.data_in(LoggerData),
	
	.PipeReset_out(PipeOutA1Reset),
	.PipeWriteClock_out(PipeOutA1WriteClock),
	.PipeWrite_out(PipeOutA1Write),
	.PipeData_out(PipeOutA1DataIn),
	.PipeCount_in(PipeOutA1Count),
	
	.mcb3_dram_dq(mcb3_dram_dq),
	.mcb3_dram_a(mcb3_dram_a),
	.mcb3_dram_ba(mcb3_dram_ba),
	.mcb3_dram_ras_n(mcb3_dram_ras_n),
	.mcb3_dram_cas_n(mcb3_dram_cas_n),
	.mcb3_dram_we_n(mcb3_dram_we_n),
	.mcb3_dram_odt(mcb3_dram_odt),
	.mcb3_dram_cke(mcb3_dram_cke),
	.mcb3_dram_dm(mcb3_dram_dm),
	.mcb3_dram_udqs(mcb3_dram_udqs),
	.mcb3_dram_udqs_n(mcb3_dram_udqs_n),
	.mcb3_rzq(mcb3_rzq),
	.mcb3_zio(mcb3_zio),
	.mcb3_dram_udm(mcb3_dram_udm),
	.mcb3_dram_dqs(mcb3_dram_dqs),
	.mcb3_dram_dqs_n(mcb3_dram_dqs_n),
	.mcb3_dram_ck(mcb3_dram_ck),
	.mcb3_dram_ck_n(mcb3_dram_ck_n),
	.mcb3_dram_cs_n(mcb3_dram_cs_n),
	.c3_sys_rst_n(c3_sys_rst_n)
);

///////////////////////////////////////////////////////////////////////////////
// ADCs

// Configuration register
wire   [1023:0]	ADCconfig[0:1];

assign ADCconfig[0]   = configuration[3071:2048];
assign ADCconfig[1]   = configuration[4095:3072];

// Parameters
localparam SIGNAL_SIZE = 24;

// ADCs
wire signed	[15:0]				ADCraw[0:1];		// out of the LTC2195
wire signed	[SIGNAL_SIZE-1:0]	ADCout[0:1];		// after the low pass filter
reg  signed	[SIGNAL_SIZE-1:0]	ADCdiff;				// difference of the two ADCs

`ifdef CONFIG_TESTHARDWARE
AD8251x2 AD8251x2_in(
	.clk_in(clk1),
	.rst_in(rst),
	.gain0_in(2'b00),
	.gain1_in(2'b00),
	.A0_out(AD8251_IN_A0),
	.A1_out(AD8251_IN_A1),
	.WR0_out(AD8251_IN_WR0),
	.WR1_out(AD8251_IN_WR1)
);
`else // CONFIG_TESTHARDWARE
AD8251x2 AD8251x2_in(
	.clk_in(clk1),
	.rst_in(rst),
	.gain0_in(2'b11 - ADCconfig[0][129:128]),
	.gain1_in(2'b11 - ADCconfig[1][129:128]),
	.A0_out(AD8251_IN_A0),
	.A1_out(AD8251_IN_A1),
	.WR0_out(AD8251_IN_WR0),
	.WR1_out(AD8251_IN_WR1)
);
`endif // CONFIG_TESTHARDWARE

LTC2195 LTC2195_inst(
	.clk_in(clk1),
	.rst_in(rst),
	.cmd_trig_in(cmd_trig),
	.cmd_addr_in(cmd_addr),
	.cmd_data_in(cmd_data1in),
	.spi_scs_out(LTC2195_SCS),
	.spi_sck_out(LTC2195_SCK),
	.spi_sdo_out(LTC2195_SDI),
	.spi_sdi_in(LTC2195_SDO),
	.ENC_out_p(LTC2195_ENC_P),
	.ENC_out_n(LTC2195_ENC_N),
	.FR_in_p(LTC2195_FR_P),
	.FR_in_n(LTC2195_FR_N),
	.DCO_in_p(LTC2195_DCO_P),
	.DCO_in_n(LTC2195_DCO_N),
	.D0_in_p(LTC2195_D0_P),
	.D0_in_n(LTC2195_D0_N),
	.D1_in_p(LTC2195_D1_P),
	.D1_in_n(LTC2195_D1_N),
	.ADC0_out(ADCraw[0]),
	.ADC1_out(ADCraw[1]),
	.FR_out(cmd_dataout_LTC2195_0[3:0])
);

assign cmd_dataout_LTC2195_0[15:4] = 12'b0;
assign cmd_dataout_LTC2195_1 = ADCraw[0];
assign cmd_dataout_LTC2195_2 = ADCraw[1];

wire   [159:0]	ADCconfig_IIR0[0:1];

genvar adc_index;
generate for (adc_index = 0; adc_index < 2; adc_index = adc_index + 1) begin: adcs

	assign ADCconfig_IIR0[adc_index] = ADCconfig[adc_index][303:144];

	IIRfilter1stOrder #(
		.SIGNAL_IN_SIZE(16),
		.SIGNAL_OUT_SIZE(SIGNAL_SIZE)
	)
	IIR0(
		.clk_in(clk1),
		.on_in(ADCconfig_IIR0[adc_index][0]),
		.a1_in(ADCconfig_IIR0[adc_index][50:16]),
		.b0_in(ADCconfig_IIR0[adc_index][98:64]),
		.b1_in(ADCconfig_IIR0[adc_index][146:112]),
		.signal_in(ADCraw[adc_index]),
		.signal_out(ADCout[adc_index])
	);
end
endgenerate

always @(posedge clk1) begin
	ADCdiff <= ADCout[0] - ADCout[1];
end

///////////////////////////////////////////////////////////////////////////////
// DACs

// Configuration register
wire   [2047:0]	DACconfig[0:2];

assign DACconfig[0]   = configuration[8191:6144];
assign DACconfig[1]   = configuration[10239:8192];
assign DACconfig[2]   = configuration[12287:10240];

wire signed [SIGNAL_SIZE-1:0]	DACin[0:2];

AD9783 #(
	.SMP_DLY(8'hD)
)
AD9783_inst(
	.clk_in(clk1),
	.rst_in(rst),
	.cmd_trig_in(cmd_trig),
	.cmd_addr_in(cmd_addr),
	.cmd_data_in(cmd_data1in),
	.cmd_data_out(cmd_dataout_AD9783),
	.rst_out(AD9783_RST),
	.spi_scs_out(AD9783_SCS),
	.spi_sck_out(AD9783_SCK),
	.spi_sdo_out(AD9783_SDI),
	.spi_sdi_in(AD9783_SDO),
//	.DAC0_in(PHASEDETdebug_out[47:32]),
//	.DAC1_in(PHASEDETdebug_out[63:48]),
	.DAC0_in(DACin[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16]),
	.DAC1_in(DACin[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16]),
	.CLK_out_p(AD9783_CLK_P),
	.CLK_out_n(AD9783_CLK_N),
	.DCI_out_p(AD9783_DCI_P),
	.DCI_out_n(AD9783_DCI_N),
	.D_out_p(AD9783_D_P),
	.D_out_n(AD9783_D_N)
);

`ifdef CONFIG_TESTHARDWARE
AD8251x2 AD8251x2_out(
	.clk_in(clk1),
	.rst_in(rst),
	.gain0_in(2'b10),
	.gain1_in(2'b10),
	.A0_out(AD8251_OUT_A0),
	.A1_out(AD8251_OUT_A1),
	.WR0_out(AD8251_OUT_WR0),
	.WR1_out(AD8251_OUT_WR1)
);
`else // CONFIG_TESTHARDWARE
AD8251x2 AD8251x2_out(
	.clk_in(clk1),
	.rst_in(rst),
	.gain0_in(DACconfig[0][131:130]),
	.gain1_in(DACconfig[1][131:130]),
	.A0_out(AD8251_OUT_A0),
	.A1_out(AD8251_OUT_A1),
	.WR0_out(AD8251_OUT_WR0),
	.WR1_out(AD8251_OUT_WR1)
);
`endif // CONFIG_TESTHARDWARE

AD5791 AD5791_inst(
	.clk_in(clk1),
	.rst_in(rst),
	.DAC_in(DACin[2][SIGNAL_SIZE-1:SIGNAL_SIZE-20]),
	.ldac_out(AD5791_LDAC),
	.clr_out(AD5791_CLR),
	.rst_out(AD5791_RST),
	.spi_scs_out(AD5791_SCS),
	.spi_sck_out(AD5791_SCK),
	.spi_sdo_out(AD5791_SDI),
	.spi_sdi_in(AD5791_SDO)
);

///////////////////////////////////////////////////////////////////////////////
// Loop filters

`ifdef CONFIG_SIMPLEPI
`include "SuperLaserLand_CONFIG_SIMPLEPI.v"
`endif // CONFIG_SIMPLEPI

///////////////////////////////////////////////////////////////////////////////
// Firmware for testing DACs and ADCs

`ifdef CONFIG_TESTHARDWARE
`include "SuperLaserLand_CONFIG_TESTHARDWARE.v"
`endif // CONFIG_TESTHARDWARE

///////////////////////////////////////////////////////////////////////////////
// Opal Kelly interface
wire            ti_clk;

wire [30:0]     ok1;
wire [16:0]     ok2;
wire [17*8-1:0] ok2x;
okWireOR # (.N(8)) wireOR (.ok2(ok2), .ok2s(ok2x));

okHost okHI(
	.hi_in(hi_in),
	.hi_out(hi_out),
	.hi_inout(hi_inout),
	.hi_aa(hi_aa),
	.ti_clk(ti_clk),
	.ok1(ok1),
	.ok2(ok2)
);

okWireIn    ep00 (.ok1(ok1),                           .ep_addr(8'h00), .ep_dataout(WireIn00));
okWireIn    ep01 (.ok1(ok1),                           .ep_addr(8'h01), .ep_dataout(WireIn01));
okWireIn    ep02 (.ok1(ok1),                           .ep_addr(8'h02), .ep_dataout(WireIn02));

okWireOut   ep20 (.ok1(ok1), .ok2(ok2x[ 0*17 +: 17 ]), .ep_addr(8'h20), .ep_datain(WireOut20));
okWireOut   ep21 (.ok1(ok1), .ok2(ok2x[ 1*17 +: 17 ]), .ep_addr(8'h21), .ep_datain(WireOut21));
okWireOut   ep22 (.ok1(ok1), .ok2(ok2x[ 2*17 +: 17 ]), .ep_addr(8'h22), .ep_datain(WireOut22));
okWireOut   ep23 (.ok1(ok1), .ok2(ok2x[ 3*17 +: 17 ]), .ep_addr(8'h23), .ep_datain(WireOut23));
okWireOut   ep24 (.ok1(ok1), .ok2(ok2x[ 4*17 +: 17 ]), .ep_addr(8'h24), .ep_datain(WireOut24));
okWireOut   ep25 (.ok1(ok1), .ok2(ok2x[ 5*17 +: 17 ]), .ep_addr(8'h25), .ep_datain(WireOut25));

okTriggerIn ep40 (.ok1(ok1),                           .ep_addr(8'h40), .ep_clk(clk1), .ep_trigger(TrigIn40));

// FIFO and pipe out for slow streaming data transfer
wire        	 PipeOutA0Read;
wire [15:0] 	 PipeOutA0DataOut;
fifo_w16_4096_r16_4096 epA0FIFO (
	.rst(1'b0),
	.wr_clk(clk1),
	.wr_en(PipeOutA0Write),
	.din(PipeOutA0DataIn),
	.rd_clk(ti_clk),
	.rd_en(PipeOutA0Read),
   .dout(PipeOutA0DataOut),
   .empty(PipeOutA0Empty),
	.full(PipeOutA0Full)
);
okPipeOut epA0 (.ok1(ok1), .ok2(ok2x[ 6*17 +: 17 ]), .ep_addr(8'hA0), .ep_datain(PipeOutA0DataOut), .ep_read(PipeOutA0Read));

// FIFO and pipe out for reading data from the RAM
wire        	 PipeOutA1Read;
wire [15:0] 	 PipeOutA1DataOut;
fifo_w64_512_r16_2048 okPipeOut_fifo (
	.rst(PipeOutA1Reset),
	.wr_clk(PipeOutA1WriteClock),
	.wr_en(PipeOutA1Write),
	.din(PipeOutA1DataIn), // Bus [63 : 0] 
	.rd_clk(ti_clk),
	.rd_en(PipeOutA1Read),
	.dout(PipeOutA1DataOut), // Bus [15 : 0] 
	.wr_data_count(PipeOutA1Count) // Bus [8 : 0]
);
okPipeOut epA1 (.ok1(ok1), .ok2(ok2x[ 7*17 +: 17 ]), .ep_addr(8'hA1), .ep_read(PipeOutA1Read),   .ep_datain(PipeOutA1DataOut));

endmodule
