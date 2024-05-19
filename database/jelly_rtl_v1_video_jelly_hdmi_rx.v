// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_hdmi_rx
        #(
            parameter   DVI_ONLYIN            = 1,
            parameter   IN_CLK_PERIOD         = 36.101,
            parameter   MMCM_MULT_F           = 40,
            parameter   MMCM_DIVIDE           = 1,
            parameter   DPA_TAP_DIFF          = 1,
            parameter   PHASE_ADJ_TH          = 8,
            parameter   BLITSLIP_PATTERN_TH   = 63,
            parameter   DPA_EYE_WIDTH_TH      = 5,
            parameter   HIGH_PERFORMANCE_MODE = "FALSE",
            parameter   PIN_SWAP              = 0,
            parameter   IDELAYCTRL_GROUP      = "IDELAYCTRL_HDMIRX",
            parameter   IOSTANDARD            = "TMDS_33"
        )
        (
            // input
            input   wire            in_reset,
            input   wire            in_clk_p,
            input   wire            in_clk_n,
            input   wire    [2:0]   in_data_p,
            input   wire    [2:0]   in_data_n,
            
            // output
            output  wire            out_clk,
            output  wire            out_reset,
            output  wire            out_vsync,
            output  wire            out_hsync,
            output  wire            out_de,
            output  wire    [23:0]  out_data,
            output  wire    [3:0]   out_ctl,
            output  wire            out_valid
        );
    
    
    
    // -----------------------------
    //  Clock
    // -----------------------------
    
    wire        in_clk;
    wire        serdes_data0;
    wire        serdes_data1;
    wire        serdes_data2;
    
    IBUFDS
            #(
                .IOSTANDARD (IOSTANDARD)
            )
        i_ibufds_clk
            (
                .I          (in_clk_p),
                .IB         (in_clk_n),
                .O          (in_clk)
            );
    
    
    wire        clkfb;
    wire        clk;
    wire        clk_x2;
    wire        clk_x10;
    
    wire        mmcm_clkfb;
    wire        mmcm_clk;
    wire        mmcm_clk_x2;
    wire        mmcm_clk_x10;
    
    wire        mmcm_locked;
    
    wire        mmcm_psen;
    wire        mmcm_psincdec;
    wire        mmcm_psdone;
    
    MMCME2_ADV
            #(
                .BANDWIDTH              ("OPTIMIZED"),
                .CLKOUT4_CASCADE        ("FALSE"),
                .COMPENSATION           ("ZHOLD"),
                .STARTUP_WAIT           ("FALSE"),
                .DIVCLK_DIVIDE          (MMCM_DIVIDE),
                .CLKFBOUT_MULT_F        (MMCM_MULT_F),
                .CLKFBOUT_PHASE         (0.000),
                .CLKFBOUT_USE_FINE_PS   ("TRUE"),
                .CLKOUT0_DIVIDE_F       (MMCM_MULT_F),
                .CLKOUT0_PHASE          (0.000),
                .CLKOUT0_DUTY_CYCLE     (0.500),
                .CLKOUT0_USE_FINE_PS    ("FALSE"),
                .CLKOUT1_DIVIDE         (MMCM_MULT_F/MMCM_DIVIDE/2),
                .CLKOUT1_PHASE          (0.000),
                .CLKOUT1_DUTY_CYCLE     (0.500),
                .CLKOUT1_USE_FINE_PS    ("FALSE"),
                .CLKOUT2_DIVIDE         (MMCM_MULT_F/MMCM_DIVIDE/10),
                .CLKOUT2_PHASE          (180.000),
                .CLKOUT2_DUTY_CYCLE     (0.500),
                .CLKOUT2_USE_FINE_PS    ("FALSE"),
                .CLKIN1_PERIOD          (IN_CLK_PERIOD),
                .REF_JITTER1            (0.010)
            )
        i_mmcm_adv_inst
            (
                .CLKFBOUT               (mmcm_clkfb),
                .CLKFBOUTB              (),
                .CLKOUT0                (mmcm_clk),
                .CLKOUT0B               (),
                .CLKOUT1                (mmcm_clk_x2),
                .CLKOUT1B               (),
                .CLKOUT2                (mmcm_clk_x10),
                .CLKOUT2B               (),
                .CLKOUT3                (),
                .CLKOUT3B               (),
                .CLKOUT4                (),
                .CLKOUT5                (),
                .CLKOUT6                (),
                .CLKFBIN                (clkfb),
                .CLKIN1                 (in_clk),
                .CLKIN2                 (1'b0),
                .CLKINSEL               (1'b1),
                .DADDR                  (7'h0),
                .DCLK                   (1'b0),
                .DEN                    (1'b0),
                .DI                     (16'h0),
                .DO                     (),
                .DRDY                   (),
                .DWE                    (1'b0),
                
                .PSCLK                  (clk),
                .PSEN                   (mmcm_psen),
                .PSINCDEC               (mmcm_psincdec),
                .PSDONE                 (mmcm_psdone),
                
                .LOCKED                 (mmcm_locked),
                .CLKINSTOPPED           (),
                .CLKFBSTOPPED           (),
                .PWRDWN                 (1'b0),
                .RST                    (in_reset)
            );
    
    BUFG    i_bufg_clkfb        (.I(mmcm_clkfb),   .O(clkfb));
    BUFG    i_bufg_clk          (.I(mmcm_clk),     .O(clk));
    BUFG    i_bufg_clk_x2       (.I(mmcm_clk_x2),  .O(clk_x2));
    BUFG    i_bufg_clk_x10      (.I(mmcm_clk_x10), .O(clk_x10));
    
    reg     reg_reset;
    reg     reg_reset_ff0;
    reg     reg_reset_ff1;
    wire    reset_async = (in_reset || !mmcm_locked);
    always @(posedge clk or posedge reset_async) begin
        if ( reset_async ) begin
            reg_reset_ff0 <= 1'b1;
            reg_reset_ff1 <= 1'b1;
            reg_reset     <= 1'b1;
        end
        else begin
            reg_reset_ff0 <= 1'b0;
            reg_reset_ff1 <= reg_reset_ff0;
            reg_reset     <= reg_reset_ff1;
        end
    end
    wire    reset = reg_reset;
    
    
    
    // -----------------------------
    //  Dynamic Phase Alignment
    // -----------------------------
    
    wire    [9:0]   dec_data0;
    wire    [9:0]   dec_data1;
    wire    [9:0]   dec_data2;
    
    reg             reg_dpa_start;
    wire            sig_dpa_busy1;
    wire            sig_dpa_busy2;
    
    reg             reg_bitslip_start;
    wire            sig_bitslip_busy0;
    wire            sig_bitslip_ready0;
    wire            sig_bitslip_busy1;
    wire            sig_bitslip_ready1;
    wire            sig_bitslip_busy2;
    wire            sig_bitslip_ready2;
                
    wire            sig_phase_valid0;
    wire            sig_phase_match0;
    wire            sig_phase_valid1;
    wire            sig_phase_match1;
    wire            sig_phase_valid2;
    wire            sig_phase_match2;
    
    wire            sig_psdone;
    
    reg     [3:0]   reg_psdone_dly;
    always @(posedge clk) begin
        reg_psdone_dly[0]   <= mmcm_psdone;
        reg_psdone_dly[3:1] <= reg_psdone_dly[2:0];
    end
    assign sig_psdone = reg_psdone_dly[3];
    
    
    // clock phase
    localparam  [2:0]   ST_START         = 0;
    localparam  [2:0]   ST_SETUP         = 1;
    localparam  [2:0]   ST_SEARCH        = 2;
    localparam  [2:0]   ST_MOVE          = 3;
    localparam  [2:0]   ST_PHASE_CALIB   = 4;
    localparam  [2:0]   ST_BITSLIP_CALIB = 5;
    localparam  [2:0]   ST_STANDBY       = 6;

    reg     [2:0]   reg_state;  
    reg             reg_psen;
    reg             reg_psincdec;
    reg     [15:0]  reg_pscounter;
    reg             reg_wait_psdone;

    always @(posedge clk) begin
        if ( reset ) begin
            reg_state           <= ST_START;
            
            reg_psen            <= 1'b0;
            reg_psincdec        <= 1'b0;
            reg_pscounter       <= 0;
            reg_wait_psdone     <= 1'b0;
            
            reg_dpa_start       <= 1'b0;
            reg_bitslip_start   <= 1'b0;
        end
        else begin
            reg_psen          <= 1'b0;
            reg_dpa_start     <= 1'b0;
            reg_bitslip_start <= 1'b0;
            
            // ps flags
            if ( sig_psdone ) begin
                reg_wait_psdone <= 1'b0;
            end
            else if ( reg_psen ) begin
                reg_wait_psdone <= 1'b1;
            end
                        
            case ( reg_state )
            ST_START:
                begin
                    // キャリブレーション開始
                    reg_state       <= ST_SETUP;
                    reg_psen        <= 1'b1;
                    reg_wait_psdone <= 1'b1;
                    reg_psincdec    <= 1'b0;
                    reg_pscounter   <= 0;
                end
                
            ST_SETUP:
                begin
                    // セットアップ(EYEの中にいたら一旦変化点まで移動)
                    if ( !reg_wait_psdone && sig_phase_valid0 ) begin
                        reg_psen        <= 1'b1;
                        reg_wait_psdone <= 1'b1;
                        if ( !sig_phase_match0 ) begin
                            reg_state    <= ST_SEARCH;
                            reg_psincdec <= 1'b1;
                        end
                    end
                end
            
            ST_SEARCH:
                begin
                    // EYEの範囲を探す(PHASE_ADJ_TH 以上の幅で取れる場所を探す)
                    if ( !reg_wait_psdone && sig_phase_valid0 ) begin
                        reg_psen        <= 1'b1;
                        reg_wait_psdone <= 1'b1;
                        if ( sig_phase_match0 ) begin
                            reg_pscounter <= reg_pscounter + 1'b1;
                        end
                        else begin
                            if ( reg_pscounter >= PHASE_ADJ_TH ) begin
                                // 十分な幅のEYEを発見
                                reg_state     <= ST_MOVE;
                                reg_psincdec  <= 1'b0;
                                reg_pscounter <= (reg_pscounter >> 1);
                            end
                            else begin
                                // 探索継続
                                reg_pscounter <= 0;
                            end
                        end
                    end
                end
                
            ST_MOVE:
                begin
                    // EYE の中央に移動
                    if ( !reg_wait_psdone ) begin
                        reg_pscounter <= reg_pscounter - 1'b1;
                        if ( reg_pscounter == 0 ) begin
                            reg_state     <= ST_PHASE_CALIB;
                            reg_dpa_start <= 1'b1;
                        end
                        else begin
                            reg_psen        <= 1'b1;
                            reg_wait_psdone <= 1'b1;
                        end
                    end
                end
                
            ST_PHASE_CALIB:
                begin
                    // 他のデータ線の移相調整
                    if ( !reg_dpa_start && !sig_dpa_busy1 && !sig_dpa_busy2 ) begin
                        reg_state         <= ST_BITSLIP_CALIB;
                        reg_bitslip_start <= 1'b1;
                    end
                end
            
            ST_BITSLIP_CALIB:
                begin
                    // BITSLIP調整
                    if ( !reg_bitslip_start && !sig_bitslip_busy0 && !sig_bitslip_busy1 && !sig_bitslip_busy2 ) begin
                        if ( sig_bitslip_ready0 && sig_bitslip_ready1 && sig_bitslip_ready2 ) begin
                            reg_state <= ST_STANDBY;
                        end
                        else begin
                            reg_state <= ST_START;
                        end
                    end
                end
                
            ST_STANDBY:
                begin
                    if ( !(sig_bitslip_ready0 && sig_bitslip_ready1 && sig_bitslip_ready2) ) begin
                        reg_state <= ST_START;
                    end
                end
            
            default:
                begin
                    reg_state <= ST_START;
                end
            endcase
        end
    end
    
    assign mmcm_psen     = reg_psen;
    assign mmcm_psincdec = reg_psincdec;
    
    
    
    // -----------------------------
    //  serdes
    // -----------------------------
    
    jelly_hdmi_rx_dpa
            #(
                .BLITSLIP_PATTERN_TH    (BLITSLIP_PATTERN_TH),
                .DPA_EYE_WIDTH_TH       (DPA_EYE_WIDTH_TH),
                .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
                .PIN_SWAP               (PIN_SWAP),
                .IDELAY_VALUE_MASTE     (15),
                .IDELAY_VALUE_SLAVE     (15 + DPA_TAP_DIFF),
                .IDELAYCTRL_GROUP       (IDELAYCTRL_GROUP),
                .IOSTANDARD             (IOSTANDARD)
            )
        i_hdmi_rx_dpa_0
            (
                .reset                  (reset),
                .clk                    (clk),
                .clk_x2                 (clk_x2),
                .clk_x10                (clk_x10),
                
                .dpa_start              (1'b0),
                .dpa_busy               (),
                
                .bitslip_start          (reg_bitslip_start),
                .bitslip_busy           (sig_bitslip_busy0),
                .bitslip_ready          (sig_bitslip_ready0),
                
                .phase_valid            (sig_phase_valid0),
                .phase_match            (sig_phase_match0),
                
                .in_d_p                 (in_data_p[0]),
                .in_d_n                 (in_data_n[0]),
                
                .out_d                  (),
                .out_data               (dec_data0)
            );
        
        
    jelly_hdmi_rx_dpa
            #(
                .BLITSLIP_PATTERN_TH    (BLITSLIP_PATTERN_TH),
                .DPA_EYE_WIDTH_TH       (DPA_EYE_WIDTH_TH),
                .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
                .PIN_SWAP               (PIN_SWAP),
                .IDELAY_VALUE_MASTE     (0),
                .IDELAY_VALUE_SLAVE     (0 + DPA_TAP_DIFF),
                .IDELAYCTRL_GROUP       (IDELAYCTRL_GROUP),
                .IOSTANDARD             (IOSTANDARD)
            )
        i_hdmi_rx_dpa_1
            (
                .reset                  (reset),
                .clk                    (clk),
                .clk_x2                 (clk_x2),
                .clk_x10                (clk_x10),
                
                .dpa_start              (reg_dpa_start),
                .dpa_busy               (sig_dpa_busy1),
                
                .bitslip_start          (reg_bitslip_start),
                .bitslip_busy           (sig_bitslip_busy1),
                .bitslip_ready          (sig_bitslip_ready1),
                
                .phase_valid            (sig_phase_valid1),
                .phase_match            (sig_phase_match1),
                
                .in_d_p                 (in_data_p[1]),
                .in_d_n                 (in_data_n[1]),
                
                .out_d                  (),
                .out_data               (dec_data1)
            );

    jelly_hdmi_rx_dpa
            #(
                .BLITSLIP_PATTERN_TH    (BLITSLIP_PATTERN_TH),
                .DPA_EYE_WIDTH_TH       (DPA_EYE_WIDTH_TH),
                .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
                .PIN_SWAP               (PIN_SWAP),
                .IDELAY_VALUE_MASTE     (0),
                .IDELAY_VALUE_SLAVE     (0 + DPA_TAP_DIFF),
                .IDELAYCTRL_GROUP       (IDELAYCTRL_GROUP),
                .IOSTANDARD             (IOSTANDARD)
            )
        i_hdmi_rx_dpa_2
            (
                .reset                  (reset),
                .clk                    (clk),
                .clk_x2                 (clk_x2),
                .clk_x10                (clk_x10),
                
                .dpa_start              (reg_dpa_start),
                .dpa_busy               (sig_dpa_busy2),
                
                .bitslip_start          (reg_bitslip_start),
                .bitslip_busy           (sig_bitslip_busy2),
                .bitslip_ready          (sig_bitslip_ready2),
                
                .phase_valid            (sig_phase_valid2),
                .phase_match            (sig_phase_match2),
                
                .in_d_p                 (in_data_p[2]),
                .in_d_n                 (in_data_n[2]),
                
                .out_d                  (),
                .out_data               (dec_data2)
            );
    
    
    
    // -----------------------------
    //  decode
    // -----------------------------
    
    jelly_hdmi_rx_decode
            #(
                .DVI_ONLYIN             (DVI_ONLYIN)
            )
        i_hdmi_rx_decode_0
            (
                .reset                  (reset),
                .clk                    (clk),
                                
                .in_d                   (dec_data0),
                
                .out_de                 (out_de),
                .out_d                  (out_data[23:16]),
                .out_c0                 (out_hsync),
                .out_c1                 (out_vsync)
            );
    
    jelly_hdmi_rx_decode
            #(
                .DVI_ONLYIN (DVI_ONLYIN)
            )
        i_hdmi_rx_decode_1
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .in_d                   (dec_data1),
                
                .out_de                 (),
                .out_d                  (out_data[15:8]),
                .out_c0                 (out_ctl[0]),
                .out_c1                 (out_ctl[1])
            );
    
    jelly_hdmi_rx_decode
            #(
                .DVI_ONLYIN (DVI_ONLYIN)
            )
        i_hdmi_rx_decode_2
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .in_d                   (dec_data2),
                
                .out_de                 (),
                .out_d                  (out_data[7:0]),
                .out_c0                 (out_ctl[2]),
                .out_c1                 (out_ctl[3])
            );
    
    assign out_clk   = clk;
    assign out_reset = reset;
    assign out_valid = (reg_state == ST_STANDBY);
    
    
endmodule


`default_nettype wire


// end of file
