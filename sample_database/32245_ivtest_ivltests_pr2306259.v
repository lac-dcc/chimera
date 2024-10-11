// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test ();
   generate
      if (1) begin
         initial begin : a
            integer i;
            i=0;
	    $display("PASSED");
         end
      end
   endgenerate
endmodule
