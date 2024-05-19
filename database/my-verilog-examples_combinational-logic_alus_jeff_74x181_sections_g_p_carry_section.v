// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

module g_p_carry_section (
    input   input3_out1,
    input   input3_out2,
    input   input2_out1,
    input   input2_out2,
    input   input1_out1,
    input   input1_out2,
    input   input0_out1,
    input   input0_out2,
    input   ci_bar,
    output  co_bar,
    output  x,
    output  y);

assign y = ~((input3_out2) | (input3_out1 & input2_out2) | (input3_out1 & input2_out1 & input1_out2) | (input3_out1 & input2_out1 & input1_out1 & input0_out2));

assign co_bar = (~y | (input3_out1 & input2_out1 & input1_out1 & input0_out1 & ci_bar));

assign x = ~(input3_out1 & input2_out1 & input1_out1 & input0_out1);

endmodule