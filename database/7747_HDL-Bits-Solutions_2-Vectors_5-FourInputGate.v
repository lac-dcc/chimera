// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    
    assign out_and = in[3] && in[2] && in[1] && in[0];
    assign out_or = in[3] || in[2] || in[1] || in[0];
    assign out_xor = in[3] ^ in[2] ^ in[1] ^ in[0];

endmodule