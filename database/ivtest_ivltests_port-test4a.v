// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/***********************************************************************

  Duplicate input declaration test case
  Duplicate port declarations should generate an error

***********************************************************************/

module port_test4 (
		    a,		// Input
		    b,		// Output
                  );

input a;
input a;

output b;

assign b=a;

endmodule
