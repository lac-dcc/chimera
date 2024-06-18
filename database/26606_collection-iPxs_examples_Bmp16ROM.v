// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: University of Alicante
// Engineer: Sergio Cuenca
// 
// Create Date: 30/12/2017 
// Module Name: bmp16ROM
// Description: ROM for storing 16 bmp images (16 colors)
//	
//
// Revision: 
// Revision 0.01 - File Created

//
// Additional Comments: based on JM Rico design
//
// WARNING: iCE40 sysMEM only support the following conf: 
//          256x16b, 512x8b, 1Kx4b, 2Kx2b
//			ROM of 1b word is mapped to 2Kx2b wasting 1bit per word
//			Alternatively compress pixels into 2b words to save BRAM
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
module Bmp16ROM (
                input  wire clk,            // System clock.
                input  wire [11:0] add,    
                output reg  [3:0] pixel           
             );

    // Image name file in binary ASCII code.
   parameter BMPFILE = "pacman.list";

    // Width and height image.
    parameter width = 16; 
    parameter height = 16;
	parameter nsprites = 16;

    // Memory
    //reg [width-1:0] logo [height-1:0];
	reg  [3:0] bmps [nsprites*width*height-1:0];


    // Load file in memory.
    initial
    begin
       if (BMPFILE) $readmemh(BMPFILE, bmps);
    end
	

    // Read memory.
    always @(posedge clk)
    begin
		pixel <= bmps[add];
    end
endmodule
