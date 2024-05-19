// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor opcodedec
// Opcode decoding
// UPDATE FROM THESIS
//   Replaced nand4 in THESIS with jeff's nand4

module opcodedec (
    input  [3:0]    OPCODE,             // 
    input  [7:4]    MW_AD_HIGH,         // 
    input  [12:9]   MW_BOP,             //
    output [7:4]    TO_COUNTER,         //
    output          EIL_BAR             //
);

// WIRES
wire W1;

// ASSIGN VALUES
assign LOW = 1'b0;
assign EIL_BAR = W1;

// Four (2x1) multiplexers
ta157_4 U1 (
    .A4(OPCODE),
    .B4(MW_AD_HIGH),
    .S(W1),
    .EN_BAR(LOW),
    .Y4(TO_COUNTER)
);

// FOUR INPUT NAND GATE
// Replaced nand4 in THESIS with jeff's nand4
nand4_behavioral U2 (
    .a(MW_BOP[9]),
    .b(MW_BOP[10]),
    .c(MW_BOP[11]),
    .d(MW_BOP[12]),
    .y(W1)
);

endmodule