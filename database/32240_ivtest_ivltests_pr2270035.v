// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test ();
    reg [30:0] a, b;

    initial begin
        b = 1;
        a = (0 << b);
        // $display ("a: %d", a);
        if (a !== 31'b0) $display("FAILED");
        else $display("PASSED");
    end
endmodule
