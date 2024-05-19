// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

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
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

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
		 
   
    assign HSync = VGA_SCA_RGB_Str_i[`HS];
    assign VSync = VGA_SCA_RGB_Str_i[`VS];
    assign ActiveVideo = VGA_SCA_RGB_Str_i[`Active];
	assign XCoord = VGA_SCA_RGB_Str_i[`XC];
	assign YCoord = VGA_SCA_RGB_Str_i[`YC];
	assign Red = VGA_SCA_RGB_Str_i[`R];
	assign Green = VGA_SCA_RGB_Str_i[`G];
	assign Blue = VGA_SCA_RGB_Str_i[`B];
	
 endmodule
