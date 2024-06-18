// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor ta377_bar
// 	Ocatal Register - Written above SOFT MACRO (text in thesis)
// UPDATE FROM THESIS
//   Replaced ta377 in THESIS with jeff_74x377
//   8-bit register, clock enable

module ta377_bar(
    input           EN_BAR,             //
    input           CLK,                //
    input  [7:0]    D,                  // 
    output [7:0]    Q                   // 
);

assign EN = ~EN_BAR;

// 8-bit register, clock enable
// Replaced ta377 in THESIS with jeff_74x377
jeff_74x377_structural U1 (
    .en_bar(EN_BAR),
    .clk(CLK),
    .d0(D[0]),
    .d1(D[1]),
    .d2(D[2]),
    .d3(D[3]),
    .d4(D[4]),
    .d5(D[5]),
    .d6(D[6]),
    .d7(D[7]),
    .q0(Q[0]),
    .q1(Q[1]),
    .q2(Q[2]),
    .q3(Q[3]),
    .q4(Q[4]),
    .q5(Q[5]),
    .q6(Q[6]),
    .q7(Q[7])
);

endmodule