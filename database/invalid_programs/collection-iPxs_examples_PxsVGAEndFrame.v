//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 23/11/2017 
// Module Name: PxsVGAEndFrame
// Description: detect the last pixel in the frame
//	
//
// Revision: 
// Revision 0.01 - File Created

// Additional Comments: based on PixelStream lib from Celoxica Ltd.
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
`include "Pxs.vh"

module PxsVGAEndFrame (
        input wire [25:0] RGBStr_i,    // Input RGB stream.
        output wire endframe     // Output pulse.
        );
		
`ifdef VGA640x480
parameter [9:0] VISIBLECOLS=640;
parameter [9:0] VISIBLEROWS=480;
`endif

assign  endframe = ((RGBStr_i[`XC]==VISIBLECOLS-1) && (RGBStr_i[`YC]==VISIBLEROWS-1)) ? 1'b1 : 1'b0;
//assign  endframe = ((RGBStr_i[`XC]==479) && (RGBStr_i[`YC]==639)) ? 1'b1 : 1'b0;
 

endmodule
