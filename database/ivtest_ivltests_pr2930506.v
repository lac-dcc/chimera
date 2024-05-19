// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`begin_keywords "1364-2005"
module test;
    reg [800:1] string;
    integer code;
    real f;

    initial begin
        string = "1e1";
        code = $sscanf(string, "%f", f);
        if (f != 10.0) $display("FAILED: got %f", f);
        else $display("PASSED");
    end
endmodule
`end_keywords
