// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input in1,
    input in2,
    input in3,
    output out);
 wire out1;
    
    assign out1 = ~(in1^in2);
    
assign out = in3^ out1;
endmodule

