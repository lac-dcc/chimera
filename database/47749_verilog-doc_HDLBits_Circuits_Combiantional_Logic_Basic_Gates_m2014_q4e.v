// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input in1,
    input in2,
    output out);
    assign out = ~(in1|in2);
endmodule
