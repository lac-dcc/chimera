// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    
    assign out = sel ? b : a;

endmodule