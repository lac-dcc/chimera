// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// This tests end labes (should fail compilation)
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2012 by Iztok Jeras.

module test ();

   // error counter
   bit err = 0;

   initial
   begin : dummy_label
      if (!err) $display("PASSED");
   end : dummy_label_bad

endmodule : test_bad
