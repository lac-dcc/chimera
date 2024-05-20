// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   // do not allow undeclared wires

module iddr (
    input  wire clk_p,
    input  wire clk_n,
    output wire led,
    output wire locked_led,
    input  wire [1:0] button,
    input  wire ddr_in0,
    input  wire ddr_in1,
    output wire clkout0, // externally connected to: ddr_in0
    output wire clkout1, // externally connected to: ddr_in1
    output wire ddr0_q0,
    output wire ddr0_q1,
    output wire ddr1_q0,
    output wire ddr1_q1
    );

    wire clk_ibufg;
    wire clk_in;
    wire clk;
    wire clkx2;
    wire clkx3_2;

    IBUFDS ibuf_inst (.I(clk_p), .IB(clk_n), .O(clk_ibufg));
    BUFG   bufg_inst (.I(clk_ibufg), .O(clk_in));

    wire clk_fb;
    wire locked;

    PLLE2_ADV #(
      .CLKFBOUT_MULT(6),
      .CLKIN1_PERIOD(5.0),
      .CLKOUT0_DIVIDE(48),
      .CLKOUT0_PHASE(0),
      .CLKOUT1_DIVIDE(96),
      .CLKOUT1_PHASE(0),
      .CLKOUT2_DIVIDE(32),
      .CLKOUT2_PHASE(0),
      .DIVCLK_DIVIDE(1),
      .REF_JITTER1(0.01),
      .STARTUP_WAIT("FALSE")
    ) PLLE2_ADV (
      .CLKFBIN(clk_fb),
      .CLKIN1(clk_in),
      .PWRDWN(1'b0),
      .RST(1'b0),
      .CLKFBOUT(clk_fb),
      .CLKOUT0(clkx2),
      .CLKOUT1(clk),
      .CLKOUT2(clkx3_2),
      .LOCKED(locked)
    );

    IDDR #(
      .DDR_CLK_EDGE("OPPOSITE_EDGE"),
      .INIT_Q1(1'b1),
      .INIT_Q2(1'b1),
      .SRTYPE("SYNC")
    ) iddr_instance0 (
      .C(clkx2),
      .CE(button[0]),
      .D(ddr_in0),
      .Q1(ddr0_q0),
      .Q2(ddr0_q1),
      .R(~button[1])
    );

    IDDR #(
      .DDR_CLK_EDGE("SAME_EDGE"),
      .INIT_Q1(1'b0),
      .INIT_Q2(1'b0),
      .SRTYPE("ASYNC")
    ) iddr_instance1 (
      .C(clkx2),
      .CE(button[0]),
      .D(ddr_in1),
      .Q1(ddr1_q0),
      .Q2(ddr1_q1),
      .S(~button[1])
    );

    assign locked_led = button[0];
    assign led = button[1];
    assign clkout0 = clkx3_2;
    assign clkout1 = clkx3_2;
endmodule
