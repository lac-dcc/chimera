// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module wide_inv_reg
(
    d_in,
    d_out,
    clock,
    rst
);
    input clock;
    input rst;
    input [31:0] d_in;

    reg [31:0] d_d;

    output [31:0] d_out;

    always @ (posedge clock)
        if(rst)
            d_d <= 32'b0;
        else
            d_d <= ~d_in;

    assign d_out = d_d;

endmodule
