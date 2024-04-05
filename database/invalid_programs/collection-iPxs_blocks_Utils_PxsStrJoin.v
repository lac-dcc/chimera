//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:    03/11/2017 
// Module Name:    PxsStrJoin
// Description:    Join the components of a stream 
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

module PxsStrJoin (	
            input wire      HSync,         	// Horizontal sync out
            input wire      VSync,         	// Vertical sync out
            input wire      Red,   			// RED vga 
            input wire     	Green, 			// GREEN vga output
            input wire      Blue,  			// BLUE vga output
            input wire [9:0] XCoord,        // ScanX postion
            input wire [9:0] YCoord,        // ScanY position 
            input wire      ActiveVideo,
			output wire [25:0] VGAStr		// Output stream
         );
		 

    assign VGAStr[`HS]= HSync;
    assign VGAStr[`VS]= VSync;
    assign VGAStr[`Active] = ActiveVideo;
	assign VGAStr[`XC] = XCoord;
	assign VGAStr[`YC] = YCoord;
	assign VGAStr[`R] = Red;
	assign VGAStr[`G] = Green;
	assign VGAStr[`B] = Blue;

 endmodule
