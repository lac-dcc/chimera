//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Project:    	   iPxs - Icestudio Pixel Stream 
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
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsConstant (
            input wire       px_clk,           // pixel clock
			input wire [22:0] VGAStr_i,	// Input stream (without RGB)
			output reg [25:0] RGBStr_o	// Output stream
         );


// Some colors.
parameter COLOR = 3'b101;

always @(posedge px_clk)
begin
		RGBStr_o[`HS] <= VGAStr_i[`HS];
		RGBStr_o[`VS] <= VGAStr_i[`VS];
		RGBStr_o[`XC] <= VGAStr_i[`XC];
		RGBStr_o[`YC] <= VGAStr_i[`YC];
		RGBStr_o[`Active] <= VGAStr_i[`Active];
		if (VGAStr_i[`Active])
		begin
			RGBStr_o[`RGB] <= COLOR;  
		end
		else
		begin
			RGBStr_o[`RGB] <= 3'b000;
		end
end

endmodule
