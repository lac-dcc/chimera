// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module simple_comp
(
    a_in, b_in, c_in,
    d_out,
    clock, rst
);

    input [15:0] a_in;
    input [15:0] b_in;
    input [15:0] c_in;

    input clock;
    input rst;

    output [15:0] d_out;

    reg [15:0] sum_c;
    reg [15:0] sum_d;

    always @ (posedge clock)
        if(rst)
            sum_c <= 16'b0;
        else
            sum_c <= a_in + b_in;

    always @ (posedge clock)
        if(rst)
            sum_d <= 16'b0;
        else
            sum_d <= sum_c + c_in;

    assign d_out = sum_d;

endmodule
