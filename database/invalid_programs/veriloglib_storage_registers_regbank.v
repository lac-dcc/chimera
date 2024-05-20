// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`include "register.v"

module regbank
#(  parameter WIDTH = 8,
    parameter NREGS = 10
)
(
    input clk,
    input rst_n,
    input [WIDTH*NREGS] data_in,
    output reg [WIDTH*NREGS] data_out
);

    generate
        for(genvar i = 0; i < NREGS; i = i + 1)
            register #(.WIDTH(WIDTH)) reg_unit (.clk(clk), .rst_n(rst_n), .data_in(data_in[i*WIDTH:((i+1)*WIDTH)-1]), .data_out(data_out[i*WIDTH:((i+1)*WIDTH)-1]));
    endgenerate

endmodule
