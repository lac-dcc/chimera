`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     Teske Virtual System 
// Engineer:    Lucas Teske
// 
// Create Date:    19:14:43 07/04/2013 
// Design Name:    LVDS 7-to-1 Serializer
// Module Name:    lvds_clockgen 
// GitHub: https://github.com/racerxdl/LVDS-7-to-1-Serializer
//////////////////////////////////////////////////////////////////////////////////

module lvds_clockgen(
    input clk,
    output clk35,
    output nclk35,
	 output rstclk,
	 output dataclock,
    output lvdsclk
    );
	 

// Clock: 1100011

wire clk_lckd;
wire clkdcm;
wire clo;

DCM_SP #(.CLKIN_PERIOD	("15.625"),
	.DESKEW_ADJUST	("0"),	
	.CLKFX_MULTIPLY	(7),
	.CLKFX_DIVIDE	(2))	
dcm_clk (
	.CLKIN   	(clk),
	.CLKFB   	(clo),
	.RST     	(1'b0),
	.CLK0    	(clkdcm),
	.CLKFX   	(clk35),
	.CLKFX180	(nclk35),
	.CLK180		(),
	.CLK270		(),
	.CLK2X		(),
	.CLK2X180	(),
	.CLK90		(),
	.CLKDV		(),
	.PSDONE		(),
	.STATUS		(),
	.DSSEN 		(1'b0),
	.PSINCDEC	(1'b0),
	.PSEN 		(1'b0),
	.PSCLK 		(1'b0),
	.LOCKED  	(clk_lckd)) ;
	
BUFG 	clk_bufg	(.I(clkdcm), 		.O(clo) ) ;

assign not_clk_lckd = ~clk_lckd ;

FDP fd_rst_clk (.D(not_clk_lckd), .C(clo), .Q(rst_clk)) ;

// The LVDS Clock is 4:3, if you need 3:4 you can use 7'b0011100
serializer lvdsclkman (
    .clk(clo), 
    .clk35(clk35), 
    .notclk35(nclk35), 
    .data(7'b1100011),
	 .rst(rst_clk),
	 .out(lvdsclk)
    ); 

assign rstclk = rst_clk;
assign dataclock = clo;
endmodule
