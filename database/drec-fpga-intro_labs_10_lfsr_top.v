module top(
    input CLK,

    output DS_EN1
);

wire [2:0]w;

lfsr lfsr(CLK, w);

assign DS_EN1 = w[0];

endmodule
