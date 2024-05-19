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
	input rx,
	
	// SYNC input
	input SYNC,

	// toggle inputs
	input [1:0] SW103, SW104, SW105,	// mod1, range, mod2
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
	// switch inputs with pullups
	//------------------------------
	wire [1:0] mod1, mod2, range;
	toggle3pos t3p_mod1(
		.pkgpin(SW105),
		.out(mod1)
	);
	toggle3pos t3p_mod2(
		.pkgpin(SW103),
		.out(mod2)
	);
	toggle3pos t3p_range(
		.pkgpin(SW104),
		.out(range)
	);
    
	//------------------------------
	// main unit
	//------------------------------
	wire r_pwm, g_pwm, b_pwm;
	wire [1:0] diag;
	wire [11:0] a0, a1, a2, a3;
	osc2 uut(
		.clk(clk),
		.reset(reset),
	
		.range(range),
		.mod1(mod1),
		.mod2(mod2),
		
		.sync(SYNC),
		
		.pwm_r(r_pwm),
		.pwm_g(g_pwm),
		.pwm_b(b_pwm),
		
		.rate(LEDR),
		
		.adc_cs(adc_cs),
		.adc_si(adc_si),
		.adc_so(adc_so),
		.adc_clk(adc_clk),
		
		.pdm_l_p(pdm_l_p),
		.pdm_l_n(pdm_l_n),
		.pdm_r_p(pdm_r_p),
		.pdm_r_n(pdm_r_n),
		
		.diag(diag),
	    .a0(a0),
	    .a1(a1),
	    .a2(a2),
	    .a3(a3),
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
	   .RGB0PWM   (r_pwm), // Input to drive RGB0 - from LEDD HardIP
	   .RGB1PWM   (g_pwm), // Input to drive RGB1 - from LEDD HardIP
	   .RGB2PWM   (b_pwm), // Input to drive RGB2 - from LEDD HardIP
	   .RGB0      (RGB0), 
	   .RGB1      (RGB1),
	   .RGB2      (RGB2)
	);

	//------------------------------
	// diagnostics
	//------------------------------
`define SIMPLE_DIAG
`ifdef SIMPLE_DIAG
	// basic serial diagnostic w/o smarts
	diag_serial u_diag(
		.clk(clk),
		.reset(reset),
	    .a0(a0),
	    .a1(a1),
	    .a2(a2),
	    .a3(a3),
		.tx(tx)
	);
`else
	// RISC-V CPU based serial I/O
	system u_riscv(
		.clk24(clk24),
		.reset(reset24),
		.RX(rx),
		.TX(tx),
		.gp_in0({mod1,a0}),
		.gp_in1({mod2,a1}),
		.gp_in2({range,a2}),
		.gp_in3({SYNC,a3}),
		.gp_out(),
		.diag()
	);
`endif
endmodule
