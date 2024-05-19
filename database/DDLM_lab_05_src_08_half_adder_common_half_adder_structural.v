// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module half_adder_structural
(
    input  wire x, y,
    output wire z,
    output wire carry_out
);
    xor(z, x, y);
    and(carry_out, x, y);
endmodule
