/**
 * Character Font ROM (4kx8)
 * This could be a RAM to allow font modifications, but not for now
 * latin-1 subset of Terminus Font 8x16 (http://terminus-font.sourceforge.net)
 * Terminus Font is licensed under the SIL Open Font License, Version 1.1.
 * The license is included as ofl.txt, and is also available with a FAQ
 * at http://scripts.sil.org/OFL
 */
module char_rom
  (input clk,
   input [11:0] addr,
   output [7:0] dout
   );

   reg [7:0] dout;
   reg [7:0] mem [4095:0];

   initial begin
      $readmemh("mem/terminus_816_latin1.hex", mem) ;
//      $readmemh("mem/terminus_816_bold_latin1.hex", mem) ;
   end

   always @(posedge clk) begin
      dout = mem[addr];
   end
endmodule
