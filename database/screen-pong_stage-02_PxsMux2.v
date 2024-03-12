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
// 
//
// Additional Comments: 
//
//	Video Stream notation 
//	- VGA: type of video 640x480 progresive
//  - S: Sync signals HSync, VSync
//	- C: Coordinates XCoord, YCoord	
//	- A: ActiveVideo 
//	- P: Pixel type RGB(1:1:1)/ Gray(3b)	
//////////////////////////////////////////////////////////////////////////////////
module PxsMux2 (
            input wire       px_clk,            // pixel clock
			input wire [25:0] RGBStr1_i,		// Input stream 1
			input wire [25:0] RGBStr2_i,		// Input stream 2		
			input wire control,					// strean selector
			output reg [25:0] RGBStr_o			// Otuput stream
         );
		 
// alias 
`define Active 0:0
`define VS 1:1
`define HS 2:2
`define YC 12:3
`define XC 22:13
`define RGB 25:23

always @(posedge px_clk)
begin
	RGBStr_o <= control? RGBStr2_i:RGBStr1_i;
end

endmodule
