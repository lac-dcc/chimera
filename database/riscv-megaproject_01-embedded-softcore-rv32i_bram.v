// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 Various parameterized Block RAMs
 */

// Synchronous Single Port
module BRAM_SSP(
		clk, we, en, addr, di, do
		);
   parameter 
     DEPTH = 256,
     DEPTH_LOG = 8,
     WIDTH = 32;
   
   input clk, we, en;
   input [DEPTH_LOG-1:0] addr;
   input [WIDTH-1:0] 	 di;
   output [WIDTH-1:0] 	 do;

   reg [WIDTH-1:0] 	 RAM [DEPTH-1:0];
   reg [WIDTH-1:0] 	 do;

   always @ (posedge clk) begin
      if (en & we) begin
	    RAM[addr]   <= di;
	    do <= di;
      end
      else
	do <= RAM[addr];
   end
   
endmodule // BRAM_SSP
