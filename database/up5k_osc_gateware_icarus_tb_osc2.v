// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// tb_osc2.v - testbench for oscillator
// 03-21-21 E. Brombaugh

`timescale 1ns/1ps
`default_nettype none

module tb_osc2;
    reg clk;
    reg reset;
	reg [1:0] range, mod1, mod2;
	wire pwm_r, pwm_g, pwm_b;
	wire adc_cs, adc_si, adc_clk;
	wire adc_so;
	wire pdm_l_p, pdm_r_p, pdm_l_n, pdm_r_n;
	
    // 48 MHz clock source
    always
        #10.4167 clk = ~clk;
    
    // reset
    initial
    begin
`ifdef icarus
  		$dumpfile("tb_osc2.vcd");
		$dumpvars;
`endif
		
        // init regs
        clk = 1'b0;
        reset = 1'b1;
		range = 2'b00;
		mod1 = 2'b00;
		mod2 = 2'b00;
        //adc_so = 0;
		
		// force known value on adc chl 1
		force uut.a2 = 12'h001;
		
        // release reset
        #1000
        reset = 1'b0;
        
`ifdef icarus
        // stop after 1 sec
		//#12000000 $finish;
		#700000 $finish;
`endif
    end
	
    // Unit under test
    osc2 uut(
        .clk(clk),              // 16 MHz system clock
        .reset(reset),          // Low-true reset
		.range(range),			// range switch
		.mod1(mod1),			// mod1 switch
		.mod2(mod2),			// mod2 switch
		.pwm_r(pwm_r),			// R LED drive
		.pwm_g(pwm_g),			// G LED drive
		.pwm_b(pwm_b),			// B LED drive
		.adc_cs(adc_cs),		// ADC SPI chip select
		.adc_si(adc_si),		// ADC SPI serial input
		.adc_clk(adc_clk),		// ADC SPI clock
		.adc_so(adc_so),		// ADC SPI serial output
		.pdm_l_p(pdm_l_p),		// Audio PDM left output
		.pdm_l_n(pdm_l_n),		// Audio PDM left output
		.pdm_r_p(pdm_r_p),		// Audio PDM right output
		.pdm_r_n(pdm_r_n)		// Audio PDM right output
	);
	
	// record sine data
	//always @(posedge clk)
	//	if(uut.sin_v)
	//		$fwrite(ofile, "%d\n", uut.sin);
	
	// temp adc serial tests
	assign adc_so = adc_si;
endmodule
