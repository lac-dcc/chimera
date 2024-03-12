//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:   03/11/2017 
// Module Name:    PxsCheckerBoard
// Description:    Add pixel color to a VGA Stream
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
module PxsCheckerBoard (
            input wire       px_clk,           // pixel clock
			input wire [22:0] VGA_SCA_Str_i,	// HSync, VSync, XCoord, YCoord, ActiveVideo
			output reg [25:0] VGA_SCA_RGB_Str_o	// HSync, VSync, XCoord, YCoord, ActiveVideo, RGB(1:1:1)
         );

// alias 
`define ActiveVideo 0:0
`define VSync 1:1
`define HSync 2:2
`define YCoord 12:3
`define XCoord 22:13
`define RGB 25:23

parameter [3:0] Black=3'b000;
parameter [3:0] White=3'b111;
parameter XGridSize = 64;
parameter YGridSize = 64;
wire comp, X0,Y0;
wire [9:0] X, Y;

assign X = VGA_SCA_Str_i[`XCoord]/XGridSize;
assign Y = VGA_SCA_Str_i[`YCoord]/YGridSize;

// assign X0=X[0]; 
// assign Y0=Y[0];
assign comp = X ^ Y;

always @(posedge px_clk)
begin

	VGA_SCA_RGB_Str_o[`RGB] <= comp? White: Black; 
    VGA_SCA_RGB_Str_o[`HSync] <= VGA_SCA_Str_i[`HSync];
    VGA_SCA_RGB_Str_o[`VSync] <= VGA_SCA_Str_i[`VSync];
	VGA_SCA_RGB_Str_o[`XCoord] <= VGA_SCA_Str_i[`XCoord];
    VGA_SCA_RGB_Str_o[`YCoord] <= VGA_SCA_Str_i[`YCoord];
	VGA_SCA_RGB_Str_o[`ActiveVideo] <= VGA_SCA_Str_i[`ActiveVideo];
end

endmodule
