// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor zp_bit
// ZP status bit
// UPDATE FROM THESIS
//   Replaced nor2 & nand4 in THESIS with Jeff's nor2 & nand4

module zp_bit (
    input  [7:0]    F8,                 // 
    output          ZP_BAR              // 
);

wire [3:0] W;

// Replaced nor2 in THESIS with Jeff's nor2
nor2_behavioral U1 (
    .a(F8[0]),
    .b(F8[1]),
    .y(W[0])
);

nor2_behavioral U2 (
    .a(F8[2]),
    .b(F8[3]),
    .y(W[1])
);

nor2_behavioral U3 (
    .a(F8[4]),
    .b(F8[5]),
    .y(W[2])
);

nor2_behavioral U4 (
    .a(F8[6]),
    .b(F8[7]),
    .y(W[3])
);

// Replaced nand4 in THESIS with Jeff's nand4
nand4_behavioral U5 (
    .a(W[0]),
    .b(W[1]),
    .c(W[2]),
    .d(W[3]),
    .y(ZP_BAR)
);

endmodule