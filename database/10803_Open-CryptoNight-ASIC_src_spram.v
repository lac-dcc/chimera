// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns // timescale for following modules

// TODO: This one does not follow ASIC RAM behavior wrt read on CS not selected

module spram (
   clk,
   cs,
   we,
   din,
   addr,
   dout);

parameter ADDR_WIDTH = 5;
parameter DATA_WIDTH = 128;

input   clk;
input   cs;
input   we;
input   [DATA_WIDTH-1:0] din;
input   [ADDR_WIDTH-1:0] addr;
output  [DATA_WIDTH-1:0] dout;

reg     [DATA_WIDTH-1:0] ram [(1<<ADDR_WIDTH) - 1 : 0];
reg     [DATA_WIDTH-1:0] q;

`ifdef ALTERA_SYNC_SRAM
// always @(posedge clk) begin
//   if (we && cs) begin
//     ram[addr] <= din;
//     q <= din;
//   end else
//     q <= ram[addr];
// end
// assign dout = q;
`else
reg   [ADDR_WIDTH-1:0] addr_reg;
always @(posedge clk) begin
  if (we && cs)
    ram[addr] <= din;
  addr_reg <= addr;
end
`endif

assign dout = ram[addr_reg];

endmodule
