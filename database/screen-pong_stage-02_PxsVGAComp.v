//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:    03/11/2017 
// Module Name:    PxsVGAComp
// Description:    Extract the components of a VGA stream 
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
//	- P: Pixel type RGB(1:1:1)/ Gray(3b)	
//////////////////////////////////////////////////////////////////////////////////
module PxsVGAComp (
			input wire [25:0] VGAStr_i,	// Input stream
            output wire      HSync,         // Horizontal sync out
            output wire      VSync,         // Vertical sync out
            output wire      Red,   // RED vga output
            output wire      Green, // GREEN vga output
            output wire      Blue  // BLUE vga output
         );
		 
// alias 
`define Active 0:0
`define VS 1:1
`define HS 2:2
`define YC 12:3
`define XC 22:13
`define B 23:23
`define G 24:24
`define R 25:25
   
    assign HSync = VGAStr_i[`HS];
    assign VSync = VGAStr_i[`VS];
	assign Red = VGAStr_i[`R];
	assign Green = VGAStr_i[`G];
	assign Blue = VGAStr_i[`B];
	
 endmodule
