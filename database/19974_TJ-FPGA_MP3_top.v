// This program was cloned from: https://github.com/DinoMax00/TJ-FPGA_MP3
// License: MIT License

//---------- top module --------------------
// -------- author : Dino ------------------
module top(
	input CLK, // out clk
	input RST, // active low 
	
	// mp3 part 
	input DREQ,      // sign for input
	output XDCS, // data control
	output XCS,  // cmd control 
	output RSET, 
	output SI,   // data input
	output SCLK,  // clk for VS1003B 
	
	// bluetooth part 
	input RXD,
	
	// display7 part
	output [6: 0] SEG,
	output [7: 0] SHIFT,
	output DOT,
	// oled part 
	output DIN, // input pin 
	output OLED_CLK, 
	output CS, // chip select
	output DC, // Data & CMD 
	output RES,
	
	// vol show
	output [15: 0] led
);
	// mp3 volume
    wire [15:0] vol;
	
	// current song
	wire [2: 0] current;
    
    // time
    wire [15: 0] Time;
	
	// display rst
	wire display_rst;
	
	// oled
	oled old(
        .CLK(CLK), 
        .RST(RST),
        .current(current),
        .DIN(DIN), // input pin 
        .OLED_CLK(OLED_CLK), 
        .CS(CS), // chip select
        .DC(DC), // Data & CMD 
        .RES(RES)
    );
	
	// vol change
	vol_control vc(
		.CLK(CLK),
		.vol(vol),
		.led(led)
	);
	
	
	// bluetooth board 
	BlueTooth BT(
		.CLK(CLK),
		.RST(RST),
		.RXD(RXD),
		.vol(vol),
		.CURRENT(current)
	);
	
	// mp3 board
	mp3 Mp3(
		.CLK(CLK), 
		.RST(RST), 
		.DREQ(DREQ),
		.vol(vol),
		.current(current),
		.XDCS(XDCS), 
		.XCS(XCS), 
		.RSET(RSET), 
		.SI(SI),
		.SCLK(SCLK),
		.MP3_RST(display_rst)
	);
	
	// Time generator
    timeCounter tc(
        .CLK(CLK),
        .RST(display_rst),
        .Time(Time)
    );
        
    // display7
    display7 d7(
		.CLK(CLK),
        .DATA(Time),
        .SEG(SEG),
        .SHIFT(SHIFT),
        .DOT(DOT)
    );
endmodule
