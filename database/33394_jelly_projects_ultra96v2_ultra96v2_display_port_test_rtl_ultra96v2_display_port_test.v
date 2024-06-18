// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  Ultra96V2 udmabuf test
//
//                                 Copyright (C) 2008-2020 by Ryuji Fuchikami
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none

module ultra96v2_display_port_test
            (
                output  wire    [1:0]   led
            );
    
    
    
    // -----------------------------
    //  ZynqMP PS
    // -----------------------------
    
    wire        dp_video_ref_clk_0;
    wire        dp_external_custom_event1_0;
    wire        dp_external_custom_event2_0;
    wire        dp_external_vsync_event_0;
    wire [7:0]  dp_live_gfx_alpha_in_0;
    wire [35:0] dp_live_gfx_pixel1_in_0;
    wire        dp_live_video_de_out_0;
    wire        dp_live_video_in_de_0;
    wire        dp_live_video_in_hsync_0;
    wire [35:0] dp_live_video_in_pixel1_0;
    wire        dp_live_video_in_vsync_0;
    wire        dp_video_in_clk_0;
    wire        dp_video_out_hsync_0;
    wire [35:0] dp_video_out_pixel1_0;
    wire        dp_video_out_vsync_0;
    wire        pl_clk0_0;
    
    design_1
        i_design_1_i
            (
                .dp_video_ref_clk_0             (dp_video_ref_clk_0),
                .dp_external_custom_event1_0    (dp_external_custom_event1_0),
                .dp_external_custom_event2_0    (dp_external_custom_event2_0),
                .dp_external_vsync_event_0      (dp_external_vsync_event_0),
                .dp_live_gfx_alpha_in_0         (dp_live_gfx_alpha_in_0),
                .dp_live_gfx_pixel1_in_0        (dp_live_gfx_pixel1_in_0),
                .dp_live_video_de_out_0         (dp_live_video_de_out_0),
                .dp_live_video_in_de_0          (dp_live_video_in_de_0),
                .dp_live_video_in_hsync_0       (dp_live_video_in_hsync_0),
                .dp_live_video_in_pixel1_0      (dp_live_video_in_pixel1_0),
                .dp_live_video_in_vsync_0       (dp_live_video_in_vsync_0),
                .dp_video_in_clk_0              (dp_video_in_clk_0),
                .dp_video_out_hsync_0           (dp_video_out_hsync_0),
                .dp_video_out_pixel1_0          (dp_video_out_pixel1_0),
                .dp_video_out_vsync_0           (dp_video_out_vsync_0),
                .pl_clk0_0                      ()// (pl_clk0_0)
            );
    
    assign pl_clk0_0 = dp_video_ref_clk_0;
    
    
    // ----------------------------------------
    //  VOUT
    // ----------------------------------------
    
    jelly_vsync_generator_core
            #(
                .V_COUNTER_WIDTH    (16),
                .H_COUNTER_WIDTH    (16)
            )
        i_vsync_generator_core
            (
                .reset              (1'b0),
                .clk                (pl_clk0_0),
                
                .ctl_enable         (1'b1),
                .ctl_busy           (),
                
                .param_htotal       (2200),
                .param_hdisp_start  (0),
                .param_hdisp_end    (1920),
                .param_hsync_start  (2008),
                .param_hsync_end    (2052),
                .param_hsync_pol    (1),
                .param_vtotal       (1125),
                .param_vdisp_start  (0),
                .param_vdisp_end    (1080),
                .param_vsync_start  (1084),
                .param_vsync_end    (1089),
                .param_vsync_pol    (1),
                
                .out_vsync          (dp_live_video_in_vsync_0),
                .out_hsync          (dp_live_video_in_hsync_0),
                .out_de             (dp_live_video_in_de_0)
            );
    
    (* mark_debug="true" *) reg                 reg_d = 0;
    (* mark_debug="true" *) reg                 reg_h = 0;
    (* mark_debug="true" *) reg     [13:0]      reg_x = 0;
    (* mark_debug="true" *) reg     [13:0]      reg_y = 0;
    
    /*
    always @(posedge pl_clk0_0) begin
        reg_h <= dp_live_video_in_vsync_0;
        
        if ( dp_live_video_in_hsync_0 ) begin
            reg_d <= 0;
            reg_x <= 0;
        end
        else if ( dp_live_video_in_de_0 ) begin
            reg_d <= 1;
            reg_x <= reg_x + 1;
        end
        
        if ( dp_live_video_in_vsync_0 ) begin
            reg_y <= 0;
        end
        else if ( reg_d && {reg_h, dp_live_video_in_hsync_0} == 2'b01 ) begin
            reg_y <= reg_y + 1;
        end
    end
    assign dp_video_in_clk_0 = pl_clk0_0;
    */
    
    
    always @(posedge dp_video_ref_clk_0) begin
        reg_h <= dp_video_out_hsync_0;
        
        if ( dp_video_out_hsync_0 ) begin
            reg_d <= 0;
            reg_x <= 0;
        end
        else if ( dp_live_video_de_out_0 || 1 ) begin
            reg_d <= 1;
            reg_x <= reg_x + 1;
        end
        
        if ( dp_video_out_vsync_0 ) begin
            reg_y <= 0;
        end
        else if ( reg_d && {reg_h, dp_video_out_hsync_0} == 2'b01 ) begin
            reg_y <= reg_y + 1;
        end
    end
    assign dp_video_in_clk_0         = dp_video_ref_clk_0; //pl_clk0_0;
    
    
    
    reg     [35:0]  tmp_pixel;
    always @* begin
        if ( reg_x == reg_y ) begin
            tmp_pixel = {12'hfff, 12'hfff, 12'hfff};
        end
        else begin
            if ( reg_x < 512 ) begin
                tmp_pixel[0*12 +: 12] = 12'h000;
                tmp_pixel[1*12 +: 12] = 12'h000;
                tmp_pixel[2*12 +: 12] = 12'h000;
            end
            else if ( reg_x < 1024 ) begin
                tmp_pixel[0*12 +: 12] = 12'hfff;
                tmp_pixel[1*12 +: 12] = 12'h000;
                tmp_pixel[2*12 +: 12] = 12'h000;
            end
            else if ( reg_x < 1024+512 ) begin
                tmp_pixel[0*12 +: 12] = 12'h000;
                tmp_pixel[1*12 +: 12] = 12'hfff;
                tmp_pixel[2*12 +: 12] = 12'h000;
            end
            else begin
                tmp_pixel[0*12 +: 12] = 12'h000;
                tmp_pixel[1*12 +: 12] = 12'h000;
                tmp_pixel[2*12 +: 12] = 12'hfff;
            end
            
            if ( reg_y >= 512 ) begin
                tmp_pixel = ~tmp_pixel;
            end
        end
    end
    assign dp_live_video_in_pixel1_0 = tmp_pixel;
    
    
    assign dp_live_gfx_alpha_in_0  = 8'h7f;
    assign dp_live_gfx_pixel1_in_0 = ~tmp_pixel;
    
    
    
//  assign dp_live_video_in_pixel1_0 = {12'hfff, 12'h000, 12'h000};
//  assign dp_live_video_in_pixel1_0 = {12'hfff, 12'h555, 12'hfff};

//    assign dp_live_video_in_pixel1_0[0*12 +: 12] = (reg_x >  512 && reg_x < 1920) ? 12'hfff : 0;
//    assign dp_live_video_in_pixel1_0[1*12 +: 12] = (reg_x > 1024 && reg_x < 1920) ? 12'hfff : 0;
//    assign dp_live_video_in_pixel1_0[2*12 +: 12] = (reg_y >  512 && reg_y < 1080) ? 12'hfff : 0;
    
    
    
    /*
    wire                        vout_vsgen_vsync;
    wire                        vout_vsgen_hsync;
    wire                        vout_vsgen_de;
    
    wire    [WB_DAT_WIDTH-1:0]  wb_vsgen_dat_o;
    wire                        wb_vsgen_stb_i;
    wire                        wb_vsgen_ack_o;
    
    jelly_vsync_generator
            #(
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .INIT_CTL_CONTROL       (1'b0),
                
                .INIT_HTOTAL            (2200),
                .INIT_HDISP_START       (0),
                .INIT_HDISP_END         (1920),
                .INIT_HSYNC_START       (2008),
                .INIT_HSYNC_END         (2052),
                .INIT_HSYNC_POL         (1),
                .INIT_VTOTAL            (1125),
                .INIT_VDISP_START       (0),
                .INIT_VDISP_END         (1080),
                .INIT_VSYNC_START       (1084),
                .INIT_VSYNC_END         (1089),
                .INIT_VSYNC_POL         (1)
            )
        i_vsync_generator
            (
                .reset                  (vout_reset),
                .clk                    (vout_clk),
                
                .out_vsync              (vout_vsgen_vsync),
                .out_hsync              (vout_vsgen_hsync),
                .out_de                 (vout_vsgen_de),
                
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_o             (wb_vsgen_dat_o),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_vsgen_stb_i),
                .s_wb_ack_o             (wb_vsgen_ack_o)
            );
    */
    
    
    reg     [31:0]      reg_counter;
    always @(posedge pl_clk0_0) begin
        reg_counter <= reg_counter + 1;
    end
    
    reg     [31:0]      reg_counter_ref;
    always @(posedge dp_video_ref_clk_0) begin
        reg_counter_ref <= reg_counter_ref + 1;
    end
    
    assign led[0] = reg_counter[26];
    assign led[1] = reg_counter_ref[26];
    
    (* mark_debug="true" *) reg         dbg_dp_live_video_in_de_0;
    (* mark_debug="true" *) reg         dbg_dp_live_video_in_hsync_0;
    (* mark_debug="true" *) reg  [35:0] dbg_dp_live_video_in_pixel1_0;
    (* mark_debug="true" *) reg         dbg_dp_live_video_in_vsync_0;
    
    (* mark_debug="true" *) reg         dbg_dp_live_video_de_out_0;
    (* mark_debug="true" *) reg         dbg_dp_video_out_hsync_0;
    (* mark_debug="true" *) reg [35:0]  dbg_dp_video_out_pixel1_0;
    (* mark_debug="true" *) reg         dbg_dp_video_out_vsync_0;
    
    always @(posedge dp_video_ref_clk_0) begin
        dbg_dp_live_video_in_de_0      <= dp_live_video_in_de_0    ;
        dbg_dp_live_video_in_hsync_0   <= dp_live_video_in_hsync_0 ;
        dbg_dp_live_video_in_pixel1_0  <= dp_live_video_in_pixel1_0;
        dbg_dp_live_video_in_vsync_0   <= dp_live_video_in_vsync_0 ;
        
        dbg_dp_live_video_de_out_0     <= dp_live_video_de_out_0;
        dbg_dp_video_out_hsync_0       <= dp_video_out_hsync_0;
        dbg_dp_video_out_pixel1_0      <= dp_video_out_pixel1_0;
        dbg_dp_video_out_vsync_0       <= dp_video_out_vsync_0;
    end
    
    
    
    
//    wire        dp_video_ref_clk_0;
//    wire        dp_video_in_clk_0;
//    wire        pl_clk0_0;

    (* mark_debug="true" *) reg         mon_dp_live_video_in_de_0;
    (* mark_debug="true" *) reg         mon_dp_live_video_in_hsync_0;
    (* mark_debug="true" *) reg  [35:0] mon_dp_live_video_in_pixel1_0;
    (* mark_debug="true" *) reg         mon_dp_live_video_in_vsync_0;
    
    (* mark_debug="true" *) reg         mon_dp_live_video_de_out_0;
    (* mark_debug="true" *) reg         mon_dp_video_out_hsync_0;
    (* mark_debug="true" *) reg  [35:0] mon_dp_video_out_pixel1_0;
    (* mark_debug="true" *) reg         mon_dp_video_out_vsync_0;
    always @(posedge pl_clk0_0) begin
        mon_dp_live_video_in_de_0      <= dp_live_video_in_de_0    ;
        mon_dp_live_video_in_hsync_0   <= dp_live_video_in_hsync_0 ;
        mon_dp_live_video_in_pixel1_0  <= dp_live_video_in_pixel1_0;
        mon_dp_live_video_in_vsync_0   <= dp_live_video_in_vsync_0 ;
        
        mon_dp_live_video_de_out_0     <= dp_live_video_de_out_0   ;
        mon_dp_video_out_hsync_0       <= dp_video_out_hsync_0     ;
        mon_dp_video_out_pixel1_0      <= dp_video_out_pixel1_0    ;
        mon_dp_video_out_vsync_0       <= dp_video_out_vsync_0     ;
    end
    
    
    
    
    
    
    
    
endmodule



`default_nettype wire


// end of file
