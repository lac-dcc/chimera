// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 23/12/2017 
// Module Name: XCoordTanslate
// Description: Generates the coordinates to access the TabGame (30x40).
//				Coordinates are translated at a rate of SPEEDpixels/frame
//				making the effect displacement to the left
//				Frame 1: first column displayed corresponds to column 0 in GameTable
//				Frame 2: first column displayed corresponds to column SPEED in GameTable 
//				Frame 3: first column displayed corresponds to column 2*SPEED in GameTable  
//				...		
//
// Revision: 
// Revision 0.01 - File Created
// Revision 0.02 - 
//
// Additional Comments: 
//
// WARNING: iCE40 sysMEM only support the following conf: 
//          256x16b, 512x8b, 1Kx4b, 2Kx2b
//			ROM of 1b word is mapped to 2Kx2b wasting 1bit per word
//			Alternatively compress pixels into 2b words to save BRAM
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module XCoordTanslate (
                input wire        px_clk,       
                input wire [25:0] RGBStr_i,      
                output reg [25:0] RGBStr_o      
               );

	parameter [9:0] VISIBLECOLS = 640;
	parameter [9:0] VISIBLEROWS = 480;
	parameter [9:0] XMAX = 840;
	parameter [9:0] XMIN = 0;

    parameter SPEED = 1;
	parameter [5:0]TabXsize=40; //Table X size
	wire endframe;
	wire [5:0] TabX;
	reg [9:0] disp = 0;
	reg [9:0] newX;
	reg [25:0] Aux;
	
	assign TabX = newX[9:4];   // Table X-Coordinate
	assign endframe = (RGBStr_i[`XC]==VISIBLECOLS-1 && RGBStr_i[`YC]==VISIBLEROWS-1)? 1'b1 : 1'b0 ;

// Task1: draw the logo	( 3-stages pipeline)
	// Stage0: calculate TabX coordinates
	always @(posedge px_clk)
    begin		
		newX <=  RGBStr_i[`XC]+disp;
		Aux[`HS]<=RGBStr_i[`HS]; Aux[`VS]<=RGBStr_i[`VS];
		Aux[`YC]<=RGBStr_i[`YC]; Aux[`XC]<=RGBStr_i[`XC];
		Aux[`Active]<=RGBStr_i[`Active];
		Aux[`RGB]<=RGBStr_i[`RGB];
	end
	// Stage1: calculate img coordinates
	always @(posedge px_clk)
    begin
		
		if (Aux[`YC]>303) // Displacement from row 303 (any other row remain still)
			// Table X-Coordinate has to remain under 40 after translation
			RGBStr_o[`XC] <= (TabX<40)? newX : {(TabX-TabXsize), newX[3:0]}; 
		else 
			RGBStr_o[`XC] <=Aux[`XC];

		RGBStr_o[`HS]<=Aux[`HS]; RGBStr_o[`VS]<=Aux[`VS];
		RGBStr_o[`YC]<=Aux[`YC];
		RGBStr_o[`Active]<=Aux[`Active];
		RGBStr_o[`RGB]<=Aux[`RGB];
	end

// Task2: update parameters during Vblanking period 
	always @(posedge px_clk)
    begin
		if (endframe)
		begin
			disp=disp+SPEED;
		end		
    end
endmodule
