// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module blinky (
    input  wire clk,
    output wire led,
    output wire [6:0] clkout
    );

    wire pll_clk;
    wire feedback;

    MMCME2_ADV #(
        .BANDWIDTH("OPTIMIZED"),
        .COMPENSATION("ZHOLD"),
        .CLKFBOUT_MULT_F(10.625),
        .CLKIN1_PERIOD(10.0),
        .CLKOUT0_DIVIDE_F(20.875),
        .CLKOUT0_PHASE(1'd0),
        .CLKOUT1_DIVIDE(8'd21),
        .CLKOUT1_PHASE(1'd0),
        .CLKOUT2_DIVIDE(8'd22),
        .CLKOUT2_PHASE(1'd0),
        .CLKOUT3_DIVIDE(8'd23),
        .CLKOUT3_PHASE(1'd0),
        .CLKOUT4_DIVIDE(24),
        .CLKOUT4_PHASE(1'd0),
        .CLKOUT5_DIVIDE(25),
        .CLKOUT5_PHASE(1'd0),
        .CLKOUT6_DIVIDE(26),
        .CLKOUT6_PHASE(1'd0),
        .DIVCLK_DIVIDE(1'd1),
        .REF_JITTER1(0.01)
    ) MMCME2_ADV (
        .PSINCDEC(1'b0),
        .CLKFBIN(feedback),
        .CLKIN1(clk),
        .PWRDWN(1'b0),
        .RST(1'b0),
        .CLKFBOUT(feedback),
        .CLKOUT0(pll_clk),
        // CLKOUT 1-3 are currently unuseable on Kintex due to missing pips in prjxray
        //.CLKOUT1(clkout[1]),
        //.CLKOUT2(clkout[2]),
        //.CLKOUT3(clkout[3]),
        .CLKOUT4(clkout[4]),
        .CLKOUT5(clkout[5]),
        .CLKOUT6(clkout[6]),
        .LOCKED()
    );

    assign clkout[0] = pll_clk;

    reg [24:0] r_count = 0;

    always @(posedge(pll_clk)) r_count <= r_count + 1;

    assign led = r_count[24];
endmodule
