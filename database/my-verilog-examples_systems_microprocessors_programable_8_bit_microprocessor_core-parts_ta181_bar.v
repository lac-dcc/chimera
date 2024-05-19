// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor ta181_bar
// 4-bit arithmetic logic unit and function generator
// Written above SOFT MACRO (text in thesis)
// UPDATE FROM THESIS
//   Replaced ta181 in THESIS with jeff_74x181
//   4-bit arithmetic logic unit and function generator

module ta181_bar(
    input           A3_BAR, A2_BAR, A1_BAR, A0_BAR,     // WORD 1
    input           B3_BAR, B2_BAR, B1_BAR, B0_BAR,     // WORD 2
    input           S3, S2, S1, S0,                     // FUNCTION SELECT
    input           M,                                  // MODE: 0 is arithmetic, 1 is logic
    input           CI,                                 // CARRY IN
    output          F3_BAR, F2_BAR, F1_BAR, F0_BAR,     // OUTPUT
    output          CO,                                 // CARRY OUT
    output          AEQB,                               // WHEN A = B
    output          P_BAR,                              // PROPAGATE - I don't use this
    output          G_BAR                               // GENERATE - I don't use this
);

// WIRES REMOVED TO KEEP ALU POSITIVE
// wire A0_SIG, A1_SIG, A2_SIG, A3_SIG;
// wire B0_SIG, B1_SIG, B2_SIG, B3_SIG;
// wire F0_SIG, F1_SIG, F2_SIG, F3_SIG;

assign CO = ~CO_BAR; // NOT IN THESIS
assign CI_BAR = ~CI; // NOT IN THESIS

// 4-bit arithmetic logic unit and function generator
// Replaced ta181 in THESIS with jeff_74x181
jeff_74x181 U1 (
    .a3(A3_BAR),
    .a2(A2_BAR),
    .a1(A1_BAR),
    .a0(A0_BAR),
    .b3(B3_BAR),
    .b2(B2_BAR),
    .b1(B1_BAR),
    .b0(B0_BAR),
    .s3(S3),
    .s2(S2),
    .s1(S1),
    .s0(S0),
    .m(M),
    .ci_bar(CI_BAR),
    .f3(F3_BAR),
    .f2(F2_BAR),
    .f1(F1_BAR),
    .f0(F0_BAR),
    .co_bar(CO_BAR),
    .aeqb(AEQB),
    .x(P_BAR),
    .y(G_BAR)
);

//not1 INV1 (.a(A3_BAR), .y(A3_SIG)); // REMOVED THIS TO KEEP IT POSTITVE
//not1 INV2 (.a(A2_BAR), .y(A2_SIG));
//not1 INV3 (.a(A1_BAR), .y(A1_SIG));
//not1 INV4 (.a(A0_BAR), .y(A0_SIG));
//not1 INV5 (.a(B3_BAR), .y(B3_SIG));
//not1 INV6 (.a(B2_BAR), .y(B2_SIG));
//not1 INV7 (.a(B1_BAR), .y(B1_SIG));
//not1 INV8 (.a(B0_BAR), .y(B0_SIG));
//not1 INV9 (.a(F3_SIG), .y(F3_BAR));
//not1 INV10 (.a(F2_SIG), .y(F2_BAR));
//not1 INV11 (.a(F1_SIG), .y(F1_BAR));
//not1 INV12 (.a(F0_SIG), .y(F0_BAR));

endmodule