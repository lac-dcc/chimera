// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:    23/11/2017  
// Project:    	   iPxs - Icestudio Pixel Stream
// Module Name:    PxsXorPattern
// Description:    Add pixel color (Xor Pattern) to a VGA Stream
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created 
// 
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
//	
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"


module PxsXorPattern (
            input wire       px_clk,            // pixel clock
			input wire [22:0] VGAStr_i,	// Input stream (without RGB)
			output reg [25:0] RGBStr_o	// Output stream
         );


wire [9:0] comp;

assign comp = VGAStr_i[22:14] ^ VGAStr_i[12:4];


always @(posedge px_clk)
begin
	RGBStr_o[`R] <= comp[0]; //comp[3]; 
    RGBStr_o[`G] <= comp [1]; //comp[3];    
    RGBStr_o[`B] <= comp[2]; //comp[4];   
    RGBStr_o[`HS] <= VGAStr_i[`HS];
    RGBStr_o[`VS] <= VGAStr_i[`VS];
	RGBStr_o[`XC] <= VGAStr_i[`XC];
    RGBStr_o[`YC] <= VGAStr_i[`YC];
	RGBStr_o[`Active] <= VGAStr_i[`Active];
end

// Alternative implementation to save flipflops (PLBs), 
// WARNING: it could produce an excesive delay in the signals and violate
// the clk constraints

// assign RGBStr_o[`R] = comp[0];
// assign RGBStr_o[`G] = comp [1];
// assign RGBStr_o[`B] = comp[2]; //comp[4];   
// assign RGBStr_o[`HS] = VGAStr_i[`HS];
// assign RGBStr_o[`VS] = VGAStr_i[`VS];
// assign RGBStr_o[`XC] = VGAStr_i[`XC];
// assign RGBStr_o[`YC] = VGAStr_i[`YC];
// assign RGBStr_o[`Active] = VGAStr_i[`Active];


endmodule
