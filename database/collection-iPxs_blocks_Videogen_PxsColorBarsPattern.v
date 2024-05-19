// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:   23/11/2017 
// Module Name:    PxsColorBarsPattern
// Description:    Add pixel color to a VGA Stream. Vertical bars change color
//                 every 8bits
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created 
// 
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
//////////////////////////////////////////////////////////////////////////////////
`include "Pxs.vh"

module PxsColorBarsPattern (
            input wire        px_clk,       // Pixel clock
            input wire [22:0] VGAStr_i,     // HS, VS, XC, YC, Active
            output reg [25:0] RGBStr_o      // HS, VS, XC, YC, Active, RGB(1:1:1)
         );


parameter [3:0] Black=3'b000;

wire [9:0] Xc;

assign Xc = VGAStr_i[`XC];   

always @(posedge px_clk)
begin
        RGBStr_o[`VGA] <= VGAStr_i[`VGA];
        if (VGAStr_i[`Active])
            RGBStr_o[`RGB] <= Xc[7:5];  //VGAStr_i[`XC][5:3];
        else
            RGBStr_o[`RGB] <= Black;
end

endmodule
