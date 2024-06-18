// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_sop = (c&d)|(~a&~b&c);
    assign out_pos = c&(~b|~c|d)&(~a|~c|d);
endmodule
