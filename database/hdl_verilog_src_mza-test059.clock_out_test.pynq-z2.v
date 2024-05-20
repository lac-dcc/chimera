// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// written 2022-11-16 by mza
// ~/tools/Xilinx/Vivado/2020.2/data/xicom/cable_drivers/lin64/install_script/install_drivers$ sudo ./install_drivers
// last updated 2023-10-20 by mza

module icyrus7series10bit (
	input half_bit_clock_p, half_bit_clock_n,
	//output word_clock,
	input word_clock,
	input reset,
	output [9:0] output_word,
	input input_bit
);
	wire refined_half_bit_clock_p, refined_half_bit_clock_n;
	assign refined_half_bit_clock_p = half_bit_clock_p;
//	BUFIO mediate_p (.I(half_bit_clock_p), .O(refined_half_bit_clock_p));
	assign refined_half_bit_clock_n = half_bit_clock_n;
//	BUFIO mediate_n (.I(half_bit_clock_n), .O(refined_half_bit_clock_n));
//	BUFR #(.BUFR_DIVIDE("5"), .SIM_DEVICE("7SERIES")) deviate (.I(refined_half_bit_clock_p), .O(word_clock), .CLR(reset), .CE(1'b1));
	// ISERDESE2: Input SERial/DESerializer with Bitslip 7 Series Xilinx HDL Language Template, version 2018.3 from UG953 (v2018.3) December 5, 2018
	wire shiftout1, shiftout2;
	ISERDESE2 #(
		.DATA_RATE("DDR"), // DDR, SDR
		.DATA_WIDTH(10), // Parallel data width (2-8,10,14)
		.DYN_CLKDIV_INV_EN("FALSE"), // Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
		.DYN_CLK_INV_EN("FALSE"), // Enable DYNCLKINVSEL inversion (FALSE, TRUE)
		.INIT_Q1(1'b0), .INIT_Q2(1'b0), .INIT_Q3(1'b0), .INIT_Q4(1'b0), // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
		.INTERFACE_TYPE("NETWORKING"), // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
		.IOBDELAY("NONE"), // NONE, BOTH, IBUF, IFD
		.NUM_CE(1), // Number of clock enables (1,2)
		.OFB_USED("FALSE"), // Select OFB path (FALSE, TRUE)
		.SERDES_MODE("MASTER"), // M*****, S****
		// SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
		.SRVAL_Q1(1'b0), .SRVAL_Q2(1'b0), .SRVAL_Q3(1'b0), .SRVAL_Q4(1'b0)
	) ISERDESE2_a (
		.O(), // 1-bit output: Combinatorial output
		// Q1 - Q8: 1-bit (each) output: Registered data outputs
		.Q1(output_word[0]), .Q2(output_word[1]), .Q3(output_word[2]), .Q4(output_word[3]),
		.Q5(output_word[4]), .Q6(output_word[5]), .Q7(output_word[6]), .Q8(output_word[7]),
		.SHIFTOUT1(shiftout1), .SHIFTOUT2(shiftout2), // SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
		.BITSLIP(1'b0), // 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to CLKDIV when asserted (active High). Subsequently, the data seen on the Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one position every time Bitslip is invoked (DDR operation is different from SDR).
		.CE1(1'b1), .CE2(1'b1), // CE1, CE2: 1-bit (each) input: Data register clock enable inputs
		.CLKDIVP(1'b0), // 1-bit input: MIG only; all others connect to GND
		// Clocks: 1-bit (each) input: ISERDESE2 clock input ports
		.CLK(refined_half_bit_clock_p), // 1-bit input: High-speed clock
		.CLKB(refined_half_bit_clock_n), // 1-bit input: High-speed secondary clock
		.CLKDIV(word_clock), // 1-bit input: Divided clock
		.OCLK(1'b0), // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"; all others connect to GND
		.OCLKB(1'b0), // 1-bit input: High speed negative edge output clock
		// Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
		.DYNCLKDIVSEL(1'b0), // 1-bit input: Dynamic CLKDIV inversion
		.DYNCLKSEL(1'b0), // 1-bit input: Dynamic CLK/CLKB inversion
		// Input Data: 1-bit (each) input: ISERDESE2 data input ports
		.D(input_bit), // 1-bit input: Data input
		.DDLY(1'b0), // 1-bit input: Serial data from IDELAYE2
		.OFB(1'b0), // 1-bit input: Data feedback from OSERDESE2
		.RST(reset), // 1-bit input: Active high asynchronous reset
		.SHIFTIN1(1'b0), .SHIFTIN2(1'b0) // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports; all others connect to GND
	);
	ISERDESE2 #(
		.DATA_RATE("DDR"), // DDR, SDR
		.DATA_WIDTH(10), // Parallel data width (2-8,10,14)
		.DYN_CLKDIV_INV_EN("FALSE"), // Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
		.DYN_CLK_INV_EN("FALSE"), // Enable DYNCLKINVSEL inversion (FALSE, TRUE)
		.INIT_Q1(1'b0), .INIT_Q2(1'b0), .INIT_Q3(1'b0), .INIT_Q4(1'b0), // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
		.INTERFACE_TYPE("NETWORKING"), // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
		.IOBDELAY("NONE"), // NONE, BOTH, IBUF, IFD
		.NUM_CE(1), // Number of clock enables (1,2)
		.OFB_USED("FALSE"), // Select OFB path (FALSE, TRUE)
		.SERDES_MODE("SLAVE"), // M*****, S****
		// SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
		.SRVAL_Q1(1'b0), .SRVAL_Q2(1'b0), .SRVAL_Q3(1'b0), .SRVAL_Q4(1'b0)
	) ISERDESE2_1 (
		.O(), // 1-bit output: Combinatorial output
		// Q1 - Q8: 1-bit (each) output: Registered data outputs
		.Q1(), .Q2(), .Q3(output_word[8]), .Q4(output_word[9]),
		.Q5(), .Q6(), .Q7(), .Q8(),
		.SHIFTOUT1(), .SHIFTOUT2(), // SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
		.BITSLIP(1'b0), // 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to CLKDIV when asserted (active High). Subsequently, the data seen on the Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one position every time Bitslip is invoked (DDR operation is different from SDR).
		.CE1(1'b1), .CE2(1'b1), // CE1, CE2: 1-bit (each) input: Data register clock enable inputs
		.CLKDIVP(1'b0), // 1-bit input: MIG only; all others connect to GND
		// Clocks: 1-bit (each) input: ISERDESE2 clock input ports
		.CLK(refined_half_bit_clock_p), // 1-bit input: High-speed clock
		.CLKB(refined_half_bit_clock_n), // 1-bit input: High-speed secondary clock
		.CLKDIV(word_clock), // 1-bit input: Divided clock
		.OCLK(1'b0), // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"; all others connect to GND
		.OCLKB(1'b0), // 1-bit input: High speed negative edge output clock
		// Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
		.DYNCLKDIVSEL(1'b0), // 1-bit input: Dynamic CLKDIV inversion
		.DYNCLKSEL(1'b0), // 1-bit input: Dynamic CLK/CLKB inversion
		// Input Data: 1-bit (each) input: ISERDESE2 data input ports
		.D(), // 1-bit input: Data input
		.DDLY(1'b0), // 1-bit input: Serial data from IDELAYE2
		.OFB(1'b0), // 1-bit input: Data feedback from OSERDESE2
		.RST(reset), // 1-bit input: Active high asynchronous reset
		.SHIFTIN1(shiftout1), .SHIFTIN2(shiftout2) // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports; all others connect to GND
	);
endmodule

//MMCM #(.M(10.0), .D(1), .CLKOUT0_DIVIDE(1.0), .CLOCK_PERIOD_NS(10.0),
//	.CLKOUT1_DIVIDE(1), .CLKOUT2_DIVIDE(1), .CLKOUT3_DIVIDE(1),
//	.CLKOUT4_DIVIDE(1), .CLKOUT5_DIVIDE(1), .CLKOUT6_DIVIDE(1)) (
//	.clock_in(clock), .reset(reset), .locked(mmcm_locked),
//	.clock0_out_p(), .clock0_out_n(), .clock1_out_p(), .clock1_out_n(),
//	.clock2_out_p(), .clock2_out_n(), .clock3_out_p(), .clock3_out_n(),
//	.clock4_out(), .clock5_out(), .clock6_out());
module MMCM #(
	parameter M = 10.0, // overall multiply [2.0,64.0]
	parameter D = 1, // overall divide [1,106]
	parameter CLKOUT0_DIVIDE = 1.0, // this one is fractional [1.0,128.0]
	parameter CLKOUT1_DIVIDE = 1, // [1,128]
	parameter CLKOUT2_DIVIDE = 1,
	parameter CLKOUT3_DIVIDE = 1,
	parameter CLKOUT4_DIVIDE = 1,
	parameter CLKOUT5_DIVIDE = 1,
	parameter CLKOUT6_DIVIDE = 1,
	parameter CLOCK_PERIOD_NS = 10.0
) (
	input clock_in, // input=[10,800]MHz; PFD=[10,450]MHZ; VCO=[600,1200]MHz; OUT=[4.69,800]MHz for a "-1" grade zynq-7020
	input reset,
	output locked,
	output clock0_out_p, clock0_out_n,
	output clock1_out_p, clock1_out_n,
	output clock2_out_p, clock2_out_n,
	output clock3_out_p, clock3_out_n,
	output clock4_out,
	output clock5_out,
	output clock6_out
);
	wire clkfb;
	// MMCME2_BASE: Base Mixed Mode Clock Manager 7 Series Xilinx HDL Language Template, version 2018.3
	MMCME2_BASE #(
		.STARTUP_WAIT("FALSE"), // Delays DONE until MMCM is locked (FALSE, TRUE)
		.BANDWIDTH("OPTIMIZED"), // Jitter programming (OPTIMIZED, HIGH, LOW)
		.REF_JITTER1(0.0), // Reference input jitter in UI (0.000-0.999).
		.DIVCLK_DIVIDE(D), // Master division value (1-106)
		.CLKFBOUT_MULT_F(M), // Multiply value for all CLKOUT (2.000-64.000).
		.CLKFBOUT_PHASE(0.0), // Phase offset in degrees of CLKFB (-360.000-360.000).
		.CLKIN1_PERIOD(CLOCK_PERIOD_NS), // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
		.CLKOUT0_DIVIDE_F(CLKOUT0_DIVIDE), // Divide amount for CLKOUT0 (1.000-128.000).
		// CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
		.CLKOUT1_DIVIDE(CLKOUT1_DIVIDE),
		.CLKOUT2_DIVIDE(CLKOUT2_DIVIDE),
		.CLKOUT3_DIVIDE(CLKOUT3_DIVIDE),
		.CLKOUT4_DIVIDE(CLKOUT4_DIVIDE),
		.CLKOUT5_DIVIDE(CLKOUT5_DIVIDE),
		.CLKOUT6_DIVIDE(CLKOUT6_DIVIDE),
		// CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
		.CLKOUT0_DUTY_CYCLE(0.5),
		.CLKOUT1_DUTY_CYCLE(0.5),
		.CLKOUT2_DUTY_CYCLE(0.5),
		.CLKOUT3_DUTY_CYCLE(0.5),
		.CLKOUT4_DUTY_CYCLE(0.5),
		.CLKOUT5_DUTY_CYCLE(0.5),
		.CLKOUT6_DUTY_CYCLE(0.5),
		// CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
		.CLKOUT0_PHASE(0.0),
		.CLKOUT1_PHASE(0.0),
		.CLKOUT2_PHASE(0.0),
		.CLKOUT3_PHASE(0.0),
		.CLKOUT4_PHASE(0.0),
		.CLKOUT5_PHASE(0.0),
		.CLKOUT6_PHASE(0.0),
		.CLKOUT4_CASCADE("FALSE") // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
	) MMCME2_BASE_inst (
		// Clock Outputs: 1-bit (each) output: User configurable clock outputs
		.CLKOUT0(clock0_out_p), // 1-bit output: CLKOUT0
		.CLKOUT0B(clock0_out_n), // 1-bit output: Inverted CLKOUT0
		.CLKOUT1(clock1_out_p), // 1-bit output: CLKOUT1
		.CLKOUT1B(clock1_out_n), // 1-bit output: Inverted CLKOUT1
		.CLKOUT2(clock2_out_p), // 1-bit output: CLKOUT2
		.CLKOUT2B(clock2_out_n), // 1-bit output: Inverted CLKOUT2
		.CLKOUT3(clock3_out_p), // 1-bit output: CLKOUT3
		.CLKOUT3B(clock3_out_n), // 1-bit output: Inverted CLKOUT3
		.CLKOUT4(clock4_out), // 1-bit output: CLKOUT4
		.CLKOUT5(clock5_out), // 1-bit output: CLKOUT5
		.CLKOUT6(clock6_out), // 1-bit output: CLKOUT6
		// Feedback Clocks: 1-bit (each) output: Clock feedback ports
		.CLKFBOUT(clkfb), // 1-bit output: Feedback clock
		.CLKFBOUTB(), // 1-bit output: Inverted CLKFBOUT
		// Status Ports: 1-bit (each) output: MMCM status ports
		.LOCKED(locked), // 1-bit output: LOCK
		// Clock Inputs: 1-bit (each) input: Clock input
		.CLKIN1(clock_in), // 1-bit input: Clock
		// Control Ports: 1-bit (each) input: MMCM control ports
		.PWRDWN(1'b0), // 1-bit input: Power-down
		.RST(reset), // 1-bit input: Reset
		// Feedback Clocks: 1-bit (each) input: Clock feedback ports
		.CLKFBIN(clkfb) // 1-bit input: Feedback clock
	);
endmodule

module clock_out_test #(
	parameter clock_select = 0
) (
//	input sysclk, // unreliable 125 MHz, comes from RTL8211 (ethernet) via 50 MHz osc
	output [7:0] jb, // pmodB
	input [5:4] ja, // 127.216 MHz, comes from PMODA
//	input [7:6] ja, // 42.3724 MHz, comes from PMODA
	input [3:0] btn, // buttons
	input [1:0] sw, // switches
	output [3:0] led,
	output hdmi_rx_cec, // sysclock out (single-ended because of TMDS/LVDS shenanigans on pynq board)
	output hdmi_tx_cec, // dummy data
	output rpio_02_r, // dummy output
//	output rpio_03_r, // dummy output
	output rpio_04_r, // source word_clock out
	output rpio_08_r, // output_word[0]
	output rpio_09_r, // output_word[1]
	output rpio_10_r, // output_word[2]
	output rpio_11_r, // output_word[3]
	output rpio_12_r, // output_word[4]
	output rpio_13_r, // output_word[5]
	output rpio_14_r, // output_word[6]
	output rpio_15_r, // output_word[7]
	output rpio_16_r, // output_word[8]
	output rpio_17_r, // output_word[9]
	output hdmi_tx_clk_p, // sysclk output (TMDS_33 but pulled towards 1.2V with 28 Ohm resistors)
	output hdmi_tx_clk_n,
	input hdmi_rx_clk_p, // bit_clock in; 1.27216 GHz clock from gulfstream (TMDS_33 but pulled towards 1.2V with 28 Ohm resistors)
	input hdmi_rx_clk_n,
	input [2:0] hdmi_rx_d_p, // input_bit (TMDS_33 but pulled towards 1.2V with 28 Ohm resistors)
	input [2:0] hdmi_rx_d_n,
	input hdmi_tx_d2_p, // input_bit (TMDS_33 but pulled towards 1.2V with 28 Ohm resistors)
	input hdmi_tx_d2_n,
	output hdmi_tx_d1_p, // calmode (LVCMOS33 but can't drive below 0.7V due to 50 Ohm pullups on pynq board)
	output hdmi_tx_d1_n, // sckdac (LVCMOS33 but can't drive below 0.7V due to 50 Ohm pullups on pynq board)
	output hdmi_tx_d0_p, // sdidac (LVCMOS33 but can't drive below 0.7V due to 50 Ohm pullups on pynq board)
	output hdmi_tx_d0_n, // cslddac (active low; LVCMOS33 but can't drive below 0.7V due to 50 Ohm pullups on pynq board)
	inout hdmi_rx_scl, // LVCMOS33 but only driven to 0 or z, never to 1
	inout hdmi_rx_sda // LVCMOS33 but only driven to 0 or z, never to 1
);
	wire reset = btn[0];
	assign hdmi_rx_scl = 1'bz;
	assign hdmi_rx_sda = 1'bz;
//	assign hdmi_tx_d1_p = 0; // calmode
	assign hdmi_tx_d1_n = 0; // sckdac
	assign hdmi_tx_d0_p = 0; // sdidac
	assign hdmi_tx_d0_n = 1; // cslddac active low
	wire clock;
	if (clock_select) begin
//		IBUFG clock_in (.I(sysclk), .O(clock));
	end else begin
		IBUFGDS clock_in_diff (.I(ja[4]), .IB(ja[5]), .O(clock));
		//IBUFG clock_in_se (.I(ja[7]), .O(clock));
	end
//	OBUFDS (.I(clock), .O(hdmi_tx_clk_p), .OB(hdmi_tx_clk_n));
	wire clock_enable;
	assign clock_enable = sw[0];
	wire calmode;
	assign calmode = sw[1];
	assign hdmi_tx_d1_p = calmode;
	wire clock_oddr1;
	wire clock_oddr2;
	wire clock_oddr3;
	ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE")) oddr_inst1 (.C(clock), .CE(clock_enable), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0), .Q(clock_oddr1));
	ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE")) oddr_inst2 (.C(clock), .CE(clock_enable), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0), .Q(clock_oddr2));
	ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE")) oddr_inst3 (.C(clock), .CE(clock_enable), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0), .Q(clock_oddr3));
	OBUFDS (.I(clock_oddr1), .O(hdmi_tx_clk_p), .OB(hdmi_tx_clk_n));
	//OBUFDS (.I(1'b0), .O(hdmi_tx_clk_p), .OB(hdmi_tx_clk_n));
	//assign rpio_02_r = clock_oddr2;
	assign rpio_02_r = 0;
	//assign hdmi_tx_cec = clock_oddr3;
	assign hdmi_tx_cec = 0;
	//assign hdmi_rx_cec = clock_oddr3;
//	reg thing = 0;
//	always @(posedge hdmi_rx_clk_p) begin
//		thing <= hdmi_rx_cec;
//	end
//	assign rpio_03_r = thing;
//	assign rpio_03_r = clock;
	wire half_bit_clock_p;
	wire half_bit_clock_n;
	//IOBUFDS_DIFF_OUT clock_in (.IO(hdmi_rx_clk_p), .IOB(hdmi_rx_clk_n), .TM(1'b1), .TS(1'b1), .I(1'b0), .O(bit_clock), .OB(bit_clock_inverted));
	wire raw_half_bit_clock;
	wire word_clock;
	IBUFGDS clock_in_diff (.I(hdmi_rx_clk_p), .IB(hdmi_rx_clk_n), .O(raw_half_bit_clock));
	wire mmcm_locked;
	assign led[3] = 0;
	assign led[2] = calmode;
	assign led[1] = clock_enable;
	assign led[0] = mmcm_locked;
	wire raw_word_clock;
	MMCM #(
		//.M(4.0), .D(2), .CLOCK_PERIOD_NS(1.667), .CLKOUT0_DIVIDE(2.0), .CLKOUT4_DIVIDE(10) // 600 MHz -> bit_clock=600 MHz and word_clock=120 MHz
		.M(4.0), .D(2), .CLOCK_PERIOD_NS(1.965), .CLKOUT0_DIVIDE(2.0), .CLKOUT4_DIVIDE(10) // 508.8875 MHz -> bit_clock=508.8875 MHz and word_clock=101.7775 MHz
			) mymmcm (
		.clock_in(raw_half_bit_clock), .reset(reset), .locked(mmcm_locked),
		.clock0_out_p(half_bit_clock_p), .clock0_out_n(half_bit_clock_n), .clock1_out_p(), .clock1_out_n(),
		.clock2_out_p(), .clock2_out_n(), .clock3_out_p(), .clock3_out_n(),
		.clock4_out(raw_word_clock), .clock5_out(), .clock6_out());
	BUFG buffy (.I(raw_word_clock), .O(word_clock));
	wire input_bit;
	IBUFDS data_in (.I(hdmi_rx_d_p[1]), .IB(hdmi_rx_d_n[1]), .O(input_bit));
	ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE")) word_clock_oddr_inst (.C(word_clock), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0), .Q(word_clock_oddr2));
	assign rpio_04_r = word_clock_oddr2;
	wire [9:0] output_word;
	assign { rpio_17_r, rpio_16_r, rpio_15_r, rpio_14_r, rpio_13_r, rpio_12_r, rpio_11_r, rpio_10_r, rpio_09_r, rpio_08_r } = output_word;
	assign jb = output_word[9:2];
	reg word_reset = 1'b1;
	localparam COUNTER_PICKOFF = 15;
	reg [COUNTER_PICKOFF:0] counter = 0;
	always @(posedge word_clock) begin
		if (reset) begin
			word_reset <= 1'b1;
			counter <= 0;
		end else begin
			if (0==counter[COUNTER_PICKOFF]) begin
				counter = counter + 1'b1;
			end else begin
				word_reset <= 0;
			end
		end
	end
	icyrus7series10bit tenbit (.half_bit_clock_p(half_bit_clock_p), .half_bit_clock_n(half_bit_clock_n), .word_clock(word_clock), .reset(word_reset), .output_word(output_word), .input_bit(input_bit));
endmodule

