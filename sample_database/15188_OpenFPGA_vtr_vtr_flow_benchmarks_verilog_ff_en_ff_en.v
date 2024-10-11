// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module ff_en
(
    d_in, d_out, clock, rst, d_en
);
    input clock;
    input rst;
    input d_en;
    
    input [9:0] d_in;
    output [9:0] d_out;

    reg [9:0] ff_d;

    assign d_out = ff_d;

    always @ (posedge clock)
        if(rst)
            ff_d <= 10'b0;
        else if(d_en)
            ff_d <= d_in;
        else
            ff_d <= ff_d;

endmodule
