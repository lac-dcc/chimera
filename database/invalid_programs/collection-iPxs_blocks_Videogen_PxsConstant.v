//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Project:        iPxs - Icestudio Pixel Stream 
// Create Date:    03/11/2017  
// Module Name:    PxsConstant
// Description:    Add constant color to a VGA Stream
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
//////////////////////////////////////////////////////////////////////////////////
`include "Pxs.vh"

module PxsConstant 
#(
    parameter color = 3'b001        // Color blue (default).
)
(
    input wire          px_clk,     // Pixel clock.
    input wire [22:0]   VGAStr_i,   // Input stream (without RGB).
    output reg [25:0]   RGBStr_o    // Output stream.
);

always @(posedge px_clk)
begin
    RGBStr_o[`VGA] <= VGAStr_i[`VGA];
    RGBStr_o[`RGB] <= VGAStr_i[`Active] ? color : 3'b000;
end

endmodule
