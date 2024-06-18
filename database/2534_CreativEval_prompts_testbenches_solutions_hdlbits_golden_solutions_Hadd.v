// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input a, b,
    output cout, sum );
    
    assign {cout, sum} = a + b;

endmodule