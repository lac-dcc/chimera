// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// グーローシェーディング
module jelly_pixel_shader_gouraud
        #(
            parameter   COMPONENT_NUM       = 3,
            parameter   DATA_WIDTH          = 8,
            
            parameter   WB_ADR_WIDTH        = 8,
            parameter   WB_DAT_WIDTH        = 32,
            parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8),
            
            parameter   AXI4S_TUSER_WIDTH   = 1,
            parameter   AXI4S_TDATA_WIDTH   = COMPONENT_NUM*DATA_WIDTH,
            
            parameter   INDEX_WIDTH         = 4,
            
            parameter   SHADER_PARAM_NUM    = COMPONENT_NUM,
            parameter   SHADER_PARAM_WIDTH  = 32,
            parameter   SHADER_PARAM_Q      = 24,
            
            parameter   USE_PARAM_CFG_READ  = 1,
            
            parameter   INIT_PARAM_BG_MODE  = 1'b0,
            parameter   INIT_PARAM_BG_COLOR = 24'h00_00_ff
        )
        (
            input   wire                                                reset,
            input   wire                                                clk,
            
            input   wire                                                start,
            input   wire                                                busy,
            input   wire                                                update,
            
            input   wire                                                s_wb_rst_i,
            input   wire                                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]                          s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]                          s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]                          s_wb_dat_i,
            input   wire                                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]                          s_wb_sel_i,
            input   wire                                                s_wb_stb_i,
            output  wire                                                s_wb_ack_o,
            
            input   wire                                                s_rasterizer_frame_start,
            input   wire                                                s_rasterizer_line_end,
            input   wire                                                s_rasterizer_polygon_enable,
            input   wire    [INDEX_WIDTH-1:0]                           s_rasterizer_polygon_index,
            input   wire    [SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:0]   s_rasterizer_shader_params,
            input   wire    [AXI4S_TDATA_WIDTH-1:0]                     s_rasterizer_bg_color,
            input   wire                                                s_rasterizer_valid,
            output  wire                                                s_rasterizer_ready,
            
            output  wire    [AXI4S_TUSER_WIDTH-1:0]                     m_axi4s_tuser,
            output  wire                                                m_axi4s_tlast,
            output  wire    [AXI4S_TDATA_WIDTH-1:0]                     m_axi4s_tdata,
            output  wire                                                m_axi4s_tvalid,
            input   wire                                                m_axi4s_tready
        );
    
    // -------------------------------------
    //  レジスタ
    // -------------------------------------
    
    // アドレス
    localparam  REG_ADDR_CFG_SHADER_PARAM_NUM   = 6'h00;
    localparam  REG_ADDR_CFG_SHADER_PARAM_WIDTH = 6'h01;
    localparam  REG_ADDR_CFG_SHADER_PARAM_Q     = 6'h02;
    
    localparam  REG_ADDR_PARAM_BG_MODE          = 6'h20;
    localparam  REG_ADDR_PARAM_BG_COLOR         = 6'h21;
    
    // 表レジスタ
    reg     [0:0]                           reg_param_bg_mode;
    reg     [AXI4S_TDATA_WIDTH-1:0]         reg_param_bg_color;
    
    // 裏レジスタ
    reg     [0:0]                           reg_shadow_bg_mode;
    reg     [AXI4S_TDATA_WIDTH-1:0]         reg_shadow_bg_color;
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_param_bg_mode  <= INIT_PARAM_BG_MODE;
            reg_param_bg_color <= INIT_PARAM_BG_COLOR;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                REG_ADDR_PARAM_BG_MODE:     reg_param_bg_mode  <= s_wb_dat_i;
                REG_ADDR_PARAM_BG_COLOR:    reg_param_bg_color <= s_wb_dat_i;
                endcase
            end
        end
    end
    
    reg     [WB_DAT_WIDTH-1:0]  tmp_wb_dat_o;
    always @* begin
        tmp_wb_dat_o = {WB_DAT_WIDTH{1'b0}};
        
        if ( USE_PARAM_CFG_READ ) begin
            case ( s_wb_adr_i )
            REG_ADDR_CFG_SHADER_PARAM_NUM:      tmp_wb_dat_o = SHADER_PARAM_NUM;
            REG_ADDR_CFG_SHADER_PARAM_WIDTH:    tmp_wb_dat_o = SHADER_PARAM_WIDTH;
            REG_ADDR_CFG_SHADER_PARAM_Q:        tmp_wb_dat_o = SHADER_PARAM_Q;
            endcase
        end
        
        case ( s_wb_adr_i )
        REG_ADDR_PARAM_BG_MODE:         tmp_wb_dat_o = reg_param_bg_mode;
        REG_ADDR_PARAM_BG_COLOR:        tmp_wb_dat_o = reg_param_bg_color;
        endcase
    end
    
    assign s_wb_dat_o = tmp_wb_dat_o;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    // update_param信号の前後ではレジスタ変化が無い前提で非同期受け渡し
    always @(posedge clk ) begin
        if ( update ) begin
            reg_shadow_bg_mode  <= reg_param_bg_mode;
            reg_shadow_bg_color <= reg_param_bg_color;
        end
    end
    
    
    
    // -------------------------------------
    //  ピクセルシェーディング
    // -------------------------------------
    
    wire                                        cke;
    
    reg             [AXI4S_TUSER_WIDTH-1:0]     pixel_frame_start;
    reg                                         pixel_line_end;
    reg             [AXI4S_TDATA_WIDTH-1:0]     pixel_data;
    reg                                         pixel_valid;
    
    integer                                     i;
    reg     signed  [SHADER_PARAM_WIDTH-1:0]    tmp_param;
    wire    signed  [SHADER_PARAM_WIDTH-1:0]    tmp_min = {1'b0, {DATA_WIDTH{1'b0}}};
    wire    signed  [SHADER_PARAM_WIDTH-1:0]    tmp_max = {1'b0, {DATA_WIDTH{1'b1}}};
    
    always @(posedge clk) begin
        if ( cke ) begin
            pixel_frame_start <= s_rasterizer_frame_start;
            pixel_line_end    <= s_rasterizer_line_end;
            pixel_data        <= s_rasterizer_bg_color;
            
            if ( reg_shadow_bg_mode == 1'b1 ) begin
                pixel_data <= reg_shadow_bg_color;
            end
            
            if ( s_rasterizer_polygon_enable ) begin
                for ( i = 0; i < COMPONENT_NUM; i = i+1 ) begin
                    tmp_param = s_rasterizer_shader_params[i*SHADER_PARAM_WIDTH +: SHADER_PARAM_WIDTH];
                    tmp_param = (tmp_param >>> (SHADER_PARAM_Q - DATA_WIDTH));
                    if ( tmp_param < tmp_min ) begin tmp_param = tmp_min; end
                    if ( tmp_param > tmp_max ) begin tmp_param = tmp_max; end
                    pixel_data[i*DATA_WIDTH +: DATA_WIDTH] <= tmp_param;
                end
            end
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            pixel_valid <= 1'b0;
        end
        else if ( cke ) begin
            pixel_valid <= s_rasterizer_valid;
        end
    end
    
    assign s_rasterizer_ready = cke;
    
    
    // -------------------------------------
    //  出力(ckeにFF挿入)
    // -------------------------------------
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (AXI4S_TUSER_WIDTH + 1 + AXI4S_TDATA_WIDTH),
                .SLAVE_REGS     (1),
                .MASTER_REGS    (1)
            )
        i_pipeline_insert_ff
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_data         ({
                                    pixel_frame_start,
                                    pixel_line_end,
                                    pixel_data
                                }),
                .s_valid        (pixel_valid),
                .s_ready        (cke),
                
                .m_data         ({
                                    m_axi4s_tuser,
                                    m_axi4s_tlast,
                                    m_axi4s_tdata
                                }),
                .m_valid        (m_axi4s_tvalid),
                .m_ready        (m_axi4s_tready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
endmodule


`default_nettype wire


// End of file
