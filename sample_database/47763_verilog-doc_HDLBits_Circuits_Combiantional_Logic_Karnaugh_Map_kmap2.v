// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign	out = (~b)&(~c) | (~a)&(~d) | a&c&d | (~a)&b&c ;
endmodule

