// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input [4:1] x,
    output f
); 

    assign	f = (~x[1])&x[3] | (~x[2])&(~x[4]) | x[1]&x[2]&x[3]&x[4];
    
endmodule

