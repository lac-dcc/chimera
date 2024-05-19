// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module multi_consumer
(
    d_in,
    d_out_1, d_out_2, d_out_4, d_out_7,
    clock, rst
);

    input clock;
    input rst;

    input [15:0] d_in;

    output [15:0] d_out_1, d_out_2, d_out_4, d_out_7;

    assign d_out_1 = d_in + 1'b1;
    assign d_out_2 = d_in + 2'b10;
    assign d_out_4 = d_in + 3'b100;
    assign d_out_7 = d_in + 3'b111;
    
endmodule
