// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module wide_inv
(
    d_in,
    d_out,
    clock,
    rst
);
    input clock;
    input rst;
    input [31:0] d_in;

    output [31:0] d_out;

    assign d_out = ~d_in;

endmodule
