///////////////////////////////////////////////////////////////////////////////
// AD9783.v
//
// 7/13/11
// David Leibrandt
//
//	AD9783 controller.
//
// addr_in = 16'h20?? --- get 8 bit SPI register with address = ??
// addr_in = 16'h21?? --- set 8 bit SPI register with address = ??
//
///////////////////////////////////////////////////////////////////////////////

// `include "timescale.v"
`timescale 1ps/1ps // this was in the SelectIO design

module AD9783(
	input	 wire							clk_in,
	input	 wire						   rst_in,

	input  wire 			  			cmd_trig_in,
	input  wire 			  [15:0] cmd_addr_in,
	input	 wire 			  [15:0] cmd_data_in,
	output wire  			  [15:0] cmd_data_out,
	
	output reg						 	rst_out,
	output wire						 	spi_scs_out,
	output wire						 	spi_sck_out,
	output wire						 	spi_sdo_out,
	input  wire						 	spi_sdi_in,
	
	input  wire	signed	  [15:0] DAC0_in,
	input  wire	signed	  [15:0] DAC1_in,
	
	output wire							CLK_out_p,
	output wire							CLK_out_n,
	output wire							DCI_out_p,
	output wire							DCI_out_n,
	output wire				  [15:0] D_out_p,
	output wire		  		  [15:0] D_out_n
);

// Parameters
parameter SMP_DLY	= 8'h0;

///////////////////////////////////////////////////////////////////////////////
// Generate the AD9783 clock

// The chip can run DDR at up to 500 MHz
// Note that DCMs have a max frequency of 360 MHz and PLLs have a max frequency of 900 MHz, but PLLs can only drive OSERDES2s and not ODDR2s
// I tried using a DCM at either 300 or 200 MHz with ODDR2s, but there were glitches on the output
// A PLL driving OSERDES2s works at up to 800 MHz

// 800 MHz PLL
wire clk8xInt; // pre-buffer
wire clk8x; 	// post-buffer
wire pllLocked, serstrobe;

PLL_BASE #(
	.BANDWIDTH("OPTIMIZED"),
	.CLK_FEEDBACK("CLKOUT0"),
	.COMPENSATION("SYSTEM_SYNCHRONOUS"),
	.DIVCLK_DIVIDE(1),
	.CLKFBOUT_MULT(8),
	.CLKFBOUT_PHASE(0.000),
	.CLKOUT0_DIVIDE(1),
	.CLKOUT0_PHASE(0.000),
	.CLKOUT0_DUTY_CYCLE(0.500),
	.CLKIN_PERIOD(10.0),
	.REF_JITTER(0.010)
)
pll_base_inst(
	.CLKOUT0(clk8xInt),
	.LOCKED(pllLocked),
	.RST(rst_in),
	.CLKFBIN(clk8x),
	.CLKIN(clk_in)
);

BUFPLL #(
	.DIVIDE(8),
	.ENABLE_SYNC("TRUE")
)
bufpll_inst(
	.PLLIN(clk8xInt),
	.IOCLK(clk8x),
	.GCLK(clk_in),
	.SERDESSTROBE(serstrobe),
	.LOCKED(pllLocked)
);

///////////////////////////////////////////////////////////////////////////////
// LVDS outputs

localparam N_LVDS = 18;
reg [2*N_LVDS-1:0] data_in;
always @(posedge clk_in) data_in = {2'b10, DAC1_in, 2'b01, DAC0_in};

wire   [N_LVDS-1:0] data_out_p, data_out_n;
assign CLK_out_p = data_out_p[17];
assign CLK_out_n = data_out_n[17];
assign DCI_out_p = data_out_p[16];
assign DCI_out_n = data_out_n[16];
assign D_out_p = data_out_p[15:0];
assign D_out_n = data_out_n[15:0];

wire   [N_LVDS-1:0] data_out_to_pins, data_out_to_pins_delay;

function integer delay_value;
	input i;
	begin
		case (i)
			0:		delay_value = 3;
			1:		delay_value = 2;
			2:		delay_value = 4;
			3:		delay_value = 3;
			4:		delay_value = 6;
			5:		delay_value = 6;
			6:		delay_value = 6;
			7:		delay_value = 8;
			8:		delay_value = 9;
			9:		delay_value = 2;
			10:	delay_value = 3;
			11:	delay_value = 7;
			12:	delay_value = 1;
			13:	delay_value = 4;
			14:	delay_value = 0;
			15:	delay_value = 0;
			16:	delay_value = 7;
			17:	delay_value = 0;
			default:
				delay_value = 0;
		endcase
	end
endfunction

// We have multiple bits - step over every bit, instantiating the required elements
genvar pin_count;
generate for (pin_count = 0; pin_count < N_LVDS; pin_count = pin_count + 1) begin: pins
	// Serializer
	wire cascade_ms_d;
   wire cascade_ms_t;
   wire cascade_sm_d;
   wire cascade_sm_t;
	
	OSERDES2 #(
		.DATA_RATE_OQ("SDR"),
		.DATA_RATE_OT("SDR"),
		.TRAIN_PATTERN(0),
      .DATA_WIDTH(8),
		.SERDES_MODE("MASTER"),
		.OUTPUT_MODE("SINGLE_ENDED")
	)
	oserdes2_master(
		.D1(data_in[pin_count]),
		.D2(data_in[N_LVDS + pin_count]),
		.D3(data_in[pin_count]),
		.D4(data_in[N_LVDS + pin_count]),
		.T1(1'b0),
      .T2(1'b0),
      .T3(1'b0),
      .T4(1'b0),
      .SHIFTIN1(1'b1),
      .SHIFTIN2(1'b1),
      .SHIFTIN3(cascade_sm_d),
      .SHIFTIN4(cascade_sm_t),
      .SHIFTOUT1(cascade_ms_d),
      .SHIFTOUT2(cascade_ms_t),
      .SHIFTOUT3(),
      .SHIFTOUT4(),
      .TRAIN(1'b0),
      .OCE(1'b1),											// clock enable
		.TCE(1'b1),
      .CLK0(clk8x),										// serial clock input
		.CLK1(1'b0),
		.CLKDIV(clk_in),									// parallel clock input
		.OQ(data_out_to_pins[pin_count]),			// serial data output
		.TQ(),
      .IOCE(serstrobe),
		.RST(rst_in)
	);
	
	OSERDES2 #(
		.DATA_RATE_OQ("SDR"),
		.DATA_RATE_OT("SDR"),
		.TRAIN_PATTERN(0),
      .DATA_WIDTH(8),
		.SERDES_MODE("SLAVE"),
		.OUTPUT_MODE("SINGLE_ENDED")
	)
	oserdes2_slave(
		.D1(data_in[pin_count]),
		.D2(data_in[N_LVDS + pin_count]),
		.D3(data_in[pin_count]),
		.D4(data_in[N_LVDS + pin_count]),
		.T1(1'b0),
      .T2(1'b0),
      .T3(1'b0),
      .T4(1'b0),
      .SHIFTIN1(cascade_ms_d),
      .SHIFTIN2(cascade_ms_t),
      .SHIFTIN3(1'b1),
      .SHIFTIN4(1'b1),
      .SHIFTOUT1(),
      .SHIFTOUT2(),
      .SHIFTOUT3(cascade_sm_d),
      .SHIFTOUT4(cascade_sm_t),
      .TRAIN(1'b0),
      .OCE(1'b1),											// clock enable
		.TCE(1'b1),
      .CLK0(clk8x),										// serial clock input
		.CLK1(1'b0),
		.CLKDIV(clk_in),									// parallel clock input
		.OQ(),
		.TQ(),
      .IOCE(serstrobe),
		.RST(rst_in)
	);
	
	// Delay
	IODELAY2 #(
		.DATA_RATE("DDR"),
		.ODELAY_VALUE(delay_value(pin_count)),
		.COUNTER_WRAPAROUND("STAY_AT_LIMIT"),
		.DELAY_SRC("ODATAIN"),
		.SERDES_MODE("NONE"),
		.SIM_TAPDELAY_VALUE(75)
	)
	iodelay2_inst(
		.ODATAIN(data_out_to_pins[pin_count]),		// datapath
		.DOUT(data_out_to_pins_delay[pin_count]),
		.T(1'b0),
		.IDATAIN(1'b0),									// inactive data connections
		.DATAOUT(),
		.DATAOUT2(),
		.TOUT(),
		.IOCLK0(1'b0),										// calibration clocks
		.IOCLK1(1'b0),
		.CLK(1'b0),											// variable delay programming
		.CAL(1'b0),
		.INC(1'b0),
		.CE(1'b0),
		.BUSY(),
		.RST(1'b0)
	);
	
	// Output buffer
	OBUFDS #(
		.IOSTANDARD("LVDS_25")
	)
	obufds_inst(
		.O(data_out_p[pin_count]),
		.OB(data_out_n[pin_count]),
		.I(data_out_to_pins_delay[pin_count])
	);
end
endgenerate

///////////////////////////////////////////////////////////////////////////////
// SPI state machine

reg			spi_trigger;
reg  [15:0]	spi_data;
wire			spi_ready;

SPI #(
	.TRANSFER_SIZE(16),
	.SPI_CLK_DIV(8'h05) // run the SPI clock at 10 MHz
)
AD_9783_SPI_inst(
	.clk_in(clk_in),
	.rst_in(rst_in),
	.trigger_in(spi_trigger),
	.data_in(spi_data),
	.data_out(cmd_data_out),
	.ready_out(spi_ready),
	.spi_scs_out(spi_scs_out),
	.spi_sck_out(spi_sck_out),
	.spi_sdo_out(spi_sdo_out),
	.spi_sdi_in(spi_sdi_in)
);

///////////////////////////////////////////////////////////////////////////////
// State machine which controls initialization and communicates with the PC

// State machine definitions
localparam IDLE 	= 4'h0;
localparam RST1   = 4'h1;
localparam RST2   = 4'h2;
localparam RST3A  = 4'h3;
localparam RST3B  = 4'h4;
localparam RST3C  = 4'h5;
localparam GET1A	= 4'h6;
localparam GET1B	= 4'h7;
localparam GET1C	= 4'h8;
localparam SET1A	= 4'h9;
localparam SET1B	= 4'hA;
localparam SET1C	= 4'hB;

// State
// The next line makes synthesis happy
// synthesis attribute INIT of state_f is "R"
reg  [3:0] state_f;
reg  [7:0] counter_f;

// State machine - combinatorial part
function [3:0] next_state;
	input    [3:0] state;
	input    [7:0] counter;
	input				trigger;
	input	  [15:0]	address;
	input				ready;
	
	begin
		case (state)
			IDLE: 
				if (trigger & (address[15:8] == 8'h20))
					next_state = GET1A;
				else if (trigger & (address[15:8] == 8'h21))
					next_state = SET1A;
				else
					next_state = IDLE;
			RST1:
				if (counter == 12'b1)
					next_state = RST2;
				else
					next_state = RST1;
			RST2:
					next_state = RST3A;
			RST3A:
				if (ready)
					next_state = RST3B;
				else
					next_state = RST3A;
			RST3B:
					next_state = RST3C;
			RST3C:
					next_state = IDLE;
			GET1A:
				if (ready)
					next_state = GET1B;
				else
					next_state = GET1A;
			GET1B:
					next_state = GET1C;
			GET1C:
					next_state = IDLE;
			SET1A:
				if (ready)
					next_state = SET1B;
				else
					next_state = SET1A;
			SET1B:
					next_state = SET1C;
			SET1C:
					next_state = IDLE;
			default:
					next_state = IDLE;
		endcase
	end
endfunction

// State machine - sequential part
always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		state_f <= RST1;
		counter_f <= 8'hFF;
		spi_trigger <= 1'b0;
	end
	else begin
		state_f <= next_state(state_f, counter_f, cmd_trig_in, cmd_addr_in, spi_ready);
		case (state_f)
			IDLE: begin
				spi_trigger <= 1'b0;
			end
			// Send a reset signal to the DAC
			RST1: begin
				rst_out <= 1'b1;
				counter_f <= counter_f - 12'b1;
			end
			RST2: begin
				rst_out <= 1'b0;
			end
			// Set SMP_DLY
			RST3A: begin
				spi_data <= {1'b0, 2'b0, 5'h5, SMP_DLY};
			end
			RST3B: begin
				spi_trigger <= 1'b1;
			end
			RST3C: begin
				spi_trigger <= 1'b0;
			end
			// Get the value of a SPI register
			GET1A: begin
				spi_data <= {1'b1, 2'b0, cmd_addr_in[4:0], 8'b0};
			end
			GET1B: begin
				spi_trigger <= 1'b1;
			end
			GET1C: begin
				spi_trigger <= 1'b0;
			end
			// Set the value of a SPI register
			SET1A: begin
				spi_data <= {1'b0, 2'b0, cmd_addr_in[4:0], cmd_data_in[7:0]};
			end
			SET1B: begin
				spi_trigger <= 1'b1;
			end
			SET1C: begin
				spi_trigger <= 1'b0;
			end
			endcase
	end
end

endmodule