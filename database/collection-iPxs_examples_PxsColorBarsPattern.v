//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:   23/11/2017 
// Module Name:    PxsColorBarsPattern
// Description:    Add pixel color to a VGA Stream. Vertical bars change color 
//					every 8bits
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
            input wire       px_clk,           // pixel clock
			input wire [22:0] VGAStr_i,	// HS, VS, XC, YC, Active
			output reg [25:0] RGBStr_o	// HS, VS, XC, YC, Active, RGB(1:1:1)
         );


parameter [3:0] Black=3'b000;
parameter [3:0] White=3'b111;

wire [9:0] Xc;

assign Xc = VGAStr_i[`XC];   

always @(posedge px_clk)
begin
		RGBStr_o[`HS] <= VGAStr_i[`HS];
		RGBStr_o[`VS] <= VGAStr_i[`VS];
		RGBStr_o[`XC] <= VGAStr_i[`XC];
		RGBStr_o[`YC] <= VGAStr_i[`YC];
		RGBStr_o[`Active] <= VGAStr_i[`Active];
		if (VGAStr_i[`Active])
			RGBStr_o[`RGB] <= Xc[7:5];  //VGAStr_i[`XC][5:3];
		else
			RGBStr_o[`RGB] <= Black;
end

endmodule
