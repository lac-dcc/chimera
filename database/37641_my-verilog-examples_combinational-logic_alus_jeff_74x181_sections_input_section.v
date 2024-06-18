// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

module input_section (
    input   a,
    input   b,
    input   s3,
    input   s2,
    input   s1,
    input   s0,
    output  out1,
    output  out2);

assign out1 = ~((b & s3 & a) | (a & s2 & ~b));
assign out2 = ~((~b & s1) | (s0 & b) | (a));

endmodule