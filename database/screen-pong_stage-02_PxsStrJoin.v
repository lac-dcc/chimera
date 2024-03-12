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
//	Video Stream notation 
//	- VGA: type of video 640x480 progresive
//  - S: Sync signals HSync, VSync
//	- C: Coordinates XCoord, YCoord	
//	- A: ActiveVideo 
//	- P: Pixel type RGB(1:1:1)/ Gray(3b)	
//////////////////////////////////////////////////////////////////////////////////
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
		 
// alias 
`define Active 0:0
`define VS 1:1
`define HS 2:2
`define YC 12:3
`define XC 22:13
`define B 23:23
`define G 24:24
`define R 25:25

    assign VGAStr[`HS]= HSync;
    assign VGAStr[`VS]= VSync;
    assign VGAStr[`Active] = ActiveVideo;
	assign VGAStr[`XC] = XCoord;
	assign VGAStr[`YC] = YCoord;
	assign VGAStr[`R] = Red;
	assign VGAStr[`G] = Green;
	assign VGAStr[`B] = Blue;

 endmodule
