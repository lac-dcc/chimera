//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:    03/11/2017  
// Project:        iPxs - Icestudio Pixel Stream
// Module Name:    PxsXorPattern
// Description:    Add pixel color (VGA Pattern) to a VGA Stream
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
//
//////////////////////////////////////////////////////////////////////////////////
`include "Pxs.vh"

module PxsXorPattern (
            input wire        px_clk,       // Pixel clock
            input wire [22:0] VGAStr_i,     // Input stream (without RGB)
            output reg [25:0] RGBStr_o      // Output stream
         );

wire [9:0] comp;

assign comp = VGAStr_i[22:14] ^ VGAStr_i[12:4];

always @(posedge px_clk)
begin
    RGBStr_o[`VGA] <= VGAStr_i[`VGA];
    if (VGAStr_i[`Active])
        begin
            RGBStr_o[`R] <= comp[3]; //0'b1;//comp[2];
            RGBStr_o[`G] <= comp[3];  // 1'b0;//comp[4];   
            RGBStr_o[`B] <= comp[4];  //comp[0]; //0'b1;// 
        end
    else
        RGBStr_o[`RGB] <= 3'b000;
end

endmodule
