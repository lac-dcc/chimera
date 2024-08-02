// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test ();
   parameter fuse_a_msb = 4;
   parameter fuse_q_msb = (2**(fuse_a_msb+1))-1;

   initial begin
      if (fuse_q_msb != 'h1f) begin
	 $display("FAILED -- fuse_q_msb = %d", fuse_q_msb);
	 $finish;
      end

      $display("PASSED");
   end

endmodule
