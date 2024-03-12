//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Project:    	   iPxs - Icestudio Pixel Stream 
// Create Date:    03/11/2017  
// Module Name:    PxsConstant
// Description:    Add constant color to a VGA Stream
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created 
// 
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
//	Video Stream notation 
//	- VGA: type of video 640x480 progresive
//  - S: Sync signals HSync, VSync
//	- C: Coordinates XCoord, YCoord	
//	- A: ActiveVideo 
//	- P: Pixel type RGB(1:1:1)	
//////////////////////////////////////////////////////////////////////////////////
module PxsConstant (
            input wire       px_clk,           // pixel clock
			input wire [22:0] VGAStr_i,	// Input stream (without RGB)
			output reg [25:0] RGBStr_o	// Output stream
         );

// alias 
`define ActiveVideo 0:0
`define VSync 1:1
`define HSync 2:2
`define YCoord 12:3
`define XCoord 22:13
`define RGB 25:23

// Some colors.
parameter [2:0] black = 3'b000;
parameter [2:0] blue  = 3'b001;
parameter [2:0] green = 3'b010;
parameter [2:0] white = 3'b111;
parameter [2:0] red = 3'b100;


always @(posedge px_clk)
begin
		RGBStr_o[`HSync] <= VGAStr_i[`HSync];
		RGBStr_o[`VSync] <= VGAStr_i[`VSync];
		RGBStr_o[`XCoord] <= VGAStr_i[`XCoord];
		RGBStr_o[`YCoord] <= VGAStr_i[`YCoord];
		RGBStr_o[`ActiveVideo] <= VGAStr_i[`ActiveVideo];
		if (VGAStr_i[`YCoord] == (240+5))
		begin
			RGBStr_o[`RGB] <= red;  
		end
		else
		begin
			RGBStr_o[`RGB] <= black;
		end
end

endmodule
