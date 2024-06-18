// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License


module M_MULT #(
    parameter N = 3
) (
    input[N-1:0] a, b,
    output[N-1:0] product
);
    assign product = a*b;
endmodule




