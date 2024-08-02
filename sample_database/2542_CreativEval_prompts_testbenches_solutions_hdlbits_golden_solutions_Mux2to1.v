// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input a, b, sel,
    output out ); 

    assign out = sel ? b : a;
    
endmodule