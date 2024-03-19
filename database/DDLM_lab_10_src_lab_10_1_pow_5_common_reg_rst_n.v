module reg_rst_n
# (
    parameter w = 1
) 
(
    input                clk,
    input                rst_n,
    input      [w - 1:0] d,
    output reg [w - 1:0] q
);

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            q <= { w { 1'b0 } };
        else
            q <= d;

endmodule
