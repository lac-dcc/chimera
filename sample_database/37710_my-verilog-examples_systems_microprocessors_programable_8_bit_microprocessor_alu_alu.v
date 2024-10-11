// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor alu
// 8-bit alu

module alu (
    input  [7:0]    IN_A,               // WORD 1
    input  [7:0]    IN_B,               // WORD 2
    input           CIN,                // CARRY IN
    input  [19:15]  ALU_FUNC,           // FUNCTION SELECT (19 is MODE: 0 is arithmetic, 1 is logic)
    output [7:0]    OUT8,               // OUTPUT
    output          C4,                 // CARRY OUT
    output          C8,                 // CARRY OUT
    output          Z                   // WHEN A = B
);

//WIRES
wire CARRY;
wire NOTHING1, NOTHING2;
wire NOTHING3, NOTHING4;
wire AEQB1, AEQB2;

assign C4 = CARRY;

ta181_bar U1 (
    .A3_BAR(IN_A[3]),
    .A2_BAR(IN_A[2]),
    .A1_BAR(IN_A[1]),
    .A0_BAR(IN_A[0]),
    .B3_BAR(IN_B[3]),
    .B2_BAR(IN_B[2]),
    .B1_BAR(IN_B[1]),
    .B0_BAR(IN_B[0]),
    .S3(ALU_FUNC[18]),
    .S2(ALU_FUNC[17]),
    .S1(ALU_FUNC[16]),
    .S0(ALU_FUNC[15]),
    .M(ALU_FUNC[19]),
    .CI(CIN),
    .F3_BAR(OUT8[3]),
    .F2_BAR(OUT8[2]),
    .F1_BAR(OUT8[1]),
    .F0_BAR(OUT8[0]),
    .CO(CARRY),
    .AEQB(AEQB1),
    .P_BAR(NOTHING1),
    .G_BAR(NOTHING2)
);

ta181_bar U2 (
    .A3_BAR(IN_A[7]),
    .A2_BAR(IN_A[6]),
    .A1_BAR(IN_A[5]),
    .A0_BAR(IN_A[4]),
    .B3_BAR(IN_B[7]),
    .B2_BAR(IN_B[6]),
    .B1_BAR(IN_B[5]),
    .B0_BAR(IN_B[4]),
    .S3(ALU_FUNC[18]),
    .S2(ALU_FUNC[17]),
    .S1(ALU_FUNC[16]),
    .S0(ALU_FUNC[15]),
    .M(ALU_FUNC[19]),
    .CI(CARRY),
    .F3_BAR(OUT8[7]),
    .F2_BAR(OUT8[6]),
    .F1_BAR(OUT8[5]),
    .F0_BAR(OUT8[4]),
    .CO(C8),
    .AEQB(AEQB2),
    .P_BAR(NOTHING3),
    .G_BAR(NOTHING4)
);

and2_behavioral AND1 (
    .a(AEQB1),
    .b(AEQB2),
    .y(Z)
);

endmodule
