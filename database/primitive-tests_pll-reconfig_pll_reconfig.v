// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module pll_reconfig (
    input  wire       clk,
    input  wire       key,
    output wire [4:0] led,
    output wire       clkout
    );

    wire pll_feedback;
    wire pll_clk;
    wire pll2_clk;
    wire locked;

    PLLE2_ADV #(
        .CLKFBOUT_MULT(8'd20),
        .CLKIN1_PERIOD(20.0),
        .CLKOUT0_DIVIDE(8'd20),
        .CLKOUT0_PHASE(1'd0),
        .DIVCLK_DIVIDE(1'd1),
        .REF_JITTER1(0.01),
        .STARTUP_WAIT("FALSE")
    ) pll_inst (
        .CLKFBIN(pll_feedback),
        .CLKIN1(clk),
        .PWRDWN(1'b0),
        .RST(1'b0),
        .CLKFBOUT(pll_feedback),
        .CLKOUT0(pll_clk),
        .LOCKED(locked)
    );


    // reconfiguration bus
    wire        dclk;
    wire [15:0] din;
    wire [6:0]  daddr;
    wire [15:0] dout;
    wire        den;
    wire        dwe;
    wire        rst_pll;
    wire        drdy;

    assign dclk = pll_clk;

    wire pll2_feedback;
    wire pll2_locked;
    PLLE2_ADV #(
       .BANDWIDTH("OPTIMIZED"),
       .CLKFBOUT_MULT(20),
       .CLKIN1_PERIOD(20.0),
       .CLKOUT0_DIVIDE(20),
       .CLKOUT0_PHASE(1'd0),
       .DIVCLK_DIVIDE(1'd1),
       .REF_JITTER1(0.01)
    ) pll2_inst (
       .CLKFBIN   (pll2_feedback),
       .CLKIN1    (pll_clk),
       .RST       (rst_pll),
       .CLKFBOUT  (pll2_feedback),
       .CLKOUT0   (clkout),
       .DO        (dout),
       .DRDY      (drdy),
       .DADDR     (daddr),
       .DCLK      (dclk),
       .DEN       (den),
       .DI        (din),
       .DWE       (dwe),
       .LOCKED    (pll2_locked)
    );

    wire reconfig_ready;
    wire reconfig_done;
    reg  start_reconfig;
    reg  [5:0] half_period;
    wire [3:0] pll2_debug;

    xilinx7_pll_reconfig reconfig (
        .rst(~locked),
        .locked(pll2_locked),

        // CLKOUT0
        .CLKOUT0_HIGH_TIME  (half_period),
        .CLKOUT0_LOW_TIME   (half_period),
        .CLKOUT0_PHASE_MUX  (3'd0),
        .CLKOUT0_EDGE       (1'b0),
        .CLKOUT0_NO_COUNT   (1'b0),
        .CLKOUT0_DELAY_TIME (6'd0),

        .CLKOUT1_NO_COUNT   (1'b1),
        .CLKOUT2_NO_COUNT   (1'b1),
        .CLKOUT3_NO_COUNT   (1'b1),
        .CLKOUT4_NO_COUNT   (1'b1),
        .CLKOUT5_NO_COUNT   (1'b1),

        // CLKFBOUT
        .CLKFBOUT_HIGH_TIME  (6'd10),
        .CLKFBOUT_LOW_TIME   (6'd10),
        .CLKFBOUT_PHASE_MUX  (3'd0),
        .CLKFBOUT_EDGE       (1'b0),
        .CLKFBOUT_NO_COUNT   (1'b0),
        .CLKFBOUT_DELAY_TIME (6'b0),

        // DIVCLK
        .DIVCLK_HIGH_TIME (6'b1),
        .DIVCLK_LOW_TIME  (6'b1),
        .DIVCLK_EDGE      (1'b0),
        .DIVCLK_NO_COUNT  (1'b1),

        // reconfiguration bus
        .dclk(dclk),
        .din(din),
        .daddr(daddr),
        .dout(dout),
        .den(den),
        .dwe(dwe),
        .rst_pll(rst_pll | ~key),
        .drdy(drdy),

        // activation
        .ready(reconfig_ready),
        .start_reconfig(start_reconfig),
        .reconfig_done(reconfig_done)
    );

    assign clkout = pll2_clk;
    reg [25:0] count   = 0;
    reg [24:0] r_count = 0;

    always @(posedge(pll_clk)) begin
        count <= count + 1;

        if (~locked) half_period <= 6'd10;
        else if (reconfig_ready & (count == 25'hffffff)) begin
            half_period <= half_period + 1;
        end

        start_reconfig <= reconfig_ready & (count == 26'h2000000);
    end

    assign led[1] = ~r_count[24];
    assign led[2] = ~start_reconfig;
    assign led[3] = ~rst_pll;
    assign led[4] = ~reconfig_ready;
    
    assign led[0] = ~count[25];

    always @(posedge(pll2_clk)) r_count <= r_count + 1;

endmodule
