// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = in[0]&in[1]&in[2]&in[3];
    
    assign out_or = in[0]|in[1]|in[2]|in[3];
    
    assign out_xor = in[0]^in[1]^in[2]^in[3];
endmodule

