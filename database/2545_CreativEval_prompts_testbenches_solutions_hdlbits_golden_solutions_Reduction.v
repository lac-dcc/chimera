// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input [7:0] in,
    output parity); 
    assign parity = ^ in[7:0];
endmodule