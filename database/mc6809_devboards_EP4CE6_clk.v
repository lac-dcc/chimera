module clk(
            input CLK_IN1,
            output CLK_OUT1,
            output CLK_OUT2,
            output CLK_OUT3,
            output CLK_OUT4,
            output LOCKED,
            input  RESET
            );

    pll pll_clk(.areset(RESET),
                .inclk0(CLK_IN1),
                .c0(CLK_OUT1),
                .c1(CLK_OUT2),
                .c2(CLK_OUT3),
                .c3(CLK_OUT4),
                .locked(LOCKED)
                );
endmodule

