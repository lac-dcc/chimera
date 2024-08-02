// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

module out_section_f1 (
    input   m_bar,
    input   ci_bar,
    input   input1_out1,
    input   input1_out2,
    input   input0_out1,
    input   input0_out2,
    output  f1);

assign f1 = ((input1_out1 ^ input1_out2) ^ ~((ci_bar & input0_out1 & m_bar) | (input0_out2 & m_bar)));

endmodule
