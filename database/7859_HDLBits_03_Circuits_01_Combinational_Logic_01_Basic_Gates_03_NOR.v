// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module (
    input in1,
    input in2,
    output out);
    assign out = !(in1|in2);
endmodule
