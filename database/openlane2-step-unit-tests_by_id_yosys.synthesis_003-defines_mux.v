// This program was cloned from: https://github.com/efabless/openlane2-step-unit-tests
// License: Apache License 2.0

`ifndef REMOVER

module parameterized_mux(A, B, S, Y);
    parameter width = 32;
    input S;
    input  [width - 1:0] A, B;
    output [width - 1:0] Y;
    assign Y = S ? B : A;
endmodule
`endif