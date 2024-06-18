// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module full_adder (
    input a, b, cin,
    output sum, carry
);

    wire w1, w2, w3, w4;

    xor w1 (sum, a, b);
    and w2 (w2, a, b);
    and w3 (w3, b, cin);
    and w4 (w4, cin, a);

    or or_gate (carry, w2, w3, w4);

endmodule

