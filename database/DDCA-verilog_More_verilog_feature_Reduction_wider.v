// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);

assign out_and = & in;
assign out_or = | in;
assign out_xor = ^ in;

endmodule
