`include "config.vh"

module register
# (
    parameter w = 1
) 
(
    input                clk,
    input                rst_n,
    input                en,
    input      [w - 1:0] d,
    output reg [w - 1:0] q
);

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            q <= { w { 1'b0 } };
        else if (en)
            q <= d;

endmodule
