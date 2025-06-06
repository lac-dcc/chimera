// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// This tests SystemVerilog packages
//
// This tests the elaboration infrastructure of packages in
// SystemVerilog. It actually covers a fair number of features,
// given the small size of the program:
//
//    *) Parsing of package blocks and import statements
//    *) Manage scope of names in package
//    *) Actual references of imported names from packages.
//

package pkg;
   parameter int foo = 1;
endpackage


module test ();

   // import all from p1
   import pkg::foo;

   initial begin
      $display("pkg::foo = %0d", foo);
      if (foo != 1) begin
	 $display("FAILED");
	 $finish;
      end
      $display("PASSED");
   end

endmodule // test
