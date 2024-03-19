// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	Version:	0.1
//	Date:		2 December 2018
//
//	Modules contained in this file:
//	1. TRIPUTER_SIMU		Simulation Model of TRIPUTER
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

`timescale 1ns / 100ps

module TRIPUTER_SIMU;

reg 			RCLK;
reg 			RST_N;
wire 	 [9:0]	SSW;
wire			UA_TX;
reg				UA_RX;
wire 	 [4:0]	SRCO;
wire 	[17:0]	SRAA;
wire 	[15:0]	SRDB;
wire 	 [6:0]	HEXM;
wire 	 [6:0]	HEXL;
wire 	 [9:0]	LEDR;
wire 	 [7:0]	LEDG;
wire 			AUD_XCK;
wire 			HDMI_CLK;

TRIPUTER CHIP(
	RCLK,
	RST_N,
	SSW,
	UA_TX,
	UA_RX,
	SRCO,
	SRAA,
	SRDB,
	HEXM,
	HEXL,
	LEDR,
	LEDG,
	AUD_XCK,
	HDMI_CLK);
	
	reg		 [7:0]	memh [8191:0];	// 16 KB in total
	reg		 [7:0]	meml [8191:0];
	reg		 [7:0]	ramh_q,raml_q;

initial // Clock generator
  begin
    RCLK = 0;
    #10 forever #10 RCLK = !RCLK;
  end
  
initial  
	begin
	 RST_N = 1'b0;
	 #105 RST_N = 1'b1;
	end
	
initial
	begin
	 UA_RX = 1'b1;
	 #100000 UA_RX = 1'b0;
	  #17360 UA_RX = 1'b1;
	  #34720 UA_RX = 1'b0;
	  #52080 UA_RX = 1'b1;
	  #17360 UA_RX = 1'b0;
	  #34720 UA_RX = 1'b1;
	end
			
	assign SSW = 10'd0;

	assign SRDB = SRCO[3] ? 16'hzzzz : {ramh_q,raml_q};

	always @(posedge SRCO[2])	// WE
		begin
			if (!SRCO[1]) memh[SRAA[12:0]] <= SRDB[15:8];
			if (!SRCO[0]) meml[SRAA[12:0]] <= SRDB[7:0];
		end
		
	always @(negedge RCLK)	// OE
		begin
			if (!SRCO[3]) ramh_q <= memh[SRAA[12:0]];
			if (!SRCO[3]) raml_q <= meml[SRAA[12:0]];
		end

endmodule

