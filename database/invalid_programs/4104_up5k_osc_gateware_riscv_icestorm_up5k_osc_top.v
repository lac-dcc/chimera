// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// up5k_osc_top.v - top level for osc in up5k
// 04-16-21 E. Brombaugh
// 04-19-21 E. Brombaugh - updated for new board

`default_nettype none

module up5k_osc_top(
	// 12MHz clock osc
	input clk_12,
	
	// ADC SPI bus
	output adc_cs, adc_si, adc_clk,
	input adc_so,
	
	// LEDs
	output RGB0, RGB1, RGB2, // RGB LED outs
	output LEDR,			// discrete LED
	
	// Differential PDM Audio
	output pdm_l_p, pdm_l_n, pdm_r_p, pdm_r_n,
	
	// Serial port
	output tx,
	output rx,
	
	// SYNC input
	input SYNC,

	// toggle inputs
	input [1:0] SW103, SW104, SW105,	// mod1, range, mod2
	
	// SPI Flash
	output MEM_SPI_MOSI_IO0, MEM_SPI_SCLK, MEM_SPI_CS,
	output MEM_SPI_WP_IO2, MEM_SPI_HLD_IO3,
	input MEM_SPI_MISO_IO1
);
	//------------------------------
	// Clock PLL
	//------------------------------
	// Fin=12, FoutA=24, FoutB=48
	wire clk, clk24, pll_lock;
	SB_PLL40_2F_PAD #(
		.DIVR(4'b0000),
		.DIVF(7'b0111111),	// 24/48
		.DIVQ(3'b100),
		.FILTER_RANGE(3'b001),
		.FEEDBACK_PATH("SIMPLE"),
		.DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
		.FDA_FEEDBACK(4'b0000),
		.DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
		.FDA_RELATIVE(4'b0000),
		.SHIFTREG_DIV_MODE(2'b00),
		.PLLOUT_SELECT_PORTA("GENCLK_HALF"),
		.PLLOUT_SELECT_PORTB("GENCLK"),
		.ENABLE_ICEGATE_PORTA(1'b0),
		.ENABLE_ICEGATE_PORTB(1'b0)
	)
	pll_inst (
		.PACKAGEPIN(clk_12),
		.PLLOUTCOREA(clk24),
		.PLLOUTGLOBALA(),
		.PLLOUTCOREB(clk),
		.PLLOUTGLOBALB(),
		.EXTFEEDBACK(),
		.DYNAMICDELAY(8'h00),
		.RESETB(1'b1),
		.BYPASS(1'b0),
		.LATCHINPUTVALUE(),
		.LOCK(pll_lock),
		.SDI(),
		.SDO(),
		.SCLK()
	);
	
	//------------------------------
	// reset generator waits > 10us
	//------------------------------
	reg [8:0] reset_cnt;
	reg reset, reset24;    
	always @(posedge clk or negedge pll_lock)
	begin
		if(!pll_lock)
		begin
			reset_cnt <= 9'h000;
			reset <= 1'b1;
		end
		else
		begin
			if(reset_cnt != 9'h1ff)
			begin
				reset_cnt <= reset_cnt + 9'h001;
				reset <= 1'b1;
			end
			else
				reset <= 1'b0;
		end
	end
	
	always @(posedge clk24 or negedge pll_lock)
		if(!pll_lock)
			reset24 <= 1'b1;
		else
			reset24 <= reset;
	
	//------------------------------
	// Instantiate RISC-V system
	//------------------------------
	wire [31:0] gpo;
	wire sys_diag;
	system u_riscv(
		.clk24(clk24),
		.reset(reset24),
		.RX(rx),
		.TX(tx),
		.gp_in0(SW103),
		.gp_in1(SW104),
		.gp_in2(SW105),
		.gp_in3(SYNC),
		.gp_out(gpo),
		.diag(sys_diag)
	);

	//------------------------------
	// Instantiate RGB DRV 
	//------------------------------
	SB_RGBA_DRV #(
		.RGB0_CURRENT("0b000001"),
		.RGB1_CURRENT("0b000001"),
		.RGB2_CURRENT("0b000001")
	) RGBA_DRIVER (
	   .CURREN    (1'b1),
	   .RGBLEDEN  (1'b1), // Enable current for all 3 RGB LED pins
	   .RGB0PWM   (gpo[17]), // Input to drive RGB0 - from LEDD HardIP
	   .RGB1PWM   (gpo[18]), // Input to drive RGB1 - from LEDD HardIP
	   .RGB2PWM   (gpo[19]), // Input to drive RGB2 - from LEDD HardIP
	   .RGB0      (RGB0), 
	   .RGB1      (RGB1),
	   .RGB2      (RGB2)
	);

	assign LEDR = gpo[20];
endmodule
