// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   reg [1:-10] foo;

   initial begin
      foo = 12'b0000_0000_0100;

      if (foo[-7-1] !== 1'b1) begin
	 $display("FAILED");
	 $finish;
      end

      $display("PASSED");
   end

endmodule // main
