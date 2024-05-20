// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module oddr (
    input  wire clk_p,
    input  wire clk_n,
    output wire led,
    output wire locked_led,
    input  wire button,
    output wire ddr_out0,
    output wire ddr_out1,
    output wire clkout0,
    output wire clkout1
    );

    wire clk_ibufg;
    wire clk_in;
    wire clk;
    wire clkx4;

    IBUFDS ibuf_inst (.I(clk_p), .IB(clk_n), .O(clk_ibufg));
    BUFG   bufg_inst (.I(clk_ibufg), .O(clk_in));

    wire clk_fb;
    wire locked;

    PLLE2_ADV #(
      .CLKFBOUT_MULT(1),
      .CLKIN1_PERIOD(5.0),
      .CLKOUT0_DIVIDE(8),
      .CLKOUT0_PHASE(0),
      .CLKOUT1_DIVIDE(32),
      .CLKOUT1_PHASE(0),
      .DIVCLK_DIVIDE(1),
      .REF_JITTER1(0.01),
      .STARTUP_WAIT("FALSE")
    ) PLLE2_ADV (
      .CLKFBIN(clk_fb),
      .CLKIN1(clk_in),
      .PWRDWN(1'b0),
      .RST(1'b0),
      .CLKFBOUT(clk_fb),
      .CLKOUT0(clkx4),
      .CLKOUT1(clk),
      .LOCKED(locked)
    );

    ODDR #(
      .DDR_CLK_EDGE("SAME_EDGE"),
      .INIT(1'b0),
      .SRTYPE("SYNC")
    ) oddr_instance0 (
      .C(clk),
      .CE(1'd1),
      .D1(1'd1),
      .D2(1'd0),
      .R(button),
      .Q(ddr_out0)
    );

    ODDR #(
      .DDR_CLK_EDGE("OPPOSITE_EDGE"),
      .INIT(1'b1),
      .SRTYPE("ASYNC")
    ) oddr_instance1 (
      .C(clkx4),
      .CE(1'd1),
      .D1(1'd1),
      .D2(1'd0),
      .S(button),
      .Q(ddr_out1)
    );

    assign locked_led = ~locked;
    assign led = button;
    assign clkout0 = clk;
    assign clkout1 = clkx4;
endmodule
