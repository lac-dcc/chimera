// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    wire one;
    assign one = !(in1^in2); 
    assign out = one^in3;

endmodule