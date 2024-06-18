// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input [7:0] in,
    output parity); 
    assign parity = ^in[7:0];
endmodule
