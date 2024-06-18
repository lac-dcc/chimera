// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// tst_6502.v - test 6502 core
// 02-11-19 E. Brombaugh

`default_nettype none

module tst_6502(
	input	clk,			// 16MHz CPU clock
	input   clk_2x,			// 32MHz pixel clock
	input	reset,			// high-true reset
	
	inout   [3:0] vdac,		// composite video DAC
	
	output reg [7:0] gpio_o,	// GPIO port
	input [7:0] gpio_i,
	
	input	RX,				// serial RX
	output	TX,				// serial TX
	
	output	snd_l,			// left 1-bit audio output
	output	snd_r,			// right 1-bit audio output
	output	snd_nmute,		// audio /mute output
	
	inout	spi0_mosi,		// SPI core 0
			spi0_miso,
			spi0_sclk,
			spi0_cs0,
	
	inout	ps2_clk,		// PS/2 Keyboard port
			ps2_dat,
	
	output	rgb0,			// LED drivers
			rgb1,
			rgb2,
	
	output	[3:0] tst		// diagnostic
);
	// The 6502
	wire [15:0] CPU_AB;
	reg [7:0] CPU_DI;
	wire [7:0] CPU_DO;
	wire CPU_WE, CPU_IRQ, CPU_RDY;
	cpu ucpu(
		.clk(clk),
		.reset(reset),
		.AB(CPU_AB),
		.DI(CPU_DI),
		.DO(CPU_DO),
		.WE(CPU_WE),
		.IRQ(CPU_IRQ),
		.NMI(1'b0),
		.RDY(CPU_RDY)
	);
	
	// address decode
	wire ram0_sel = (CPU_AB[15] == 1'b0) ? 1 : 0;
	wire ram1_sel = ((CPU_AB[15:12] >= 4'h8)&&(CPU_AB[15:12] <= 4'hC)) ? 1 : 0;
	wire video_sel = ((CPU_AB[15:12] == 4'hd)||(CPU_AB[15:12] == 4'he)) ? 1 : 0;
	wire acia_sel = (CPU_AB[15:8] == 8'hf0) ? 1 : 0;
	wire wb_sel = (CPU_AB[15:8] == 8'hf1) ? 1 : 0;
	wire gpio_sel = (CPU_AB[15:8] == 8'hf2) ? 1 : 0;
	wire led_sel = (CPU_AB[15:8] == 8'hf3) ? 1 : 0;
	wire ps2_sel = (CPU_AB[15:8] == 8'hf4) ? 1 : 0;
	wire snd_sel = (CPU_AB[15:8] == 8'hf5) ? 1 : 0;
	wire vctl_sel = (CPU_AB[15:8] == 8'hf6) ? 1 : 0;
	wire rom_sel = (CPU_AB[15:11] == 5'h1f) ? 1 : 0;
	
	// system control and write protect bytes
	reg [7:0] sysctl, ram0_wp, ram1_wp;
	
	// 32kB RAM @ 0000-7FFF
	wire [7:0] ram0_do;
	ram_32kb uram0(
		.clk(clk),
		.sel(ram0_sel),
		.we(CPU_WE),
		.wp(ram0_wp),
		.addr(CPU_AB[14:0]),
		.din(CPU_DO),
		.dout(ram0_do)
	);
	
	// 20kB RAM @ 8000-CFFF
	wire [7:0] ram1_do;
	ram_32kb uram1(
		.clk(clk),
		.sel(ram1_sel),
		.we(CPU_WE),
		.wp(ram1_wp),
		.addr(CPU_AB[14:0]),
		.din(CPU_DO),
		.dout(ram1_do)
	);
	
	// 8kB Video RAM @ D000-EFFF, video control @ F600-F6FF
	wire [7:0] video_do, vctl_do;
	video uvid(
		.clk(clk),				// system clock
		.clk_2x(clk_2x),		// pixel clock
		.reset(reset),			// system reset
		.sel_ram(video_sel),	// video RAM select
		.sel_ctl(vctl_sel),		// video control select
		.we(CPU_WE),			// write enable
		.addr(CPU_AB[12:0]),	// address
		.din(CPU_DO),			// data bus input
		.ram_dout(video_do),	// ram data bus output
		.ctl_dout(vctl_do),		// ctl data bus output
		.vdac(vdac)				// video DAC
	);
		
	// 256B ACIA @ F000-F0FF
	wire [7:0] acia_do;
	wire acia_irq;
	acia uacia(
		.clk(clk),				// system clock
		.rst(reset),			// system reset
		.cs(acia_sel),			// chip select
		.we(CPU_WE),			// write enable
		.rs(CPU_AB[0]),			// address
		.rx(RX),				// serial receive
		.din(CPU_DO),			// data bus input
		.dout(acia_do),			// data bus output
		.tx(TX),				// serial transmit
		.irq(acia_irq)			// interrupt request
	);
	
	// 256B Wishbone bus master and SB IP cores @ F100-F1FF
	wire [7:0] wb_do;
	wire wb_irq, wb_rdy;
	system_bus usysbus(
		.clk(clk),				// system clock
		.rst(reset),			// system reset
		.cs(wb_sel),			// chip select
		.we(CPU_WE),			// write enable
		.addr(CPU_AB[7:0]),		// address
		.din(CPU_DO),			// data bus input
		.dout(wb_do),			// data bus output
		.rdy(wb_rdy),			// processor stall
		.irq(wb_irq),			// interrupt request
		.spi0_mosi(spi0_mosi),	// spi core 0 mosi
		.spi0_miso(spi0_miso),	// spi core 0 miso
		.spi0_sclk(spi0_sclk),	// spi core 0 sclk
		.spi0_cs0(spi0_cs0)		// spi core 0 cs
	);
	
	// combine IRQs
	assign CPU_IRQ = acia_irq | wb_irq;
	
	// combine RDYs
	assign CPU_RDY = wb_rdy;
	
	// 256B GPIO & sysctl @ F200-F2FF
	reg [7:0] gpio_do;
	// write
	always @(posedge clk)
		if(reset)
		begin
			gpio_o <= 8'h00;
			sysctl <= 8'h00;
			ram0_wp <= 8'h00;
			ram1_wp <= 8'h00;
		end
		else if((CPU_WE == 1'b1) && (gpio_sel == 1'b1))
		begin
			case(CPU_AB[1:0])
				2'b00: gpio_o <= CPU_DO;
				2'b01: sysctl <= CPU_DO;
				2'b10: ram0_wp <= CPU_DO;
				2'b11: ram1_wp <= CPU_DO;
			endcase
		end
		
	// read
	always @(posedge clk)
		if((CPU_WE == 1'b0) && (gpio_sel == 1'b1))
			case(CPU_AB[1:0])
				2'b00: gpio_do <= gpio_i;
				2'b01: gpio_do <= sysctl;
				2'b10: gpio_do <= ram0_wp;
				2'b11: gpio_do <= ram1_wp;
			endcase
			
	// LED PWM controller @ F300-F3FF
	wire [7:0] led_do;
	led_pwm uledpwm(
		.clk(clk),				// system clock
		.rst(reset),			// system reset
		.cs(led_sel),			// chip select
		.we(CPU_WE),			// write enable
		.addr(CPU_AB[3:0]),		// address
		.din(CPU_DO),			// data bus input
		.dout(led_do),			// data bus output
		.rgb0(rgb0),			// rgb0 pin
		.rgb1(rgb1),			// rgb1 pin
		.rgb2(rgb2)				// rgb2 pin
	);
			
	// PS/2 Keyboard port @ F400 - F4FF
	wire [7:0] ps2_do;
	wire [3:0] ps2_diag;
	ps2 ups2(
		.clk(clk),				// system clock
		.rst(reset),			// system reset
		.cs(ps2_sel),			// chip select
		.we(CPU_WE),			// write enable
		.addr(CPU_AB[1:0]),		// address
		.din(CPU_DO),			// data bus input
		.dout(ps2_do),			// data bus output
		.diag(ps2_diag),		// diagnostics
		.ps2_clk(ps2_clk),		// ps2 clock i/o
		.ps2_dat(ps2_dat)		// ps2 data i/o
	);
	
	// sound generator @ F500 - F5FF
	wire [7:0] snd_do;
	snd usnd(
		.clk(clk),				// system clock
		.rst(reset),			// system reset
		.cs(snd_sel),			// chip select
		.we(CPU_WE),			// write enable
		.addr(CPU_AB[3:0]),		// address
		.din(CPU_DO),			// data bus input
		.dout(snd_do),			// data bus output
		.snd_l(snd_l),			// left 1-bit DAC output
		.snd_r(snd_r),			// right 1-bit DAC output
		.snd_nmute(snd_nmute)	// audio /mute output
	);
	
	// 2kB ROM @ f800-ffff
	reg [7:0] rom_mem[2047:0];
	reg [7:0] rom_do;
	initial
		$readmemh("rom.hex",rom_mem);
	always @(posedge clk)
		rom_do <= rom_mem[CPU_AB[10:0]];

	// data mux only updates select lines when CPU_RDY asserted
	reg [9:0] mux_sel;
	always @(posedge clk)
		if(CPU_RDY)
			mux_sel <= {rom_sel,vctl_sel,snd_sel,ps2_sel,led_sel,gpio_sel,
						wb_sel,acia_sel,video_sel,ram1_sel,ram0_sel};
	always @(*)
		casez(mux_sel)
			11'b00000000001: CPU_DI = ram0_do;
			11'b0000000001z: CPU_DI = ram1_do;
			11'b000000001zz: CPU_DI = video_do;
			11'b00000001zzz: CPU_DI = acia_do;
			11'b0000001zzzz: CPU_DI = wb_do;
			11'b000001zzzzz: CPU_DI = gpio_do;
			11'b00001zzzzzz: CPU_DI = led_do;
			11'b0001zzzzzzz: CPU_DI = ps2_do;
			11'b001zzzzzzzz: CPU_DI = snd_do;
			11'b01zzzzzzzzz: CPU_DI = vctl_do;
			11'b1zzzzzzzzzz: CPU_DI = rom_do;
			default: CPU_DI = rom_do;
		endcase
		
	// hook up diagnostics
	//assign tst[0] = clk;
	//assign tst[1] = wb_sel;
	//assign tst[2] = CPU_RDY;
	//assign tst[3] = 1'b0;
	assign tst = ps2_diag;
endmodule
