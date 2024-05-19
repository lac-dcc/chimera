// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
   initial
     begin: A1
	while(1 != 0)
	  begin: A2
	     reg B;
	     B = 1;
	     $display("B is %d", B);
	     disable A1;
	  end
     end
endmodule
