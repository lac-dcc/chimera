//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:    03/11/2017 
// Module Name:    PxsStrVGAJoin
// Description:    Join the components of a VGA stream 
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

module PxsStrVGAJoin (			
            input wire      HSync,         // Horizontal sync out
            input wire      VSync,         // Vertical sync out
            input wire [9:0] XCoord,       // ScanX postion
            input wire [9:0] YCoord,       // ScanY position 
            input wire      ActiveVideo,	// active video
			output wire [22:0] VGAStr		// output stream
         );
		 
    assign VGAStr[`HS]= HSync;
    assign VGAStr[`VS]= VSync;
    assign VGAStr[`Active] = ActiveVideo;
	assign VGAStr[`XC] = XCoord;
	assign VGAStr[`YC] = YCoord;
	
 endmodule
