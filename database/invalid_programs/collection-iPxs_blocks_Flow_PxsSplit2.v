//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date:    03/11/2017 
// Module Name:    PxsSplit2
// Description:    copy input stream into two output streams 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created 
// 
//
// Additional Comments: 
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"
module PxsSplit2 (
            input wire       px_clk,           	// pixel clock
			input wire [25:0] RGBStr_i,			// Input stream
			output reg [25:0] RGBStr1_o,		// Output stream 1
			output reg [25:0] RGBStr2_o			// Output stream 2
         );
		 
always @(posedge px_clk)
begin
	RGBStr1_o <= RGBStr_i;
	RGBStr2_o <= RGBStr_i;
end

endmodule
