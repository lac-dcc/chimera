//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:    03/11/2017  
// Module Name:    PxsStrComp
// Description:    Extract the stream components 
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
module PxsStrComp (
			input wire [25:0] VGA_SCA_RGB_Str_i,	// HSync, VSync, XCoord, YCoord, ActiveVideo, RGB(1:1:1)
            output wire      HSync,         		// Horizontal sync out
            output wire      VSync,         		// Vertical sync out
            output wire      Red,   				// RED vga 
            output wire     Green, 					// GREEN vga output
            output wire      Blue,  				// BLUE vga output
            output wire [9:0] XCoord,          		// ScanX postion
            output wire [9:0] YCoord,          		// ScanY position 
            output wire      ActiveVideo			// Active video
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
   
    assign HSync = VGA_SCA_RGB_Str_i[`HS];
    assign VSync = VGA_SCA_RGB_Str_i[`VS];
    assign ActiveVideo = VGA_SCA_RGB_Str_i[`Active];
	assign XCoord = VGA_SCA_RGB_Str_i[`XC];
	assign YCoord = VGA_SCA_RGB_Str_i[`YC];
	assign Red = VGA_SCA_RGB_Str_i[`R];
	assign Green = VGA_SCA_RGB_Str_i[`G];
	assign Blue = VGA_SCA_RGB_Str_i[`B];
	
 endmodule
