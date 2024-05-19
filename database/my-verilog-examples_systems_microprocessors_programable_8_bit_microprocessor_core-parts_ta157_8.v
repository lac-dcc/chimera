// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor ta157_8
// Eight (2x1) multiplexers
// UPDATE FROM THESIS
//   Replaced ta157bar and ta157 in THESIS with jeff_74x157
//   Quad 2x1 multiplexers

module ta157_8(
    input  [7:0]    A8,                 // 
    input  [7:0]    B8,                 // 
    input           S,                  //
    input           EN_BAR,             //
    output [7:0]    Y8                  // 
);


// Replaced ta157_bar and ta157 in THESIS with jeff_74x157
assign EN = ~EN_BAR;

// Lower 4 bits - Quad 2x1 multiplexers
jeff_74x157_behavioral MUX0 (
    .a(A8[3:0]),
    .b(B8[3:0]),
    .s(S),
    .en(EN),
    .y(Y8[3:0])
);

// Upper 4 bits - Quad 2x1 multiplexers
jeff_74x157_behavioral MUX1 (
    .a(A8[7:4]),
    .b(B8[7:4]),
    .s(S),
    .en(EN),
    .y(Y8[7:4])
);

endmodule