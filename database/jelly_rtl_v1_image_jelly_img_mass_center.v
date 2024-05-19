// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_mass_center
        #(
            parameter   CORE_ID                 = 32'h527a_0102,
            parameter   CORE_VERSION            = 32'h0001_0000,
            
            parameter   INDEX_WIDTH             = 1,
            
            parameter   WB_ADR_WIDTH            = 8,
            parameter   WB_DAT_WIDTH            = 32,
            parameter   WB_SEL_WIDTH            = (WB_DAT_WIDTH / 8),
            
            parameter   DATA_WIDTH              = 8,
            parameter   Q_WIDTH                 = 0,
            parameter   X_WIDTH                 = 14,
            parameter   Y_WIDTH                 = 14,
            parameter   OUT_X_WIDTH             = 14 + Q_WIDTH,
            parameter   OUT_Y_WIDTH             = 14 + Q_WIDTH,
            parameter   X_COUNT_WIDTH           = 32,
            parameter   Y_COUNT_WIDTH           = 32,
            parameter   N_COUNT_WIDTH           = 32,
            
            parameter   INIT_CTL_CONTROL        = 3'b011,
            parameter   INIT_PARAM_RANGE_LEFT   = 0,
            parameter   INIT_PARAM_RANGE_RIGHT  = {X_WIDTH{1'b1}},
            parameter   INIT_PARAM_RANGE_TOP    = 0,
            parameter   INIT_PARAM_RANGE_BOTTOM = {Y_WIDTH{1'b1}}
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o,
            
            input   wire                            s_img_line_first,
            input   wire                            s_img_line_last,
            input   wire                            s_img_pixel_first,
            input   wire                            s_img_pixel_last,
            input   wire                            s_img_de,
            input   wire    [DATA_WIDTH-1:0]        s_img_data,
            input   wire                            s_img_valid,
            
            output  wire    [X_WIDTH-1:0]           out_x,
            output  wire    [Y_WIDTH-1:0]           out_y,
            output  wire                            out_valid
        );
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID              = 8'h00;
    localparam  ADR_CORE_VERSION         = 8'h01;
    localparam  ADR_CTL_CONTROL          = 8'h04;
    localparam  ADR_CTL_STATUS           = 8'h05;
    localparam  ADR_CTL_INDEX            = 8'h07;
    localparam  ADR_PARAM_RANGE_LEFT     = 8'h08;
    localparam  ADR_PARAM_RANGE_RIGHT    = 8'h09;
    localparam  ADR_PARAM_RANGE_TOP      = 8'h0a;
    localparam  ADR_PARAM_RANGE_BOTTOM   = 8'h0b;
    localparam  ADR_CURRENT_RANGE_LEFT   = 8'h18;
    localparam  ADR_CURRENT_RANGE_RIGHT  = 8'h19;
    localparam  ADR_CURRENT_RANGE_TOP    = 8'h1a;
    localparam  ADR_CURRENT_RANGE_BOTTOM = 8'h1b;
    localparam  ADR_MONITOR_OUT_X        = 8'h20;
    localparam  ADR_MONITOR_OUT_Y        = 8'h20;
    
    // handshake
    wire    [INDEX_WIDTH-1:0]   update_index;
    wire                        update_ack;
    wire    [INDEX_WIDTH-1:0]   ctl_index;
    
    jelly_param_update_master
            #(
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_param_update_master
            (
                .reset          (s_wb_rst_i),
                .clk            (s_wb_clk_i),
                .cke            (1'b1),
                .in_index       (update_index),
                .out_ack        (update_ack),
                .out_index      (ctl_index)
            );
    
    // registers
    reg     [2:0]               reg_ctl_control;
    reg     [X_WIDTH-1:0]       reg_param_range_left;
    reg     [X_WIDTH-1:0]       reg_param_range_right;
    reg     [Y_WIDTH-1:0]       reg_param_range_top;
    reg     [Y_WIDTH-1:0]       reg_param_range_bottom;
    
    // core status
    wire    [X_WIDTH-1:0]       core_current_range_left;
    wire    [X_WIDTH-1:0]       core_current_range_right;
    wire    [Y_WIDTH-1:0]       core_current_range_top;
    wire    [Y_WIDTH-1:0]       core_current_range_bottom;
    
    function [WB_DAT_WIDTH-1:0] reg_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] wdat,
                                        input [WB_SEL_WIDTH-1:0] msk
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            reg_mask[i] = msk[i/8] ? wdat[i] : org[i];
        end
    end
    endfunction
    
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_control        <= INIT_CTL_CONTROL;
            reg_param_range_left   <= INIT_PARAM_RANGE_LEFT;
            reg_param_range_right  <= INIT_PARAM_RANGE_RIGHT;
            reg_param_range_top    <= INIT_PARAM_RANGE_TOP;
            reg_param_range_bottom <= INIT_PARAM_RANGE_BOTTOM;
        end
        else begin
            if ( update_ack && !reg_ctl_control[2] ) begin
                reg_ctl_control[1] <= 1'b0;     // auto clear
            end
            
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL:        reg_ctl_control        <= reg_mask(reg_ctl_control,        s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RANGE_LEFT:   reg_param_range_left   <= reg_mask(reg_param_range_left,   s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RANGE_RIGHT:  reg_param_range_right  <= reg_mask(reg_param_range_right,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RANGE_TOP:    reg_param_range_top    <= reg_mask(reg_param_range_top,    s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RANGE_BOTTOM: reg_param_range_bottom <= reg_mask(reg_param_range_bottom, s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)              ? CORE_ID                   :
                        (s_wb_adr_i == ADR_CORE_VERSION)         ? CORE_VERSION              :
                        (s_wb_adr_i == ADR_CTL_CONTROL)          ? reg_ctl_control           :
                        (s_wb_adr_i == ADR_CTL_STATUS)           ? 0                         :
                        (s_wb_adr_i == ADR_CTL_INDEX)            ? ctl_index                 :
                        (s_wb_adr_i == ADR_PARAM_RANGE_LEFT)     ? reg_param_range_left      :
                        (s_wb_adr_i == ADR_PARAM_RANGE_RIGHT)    ? reg_param_range_right     :
                        (s_wb_adr_i == ADR_PARAM_RANGE_TOP)      ? reg_param_range_top       :
                        (s_wb_adr_i == ADR_PARAM_RANGE_BOTTOM)   ? reg_param_range_bottom    :
                        (s_wb_adr_i == ADR_CURRENT_RANGE_LEFT)   ? core_current_range_left   :
                        (s_wb_adr_i == ADR_CURRENT_RANGE_RIGHT)  ? core_current_range_right  :
                        (s_wb_adr_i == ADR_CURRENT_RANGE_TOP)    ? core_current_range_top    :
                        (s_wb_adr_i == ADR_CURRENT_RANGE_BOTTOM) ? core_current_range_bottom :
                        (s_wb_adr_i == ADR_MONITOR_OUT_X)        ? out_x                     :
                        (s_wb_adr_i == ADR_MONITOR_OUT_Y)        ? out_y                     :
                        0;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    // ---------------------------------
    //  Core
    // ---------------------------------
    
    jelly_img_mass_center_core
            #(
                .INDEX_WIDTH            (INDEX_WIDTH),
                .DATA_WIDTH             (DATA_WIDTH),
                .Q_WIDTH                (Q_WIDTH),
                .X_WIDTH                (X_WIDTH),
                .Y_WIDTH                (Y_WIDTH),
                .OUT_X_WIDTH            (OUT_X_WIDTH),
                .OUT_Y_WIDTH            (OUT_Y_WIDTH),
                .X_COUNT_WIDTH          (X_COUNT_WIDTH),
                .Y_COUNT_WIDTH          (Y_COUNT_WIDTH),
                .N_COUNT_WIDTH          (N_COUNT_WIDTH)
            )
        i_img_mass_center_core
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .ctl_update             (reg_ctl_control[1]),
                .ctl_index              (update_index),
                
                .param_range_left       (reg_param_range_left),
                .param_range_right      (reg_param_range_right),
                .param_range_top        (reg_param_range_top),
                .param_range_bottom     (reg_param_range_bottom),
                
                .current_range_left     (core_current_range_left),
                .current_range_right    (core_current_range_right),
                .current_range_top      (core_current_range_top),
                .current_range_bottom   (core_current_range_bottom),
                
                .s_img_line_first       (s_img_line_first),
                .s_img_line_last        (s_img_line_last),
                .s_img_pixel_first      (s_img_pixel_first),
                .s_img_pixel_last       (s_img_pixel_last),
                .s_img_de               (s_img_de),
                .s_img_data             (s_img_data),
                .s_img_valid            (s_img_valid),
                
                .out_x                  (out_x),
                .out_y                  (out_y),
                .out_valid              (out_valid)
            );
    
    
endmodule


`default_nettype wire


// end of file
