// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module pr0;
   reg r;
   initial r = ( 1'b1 ? 1'b0 : 1'b0) ? 1'b0 : 1'b0;
   initial begin
      #1 if (r !== 1'b0) begin
	 $display("FAILED");
	 $finish;
      end
      $display("PASSED");
   end
endmodule
