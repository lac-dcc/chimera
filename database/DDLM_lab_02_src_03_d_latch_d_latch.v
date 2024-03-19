module d_latch
(
    input       clk,
    input       d,
    output reg  q
);

    always @ (clk or d)
        if(clk)
            q <= d;

endmodule
