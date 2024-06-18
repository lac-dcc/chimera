// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    
    assign out_sop = (~a & ~b & c) | (b & c & d) | (a & c & d);
    assign out_pos = out_sop;

endmodule