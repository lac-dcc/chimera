// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 03/11/2017 
// Module Name: DisplayGame
// Description: Displays an sprite-based game
//				GameTable 30x40 4bit; BmpMem 4bmp 16x16 4bit (1024x4b)
//
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: 
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module DisplayGame (
                input wire        	px_clk,       // pixel clock.
                input wire [25:0] 	RGBStr_i,       
				input wire [3:0]	TabDat,
				input wire [3:0]	BmpDat,
				output reg [10:0] 	TabAdd,
				output reg [9:0] 	BmpAdd,
                output reg 	[25:0] 	RGBStr_o       // 
               );

   
	// Logo dimension.
    parameter Tab_width = 40;
    parameter Tab_height = 30;
	parameter Bmp_width = 16;
	parameter Bmp_height =16;
	
	parameter VISIBLECOLS = 640;
	parameter VISIBLEROWS = 480;


	// Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;
    parameter [2:0] pink = 3'b101;


	wire [9:0]sx; 
	wire [9:0]sy;
	wire [5:0]TabX; 
	wire [4:0]TabY;
	reg [3:0]BmpX;
	reg [3:0]BmpY;
	reg InTabX, InTabY, InTab;
	reg [25:0]AuxStr1;
	reg [25:0]AuxStr2;
	
	
	assign sx = RGBStr_i[`XC]; 
	assign sy = RGBStr_i[`YC];
	assign TabX = sx[9:4]; 
	assign TabY = sy[8:4];
	
	
	// Stage0: calculate coordinates and send TabAdd
	always @(posedge px_clk)
    begin
		TabAdd <= TabY*Tab_width+TabX;  // TabbAdd= Y*width+X
		InTabX <= (sx==0)? 1: ((sx==Tab_width*Bmp_width) ? 0 : InTabX);
		InTabY <= (sy==0)? 1: ((sy==Tab_height*Bmp_height) ? 0 : InTabY);
		BmpX <= sx[3:0]; BmpY <= sy[3:0]; // BmpX <= sx[4:1]; BmpY <= sy[4:1];   //coord scaled x2 //
		
		AuxStr1[`HS]<=RGBStr_i[`HS]; AuxStr1[`VS]<=RGBStr_i[`VS];
		AuxStr1[`XC]<=RGBStr_i[`XC]; AuxStr1[`YC]<=RGBStr_i[`YC];
		AuxStr1[`Active]<=RGBStr_i[`Active];
		AuxStr1[`RGB]<=RGBStr_i[`RGB];
	end
	// Stage1: read Nbmp and send BmpAdd
	always @(posedge px_clk)
    begin
		AuxStr2[`HS]<=AuxStr1[`HS]; AuxStr2[`VS]<=AuxStr1[`VS];
		AuxStr2[`XC]<=AuxStr1[`XC]; AuxStr2[`YC]<=AuxStr1[`YC];
		AuxStr2[`Active]<=AuxStr1[`Active];
		InTab <= InTabX && InTabY;
		AuxStr2[`RGB]<= AuxStr1[`RGB];
		if (AuxStr1[`Active]) //(AuxStr1[`XC]<VISIBLECOLS && AuxStr1[`YC]<VISIBLEROWS)
		begin
			if(InTabX==1 && InTabY==1)
			begin
				BmpAdd<={TabDat[1:0],BmpY,BmpX};
			end
		end
	end
	
	// Stage2: read pixel	
	always @(posedge px_clk)
    begin	
		RGBStr_o[`HS]<=AuxStr2[`HS]; RGBStr_o[`VS]<=AuxStr2[`VS];
		RGBStr_o[`XC]<=AuxStr2[`XC]; RGBStr_o[`YC]<=AuxStr2[`YC];
		RGBStr_o[`Active]<=AuxStr2[`Active];

		if (AuxStr2[`Active]) //(AuxStr2[`XC]<VISIBLECOLS && AuxStr2[`YC]<VISIBLEROWS)
		begin
			if (InTab)
			begin
				RGBStr_o[`RGB]<= (BmpDat[2:0]==0)? AuxStr2[`RGB]: BmpDat[2:0];
			end
		end
		else
		begin
			RGBStr_o[`RGB]<= AuxStr2[`RGB];
		end
	end	
endmodule
