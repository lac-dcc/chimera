// This program was cloned from: https://github.com/sergicuen/collection-iPxs
// License: GNU General Public License v2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
//
// Create Date: 09:30:38 19/09/2017
// Module Name: BmpROM
// Description: ROM for storing the sprites of the game
//				4sprites of 16x16 4bits
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created 1BRAM
//
// Additional Comments:
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------

module BmpROM (
                input  wire clk,            // System clock.
                input  wire [9:0] add,    
                output reg  [3:0] pixel           
             );

    // Image name file in binary ASCII code.
   parameter BMPFILE = "pacman.list";

    // Width and height image. Both power of 2 
    parameter width = 16; 
    parameter height = 16;
	parameter nsprites = 4;

    // Memory
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
