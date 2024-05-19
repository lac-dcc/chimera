// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

`timescale 1ps/1ps
(* CORE_GENERATION_INFO = "pll,clk_wiz_v3_6,{component_name=pll,use_phase_alignment=true,use_min_o_jitter=true,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,feedback_source=FDBK_AUTO,primtype_sel=PLL_BASE,num_out_clk=1,clkin1_period=10.0,clkin2_period=10.0,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,use_status=false,use_freeze=false,use_clk_valid=false,feedback_type=SINGLE,clock_mgr_type=AUTO,manual_override=false}" *)

module pll (
    input   clk_in,
    output  clk_out,

    input   reset,
    output  locked
    );

    IBUFG clkin1_buf (
        .O (clkin1),
        .I (clk_in)
    );

    wire [15:0] do_unused;
    wire        drdy_unused;
    wire        clkfbout;
    wire        clkfbout_buf;
    wire        clkout1_unused;
    wire        clkout2_unused;
    wire        clkout3_unused;
    wire        clkout4_unused;
    wire        clkout5_unused;

    PLL_BASE # (
        .BANDWIDTH              ("HIGH"),
        .CLK_FEEDBACK           ("CLKFBOUT"),
        .COMPENSATION           ("SYSTEM_SYNCHRONOUS"),
        .DIVCLK_DIVIDE          (1),
        .CLKFBOUT_MULT          (10),
        .CLKFBOUT_PHASE         (0.000),
        .CLKOUT0_DIVIDE         (8),
        .CLKOUT0_PHASE          (0.000),
        .CLKOUT0_DUTY_CYCLE     (0.500),
        .CLKIN_PERIOD           (10.0),
        .REF_JITTER             (0.010)
    )
    pll_base_inst (
        .CLKFBOUT               (clkfbout),
        .CLKOUT0                (clkout0),
        .CLKOUT1                (clkout1_unused),
        .CLKOUT2                (clkout2_unused),
        .CLKOUT3                (clkout3_unused),
        .CLKOUT4                (clkout4_unused),
        .CLKOUT5                (clkout5_unused),

        .LOCKED                 (locked),
        .RST                    (reset),

        .CLKFBIN                (clkfbout_buf),
        .CLKIN                  (clkin1)
    );

    BUFG clkf_buf (
        .O (clkfbout_buf),
        .I (clkfbout)
    );

    BUFG clkout1_buf (
        .O   (clk_out),
        .I   (clkout0)
    );
endmodule
