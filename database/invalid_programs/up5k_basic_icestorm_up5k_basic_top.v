// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// up5k_basic_top.v - top level for tst_6502 in up5k
// 03-02-19 E. Brombaugh

`default_nettype none

module up5k_basic_top(
	// 16MHz clock osc
	input clk_16,
	
	// Reset input
	input NRST,
	
	// vga
	output [1:0] vga_r, vga_g, vga_b,
	output vga_vs, vga_hs,
    
    // video
    inout [3:0] vdac,
	
    // serial
    input RX,
    output TX,
	
	// sigma-delta audio
	output	audio_nmute,
			audio_l,
			audio_r,
	
	// SPI0 port
	inout	spi0_mosi,
			spi0_miso,
			spi0_sclk,
			spi0_cs0,
	
	// PS/2 keyboard port
	inout	ps2_clk,
			ps2_dat,
	
    // diagnostics
    output [3:0] tst,
	
	// gpio
    //input [3:0] pmod,
	
	// LED - via drivers
	output RGB0, RGB1, RGB2
);
	// temp override pmod input
	wire [3:0] pmod = 4'h0;
	
	// Fin=16, FoutA=16, FoutB=32
	wire clk, clk_2x, pll_lock;
	SB_PLL40_2F_PAD #(
		.DIVR(4'b0000),
		.DIVF(7'b0111111),
		.DIVQ(3'b101),
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
		.PACKAGEPIN(clk_16),
		.PLLOUTCOREA(clk),
		.PLLOUTGLOBALA(),
		.PLLOUTCOREB(clk_2x),
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
	
	// external reset debounce
	reg [7:0] ercnt;
	reg erst;
	always @(posedge clk)
	begin
		if(NRST == 1'b0)
		begin
			ercnt <= 8'h00;
			erst <= 1'b1;
		end
		else
		begin
			if(!&ercnt)
				ercnt <= ercnt + 8'h01;
			else
				erst <= 1'b0;
		end
	end
	
	// reset generator waits > 10us
	reg [7:0] reset_cnt;
	reg reset;    
	always @(posedge clk)
	begin
		if(!pll_lock)
		begin
			reset_cnt <= 8'h00;
			reset <= 1'b1;
		end
		else
		begin
			if(reset_cnt != 8'hff)
			begin
				reset_cnt <= reset_cnt + 8'h01;
				reset <= 1'b1;
			end
			else
				reset <= erst;
		end
	end
    
	// test unit
	wire [3:0] tst;
	wire [7:0] gpio_o;
	tst_6502 uut(
		.clk(clk),
		.clk_2x(clk_2x),
		.reset(reset),
    
        .vdac(vdac),
		
		.gpio_o(gpio_o),
		.gpio_i({4'h0,pmod}),
    
        .RX(RX),
        .TX(TX),
	
		.snd_nmute(audio_nmute),
		.snd_l(audio_l),
		.snd_r(audio_r),
	
		.spi0_mosi(spi0_mosi),
		.spi0_miso(spi0_miso),
		.spi0_sclk(spi0_sclk),
		.spi0_cs0(spi0_cs0),
	
		.ps2_clk(ps2_clk),
		.ps2_dat(ps2_dat),
		
		.rgb0(RGB0),
		.rgb1(RGB1),
		.rgb2(RGB2),
    
		.tst(tst)
	);
    
	// drive VGA
	assign {vga_r,vga_g,vga_b,vga_hs,vga_vs} = gpio_o;
endmodule
