// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:   03/11/2017 
// Module Name:    PxsCheckerBoard
// Description:    Draw a checker board on a RGB Stream.
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
//  - P: Pixel type RGB(1:1:1)
//
//////////////////////////////////////////////////////////////////////////////////
`include "Pxs.vh"

module PxsCheckerBoard (
            input wire       px_clk,        // Pixel clock
            input wire [22:0] VGAStr_i,     // HSync, VSync, XCoord, YCoord, ActiveVideo
            output reg [25:0] RGBStr_o      // HSync, VSync, XCoord, YCoord, ActiveVideo, RGB(1:1:1)
         );

parameter [3:0] Black=3'b000;
parameter [3:0] White=3'b111;
parameter XGridSize = 64;
parameter YGridSize = 64;
wire comp, X0,Y0;
wire [9:0] X, Y;

assign X = VGAStr_i[`XC]/XGridSize;
assign Y = VGAStr_i[`YC]/YGridSize;

// assign X0=X[0]; 
// assign Y0=Y[0];
assign comp = X ^ Y;

always @(posedge px_clk)
begin
    RGBStr_o[`VGA] <= VGAStr_i[`VGA];
    RGBStr_o[`RGB] <= VGAStr_i[`Active] && comp ? White : Black; 
end

endmodule
