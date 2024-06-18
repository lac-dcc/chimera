// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor ta157_4
// Four (2x1) multiplexers
// UPDATE FROM THESIS
//   Replaced ta157bar and ta157 in THESIS with jeff_74x157
//   Quad 2x1 multiplexers

module ta157_4(
    input  [3:0]    A4,                 // 
    input  [3:0]    B4,                 // 
    input           S,                  //
    input           EN_BAR,             //
    output [3:0]    Y4                  // 
);

// Replaced ta157_bar and ta157 in THESIS with jeff_74x157
assign EN = ~EN_BAR;

// Quad 2x1 multiplexers
jeff_74x157_behavioral MUX0 (
    .a(A4),
    .b(B4),
    .s(S),
    .en(EN),
    .y(Y4)
);

endmodule