// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor register_ab8
// The registers used for temporary storage
// UPDATE FROM THESIS
//   Replaced or2 in THESIS with jeff's or2

module register_ab8(
    input [7:0]     DATA_IN,            // 
    input           SYSTEM_CLK,         // 
    input           ENABLE_CLK,         // 
    output [7:0]    DATA_OUT            // 
);

// WIRES
wire         W1;

// ASSIGN VALUES
assign LOW              = 1'b0;

// OR GATE
//   Replaced or2 in THESIS with jeff's or2
or2_behavioral OR1 (
    .a(SYSTEM_CLK),
    .b(ENABLE_CLK),
    .y(W1)
);

// 8-bit register, clock enable
ta377_bar DFFS (
    .EN_BAR(LOW),
    .CLK(W1),
    .D(DATA_IN),
    .Q(DATA_OUT)
);

endmodule