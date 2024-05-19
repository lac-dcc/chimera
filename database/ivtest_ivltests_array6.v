// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   reg signed [7:0] pair[0:1];
   integer   idx;

   initial begin
      pair[0] = 0;
      pair[1] = 1;
      idx = 0;

      if (pair[idx]+8'sd1 !== 8'sd1) begin
	 $display("FAILED");
	 $finish;
      end

      pair[idx+1] = pair[idx] + 8'sd2;
      if (pair[idx+1]+8'sd1 !== 8'sd3) begin
	 $display("FAILED");
	 $finish;
      end
      $display("PASSED");
   end

endmodule // main
