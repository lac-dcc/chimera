// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test2 ();

    generate
    begin : a
        reg b;
    end
    endgenerate

  initial begin
    a.b = 1'b1;
    if (a.b) $display("PASSED");
    else $display("FAILED");
  end
endmodule
