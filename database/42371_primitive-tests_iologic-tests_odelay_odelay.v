// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module odelay (
    input  wire clk_p,
    input  wire clk_n,
    output wire led,
    output wire locked_led,
    input  wire button,
    output wire delay_out0,
    output wire delay_out1,
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

    IDELAYCTRL IDELAYCTRL(
      .REFCLK(clk_in),
      .RST(1'b0)
    );

    PLLE2_ADV #(
      .CLKFBOUT_MULT(4),
      .CLKIN1_PERIOD(5.0),
      .CLKOUT0_DIVIDE(32),
      .CLKOUT0_PHASE(0),
      .CLKOUT1_DIVIDE(128),
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

    wire delay_in;
    ODDR #(
      .DDR_CLK_EDGE("SAME_EDGE"),
      .INIT(1'b0),
      .SRTYPE("SYNC")
    ) odelay_instance1 (
      .C(clk),
      .CE(1'd1),
      .D1(1'd1),
      .D2(1'd0),
      .S(0),
      .Q(delay_in)
    );

    ODELAYE2 #(
      .CINVCTRL_SEL("FALSE"),
      .DELAY_SRC("ODATAIN"),
      .HIGH_PERFORMANCE_MODE("TRUE"),
      .ODELAY_TYPE("VARIABLE"),
      .ODELAY_VALUE(1'd0),
      .PIPE_SEL("FALSE"),
      .REFCLK_FREQUENCY(200.0),
      .SIGNAL_PATTERN("DATA")
    ) oddr_delay (
      .C(clkx4),
      .CE(~button),
      .INC(1'd1),
      .LD(1'd0),
      .LDPIPEEN(1'd0),
      .DATAOUT(delay_out0),
      .ODATAIN(delay_in)
    );

    ODELAYE2 #(
      .CINVCTRL_SEL("FALSE"),
      .DELAY_SRC("ODATAIN"),
      .HIGH_PERFORMANCE_MODE("TRUE"),
      .ODELAY_TYPE("VARIABLE"),
      .ODELAY_VALUE(1'd0),
      .PIPE_SEL("FALSE"),
      .REFCLK_FREQUENCY(200.0),
      .SIGNAL_PATTERN("DATA")
    ) delay (
      .C(clkx4),
      .CE(~button),
      .INC(1'd1),
      .LD(1'd0),
      .LDPIPEEN(1'd0),
      .DATAOUT(delay_out1),
      .ODATAIN(clk)
    );

    assign locked_led = ~locked;
    assign led = button;
    assign clkout0 = clk;
    assign clkout1 = clkx4;
endmodule
