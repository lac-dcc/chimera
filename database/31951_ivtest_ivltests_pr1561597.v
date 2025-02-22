// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module evidence;
   reg [4:0] y = 5'h10;
   initial begin
      $display(y[4], y[1<<2]);
      if (y[1<<2] !== 1'b1) begin
	 $display("FAILED");
	 $finish;
      end
      $display("PASSED");
   end
endmodule
