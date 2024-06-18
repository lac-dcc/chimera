// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module ll1 (
    input A,
    input B,
    input C,
    output f
);

    assign f = (A & ~B & C) | (A & B & ~C);

endmodule
