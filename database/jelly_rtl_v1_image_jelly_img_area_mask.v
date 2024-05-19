// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_area_mask
        #(
            parameter   USER_WIDTH                = 0,
            parameter   DATA_WIDTH                = 8,
            parameter   X_WIDTH                   = 14,
            parameter   Y_WIDTH                   = 14,
            parameter   USE_VALID                 = 0,
            
            parameter   CORE_ID                   = 32'h527a_2820,
            parameter   CORE_VERSION              = 32'h0001_0000,
            parameter   INDEX_WIDTH               = 1,
            
            parameter   WB_ADR_WIDTH              = 8,
            parameter   WB_DAT_WIDTH              = 32,
            parameter   WB_SEL_WIDTH              = (WB_DAT_WIDTH / 8),
            
            parameter   INIT_CTL_CONTROL          = 3'b000,
            parameter   INIT_PARAM_MASK_FLAG      = 4'b0100,
            parameter   INIT_PARAM_MASK_VALUE0    = 0,
            parameter   INIT_PARAM_MASK_VALUE1    = {DATA_WIDTH{1'b1}},
            parameter   INIT_PARAM_THRESH_FLAG    = 2'b00,
            parameter   INIT_PARAM_THRESH_VALUE   = 0,
            parameter   INIT_PARAM_RECT_FLAG      = 2'b00,
            parameter   INIT_PARAM_RECT_LEFT      = 0,
            parameter   INIT_PARAM_RECT_RIGHT     = {X_WIDTH{1'b0}},
            parameter   INIT_PARAM_RECT_TOP       = 0,
            parameter   INIT_PARAM_RECT_BOTTOM    = {Y_WIDTH{1'b0}},
            parameter   INIT_PARAM_CIRCLE_FLAG    = 2'b00,
            parameter   INIT_PARAM_CIRCLE_X       = 0,
            parameter   INIT_PARAM_CIRCLE_Y       = 0,
            parameter   INIT_PARAM_CIRCLE_RADIUS2 = 0,
            
            parameter   USER_BITS                 = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            in_update_req,
            
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
            input   wire    [USER_BITS-1:0]         s_img_user,
            input   wire    [DATA_WIDTH-1:0]        s_img_data,
            input   wire                            s_img_valid,
            
            output  wire                            m_img_line_first,
            output  wire                            m_img_line_last,
            output  wire                            m_img_pixel_first,
            output  wire                            m_img_pixel_last,
            output  wire                            m_img_de,
            output  wire    [USER_BITS-1:0]         m_img_user,
            output  wire    [DATA_WIDTH-1:0]        m_img_data,
            output  wire    [DATA_WIDTH-1:0]        m_img_masked_data,
            output  wire                            m_img_mask,
            output  wire                            m_img_valid
        );
    
    localparam  XY_WIDTH     = X_WIDTH > Y_WIDTH ? X_WIDTH : Y_WIDTH;
    localparam  RADIUS_WIDTH = 2 * XY_WIDTH;
    
    
    // -------------------------------------
    //  registers domain
    // -------------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID                = 8'h00;
    localparam  ADR_CORE_VERSION           = 8'h01;
    localparam  ADR_CTL_CONTROL            = 8'h04;
    localparam  ADR_CTL_STATUS             = 8'h05;
    localparam  ADR_CTL_INDEX              = 8'h07;
    localparam  ADR_PARAM_MASK_FLAG        = 8'h10;
    localparam  ADR_PARAM_MASK_VALUE0      = 8'h12;
    localparam  ADR_PARAM_MASK_VALUE1      = 8'h13;
    localparam  ADR_PARAM_THRESH_FLAG      = 8'h14;
    localparam  ADR_PARAM_THRESH_VALUE     = 8'h15;
    localparam  ADR_PARAM_RECT_FLAG        = 8'h21;
    localparam  ADR_PARAM_RECT_LEFT        = 8'h24;
    localparam  ADR_PARAM_RECT_RIGHT       = 8'h25;
    localparam  ADR_PARAM_RECT_TOP         = 8'h26;
    localparam  ADR_PARAM_RECT_BOTTOM      = 8'h27;
    localparam  ADR_PARAM_CIRCLE_FLAG      = 8'h50;
    localparam  ADR_PARAM_CIRCLE_X         = 8'h54;
    localparam  ADR_PARAM_CIRCLE_Y         = 8'h55;
    localparam  ADR_PARAM_CIRCLE_RADIUS2   = 8'h56;
    localparam  ADR_CURRENT_MASK_FLAG      = 8'h90;
    localparam  ADR_CURRENT_MASK_VALUE0    = 8'h92;
    localparam  ADR_CURRENT_MASK_VALUE1    = 8'h93;
    localparam  ADR_CURRENT_THRESH_FLAG    = 8'h94;
    localparam  ADR_CURRENT_THRESH_VALUE   = 8'h95;
    localparam  ADR_CURRENT_RECT_FLAG      = 8'ha1;
    localparam  ADR_CURRENT_RECT_LEFT      = 8'ha4;
    localparam  ADR_CURRENT_RECT_RIGHT     = 8'ha5;
    localparam  ADR_CURRENT_RECT_TOP       = 8'ha6;
    localparam  ADR_CURRENT_RECT_BOTTOM    = 8'ha7;
    localparam  ADR_CURRENT_CIRCLE_FLAG    = 8'hd0;
    localparam  ADR_CURRENT_CIRCLE_X       = 8'hd4;
    localparam  ADR_CURRENT_CIRCLE_Y       = 8'hd5;
    localparam  ADR_CURRENT_CIRCLE_RADIUS2 = 8'hd6;
    
    // registers
    reg     [2:0]                   reg_ctl_control;
    reg     [3:0]                   reg_param_mask_flag;
    reg     [DATA_WIDTH-1:0]        reg_param_mask_value0;
    reg     [DATA_WIDTH-1:0]        reg_param_mask_value1;
    reg     [1:0]                   reg_param_rect_flag;
    reg     [X_WIDTH-1:0]           reg_param_rect_left;
    reg     [X_WIDTH-1:0]           reg_param_rect_right;
    reg     [Y_WIDTH-1:0]           reg_param_rect_top;
    reg     [Y_WIDTH-1:0]           reg_param_rect_bottom;
    reg     [1:0]                   reg_param_circle_flag;
    reg     [X_WIDTH-1:0]           reg_param_circle_x;
    reg     [Y_WIDTH-1:0]           reg_param_circle_y;
    reg     [RADIUS_WIDTH-1:0]      reg_param_circle_radius2;   // 半径の2乗
    reg     [1:0]                   reg_param_thresh_flag;
    reg     [DATA_WIDTH-1:0]        reg_param_thresh_value;
    
    // shadow registers(core domain)
    reg     [0:0]                   reg_current_control;
    reg     [3:0]                   reg_current_mask_flag;
    reg     [DATA_WIDTH-1:0]        reg_current_mask_value0;
    reg     [DATA_WIDTH-1:0]        reg_current_mask_value1;
    reg     [1:0]                   reg_current_rect_flag;
    reg     [X_WIDTH-1:0]           reg_current_rect_left;
    reg     [X_WIDTH-1:0]           reg_current_rect_right;
    reg     [Y_WIDTH-1:0]           reg_current_rect_top;
    reg     [Y_WIDTH-1:0]           reg_current_rect_bottom;
    reg     [1:0]                   reg_current_circle_flag;
    reg     [X_WIDTH-1:0]           reg_current_circle_x;
    reg     [Y_WIDTH-1:0]           reg_current_circle_y;
    reg     [RADIUS_WIDTH-1:0]      reg_current_circle_radius2;
    reg     [1:0]                   reg_current_thresh_flag;
    reg     [DATA_WIDTH-1:0]        reg_current_thresh_value;
    
    
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
            reg_ctl_control          <= INIT_CTL_CONTROL;
            reg_param_mask_flag      <= INIT_PARAM_MASK_FLAG;
            reg_param_mask_value0    <= INIT_PARAM_MASK_VALUE0;
            reg_param_mask_value1    <= INIT_PARAM_MASK_VALUE1;
            reg_param_thresh_flag    <= INIT_PARAM_THRESH_FLAG;
            reg_param_thresh_value   <= INIT_PARAM_THRESH_VALUE;
            reg_param_rect_flag      <= INIT_PARAM_RECT_FLAG;
            reg_param_rect_left      <= INIT_PARAM_RECT_LEFT;
            reg_param_rect_right     <= INIT_PARAM_RECT_RIGHT;
            reg_param_rect_top       <= INIT_PARAM_RECT_TOP;
            reg_param_rect_bottom    <= INIT_PARAM_RECT_BOTTOM;
            reg_param_circle_flag    <= INIT_PARAM_CIRCLE_FLAG;
            reg_param_circle_x       <= INIT_PARAM_CIRCLE_X;
            reg_param_circle_y       <= INIT_PARAM_CIRCLE_Y;
            reg_param_circle_radius2 <= INIT_PARAM_CIRCLE_RADIUS2;
        end
        else begin
            if ( update_ack && !reg_ctl_control[2] ) begin
                reg_ctl_control[1] <= 1'b0;     // auto clear
            end
            
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL:            reg_ctl_control          <= write_mask(reg_ctl_control,           s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MASK_FLAG:        reg_param_mask_flag      <= write_mask(reg_param_mask_flag,       s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MASK_VALUE0:      reg_param_mask_value0    <= write_mask(reg_param_mask_value0,     s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_MASK_VALUE1:      reg_param_mask_value1    <= write_mask(reg_param_mask_value1,     s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_THRESH_FLAG:      reg_param_thresh_flag    <= write_mask(reg_param_thresh_flag,     s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_THRESH_VALUE:     reg_param_thresh_value   <= write_mask(reg_param_thresh_value,    s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RECT_FLAG:        reg_param_rect_flag      <= write_mask(reg_param_rect_flag,       s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RECT_LEFT:        reg_param_rect_left      <= write_mask(reg_param_rect_left,       s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RECT_RIGHT:       reg_param_rect_right     <= write_mask(reg_param_rect_right,      s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RECT_TOP:         reg_param_rect_top       <= write_mask(reg_param_rect_top,        s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RECT_BOTTOM:      reg_param_rect_bottom    <= write_mask(reg_param_rect_bottom,     s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CIRCLE_FLAG:      reg_param_circle_flag    <= write_mask(reg_param_circle_flag,     s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CIRCLE_X:         reg_param_circle_x       <= write_mask(reg_param_circle_x,        s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CIRCLE_Y:         reg_param_circle_y       <= write_mask(reg_param_circle_y,        s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_CIRCLE_RADIUS2:   reg_param_circle_radius2 <= write_mask(reg_param_circle_radius2,  s_wb_dat_i, s_wb_sel_i);
                endcase
            end
        end
    end
    
    // read
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)                ? CORE_ID                    :
                        (s_wb_adr_i == ADR_CORE_VERSION)           ? CORE_VERSION               :
                        (s_wb_adr_i == ADR_CTL_CONTROL)            ? reg_ctl_control            :
                        (s_wb_adr_i == ADR_CTL_STATUS)             ? reg_current_control        :
                        (s_wb_adr_i == ADR_CTL_INDEX)              ? ctl_index                  :
                        (s_wb_adr_i == ADR_PARAM_MASK_FLAG)        ? reg_param_mask_flag        :
                        (s_wb_adr_i == ADR_PARAM_MASK_VALUE0)      ? reg_param_mask_value0      :
                        (s_wb_adr_i == ADR_PARAM_MASK_VALUE1)      ? reg_param_mask_value1      :
                        (s_wb_adr_i == ADR_PARAM_THRESH_FLAG)      ? reg_param_thresh_flag      :
                        (s_wb_adr_i == ADR_PARAM_THRESH_VALUE)     ? reg_param_thresh_value     :
                        (s_wb_adr_i == ADR_PARAM_RECT_FLAG)        ? reg_param_rect_flag        :
                        (s_wb_adr_i == ADR_PARAM_RECT_LEFT)        ? reg_param_rect_left        :
                        (s_wb_adr_i == ADR_PARAM_RECT_RIGHT)       ? reg_param_rect_right       :
                        (s_wb_adr_i == ADR_PARAM_RECT_TOP)         ? reg_param_rect_top         :
                        (s_wb_adr_i == ADR_PARAM_RECT_BOTTOM)      ? reg_param_rect_bottom      :
                        (s_wb_adr_i == ADR_PARAM_CIRCLE_FLAG)      ? reg_param_circle_flag      :
                        (s_wb_adr_i == ADR_PARAM_CIRCLE_X)         ? reg_param_circle_x         :
                        (s_wb_adr_i == ADR_PARAM_CIRCLE_Y)         ? reg_param_circle_y         :
                        (s_wb_adr_i == ADR_PARAM_CIRCLE_RADIUS2)   ? reg_param_circle_radius2   :
                        (s_wb_adr_i == ADR_CURRENT_MASK_FLAG)      ? reg_current_mask_flag      :
                        (s_wb_adr_i == ADR_CURRENT_MASK_VALUE0)    ? reg_current_mask_value0    :
                        (s_wb_adr_i == ADR_CURRENT_MASK_VALUE1)    ? reg_current_mask_value1    :
                        (s_wb_adr_i == ADR_CURRENT_THRESH_FLAG)    ? reg_current_thresh_flag    :
                        (s_wb_adr_i == ADR_CURRENT_THRESH_VALUE)   ? reg_current_thresh_value   :
                        (s_wb_adr_i == ADR_CURRENT_RECT_FLAG)      ? reg_current_rect_flag      :
                        (s_wb_adr_i == ADR_CURRENT_RECT_LEFT)      ? reg_current_rect_left      :
                        (s_wb_adr_i == ADR_CURRENT_RECT_RIGHT)     ? reg_current_rect_right     :
                        (s_wb_adr_i == ADR_CURRENT_RECT_TOP)       ? reg_current_rect_top       :
                        (s_wb_adr_i == ADR_CURRENT_RECT_BOTTOM)    ? reg_current_rect_bottom    :
                        (s_wb_adr_i == ADR_CURRENT_CIRCLE_FLAG)    ? reg_current_circle_flag    :
                        (s_wb_adr_i == ADR_CURRENT_CIRCLE_X)       ? reg_current_circle_x       :
                        (s_wb_adr_i == ADR_CURRENT_CIRCLE_Y)       ? reg_current_circle_y       :
                        (s_wb_adr_i == ADR_CURRENT_CIRCLE_RADIUS2) ? reg_current_circle_radius2 :
                        0;
    
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
            reg_update_req             <= 1'b0;
            reg_current_control        <= INIT_CTL_CONTROL;
            reg_current_mask_flag      <= INIT_PARAM_MASK_FLAG;
            reg_current_mask_value0    <= INIT_PARAM_MASK_VALUE0;
            reg_current_mask_value1    <= INIT_PARAM_MASK_VALUE1;
            reg_current_rect_flag      <= INIT_PARAM_THRESH_FLAG;
            reg_current_rect_left      <= INIT_PARAM_THRESH_VALUE;
            reg_current_rect_right     <= INIT_PARAM_RECT_FLAG;
            reg_current_rect_top       <= INIT_PARAM_RECT_LEFT;
            reg_current_rect_bottom    <= INIT_PARAM_RECT_RIGHT;
            reg_current_circle_flag    <= INIT_PARAM_RECT_TOP;
            reg_current_circle_x       <= INIT_PARAM_RECT_BOTTOM;
            reg_current_circle_y       <= INIT_PARAM_CIRCLE_FLAG;
            reg_current_circle_radius2 <= INIT_PARAM_CIRCLE_X;
            reg_current_thresh_flag    <= INIT_PARAM_CIRCLE_Y;
            reg_current_thresh_value   <= INIT_PARAM_CIRCLE_RADIUS2;
       end
        else begin
            if ( in_update_req ) begin
                reg_update_req <= 1'b1;
            end
            
            if ( cke ) begin
                if ( reg_update_req & update_trig & update_en ) begin
                    reg_update_req             <= 1'b0;
                    
                    reg_current_control        <= reg_ctl_control[0];
                    reg_current_mask_flag      <= reg_param_mask_flag;
                    reg_current_mask_value0    <= reg_param_mask_value0;
                    reg_current_mask_value1    <= reg_param_mask_value1;
                    reg_current_rect_flag      <= reg_param_rect_flag;
                    reg_current_rect_left      <= reg_param_rect_left;
                    reg_current_rect_right     <= reg_param_rect_right;
                    reg_current_rect_top       <= reg_param_rect_top;
                    reg_current_rect_bottom    <= reg_param_rect_bottom;
                    reg_current_circle_flag    <= reg_param_circle_flag;
                    reg_current_circle_x       <= reg_param_circle_x;
                    reg_current_circle_y       <= reg_param_circle_y;
                    reg_current_circle_radius2 <= reg_param_circle_radius2;
                    reg_current_thresh_flag    <= reg_param_thresh_flag;
                    reg_current_thresh_value   <= reg_param_thresh_value;
                end
            end
        end
    end
    
    // core
    jelly_img_area_mask_core
            #(
                .USER_WIDTH         (USER_WIDTH),
                .DATA_WIDTH         (DATA_WIDTH),
                .X_WIDTH            (X_WIDTH),
                .Y_WIDTH            (Y_WIDTH),
                .USE_VALID          (USE_VALID)
            )
        i_img_area_mask_core
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .enable             (reg_current_control[0]),
                
                .mask_or            (reg_current_mask_flag[0]),
                .mask_inv           (reg_current_mask_flag[1]),
                .mask_en0           (reg_current_mask_flag[2]),
                .mask_en1           (reg_current_mask_flag[3]),
                .mask_value0        (reg_current_mask_value0),
                .mask_value1        (reg_current_mask_value1),
                
                .thresh_en          (reg_current_thresh_flag[0]),
                .thresh_inv         (reg_current_thresh_flag[1]),
                .thresh_value       (reg_current_thresh_value),
                
                .rect_en            (reg_current_rect_flag[0]),
                .rect_inv           (reg_current_rect_flag[1]),
                .rect_left          (reg_current_rect_left),
                .rect_right         (reg_current_rect_right),
                .rect_top           (reg_current_rect_top),
                .rect_bottom        (reg_current_rect_bottom),
                
                .circle_en          (reg_current_circle_flag[0]),
                .circle_inv         (reg_current_circle_flag[1]),
                .circle_x           (reg_current_circle_x),
                .circle_y           (reg_current_circle_y),
                .circle_radius2     (reg_current_circle_radius2),
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (s_img_user),
                .s_img_data         (s_img_data),
                .s_img_valid        (s_img_valid),
                
                .m_img_line_first   (m_img_line_first),
                .m_img_line_last    (m_img_line_last),
                .m_img_pixel_first  (m_img_pixel_first),
                .m_img_pixel_last   (m_img_pixel_last),
                .m_img_de           (m_img_de),
                .m_img_user         (m_img_user),
                .m_img_data         (m_img_data),
                .m_img_masked_data  (m_img_masked_data),
                .m_img_mask         (m_img_mask),
                .m_img_valid        (m_img_valid)
            );
    
    
    
endmodule


`default_nettype wire


// end of file
