// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    assign out = in[sel];

endmodule