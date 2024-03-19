// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_color_matrix
        #(
            parameter   USER_WIDTH           = 0,
            parameter   DATA_WIDTH           = 10,
            parameter   INTERNAL_WIDTH       = DATA_WIDTH + 2,
            
            parameter   CORE_ID              = 32'h527a_2130,
            parameter   CORE_VERSION         = 32'h0001_0000,
            parameter   INDEX_WIDTH          = 1,
            parameter   FRAME_WIDTH          = 32,
            
            parameter   COEFF_INT_WIDTH      = 17,
            parameter   COEFF_FRAC_WIDTH     = 8,
            parameter   COEFF3_INT_WIDTH     = COEFF_INT_WIDTH,
            parameter   COEFF3_FRAC_WIDTH    = COEFF_FRAC_WIDTH,
            parameter   STATIC_COEFF         = 1,
            parameter   DEVICE               = "RTL", // "RTL" or "7SERIES"
            
            parameter   WB_ADR_WIDTH         = 8,
            parameter   WB_DAT_WIDTH         = 32,
            parameter   WB_SEL_WIDTH         = (WB_DAT_WIDTH / 8),
            
            parameter   INIT_CTL_CONTROL     = 1,
            parameter   INIT_PARAM_MATRIX00  = (1 << COEFF_FRAC_WIDTH),
            parameter   INIT_PARAM_MATRIX01  = 0,
            parameter   INIT_PARAM_MATRIX02  = 0,
            parameter   INIT_PARAM_MATRIX03  = 0,
            parameter   INIT_PARAM_MATRIX10  = 0,
            parameter   INIT_PARAM_MATRIX11  = (1 << COEFF_FRAC_WIDTH),
            parameter   INIT_PARAM_MATRIX12  = 0,
            parameter   INIT_PARAM_MATRIX13  = 0,
            parameter   INIT_PARAM_MATRIX20  = 0,
            parameter   INIT_PARAM_MATRIX21  = 0,
            parameter   INIT_PARAM_MATRIX22  = (1 << COEFF_FRAC_WIDTH),
            parameter   INIT_PARAM_MATRIX23  = 0,
            parameter   INIT_PARAM_CLIP_MIN0 = {DATA_WIDTH{1'b0}},
            parameter   INIT_PARAM_CLIP_MAX0 = {DATA_WIDTH{1'b1}},
            parameter   INIT_PARAM_CLIP_MIN1 = {DATA_WIDTH{1'b0}},
            parameter   INIT_PARAM_CLIP_MAX1 = {DATA_WIDTH{1'b1}},
            parameter   INIT_PARAM_CLIP_MIN2 = {DATA_WIDTH{1'b0}},
            parameter   INIT_PARAM_CLIP_MAX2 = {DATA_WIDTH{1'b1}},
            
            // local
            parameter   COEFF_WIDTH          = COEFF_INT_WIDTH + COEFF_FRAC_WIDTH,
            parameter   COEFF3_WIDTH         = COEFF3_INT_WIDTH + COEFF3_FRAC_WIDTH,
            parameter   USER_BITS            = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        in_update_req,
            
            input   wire                        s_wb_rst_i,
            input   wire                        s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            input   wire                        s_img_line_first,
            input   wire                        s_img_line_last,
            input   wire                        s_img_pixel_first,
            input   wire                        s_img_pixel_last,
            input   wire                        s_img_de,
            input   wire    [USER_BITS-1:0]     s_img_user,
            input   wire    [DATA_WIDTH-1:0]    s_img_color0,
            input   wire    [DATA_WIDTH-1:0]    s_img_color1,
            input   wire    [DATA_WIDTH-1:0]    s_img_color2,
            input   wire                        s_img_valid,
            
            output  wire                        m_img_line_first,
            output  wire                        m_img_line_last,
            output  wire                        m_img_pixel_first,
            output  wire                        m_img_pixel_last,
            output  wire                        m_img_de,
            output  wire    [USER_BITS-1:0]     m_img_user,
            output  wire    [DATA_WIDTH-1:0]    m_img_color0,
            output  wire    [DATA_WIDTH-1:0]    m_img_color1,
            output  wire    [DATA_WIDTH-1:0]    m_img_color2,
            output  wire                        m_img_valid
        );
    
    
    // -------------------------------------
    //  registers domain
    // -------------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID               = 8'h00;
    localparam  ADR_CORE_VERSION          = 8'h01;
    localparam  ADR_CTL_CONTROL           = 8'h04;
    localparam  ADR_CTL_STATUS            = 8'h05;
    localparam  ADR_CTL_INDEX             = 8'h07;
    localparam  ADR_PARAM_MATRIX00        = 8'h10;
    localparam  ADR_PARAM_MATRIX01        = 8'h11;
    localparam  ADR_PARAM_MATRIX02        = 8'h12;
    localparam  ADR_PARAM_MATRIX03        = 8'h13;
    localparam  ADR_PARAM_MATRIX10        = 8'h14;
    localparam  ADR_PARAM_MATRIX11        = 8'h15;
    localparam  ADR_PARAM_MATRIX12        = 8'h16;
    localparam  ADR_PARAM_MATRIX13        = 8'h17;
    localparam  ADR_PARAM_MATRIX20        = 8'h18;
    localparam  ADR_PARAM_MATRIX21        = 8'h19;
    localparam  ADR_PARAM_MATRIX22        = 8'h1a;
    localparam  ADR_PARAM_MATRIX23        = 8'h1b;
    localparam  ADR_PARAM_CLIP_MIN0       = 8'h20;
    localparam  ADR_PARAM_CLIP_MAX0       = 8'h21;
    localparam  ADR_PARAM_CLIP_MIN1       = 8'h22;
    localparam  ADR_PARAM_CLIP_MAX1       = 8'h23;
    localparam  ADR_PARAM_CLIP_MIN2       = 8'h24;
    localparam  ADR_PARAM_CLIP_MAX2       = 8'h25;
    localparam  ADR_CFG_COEFF0_WIDTH      = 8'h40;
    localparam  ADR_CFG_COEFF1_WIDTH      = 8'h41;
    localparam  ADR_CFG_COEFF2_WIDTH      = 8'h42;
    localparam  ADR_CFG_COEFF3_WIDTH      = 8'h43;
    localparam  ADR_CFG_COEFF0_FRAC_WIDTH = 8'h44;
    localparam  ADR_CFG_COEFF1_FRAC_WIDTH = 8'h45;
    localparam  ADR_CFG_COEFF2_FRAC_WIDTH = 8'h46;
    localparam  ADR_CFG_COEFF3_FRAC_WIDTH = 8'h47;
    localparam  ADR_CURRENT_MATRIX00      = 8'h90;
    localparam  ADR_CURRENT_MATRIX01      = 8'h91;
    localparam  ADR_CURRENT_MATRIX02      = 8'h92;
    localparam  ADR_CURRENT_MATRIX03      = 8'h93;
    localparam  ADR_CURRENT_MATRIX10      = 8'h94;
    localparam  ADR_CURRENT_MATRIX11      = 8'h95;
    localparam  ADR_CURRENT_MATRIX12      = 8'h96;
    localparam  ADR_CURRENT_MATRIX13      = 8'h97;
    localparam  ADR_CURRENT_MATRIX20      = 8'h98;
    localparam  ADR_CURRENT_MATRIX21      = 8'h99;
    localparam  ADR_CURRENT_MATRIX22      = 8'h9a;
    localparam  ADR_CURRENT_MATRIX23      = 8'h9b;
    localparam  ADR_CURRENT_CLIP_MIN0     = 8'ha0;
    localparam  ADR_CURRENT_CLIP_MAX0     = 8'ha1;
    localparam  ADR_CURRENT_CLIP_MIN1     = 8'ha2;
    localparam  ADR_CURRENT_CLIP_MAX1     = 8'ha3;
    localparam  ADR_CURRENT_CLIP_MIN2     = 8'ha4;
    localparam  ADR_CURRENT_CLIP_MAX2     = 8'ha5;
    
    // registers
    reg             [2:0]               reg_ctl_control; 
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix00;
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix01;
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix02;
    reg     signed  [COEFF3_WIDTH-1:0]  reg_param_matrix03;
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix10;
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix11;
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix12;
    reg     signed  [COEFF3_WIDTH-1:0]  reg_param_matrix13;
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix20;
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix21;
    reg     signed  [COEFF_WIDTH-1:0]   reg_param_matrix22;
    reg     signed  [COEFF3_WIDTH-1:0]  reg_param_matrix23;
    reg             [DATA_WIDTH-1:0]    reg_param_clip_min0;
    reg             [DATA_WIDTH-1:0]    reg_param_clip_max0;
    reg             [DATA_WIDTH-1:0]    reg_param_clip_min1;
    reg             [DATA_WIDTH-1:0]    reg_param_clip_max1;
    reg             [DATA_WIDTH-1:0]    reg_param_clip_min2;
    reg             [DATA_WIDTH-1:0]    reg_param_clip_max2;
    
    // shadow registers(core domain)
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix00;
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix01;
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix02;
    reg     signed  [COEFF3_WIDTH-1:0]  reg_current_matrix03;
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix10;
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix11;
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix12;
    reg     signed  [COEFF3_WIDTH-1:0]  reg_current_matrix13;
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix20;
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix21;
    reg     signed  [COEFF_WIDTH-1:0]   reg_current_matrix22;
    reg     signed  [COEFF3_WIDTH-1:0]  reg_current_matrix23;
    reg             [DATA_WIDTH-1:0]    reg_current_clip_min0;
    reg             [DATA_WIDTH-1:0]    reg_current_clip_max0;
    reg             [DATA_WIDTH-1:0]    reg_current_clip_min1;
    reg             [DATA_WIDTH-1:0]    reg_current_clip_max1;
    reg             [DATA_WIDTH-1:0]    reg_current_clip_min2;
    reg             [DATA_WIDTH-1:0]    reg_current_clip_max2;
    
    // handshake with core domain
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
    
    // write mask
    function [WB_DAT_WIDTH-1:0] write_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] wdat,
                                        input [WB_SEL_WIDTH-1:0] msk
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            write_mask[i] = msk[i/8] ? wdat[i] : org[i];
        end
    end
    endfunction
    
    // registers control
    always @(posedge s_wb_clk_i) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_control     <= INIT_CTL_CONTROL | 1;
            reg_param_matrix00  <= INIT_PARAM_MATRIX00;
            reg_param_matrix01  <= INIT_PARAM_MATRIX01;
            reg_param_matrix02  <= INIT_PARAM_MATRIX02;
            reg_param_matrix03  <= INIT_PARAM_MATRIX03;
            reg_param_matrix10  <= INIT_PARAM_MATRIX10;
            reg_param_matrix11  <= INIT_PARAM_MATRIX11;
            reg_param_matrix12  <= INIT_PARAM_MATRIX12;
            reg_param_matrix13  <= INIT_PARAM_MATRIX13;
            reg_param_matrix20  <= INIT_PARAM_MATRIX20;
            reg_param_matrix21  <= INIT_PARAM_MATRIX21;
            reg_param_matrix22  <= INIT_PARAM_MATRIX22;
            reg_param_matrix23  <= INIT_PARAM_MATRIX23;
            reg_param_clip_min0 <= INIT_PARAM_CLIP_MIN0;
            reg_param_clip_max0 <= INIT_PARAM_CLIP_MAX0;
            reg_param_clip_min1 <= INIT_PARAM_CLIP_MIN1;
            reg_param_clip_max1 <= INIT_PARAM_CLIP_MAX1;
            reg_param_clip_min2 <= INIT_PARAM_CLIP_MIN2;
            reg_param_clip_max2 <= INIT_PARAM_CLIP_MAX2;
        end
        else begin
            // auto clear
            if ( update_ack && !reg_ctl_control[2] ) begin
                reg_ctl_control[1] <= 1'b0;
            end
            
            // write
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL:       reg_ctl_control     <= write_mask(reg_param_matrix00 , s_wb_dat_i, s_wb_sel_i) | 1;
                ADR_PARAM_MATRIX00:    reg_param_matrix00  <= write_mask(reg_param_matrix00 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX01:    reg_param_matrix01  <= write_mask(reg_param_matrix01 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX02:    reg_param_matrix02  <= write_mask(reg_param_matrix02 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX03:    reg_param_matrix03  <= write_mask(reg_param_matrix03 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX10:    reg_param_matrix10  <= write_mask(reg_param_matrix10 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX11:    reg_param_matrix11  <= write_mask(reg_param_matrix11 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX12:    reg_param_matrix12  <= write_mask(reg_param_matrix12 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX13:    reg_param_matrix13  <= write_mask(reg_param_matrix13 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX20:    reg_param_matrix20  <= write_mask(reg_param_matrix20 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX21:    reg_param_matrix21  <= write_mask(reg_param_matrix21 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX22:    reg_param_matrix22  <= write_mask(reg_param_matrix22 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MATRIX23:    reg_param_matrix23  <= write_mask(reg_param_matrix23 , s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CLIP_MIN0:   reg_param_clip_min0 <= write_mask(reg_param_clip_min0, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CLIP_MAX0:   reg_param_clip_max0 <= write_mask(reg_param_clip_max0, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CLIP_MIN1:   reg_param_clip_min1 <= write_mask(reg_param_clip_min1, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CLIP_MAX1:   reg_param_clip_max1 <= write_mask(reg_param_clip_max1, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CLIP_MIN2:   reg_param_clip_min2 <= write_mask(reg_param_clip_min2, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CLIP_MAX2:   reg_param_clip_max2 <= write_mask(reg_param_clip_max2, s_wb_dat_i, s_wb_sel_i);
                default: ;
                endcase
            end
        end
    end
    
    // read用にWB_DAT_WIDTHサイズに符号拡張
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix00   = reg_param_matrix00;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix01   = reg_param_matrix01;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix02   = reg_param_matrix02;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix03   = reg_param_matrix03;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix10   = reg_param_matrix10;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix11   = reg_param_matrix11;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix12   = reg_param_matrix12;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix13   = reg_param_matrix13;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix20   = reg_param_matrix20;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix21   = reg_param_matrix21;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix22   = reg_param_matrix22;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_param_matrix23   = reg_param_matrix23;
    
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix00 = reg_current_matrix00;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix01 = reg_current_matrix01;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix02 = reg_current_matrix02;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix03 = reg_current_matrix03;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix10 = reg_current_matrix10;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix11 = reg_current_matrix11;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix12 = reg_current_matrix12;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix13 = reg_current_matrix13;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix20 = reg_current_matrix20;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix21 = reg_current_matrix21;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix22 = reg_current_matrix22;
    wire    signed  [WB_DAT_WIDTH-1:0]  signed_current_matrix23 = reg_current_matrix23;
    
    // read (shadow register は クロック同期してないのであくまでデバッグ用)
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)               ? CORE_ID                 :
                        (s_wb_adr_i == ADR_CORE_VERSION)          ? CORE_VERSION            :
                        (s_wb_adr_i == ADR_CTL_CONTROL)           ? reg_ctl_control         :
                        (s_wb_adr_i == ADR_CTL_STATUS)            ? 1                       :
                        (s_wb_adr_i == ADR_CTL_INDEX)             ? ctl_index               :
                        (s_wb_adr_i == ADR_PARAM_MATRIX00)        ? signed_param_matrix00   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX01)        ? signed_param_matrix01   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX02)        ? signed_param_matrix02   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX03)        ? signed_param_matrix03   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX10)        ? signed_param_matrix10   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX11)        ? signed_param_matrix11   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX12)        ? signed_param_matrix12   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX13)        ? signed_param_matrix13   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX20)        ? signed_param_matrix20   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX21)        ? signed_param_matrix21   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX22)        ? signed_param_matrix22   :
                        (s_wb_adr_i == ADR_PARAM_MATRIX23)        ? signed_param_matrix23   :
                        (s_wb_adr_i == ADR_PARAM_CLIP_MIN0)       ? reg_param_clip_min0     :
                        (s_wb_adr_i == ADR_PARAM_CLIP_MAX0)       ? reg_param_clip_max0     :
                        (s_wb_adr_i == ADR_PARAM_CLIP_MIN1)       ? reg_param_clip_min1     :
                        (s_wb_adr_i == ADR_PARAM_CLIP_MAX1)       ? reg_param_clip_max1     :
                        (s_wb_adr_i == ADR_PARAM_CLIP_MIN2)       ? reg_param_clip_min2     :
                        (s_wb_adr_i == ADR_PARAM_CLIP_MAX2)       ? reg_param_clip_max2     :
                        (s_wb_adr_i == ADR_CFG_COEFF0_WIDTH)      ? COEFF_WIDTH             :
                        (s_wb_adr_i == ADR_CFG_COEFF1_WIDTH)      ? COEFF_WIDTH             :
                        (s_wb_adr_i == ADR_CFG_COEFF2_WIDTH)      ? COEFF_WIDTH             :
                        (s_wb_adr_i == ADR_CFG_COEFF3_WIDTH)      ? COEFF3_WIDTH            :
                        (s_wb_adr_i == ADR_CFG_COEFF0_FRAC_WIDTH) ? COEFF_FRAC_WIDTH        :
                        (s_wb_adr_i == ADR_CFG_COEFF1_FRAC_WIDTH) ? COEFF_FRAC_WIDTH        :
                        (s_wb_adr_i == ADR_CFG_COEFF2_FRAC_WIDTH) ? COEFF_FRAC_WIDTH        :
                        (s_wb_adr_i == ADR_CFG_COEFF3_FRAC_WIDTH) ? COEFF3_FRAC_WIDTH       :
                        (s_wb_adr_i == ADR_CURRENT_MATRIX00)      ? signed_current_matrix00 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX01)      ? signed_current_matrix01 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX02)      ? signed_current_matrix02 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX03)      ? signed_current_matrix03 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX10)      ? signed_current_matrix10 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX11)      ? signed_current_matrix11 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX12)      ? signed_current_matrix12 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX13)      ? signed_current_matrix13 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX20)      ? signed_current_matrix20 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX21)      ? signed_current_matrix21 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX22)      ? signed_current_matrix22 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_MATRIX23)      ? signed_current_matrix23 :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_CLIP_MIN0)     ? reg_current_clip_min0   :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_CLIP_MAX0)     ? reg_current_clip_max0   :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_CLIP_MIN1)     ? reg_current_clip_min1   :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_CLIP_MAX1)     ? reg_current_clip_max1   :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_CLIP_MIN2)     ? reg_current_clip_min2   :   // for debug
                        (s_wb_adr_i == ADR_CURRENT_CLIP_MAX2)     ? reg_current_clip_max2   :   // for debug
                        {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    
    // -------------------------------------
    //  core domain
    // -------------------------------------
    
    // handshake with registers domain
    wire    update_trig = (s_img_valid & s_img_line_first & s_img_pixel_first);
    wire    update_en;
    
    jelly_param_update_slave
            #(
                .INDEX_WIDTH    (INDEX_WIDTH)
            )
        i_param_update_slave
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .in_trigger     (update_trig),
                .in_update      (reg_ctl_control[1]),
                
                .out_update     (update_en),
                .out_index      (update_index)
            );
    
    // wait for frame start to update parameters
    reg                 reg_update_req;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_update_req        <= 1'b0;
            
            reg_current_matrix00  <= INIT_PARAM_MATRIX00;
            reg_current_matrix01  <= INIT_PARAM_MATRIX01;
            reg_current_matrix02  <= INIT_PARAM_MATRIX02;
            reg_current_matrix03  <= INIT_PARAM_MATRIX03;
            reg_current_matrix10  <= INIT_PARAM_MATRIX10;
            reg_current_matrix11  <= INIT_PARAM_MATRIX11;
            reg_current_matrix12  <= INIT_PARAM_MATRIX12;
            reg_current_matrix13  <= INIT_PARAM_MATRIX13;
            reg_current_matrix20  <= INIT_PARAM_MATRIX20;
            reg_current_matrix21  <= INIT_PARAM_MATRIX21;
            reg_current_matrix22  <= INIT_PARAM_MATRIX22;
            reg_current_matrix23  <= INIT_PARAM_MATRIX23;
            reg_current_clip_min0 <= INIT_PARAM_CLIP_MIN0;
            reg_current_clip_max0 <= INIT_PARAM_CLIP_MAX0;
            reg_current_clip_min1 <= INIT_PARAM_CLIP_MIN1;
            reg_current_clip_max1 <= INIT_PARAM_CLIP_MAX1;
            reg_current_clip_min2 <= INIT_PARAM_CLIP_MIN2;
            reg_current_clip_max2 <= INIT_PARAM_CLIP_MAX2;
        end
        else begin
            if ( in_update_req ) begin
                reg_update_req <= 1'b1;
            end
            
            if ( cke ) begin
                if ( reg_update_req & update_trig & update_en ) begin
                    reg_update_req        <= 1'b0;
                    
                    reg_current_matrix00  <= reg_param_matrix00;
                    reg_current_matrix01  <= reg_param_matrix01;
                    reg_current_matrix02  <= reg_param_matrix02;
                    reg_current_matrix03  <= reg_param_matrix03;
                    reg_current_matrix10  <= reg_param_matrix10;
                    reg_current_matrix11  <= reg_param_matrix11;
                    reg_current_matrix12  <= reg_param_matrix12;
                    reg_current_matrix13  <= reg_param_matrix13;
                    reg_current_matrix20  <= reg_param_matrix20;
                    reg_current_matrix21  <= reg_param_matrix21;
                    reg_current_matrix22  <= reg_param_matrix22;
                    reg_current_matrix23  <= reg_param_matrix23;
                    reg_current_clip_min0 <= reg_param_clip_min0;
                    reg_current_clip_max0 <= reg_param_clip_max0;
                    reg_current_clip_min1 <= reg_param_clip_min1;
                    reg_current_clip_max1 <= reg_param_clip_max1;
                    reg_current_clip_min2 <= reg_param_clip_min2;
                    reg_current_clip_max2 <= reg_param_clip_max2;
                end
            end
        end
    end
    
    
    // core
    jelly_img_color_matrix_core
            #(
                .USER_WIDTH             (USER_WIDTH),
                .DATA_WIDTH             (DATA_WIDTH),
                .INTERNAL_WIDTH         (INTERNAL_WIDTH),
                
                .COEFF_INT_WIDTH        (COEFF_INT_WIDTH),
                .COEFF_FRAC_WIDTH       (COEFF_FRAC_WIDTH),
                .COEFF3_INT_WIDTH       (COEFF3_INT_WIDTH),
                .COEFF3_FRAC_WIDTH      (COEFF3_FRAC_WIDTH),
                .STATIC_COEFF           (STATIC_COEFF),
                .DEVICE                 (DEVICE)
            )
        i_img_color_matrix_core
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .param_matrix00         (reg_current_matrix00),
                .param_matrix01         (reg_current_matrix01),
                .param_matrix02         (reg_current_matrix02),
                .param_matrix03         (reg_current_matrix03),
                .param_matrix10         (reg_current_matrix10),
                .param_matrix11         (reg_current_matrix11),
                .param_matrix12         (reg_current_matrix12),
                .param_matrix13         (reg_current_matrix13),
                .param_matrix20         (reg_current_matrix20),
                .param_matrix21         (reg_current_matrix21),
                .param_matrix22         (reg_current_matrix22),
                .param_matrix23         (reg_current_matrix23),
                .param_clip_min0        (reg_current_clip_min0),
                .param_clip_max0        (reg_current_clip_max0),
                .param_clip_min1        (reg_current_clip_min1),
                .param_clip_max1        (reg_current_clip_max1),
                .param_clip_min2        (reg_current_clip_min2),
                .param_clip_max2        (reg_current_clip_max2),
                
                .s_img_line_first       (s_img_line_first),
                .s_img_line_last        (s_img_line_last),
                .s_img_pixel_first      (s_img_pixel_first),
                .s_img_pixel_last       (s_img_pixel_last),
                .s_img_de               (s_img_de),
                .s_img_user             (s_img_user),
                .s_img_color0           (s_img_color0),
                .s_img_color1           (s_img_color1),
                .s_img_color2           (s_img_color2),
                .s_img_valid            (s_img_valid),
                
                .m_img_line_first       (m_img_line_first),
                .m_img_line_last        (m_img_line_last),
                .m_img_pixel_first      (m_img_pixel_first),
                .m_img_pixel_last       (m_img_pixel_last),
                .m_img_de               (m_img_de),
                .m_img_user             (m_img_user),
                .m_img_color0           (m_img_color0),
                .m_img_color1           (m_img_color1),
                .m_img_color2           (m_img_color2),
                .m_img_valid            (m_img_valid)
            );
    
    
endmodule


`default_nettype wire


// end of file
