// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// tb_tst_6502.v - testbench for test 6502 core
// 02-11-19 E. Brombaugh

`timescale 1ns/1ps
`default_nettype none

module tb_tst_6502;
    reg clk;
    reg clk_2x;
    reg reset;
	wire [3:0] vdac;
	wire [7:0] gpio_o;
	reg [7:0] gpio_i;
	reg RX;
    wire TX;
	wire snd_l, snd_r, snd_nmute;
    wire spi0_mosi, spi0_miso, spi0_sclk, spi0_cs0;
	wire ps2_clk, ps2_dat;
	wire rgb0, rgb1, rgb2;
	wire [3:0] tst;
	
    // clock sources
    always
        #31.25 clk = ~clk;
    always
		#15.625 clk_2x = ~clk_2x;
	
    // reset
    initial
    begin
`ifdef icarus
  		$dumpfile("tb_tst_6502.vcd");
		$dumpvars;
`endif
        
        // init regs
        clk = 1'b0;
        clk_2x = 1'b0;
        reset = 1'b1;
        RX = 1'b1;
        
        // release reset
        #1000
        reset = 1'b0;
        
`ifdef icarus
        // stop after 1 sec
		#10000000 $finish;
`endif
    end
    
    // Unit under test
    tst_6502 uut(
        .clk(clk),              // 16MHz CPU clock
        .clk_2x(clk_2x),        // 32MHz Video clock
        .reset(reset),          // Low-true reset
		.vdac(vdac),			// video DAC
        .gpio_o(gpio_o),        // gpio
        .gpio_i(gpio_i),
        .RX(RX),                // serial
        .TX(TX),
		.snd_l(snd_l),			// audio
		.snd_r(snd_r),
		.snd_nmute(snd_nmute),
		.spi0_mosi(spi0_mosi),	// SPI core 0
		.spi0_miso(spi0_miso),
		.spi0_sclk(spi0_sclk),
		.spi0_cs0(spi0_cs0),
		.ps2_clk(ps2_clk),		// PS/2 Keyboard port
		.ps2_dat(ps2_dat),
		.rgb0(rgb0),			// LED drivers
		.rgb1(rgb1),
		.rgb2(rgb2),
		.tst(tst)				// diagnostic port
    );
endmodule
