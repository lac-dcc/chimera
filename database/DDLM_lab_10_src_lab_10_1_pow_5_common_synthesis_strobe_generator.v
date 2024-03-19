module strobe_generator
# (
    parameter w = 24
)
(
    input      clk,
    input      rst_n,
    output reg strobe
);

    reg [w - 1:0] cnt;

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            cnt <= { w { 1'b0 } };
        else
            cnt <= cnt + 1'b1;

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            strobe <= 1'b0;
        else
            strobe <= (cnt [w - 1:0] == 1'b0);

endmodule
 