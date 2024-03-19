`timescale 1ns / 1ps

module clk_for_spi (
    input clk_in1,
    output clk_out1,
    output clk_out2,
    input reset
    );
    
    wire clk_in1_mmcm, clkfbout_mmcm, clkfbout_buf_mmcm, clk_out1_mmcm, clk_out2_mmcm;

    IBUF clkin1_ibufg (
        .O(clk_in1_mmcm),
        .I(clk_in1)
    );

    BUFG clkf_buf (
        .O(clkfbout_buf_mmcm),
        .I(clkfbout_mmcm)
    );
    
    BUFG clkout1_buf (
        .O(clk_out1),
        .I(clk_out1_mmcm)
    );
    
    BUFG clkout2_buf (
        .O(clk_out2),
        .I(clk_out2_mmcm)
    );
   
    MMCME2_ADV #(
        .BANDWIDTH            ("OPTIMIZED"),
        .CLKOUT4_CASCADE      ("FALSE"),
        .COMPENSATION         ("ZHOLD"),
        .STARTUP_WAIT         ("FALSE"),
        .DIVCLK_DIVIDE        (1),
        .CLKFBOUT_MULT_F      (10.000),
        .CLKFBOUT_PHASE       (0.000),
        .CLKFBOUT_USE_FINE_PS ("FALSE"),
        .CLKOUT0_DIVIDE_F     (25.000),
        .CLKOUT0_PHASE        (0.000),
        .CLKOUT0_DUTY_CYCLE   (0.500),
        .CLKOUT0_USE_FINE_PS  ("FALSE"),
        .CLKIN1_PERIOD        (10.000)
    ) mmcm_adv_inst (
        .CLKFBOUT            (clkfbout_mmcm),
        .CLKFBOUTB           (),
        .CLKOUT0             (clk_out1_mmcm),
        .CLKOUT0B            (clk_out2_mmcm),
        .CLKOUT1             (),
        .CLKOUT1B            (),
        .CLKOUT2             (),
        .CLKOUT2B            (),
        .CLKOUT3             (),
        .CLKOUT3B            (),
        .CLKOUT4             (),
        .CLKOUT5             (),
        .CLKOUT6             (),
        .CLKFBIN             (clkfbout_buf_mmcm),
        .CLKIN1              (clk_in1_mmcm),
        .CLKIN2              (1'b0),
        .CLKINSEL            (1'b1),
        .DADDR               (7'h0),
        .DCLK                (1'b0),
        .DEN                 (1'b0),
        .DI                  (16'h0),
        .DO                  (),
        .DRDY                (),
        .DWE                 (1'b0),
        .PSCLK               (1'b0),
        .PSEN                (1'b0),
        .PSINCDEC            (1'b0),
        .PSDONE              (),
        .LOCKED              (),
        .CLKINSTOPPED        (),
        .CLKFBSTOPPED        (),
        .PWRDWN              (1'b0),
        .RST                 (reset)
    );

endmodule
