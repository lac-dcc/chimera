// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   reg [3:0] tmp;

   initial begin
      tmp = 10.7;

      if (tmp !== 4'd11) begin
	 $display("FAILED -- Incorrect rounding: tmp=%b", tmp);
	 $finish;
      end

      $display("PASSED");
   end

endmodule // main
