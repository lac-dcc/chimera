// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// osc2.v - oscillator with faster clock and enable
// 03-21-21 E. Brombaugh

`default_nettype none

module osc2(
    input clk,              // 48.0MHz CPU clock
    input reset,            // Low-true reset
	
	// external toggle switch inputs
	input [1:0] range, mod1, mod2,

	// SYNC input
	input sync,
	
	// PWM LED outputs
	output pwm_r, pwm_g, pwm_b,
	
	// Rate LED output
    output rate,
	
	// SPI ADC interface
	output adc_cs, adc_si, adc_clk,
	input adc_so,
	
	// Differentiall PDM outputs
	output pdm_l_p, pdm_l_n, pdm_r_p, pdm_r_n,
	
	// diagnostic
	output [1:0] diag,
	output [11:0] a0, a1, a2, a3
);
	// Sample rate enable
	reg [2:0] clk_cnt;
	reg ena;
	always @(posedge clk)
		if(reset)
		begin
			clk_cnt <= 3'b000;
			ena <= 1'b1;
		end
		else
		begin
			clk_cnt <= clk_cnt + 3'b001;
			if(clk_cnt == 3'b010)
			begin
				clk_cnt <= 3'b000;
				ena <= 1'b1;
			end
			else
				ena <= 1'b0;
		end
	
	// ADC
	//wire [11:0] a0, a1, a2, a3;
	wire a0_v, a1_v, a2_v, a3_v;
	adc u_adc(
		.clk(clk),
		.reset(reset),
		.adc_cs(adc_cs),
		.adc_si(adc_si),
		.adc_so(adc_so),
		.adc_clko(adc_clk),
		.a0(a0),	// CV1
		.a1(a1),	// CV3
		.a2(a2),	// CV2
		.a3(a3),	// 1V/Oct
		.a0_v(a0_v),
		.a1_v(a1_v),
		.a2_v(a2_v),
		.a3_v(a3_v)
	);
	
	// PWMs
	pwm u_pwm_r(
		.clk(clk),
		.val(a0[11:4]),
		.pwm(pwm_r)
	);
	pwm u_pwm_g(
		.clk(clk),
		.val(a1[11:4]),
		.pwm(pwm_g)
	);
	pwm u_pwm_b(
		.clk(clk),
		.val(a2[11:4]),
		.pwm(pwm_b)
	);

	// Expo Calculation
	wire [31:0] frq;
	expo_calc u_expo(
		.clk(clk),
		.reset(reset),
		.range(range),
		.in(a3),
		.in_v(a3_v),
		.out(frq)
	);
	
	// detect falling edge of sync
	reg sync_d, sync_edge;
	always @(posedge clk)
		if(ena)
		begin
			sync_d <= sync;
			sync_edge = !sync & sync_d;
		end
		
	// NCO
	reg [31:0] phs;
	always @(posedge clk)
		if(reset | sync_edge)
			phs <= 0;
		else if(ena)
			phs <= phs + frq;
	
	// Rate output
	assign rate = phs[31];
	
	// waveforms
	wire signed [15:0] saw = phs[31:16];
	wire signed [15:0] pwm;
	wire signed [15:0] sin;
		
	// square / pulse wave
	wire pwm_v;
	pulse_wave u_pulse(
		.clk(clk),
		.ena(ena),
		.phs(phs),
		.width(a1),
		.out(pwm),
		.valid(pwm_v)
	);
		
	// sine wave
	sine u_sine(
		.clk(clk),
		.reset(reset),
		.ena(ena),
		.phs(phs),
		.out(sin),
		.valid()
	);
	
	// select the outputs
	reg signed [15:0] src_l, src_r;
	always @(posedge clk)
		if(ena)
		begin
			case(mod1)
				2'b00: src_l = sin;
				2'b01: src_l = saw;
				2'b10: src_l = pwm;
				default: src_l = sin;
			endcase
			case(mod2)
				2'b00: src_r = sin;
				2'b01: src_r = saw;
				2'b10: src_r = pwm;
				default: src_r = sin;
			endcase
		end
	
	// PDM outputs
	pdm u_pdm_l(
		.clk(clk),
		.reset(reset),
		.ena(ena),
		.in(src_l),
		.pdm_p(pdm_l_p),
		.pdm_n(pdm_l_n)
	);
	pdm u_pdm_r(
		.clk(clk),
		.reset(reset),
		.ena(ena),
		.in(src_r),
		.pdm_p(pdm_r_p),
		.pdm_n(pdm_r_n)
	);
		
	// diagnostic
	assign diag[0] = rate;
	assign diag[1] = 1'b0;
endmodule
