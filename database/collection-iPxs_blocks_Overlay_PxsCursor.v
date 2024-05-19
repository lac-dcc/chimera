// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 23/11/2017 
// Module Name: PxsCursor
// Description: draw a cursor at coord X,Y
//
//			
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//  					resources 1BRAM, two cursor types
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
// 
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsCursor(
                input wire        	px_clk,       
                input wire [25:0] 	RGBStr_i,       
				input wire [9:0]	X,
				input wire [9:0]	Y,
                output reg [25:0] 	RGBStr_o       
               );


    //cursor definition
	parameter FILE_CURSOR = "CursorCross.list";
	parameter CURSEL= 1'b1;		// Cursor selector
	
	parameter Ncur=2;			// 2 different cursor
	parameter CurWidth = 32;
	parameter CurHeight = 32;
	// cursor rom 2x32x32x2b
	reg  [1:0] cursorROM [Ncur*CurWidth*CurHeight-1:0];
	wire [10:0] addr;

	parameter HotSpotX = 16;
	parameter HotSpotY = 16;
	
    // Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;
    parameter [2:0] pink = 3'b101;

	
	reg [9:0] x_cur, y_cur;    // cursor coord
	reg Active ;
	reg [1:0] CursorPix;
	reg [25:0] AuxStr1, AuxStr2;
	
	// initialization cursorROM
	initial
    begin
		if (FILE_CURSOR) $readmemh(FILE_CURSOR, cursorROM);   // Load logo on memory
    end
	
	assign addr={CURSEL,y_cur[4:0],x_cur[4:0]};
	// 3 stage pipeline
	// Stage0: calculate cursor coordinates
	always @(posedge px_clk)
    begin
		x_cur <= (RGBStr_i[`XC]+HotSpotX)-X;
		y_cur <= (RGBStr_i[`YC]+HotSpotY)-Y;
		AuxStr1[`HS]<=RGBStr_i[`HS]; AuxStr1[`VS]<=RGBStr_i[`VS];
		AuxStr1[`XC]<=RGBStr_i[`XC]; AuxStr1[`YC]<=RGBStr_i[`YC];
		AuxStr1[`Active]<=RGBStr_i[`Active];
		AuxStr1[`RGB]<=RGBStr_i[`RGB];
	end
	// Stage1: read cursor pixel
	always @(posedge px_clk)
    begin
		Active <= (x_cur >= 0 && x_cur < CurWidth) && (y_cur >= 0 && y_cur < CurHeight);
		AuxStr2[`HS]<=AuxStr1[`HS]; AuxStr2[`VS]<=AuxStr1[`VS];
		AuxStr2[`XC]<=AuxStr1[`XC]; AuxStr2[`YC]<=AuxStr1[`YC];
		AuxStr2[`Active]<=AuxStr1[`Active];
		AuxStr2[`RGB]<=AuxStr1[`RGB];
		CursorPix <= cursorROM [addr];
	end		
	
	// Stage2: draw cursor 
	always @(posedge px_clk)
    begin
		RGBStr_o[`HS]<=AuxStr2[`HS]; RGBStr_o[`VS]<=AuxStr2[`VS];
		RGBStr_o[`XC]<=AuxStr2[`XC]; RGBStr_o[`YC]<=AuxStr2[`YC];
		RGBStr_o[`Active]<=AuxStr2[`Active];

		if(Active && X > HotSpotX && X<639-HotSpotX)
			RGBStr_o[`RGB] <= (((Active && CursorPix[0])? black : AuxStr2[`RGB]) ^ ((Active && CursorPix [1])? white : black));
		//ApplyCursor(Active[0], Cursor[0], AuxStr2[`RGB]);
		else 
			RGBStr_o[`RGB] <= AuxStr2[`RGB];
	end
		
endmodule
