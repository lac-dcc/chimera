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
    wire mclk;
    wire mclkx4;

    IBUFDS ibuf_inst (.I(clk_p), .IB(clk_n), .O(clk_ibufg));
    BUFG   bufg_inst (.I(clk_ibufg), .O(clk_in));

    wire clk_fb;
    wire locked;

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
    
    wire mclk_fb;
    wire mlocked;

    MMCME2_ADV #(
      .CLKFBOUT_MULT_F(4),
      .CLKIN1_PERIOD(5.0),
      .CLKOUT0_DIVIDE_F(32),
      .CLKOUT0_PHASE(0),
      .CLKOUT1_DIVIDE(128),
      .CLKOUT1_PHASE(0),
      .DIVCLK_DIVIDE(1),
      .REF_JITTER1(0.01),
      .STARTUP_WAIT("FALSE")
    ) MMCME2_ADV (
      .CLKFBIN(mclk_fb),
      .CLKIN1(clk_in),
      .PWRDWN(1'b0),
      .RST(1'b0),
      .CLKFBOUT(mclk_fb),
      .CLKOUT0(mclkx4),
      .CLKOUT1(mclk),
      .LOCKED(mlocked)
    );

    assign locked_led = ~locked;
    assign led = button;
    assign clkout0 = clk;
    assign clkout1 = mclk;
endmodule
