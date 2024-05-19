// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

    assign	out_sop = c&d | (~a)&(~b)&c;
    assign	out_pos = c&((~a)|(~c)|d)&(a|(~b)|(~c)|d);
    
endmodule

