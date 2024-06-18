// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns // timescale for following modules

module spram128k (
   clk,
   re,
   we,
   din,
   addr,
   dout);

parameter ADDR_WIDTH = 17;
parameter DATA_WIDTH = 128;

input   clk;
input   re;
input   we;
input   [DATA_WIDTH-1:0] din;
input   [ADDR_WIDTH-1:0] addr;
output  [DATA_WIDTH-1:0] dout;

`define SIM_RAM
`ifdef SIM_RAM
spram #(.ADDR_WIDTH(ADDR_WIDTH)) R (
  .clk(clk),
  .cs(re || we),
  .we(we),
  .din(din),
  .addr(addr),
  .dout(dout)
  );
`endif

endmodule
