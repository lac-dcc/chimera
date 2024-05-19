// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

module out_section_f2 (
    input   m_bar,
    input   ci_bar,
    input   input2_out1,
    input   input2_out2,
    input   input1_out1,
    input   input1_out2,
    input   input0_out1,
    input   input0_out2,
    output  f2);

assign f2 = ((input2_out1 ^ input2_out2) ^ ~((ci_bar & input0_out1 & input1_out1 & m_bar) | (input1_out1 & input0_out2 & m_bar) | (input1_out2 & m_bar)));

endmodule
