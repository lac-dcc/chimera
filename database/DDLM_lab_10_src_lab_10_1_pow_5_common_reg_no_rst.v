module reg_no_rst
# (
    parameter w = 1
) 
(
    input                clk,
    input      [w - 1:0] d,
    output reg [w - 1:0] q
);

    always @ (posedge clk)
        q <= d;

endmodule
