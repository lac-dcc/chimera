// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module mmcm_reconfig (
    input  wire       clk,
    input  wire       key,
    output wire [4:0] led,
    output wire       clkout
    );

    wire pll_feedback;
    wire pll_clk;
    wire mmcm_clk;
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
    wire        rst_mmcm;
    wire        drdy;

    assign dclk = pll_clk;

    wire mmcm_feedback;
    wire mmcm_locked;
    MMCME2_ADV #(
       .BANDWIDTH("OPTIMIZED"),
       .COMPENSATION("ZHOLD"),
       .CLKFBOUT_MULT_F(20.625),
       .CLKIN1_PERIOD(20.0),
       .CLKOUT0_DIVIDE_F(20.875),
       .CLKOUT0_PHASE(1'd0),
       .DIVCLK_DIVIDE(1'd1),
       .REF_JITTER1(0.01)
    ) mmcm_inst (
       .CLKFBIN   (mmcm_feedback),
       .CLKIN1    (pll_clk),
       .PSDONE    (),
       .PSCLK     (1'b0),
       .PSEN      (1'b0),
       .PSINCDEC  (1'b0),
       .PWRDWN    (1'b0),
       .RST       (rst_mmcm),
       .CLKFBOUT  (mmcm_feedback),
       .CLKOUT0   (clkout),
       .DO        (dout),
       .DRDY      (drdy),
       .DADDR     (daddr),
       .DCLK      (dclk),
       .DEN       (den),
       .DI        (din),
       .DWE       (dwe),
       .LOCKED    (mmcm_locked)
    );

    wire reconfig_ready;
    wire reconfig_done;
    reg  start_reconfig;
    reg  [6:0] multiplier;
    wire [3:0] mmcm_debug;
    reg  [2:0] frac;
    wire frac_low;
    assign frac_low = ~frac[2];

    xilinx7_mmcm_reconfig reconfig (
        .rst(~locked),
        .locked(mmcm_locked),

        // CLKOUT0
        .CLKOUT0_HIGH_TIME  (6'd10),
        .CLKOUT0_LOW_TIME   (6'd10),
        .CLKOUT0_PHASE_MUX  (3'd0),
        .CLKOUT0_FRAC       (3'd0),
        .CLKOUT0_FRAC_EN    (1'b0),
        .CLKOUT0_WF_R       (1'b0),
        .CLKOUT0_EDGE       (1'b0),
        .CLKOUT0_NO_COUNT   (1'b0),
        .CLKOUT0_DELAY_TIME (6'd0),

        .CLKOUT1_NO_COUNT   (1'b1),
        .CLKOUT2_NO_COUNT   (1'b1),
        .CLKOUT3_NO_COUNT   (1'b1),
        .CLKOUT4_NO_COUNT   (1'b1),
        .CLKOUT5_NO_COUNT   (1'b1),
        .CLKOUT6_NO_COUNT   (1'b1),

        // CLKFBOUT
        .CLKFBOUT_HIGH_TIME  (multiplier[6:1]),
        .CLKFBOUT_LOW_TIME   (multiplier[6:1] - 1 + multiplier[0]), // if FRAC_EN is high, the factor increases by one, so we have to subtract one here
        .CLKFBOUT_PHASE_MUX  (3'd0),
        .CLKFBOUT_FRAC       (frac),
        .CLKFBOUT_FRAC_EN    (1'b1),
        .CLKFBOUT_WF_R       (1'b0),
        .CLKFBOUT_WF_F       (frac_low), // this needs to be high for frac values of 0, 1, 2, 3
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
        .rst_mmcm(rst_mmcm),
        .drdy(drdy),

        // activation
        .ready(reconfig_ready),
        .start_reconfig(start_reconfig),
        .reconfig_done(reconfig_done)
    );

    assign clkout = mmcm_clk;
    reg [26:0] count   = 0;
    reg [24:0] r_count = 0;

    always @(posedge(pll_clk)) begin
        count <= count + 1;

        if (~locked) {multiplier, frac} <= {7'd20, 3'd0};
        else if (reconfig_ready & (count == 27'h3ffffff)) begin
            if (~key) begin
                if (frac == 3'b111) multiplier <= multiplier + 1;
                frac <= frac + 1;
            end
        end

        start_reconfig <= reconfig_ready & (count == 27'h4000000);
    end

    assign led[0] = ~count[25];
    assign led[1] = ~r_count[24];
    assign led[4:2] = ~frac;

    always @(posedge(mmcm_clk)) r_count <= r_count + 1;

endmodule
