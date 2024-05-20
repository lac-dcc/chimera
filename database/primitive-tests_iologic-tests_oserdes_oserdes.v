// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module oserdes (
    input  wire clk_p,
    input  wire clk_n,
    output wire led,
    output wire locked_led,
    input  wire button,
    output wire button_led,
    output wire diff_led_p,
    output wire diff_led_n,
    output wire serdes_out
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
      .CLKFBOUT_MULT(1'd1),
      .CLKIN1_PERIOD(5.0),
      .CLKOUT0_DIVIDE(5'd8),
      .CLKOUT0_PHASE(1'd0),
      .CLKOUT1_DIVIDE(7'd32),
      .CLKOUT1_PHASE(1'd0),
      .DIVCLK_DIVIDE(1'd1),
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

    // With DDR enabled this should give an output rate of 50MHz
    OSERDESE2 #(
      .DATA_RATE_OQ("DDR"),
      .DATA_RATE_TQ("BUF"),
      .DATA_WIDTH(4'd8),
      .SERDES_MODE("MASTER"),
      .TRISTATE_WIDTH(1'd1)
    ) OSERDESE2_1 (
      .CLK(clkx4), // 200MHz / 8 = 25MHz
      .CLKDIV(clk),// 25MHz / 4 = 6.25MHz
      .D1(1'b1),
      .D2(1'b1),
      .D3(1'b0),
      .D4(1'b0),
      .D5(1'b1),
      .D6(1'b0),
      .D7(1'b1),
      .D8(1'b0),
      .OCE(1'd1),
      .RST(1'b0),
      .OQ(serdes_out)
    );

    reg [26:0] r_count = 0;

    always @(posedge(clk)) begin
        r_count <= r_count + 1;
    end

    assign led = r_count[22];
    assign locked_led = ~locked;
    assign button_led = button;

    OBUFDS obuf_inst (.I(led), .O(diff_led_p), .OB(diff_led_n));
endmodule
