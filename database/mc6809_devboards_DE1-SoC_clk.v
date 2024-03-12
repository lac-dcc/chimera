module clk(
            input CLK_IN1,
            output CLK_OUT1,
            output CLK_OUT2,
            output CLK_OUT3,
            output CLK_OUT4,
            output LOCKED,
            input  RESET
            );

    pll pll_clk(.rst(RESET),
                .refclk(CLK_IN1),
                .outclk_0(CLK_OUT1),
                .outclk_1(CLK_OUT2),
                .outclk_2(CLK_OUT3),
                .outclk_3(CLK_OUT4),
                .locked(LOCKED)
                );
endmodule

