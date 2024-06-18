// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    reg [7:0]tmp1,tmp2;
    mux2 mux0 ( sel[0],    a,    b, tmp1 );
    mux2 mux1 ( sel[0],    c,    d, tmp2 );
    mux2 mux2 ( sel[1], tmp1, tmp2,  out );

endmodule

