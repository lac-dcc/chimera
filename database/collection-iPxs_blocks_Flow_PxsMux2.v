//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:    03/11/2017  
// Module Name:    PxsMux2
// Description:    Mux for streams 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created 
// Revision 0.02 - Combinational style for saving flipflops 
//
// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsMux2 (
            input wire       px_clk,            // pixel clock
			input wire [25:0] RGBStr1_i,		// Input stream 1
			input wire [25:0] RGBStr2_i,		// Input stream 2		
			input wire control,					// strean selector
			output wire [25:0] RGBStr_o			// Otuput stream
         );
		 

assign RGBStr_o = control? RGBStr2_i:RGBStr1_i;

// always @(posedge px_clk)
// begin
	// RGBStr_o <= control? RGBStr2_i:RGBStr1_i;
// end

endmodule
