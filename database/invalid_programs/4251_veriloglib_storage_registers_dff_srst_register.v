// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`include "../flipflops/dff_srst.v"

module dff_srst_register
#(parameter WIDTH = 8)
(
    input clk, rst_n,
    input [WIDTH-1:0] d,
    output [WIDTH-1:0] q
);

generate
    for(genvar i = 0; i < WIDTH; i = i + 1)
        dff_srst dff_unit (.clk(clk), .rst_n(rst_n), .d(d[i]), .q(q[i]));
endgenerate


endmodule
