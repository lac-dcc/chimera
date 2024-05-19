// This program was cloned from: https://github.com/AndresNavarro82/vt52-fpga
// License: GNU General Public License v3.0

/**
 * Keymap ROM (2KB, maps keycodes to ASCII chars)
 * This could be a RAM to allow keymap modifications, but not for now
 * There's 8 planes for each keycode (controlled by the highest three bits)
 * MSB is for long keycode vs short keycode, the the next two bits:
 * 00: no shift or caps lock
 * 01: just shift
 * 10: just caps lock
 * 11: caps lock & shift
 */
module keymap_rom
  (input clk,
   input [10:0] addr,
   output [7:0] dout
   );

   reg [7:0]    dout;
   reg [7:0]    mem [2047:0];

   integer i;

   initial begin
      // the hex file is sparse, prefill with zeros
      // XXX yosys doesn't like this, it overrides the readmemh
      // so for now just assume that all other positions have zeros...
      // for (i = 0; i < 2047; i = i + 1) mem[i] = "b";
      $readmemh("mem/keymap.hex", mem) ;
   end

   always @(posedge clk) begin
      dout = mem[addr];
   end
endmodule
