// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:   03/11/2017 
// Module Name:    PxsCheckerBoard
// Description:    Add pixel color to a VGA Stream
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

module PxsCheckerBoard (
            input wire       px_clk,           // pixel clock
			input wire [22:0] VGA_SCA_Str_i,	// HS, VS, XC, YC, Active
			output reg [25:0] VGA_SCA_RGB_Str_o	// HS, VS, XC, YC, Active, RGB(1:1:1)
         );


parameter [3:0] Black=3'b000;
parameter [3:0] White=3'b111;
parameter XGridSize = 64;
parameter YGridSize = 64;
wire comp, X0,Y0;
wire [9:0] X, Y;

assign X = VGA_SCA_Str_i[`XC]/XGridSize;
assign Y = VGA_SCA_Str_i[`YC]/YGridSize;

// assign X0=X[0]; 
// assign Y0=Y[0];
assign comp = X ^ Y;

always @(posedge px_clk)
begin

	VGA_SCA_RGB_Str_o[`RGB] <= comp? White: Black; 
    VGA_SCA_RGB_Str_o[`HS] <= VGA_SCA_Str_i[`HS];
    VGA_SCA_RGB_Str_o[`VS] <= VGA_SCA_Str_i[`VS];
	VGA_SCA_RGB_Str_o[`XC] <= VGA_SCA_Str_i[`XC];
    VGA_SCA_RGB_Str_o[`YC] <= VGA_SCA_Str_i[`YC];
	VGA_SCA_RGB_Str_o[`Active] <= VGA_SCA_Str_i[`Active];
end

endmodule
