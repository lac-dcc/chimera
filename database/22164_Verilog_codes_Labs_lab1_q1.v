// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module q1_structural (
    input A,
    input  B,
    input  C,
    output Y);
    
    wire w1;
    wire w2;
    wire w3;
    wire w4;

    and gate1 (w1, A, ~B);
    or gate2 (w2, A, B);
    not gate3 (w3, C);
    and gate4 (w4,w2, w3);
    or gate5(Y,w1,w4);

endmodule
