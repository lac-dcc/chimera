// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   wire a;
   device U1(a);

   task work;
     begin
	$deposit(U1.r, 1);
	$display("PASSED");
	$finish;
     end
   endtask

   initial work;

endmodule

module device(r);
   output r;
   reg r;
endmodule
