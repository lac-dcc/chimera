// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

module SPRAM_16Kx16
  (
   input wire [13:0] addr,
   input wire [15:0] din,
   input wire [3:0] maskwren,
   input wire wren,
   input wire clk,
   output reg [15:0] dout
   );
   
   reg [15:0] 	     RAM [16383:0] /*verilator public*/;

   always @ (posedge clk) begin
      if (wren) begin
	 if (maskwren[0]) RAM[addr][0+:4]   <= din[0+:4];
	 if (maskwren[1]) RAM[addr][4+:4]   <= din[4+:4];
	 if (maskwren[2]) RAM[addr][8+:4]   <= din[8+:4];
	 if (maskwren[3]) RAM[addr][12+:4]   <= din[12+:4];
      end
      else begin
	dout <= RAM[addr];
      end
   end
endmodule // SB_SPRAM256KA
