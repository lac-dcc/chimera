// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

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
//  Video Stream notation 
//  - VGA: type of video 640x480 progresive
//  - S: Sync signals HSync, VSync
//  - C: Coordinates XCoord, YCoord 
//  - A: ActiveVideo 
//  - P: Pixel type RGB(1:1:1)/ Gray(3b)
//////////////////////////////////////////////////////////////////////////////////
`include "Pxs.vh"

module PxsStrVGAJoin (
            input wire         HSync,        // Horizontal sync out
            input wire         VSync,        // Vertical sync out
            input wire [9:0]   XCoord,       // ScanX postion
            input wire [9:0]   YCoord,       // ScanY position
            input wire         ActiveVideo,  // Active video
            output wire [22:0] VGAStr_o      // Output stream
         );

assign VGAStr_o[`HS] = HSync;
assign VGAStr_o[`VS] = VSync;
assign VGAStr_o[`Active] = ActiveVideo;
assign VGAStr_o[`XC] = XCoord;
assign VGAStr_o[`YC] = YCoord;

endmodule
