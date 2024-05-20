// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module multiplier(
    input [7:0] a, b,
    output [7:0] result
);

    wire [15:0] mult;
    assign mult = a * b;
    assign result = mult[15:8];

endmodule


