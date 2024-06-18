// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    assign out = in[sel*4+3 -: 4]; // - and : should be put together
    
endmodule