// This program was cloned from: https://github.com/chriz2600/time-sleuth
// License: MIT License

`timescale 1 ns / 1 ns

module char_rom (
    input clock,
    input [7:0] address,
    output [7:0] q
);

reg[7:0] q_reg;
reg[7:0] q_reg_2;

assign q = q_reg_2;

always @(posedge clock) begin
    case (address)
        `include "font/8x16-font-digits.v"
    endcase
    q_reg_2 <= q_reg;
end
endmodule
