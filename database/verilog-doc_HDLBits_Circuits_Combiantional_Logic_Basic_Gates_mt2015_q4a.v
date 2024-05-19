// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (input x, input y, output z);
    assign z = (x^y)&x;
endmodule

