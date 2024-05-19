// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

module SPRAM_16Kx16
  (
   input wire [13:0] addr,
   input wire [15:0] din,
   input wire [3:0] maskwren,
   input wire wren,
   input wire clk,
   output wire [15:0] dout
   );

   SB_SPRAM256KA ram0
     (
      .ADDRESS(addr),
      .DATAIN(din),
      .MASKWREN(maskwren),
      .CHIPSELECT(1'b1),
      .CLOCK(clk),
      .STANDBY(1'b0),
      .SLEEP(1'b0),
      .POWEROFF(1'b0),
      .DATAOUT(dout)
      );

endmodule
