`include "config.vh"

module register_no_rst
# (
    parameter w = 1
) 
(
    input                clk,
    input                en,
    input      [w - 1:0] d,
    output reg [w - 1:0] q
);

    always @ (posedge clk)
        if (en)
            q <= d;

endmodule
