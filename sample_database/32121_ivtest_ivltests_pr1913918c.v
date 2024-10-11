// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// pr1913918c

module test ( output reg a);

   parameter [9:1] b = 9'b0_0000_0010;

   initial begin
      a = b[1] ^ b[9];
      if (a !== 1'b0) begin
	 $display("FAILED -- b=%b, a=%b", b, a);
	 $finish;
      end
      $display("PASSED");
   end

endmodule
