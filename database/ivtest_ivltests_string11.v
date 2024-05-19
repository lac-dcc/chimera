// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   reg [31:0] bytes;

   initial begin
      bytes = "\101\102\103\n";
      $write("bytes=%h\n", bytes);
      $finish(0);
   end
endmodule // main
