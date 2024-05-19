// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
   initial
     begin: A1
	reg[1:0] v2;
	v2 = 2'b0z;
	$write(
	       "expected 1; got %0b\n",
	       (($signed(v2) === 1'sbx) || ($signed(v2 + 1'b1) === 1'sbx)));
     end
endmodule
