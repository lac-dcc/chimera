// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input [4:1] x,
    output f
); 

    assign f = (~x[1] & x[3]) | (~x[2] & ~x[3] & ~x[4]) | (x[1] & ~x[2] & x[3] & ~x[4]) | (x[2] & x[3] & x[4]);
    
endmodule