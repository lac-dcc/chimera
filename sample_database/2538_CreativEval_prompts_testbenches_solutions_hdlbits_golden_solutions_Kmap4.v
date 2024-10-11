// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = (~a&b&~c&~d) | (a&~b&~c&~d) | (~a&~b&~c&d) |  (a&b&~c&d) |  (~a&b&c&d) |  (a&~b&c&d) |  (~a&~b&c&~d) |  (a&b&c&~d);

endmodule