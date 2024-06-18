// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
   initial begin
      main;
      $display("PASSED");
   end

   task main;
      begin
	 if(1)
	   ;
	 else begin
	    $display("FAILED");
	    $finish;
	 end
      end
   endtask
endmodule
