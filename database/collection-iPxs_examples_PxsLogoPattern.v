// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 23/11/2017 
// Module Name: PxsLogoPattern
// Description: draw a Pattern of logo
//	
//
// Revision: 
// Revision 0.01 - File Created
// Revision 0.02 - Optimized for BRAM mapping of logo ROM
//				   	Logo can be upscaled 2x 
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
// WARNING: iCE40 sysMEM only support the following conf: 
//          256x16b, 512x8b, 1Kx4b, 2Kx2b
//			ROM of 1b word is mapped to 2Kx2b wasting 1bit per word
//			Alternatively compress pixels into 2b words to save BRAM
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsLogoPattern (
                input wire        px_clk,       // pixel clock.
                input wire [22:0] VGAStr_i,       // VGA stream
                output reg [25:0] RGBStr_o       // 
               );

`define addy 8:3   	
`define addx 18:13	
// use the following define to get the logo upscale 2x
`define addy2 9:4   
`define addx2 19:14	

    //logo definition
	parameter FILE_LOGO = "darthvaderlogo.list";

   
	// Logo dimension. Power of two eases the address generation
    parameter width_logo = 64; 
    parameter height_logo = 64;
	
	// logo rom
	reg  [0:0] logo [width_logo*height_logo-1:0];
	
	// Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;
    parameter [2:0] pink = 3'b101;	
    parameter ink = black;
    parameter background = white;

	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;

	wire [13:0] addr;
	reg [9:0] x_img, y_img;    // image coord
	reg [22:0] AuxStr1;
	reg pixel;
	
	// initialization of logo location, direction and speed
	initial
    begin
		if (FILE_LOGO) $readmemh(FILE_LOGO, logo);   // Load logo on memory
    end

// 2 stages pipeline
	assign addr={VGAStr_i[`addy],VGAStr_i[`addx]};
	// Stage0: read pixel
	always @(posedge px_clk)
    begin
		AuxStr1[`HS]<=VGAStr_i[`HS]; AuxStr1[`VS]<=VGAStr_i[`VS];
		AuxStr1[`XC]<=VGAStr_i[`XC]; AuxStr1[`YC]<=VGAStr_i[`YC];
		AuxStr1[`Active]<=VGAStr_i[`Active];
		pixel <= logo [addr];
	end
	// Stage1: draw Logo pattern
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr1[`HS]; RGBStr_o[`VS]<=AuxStr1[`VS];
		RGBStr_o[`XC]<=AuxStr1[`XC]; RGBStr_o[`YC]<=AuxStr1[`YC];
		RGBStr_o[`Active]<=AuxStr1[`Active];

		if(AuxStr1[`Active])
			RGBStr_o[`RGB]<= pixel? ink: background;
		else
			RGBStr_o[`RGB]<=black;
	end
	
/*
// optimizing to 1BRAM 
	// logo rom
	reg bitsel;
	reg [1:0] pixel;
	wire [12:0] add;
	reg  [1:0] logo [(width_logo)*height_logo-1:0]; // 64x32x2b addr(7b+6b)

	// width and height are power of 2, so addr can be generated concatenating coord 
	// {YC[6:0],XC[6:1]}
	assign add={VGAStr_i[`addy2],VGAStr_i[`addx2]};
	

	// Stage0: read pixel
	always @(posedge px_clk)
    begin
		AuxStr1[`HS]<=VGAStr_i[`HS]; AuxStr1[`VS]<=VGAStr_i[`VS];
		AuxStr1[`XC]<=VGAStr_i[`XC]; AuxStr1[`YC]<=VGAStr_i[`YC];
		AuxStr1[`Active]<=VGAStr_i[`Active];
		pixel <= logo [add];
		bitsel <= add[0];
	end
	// Stage1: draw Logo pattern
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr1[`HS]; RGBStr_o[`VS]<=AuxStr1[`VS];
		RGBStr_o[`XC]<=AuxStr1[`XC]; RGBStr_o[`YC]<=AuxStr1[`YC];
		RGBStr_o[`Active]<=AuxStr1[`Active];

		if(AuxStr1[`Active])
		begin
			RGBStr_o[`RGB]<= pixel[bitsel]? ink: background;
		end
		else
		begin
			RGBStr_o[`RGB]<=black;
		end
	end
*/
	
endmodule
