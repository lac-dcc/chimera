// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] e;
    wire [7:0] f;
    
    assign e = (a<b) ? a : b;
    assign f = (c<d) ? c : d;
    
    assign min = (e<f) ? e : f;

endmodule