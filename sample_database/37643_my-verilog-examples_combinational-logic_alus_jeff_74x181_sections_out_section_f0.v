// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

module out_section_f0 (
    input   m_bar,
    input   ci_bar,
    input   input0_out1,
    input   input0_out2,
    output  f0);

assign f0 = ((input0_out1 ^ input0_out2) ^ ~(ci_bar & m_bar));

endmodule