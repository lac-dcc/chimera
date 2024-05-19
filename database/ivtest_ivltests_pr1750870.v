// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// pr1750870

module test (FUSE_Q);

   parameter fuse_a_msb = 4;

   parameter fuse_q_msb = (2**(fuse_a_msb+1))-1;

   input [fuse_q_msb:0] FUSE_Q;

   initial begin
      $display("fuse_q_msb = %d", fuse_q_msb);
      if ($bits(FUSE_Q) != 32) begin
	 $display("FAILED -- $bits(FUSE_Q) = %d", $bits(FUSE_Q));
	 $finish;
      end

      $display("PASSED");
   end

endmodule
