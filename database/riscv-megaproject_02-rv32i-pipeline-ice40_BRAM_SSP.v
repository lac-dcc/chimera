// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 Various parameterized Block RAMs
 */

// Synchronous Single Port
module BRAM_SSP(
		clk, we, en, addr, din, dout
		);
   parameter 
     DEPTH = 256,
     DEPTH_LOG = 8,
     WIDTH = 32;
   
   input clk, we, en;
   input [DEPTH_LOG-1:0] addr;
   input [WIDTH-1:0] 	 din;
   output [WIDTH-1:0] 	 dout;

   reg [WIDTH-1:0] 	 RAM [DEPTH-1:0] /*verilator public*/;
   reg [WIDTH-1:0] 	 dout;

   always @ (posedge clk) begin
      if (en & we) begin
	    RAM[addr]   <= din;
	    dout <= din;
      end
      else
	dout <= RAM[addr];
   end
   
endmodule // BRAM_SSP
