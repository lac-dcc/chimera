// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

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
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsVGAComp (
			input wire [25:0] VGAStr_i,	// Input stream
            output wire      HSync,         // Horizontal sync out
            output wire      VSync,         // Vertical sync out
            output wire      Red,   // RED vga output
            output wire      Green, // GREEN vga output
            output wire      Blue  // BLUE vga output
         );
		    
    assign HSync = VGAStr_i[`HS];
    assign VSync = VGAStr_i[`VS];
	assign Red = VGAStr_i[`R];
	assign Green = VGAStr_i[`G];
	assign Blue = VGAStr_i[`B];
	
 endmodule
