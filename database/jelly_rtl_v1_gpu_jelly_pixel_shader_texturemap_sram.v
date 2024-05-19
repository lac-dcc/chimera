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


module jelly_pixel_shader_texturemap_sram
        #(
            parameter   COMPONENT_NUM      = 3,
            parameter   DATA_WIDTH         = 8,
            
            parameter   WB_ADR_WIDTH       = 8,
            parameter   WB_DAT_WIDTH       = 32,
            parameter   WB_SEL_WIDTH       = (WB_DAT_WIDTH / 8),
            
            parameter   AXI4S_TUSER_WIDTH  = 1,
            parameter   AXI4S_TDATA_WIDTH  = COMPONENT_NUM*DATA_WIDTH,
            
            parameter   INDEX_WIDTH        = 4,
            
            parameter   SHADER_PARAM_NUM   = COMPONENT_NUM,
            parameter   SHADER_PARAM_WIDTH = 32,
            parameter   SHADER_PARAM_Q     = 24,
            
            parameter   U_WIDTH            = SHADER_PARAM_Q,
            parameter   U_INT_WIDTH        = 8,
            parameter   U_FRAC_WIDTH       = U_WIDTH - U_INT_WIDTH,
            
            parameter   V_WIDTH            = SHADER_PARAM_Q,
            parameter   V_INT_WIDTH        = 8,
            parameter   V_FRAC_WIDTH       = U_WIDTH - U_INT_WIDTH,
            
            parameter   READMEMB           = 0,
            parameter   READMEMH           = 0,
            parameter   READMEM_FILE0      = "",
            parameter   READMEM_FILE1      = "",
            parameter   READMEM_FILE2      = "",
            parameter   READMEM_FILE3      = "",
            
            parameter   DEVICE             = "RTL",
            
            parameter   USE_PARAM_CFG_READ = 1,
            
            parameter   INIT_PARAM_BGC     = 24'h00_00_ff
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
            
            input   wire                                                mem_reset,
            input   wire                                                mem_clk,
            input   wire                                                mem_we,
            input   wire    [U_INT_WIDTH-1:0]                           mem_addrx,
            input   wire    [V_INT_WIDTH-1:0]                           mem_addry,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]              mem_wdata,
            
            input   wire                                                s_rasterizer_frame_start,
            input   wire                                                s_rasterizer_line_end,
            input   wire                                                s_rasterizer_polygon_enable,
            input   wire    [INDEX_WIDTH-1:0]                           s_rasterizer_polygon_index,
            input   wire    [SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:0]   s_rasterizer_shader_params,
            input   wire                                                s_rasterizer_valid,
            output  wire                                                s_rasterizer_ready,
            
            output  wire    [AXI4S_TUSER_WIDTH-1:0]                     m_axi4s_tuser,
            output  wire                                                m_axi4s_tlast,
            output  wire    [AXI4S_TDATA_WIDTH-1:0]                     m_axi4s_tdata,
            output  wire                                                m_axi4s_tstrb,
            output  wire                                                m_axi4s_tvalid,
            input   wire                                                m_axi4s_tready
        );
    
    
    // -------------------------------------
    //  レジスタ
    // -------------------------------------
    
    // アドレス
    localparam  REG_ADDR_PARAM_BGC              = 6'h00;
    localparam  REG_ADDR_CFG_SHADER_PARAM_NUM   = 6'h10;
    localparam  REG_ADDR_CFG_SHADER_PARAM_WIDTH = 6'h11;
    localparam  REG_ADDR_CFG_SHADER_PARAM_Q     = 6'h12;
    localparam  REG_ADDR_CFG_U_INT_WIDTH        = 6'h14;
    localparam  REG_ADDR_CFG_U_FRAC_WIDTH       = 6'h15;
    localparam  REG_ADDR_CFG_V_INT_WIDTH        = 6'h16;
    localparam  REG_ADDR_CFG_V_FRAC_WIDTH       = 6'h17;

    
    // 表レジスタ
    reg     [AXI4S_TDATA_WIDTH-1:0]         reg_param_bgc;
    
    // 裏レジスタ
    reg     [AXI4S_TDATA_WIDTH-1:0]         reg_shadow_bgc;
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_param_bgc <= INIT_PARAM_BGC;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                REG_ADDR_PARAM_BGC: reg_param_bgc <= s_wb_dat_i;
                endcase
            end
        end
    end
    
    reg     [WB_DAT_WIDTH-1:0]  tmp_wb_dat_o;
    always @* begin
        tmp_wb_dat_o = {WB_DAT_WIDTH{1'b0}};
        case ( s_wb_adr_i )
        REG_ADDR_PARAM_BGC:     tmp_wb_dat_o = reg_param_bgc;
        endcase
        
        if ( USE_PARAM_CFG_READ ) begin
            case ( s_wb_adr_i )
            REG_ADDR_CFG_SHADER_PARAM_NUM:      tmp_wb_dat_o = SHADER_PARAM_NUM;
            REG_ADDR_CFG_SHADER_PARAM_WIDTH:    tmp_wb_dat_o = SHADER_PARAM_WIDTH;
            REG_ADDR_CFG_SHADER_PARAM_Q:        tmp_wb_dat_o = SHADER_PARAM_Q;
            REG_ADDR_CFG_U_INT_WIDTH:           tmp_wb_dat_o = U_INT_WIDTH;
            REG_ADDR_CFG_U_FRAC_WIDTH:          tmp_wb_dat_o = U_FRAC_WIDTH;
            REG_ADDR_CFG_V_INT_WIDTH:           tmp_wb_dat_o = V_INT_WIDTH;
            REG_ADDR_CFG_V_FRAC_WIDTH:          tmp_wb_dat_o = V_FRAC_WIDTH;
            endcase
        end
    end
    
    assign s_wb_dat_o = tmp_wb_dat_o;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    // update_param信号の前後ではレジスタ変化が無い前提で非同期受け渡し
    always @(posedge clk ) begin
        if ( update ) begin
            reg_shadow_bgc <= reg_param_bgc;
        end
    end
    
    
    
    
    // -------------------------------------
    // パースペクティブコレクション
    // -------------------------------------
    
    wire                                        cke;
    
    wire                                        pc_frame_start;
    wire                                        pc_line_end;
    wire                                        pc_polygon_enable;
    wire            [INDEX_WIDTH-1:0]           pc_polygon_index;
    wire    signed  [SHADER_PARAM_WIDTH-1:0]    pc_u_tmp;
    wire    signed  [SHADER_PARAM_WIDTH-1:0]    pc_v_tmp;
    wire                                        pc_valid;
//  wire                                        pc_ready;
    
    wire    signed  [U_WIDTH-1:0]               pc_u = (pc_u_tmp >>> (SHADER_PARAM_Q - U_WIDTH));
    wire    signed  [V_WIDTH-1:0]               pc_v = (pc_v_tmp >>> (SHADER_PARAM_Q - V_WIDTH));
    
    jelly_fixed_matrix_divider
            #(
                .USER_WIDTH                 (3+INDEX_WIDTH),
                
                .NUM                        (SHADER_PARAM_NUM - 1),
                .S_DIVIDEND_INT_WIDTH       (SHADER_PARAM_WIDTH - SHADER_PARAM_Q),
                .S_DIVIDEND_FRAC_WIDTH      (SHADER_PARAM_Q),
                .S_DIVISOR_INT_WIDTH        (SHADER_PARAM_WIDTH - SHADER_PARAM_Q),
                .S_DIVISOR_FRAC_WIDTH       (SHADER_PARAM_Q),
                .M_QUOTIENT_INT_WIDTH       (SHADER_PARAM_WIDTH - SHADER_PARAM_Q),
                .M_QUOTIENT_FRAC_WIDTH      (SHADER_PARAM_Q),
                
                .DIVIDEND_FIXED_INT_WIDTH   (SHADER_PARAM_WIDTH - SHADER_PARAM_Q),
                .DIVIDEND_FIXED_FRAC_WIDTH  (SHADER_PARAM_Q),
                
                .DIVISOR_FLOAT_EXP_WIDTH    (6),
                .DIVISOR_FLOAT_FRAC_WIDTH   (16),
                
                .CLIP                       (1),
                
                .RAM_TYPE                   ("block"),
                
                .MASTER_IN_REGS             (0),
                .MASTER_OUT_REGS            (0),
                
                .DEVICE                     (DEVICE)
            )
        i_fixed_matrix_divider
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .s_user                     ({
                                                s_rasterizer_frame_start,
                                                s_rasterizer_line_end,
                                                s_rasterizer_polygon_enable,
                                                s_rasterizer_polygon_index
                                            }),
                .s_dividend                 (s_rasterizer_shader_params[SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:SHADER_PARAM_WIDTH]),
                .s_divisor                  (s_rasterizer_shader_params[SHADER_PARAM_WIDTH-1:0]),
                .s_valid                    (s_rasterizer_valid),
                .s_ready                    (),
                
                .m_user                     ({
                                                pc_frame_start,
                                                pc_line_end,
                                                pc_polygon_enable,
                                                pc_polygon_index
                                            }),
                .m_quotient                 ({pc_v_tmp, pc_u_tmp}),
                .m_valid                    (pc_valid),
                .m_ready                    (1'b1)
            );
    
    assign s_rasterizer_ready = cke;
    
    
    
    // -------------------------------------
    //  テクスチャメモリ
    // -------------------------------------
    
    wire                                        tex_frame_start;
    wire                                        tex_line_end;
    wire                                        tex_polygon_enable;
    wire    [INDEX_WIDTH-1:0]                   tex_polygon_index;
    wire    [U_FRAC_WIDTH-1:0]                  tex_u;
    wire    [V_FRAC_WIDTH-1:0]                  tex_v;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]      tex_data00;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]      tex_data01;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]      tex_data10;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]      tex_data11;
    wire                                        tex_valid;
//  wire                                        tex_ready;
    
    jelly_ram_quad_read
            #(
                .USER_WIDTH                 (3 + INDEX_WIDTH + V_FRAC_WIDTH + U_FRAC_WIDTH),
                .ADDR_X_WIDTH               (U_INT_WIDTH),
                .ADDR_Y_WIDTH               (V_INT_WIDTH),
                .DATA_WIDTH                 (COMPONENT_NUM*DATA_WIDTH),
                .RAM_TYPE                   ("block"),
                .DOUT_REGS                  (0),
                
                .READMEMB                   (READMEMB),
                .READMEMH                   (READMEMH),
                .READMEM_FILE0              (READMEM_FILE0),
                .READMEM_FILE1              (READMEM_FILE1),
                .READMEM_FILE2              (READMEM_FILE2),
                .READMEM_FILE3              (READMEM_FILE3)
            )
        i_ram_quad_read
            (
                .write_reset                (mem_reset),
                .write_clk                  (mem_clk),
                .write_we                   (mem_we),
                .write_addrx                (mem_addrx),
                .write_addry                (mem_addry),
                .write_data                 (mem_wdata),
                
                .read_reset                 (reset),
                .read_clk                   (clk),
                .read_cke                   (cke),
                
                .s_read_user                ({
                                                pc_frame_start,
                                                pc_line_end,
                                                pc_polygon_enable,
                                                pc_polygon_index,
                                                pc_u[U_FRAC_WIDTH-1:0],
                                                pc_v[V_FRAC_WIDTH-1:0]
                                            }),
                .s_read_addrx               (pc_u[U_FRAC_WIDTH +: U_INT_WIDTH]),
                .s_read_addry               (pc_v[V_FRAC_WIDTH +: V_INT_WIDTH]),
                .s_read_valid               (pc_valid),
                
                .m_read_user                ({
                                                tex_frame_start,
                                                tex_line_end,
                                                tex_polygon_enable,
                                                tex_polygon_index,
                                                tex_u,
                                                tex_v
                                            }),
                .m_read_data0               (tex_data00),
                .m_read_data1               (tex_data01),
                .m_read_data2               (tex_data10),
                .m_read_data3               (tex_data11),
                .m_read_valid               (tex_valid)
            );
    
    
    // -------------------------------------
    //  バイリニア
    // -------------------------------------
    
    wire    [0:0]                               axi4s_bilinear_tuser;
    wire    [INDEX_WIDTH-1:0]                   axi4s_bilinear_tindex;
    wire                                        axi4s_bilinear_tlast;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]      axi4s_bilinear_tdata;
    wire                                        axi4s_bilinear_tstrb;
    wire                                        axi4s_bilinear_tvalid;
    
    jelly_bilinear_axi4s
            #(
                .COMPONENT_NUM              (COMPONENT_NUM),
                .DATA_WIDTH                 (DATA_WIDTH),
                .TUSER_WIDTH                (2+INDEX_WIDTH),
                .TDATA_WIDTH                (COMPONENT_NUM*DATA_WIDTH),
                .X_WIDTH                    (U_FRAC_WIDTH),
                .Y_WIDTH                    (V_FRAC_WIDTH),
                .M_SLAVE_REGS               (0),
                .M_MASTER_REGS              (0)
            )
        i_bilinear_axi4s
            (
                .aresetn                    (~reset),
                .aclk                       (clk),
                .aclken                     (cke),
                
                .s_tuser                    ({tex_frame_start, tex_polygon_enable, tex_polygon_index}),
                .s_tlast                    (tex_line_end),
                .s_tx                       (tex_u),
                .s_ty                       (tex_v),
                .s_tdata00                  (tex_data00),
                .s_tdata01                  (tex_data01),
                .s_tdata10                  (tex_data10),
                .s_tdata11                  (tex_data11),
                .s_tvalid                   (tex_valid),
                .s_tready                   (),
                
                .m_tuser                    ({axi4s_bilinear_tuser, axi4s_bilinear_tstrb, axi4s_bilinear_tindex}),
                .m_tlast                    (axi4s_bilinear_tlast),
                .m_tdata                    (axi4s_bilinear_tdata),
                .m_tvalid                   (axi4s_bilinear_tvalid),
                .m_tready                   (1'b1)
            );
    
    
    // -------------------------------------
    //  バックグラウンド色設定
    // -------------------------------------
    
    reg     [0:0]                               axi4s_bgc_tuser;
    reg                                         axi4s_bgc_tlast;
    reg     [AXI4S_TDATA_WIDTH-1:0]             axi4s_bgc_tdata;
    reg                                         axi4s_bgc_tstrb;
    reg                                         axi4s_bgc_tvalid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            axi4s_bgc_tuser  <= 1'bx;
            axi4s_bgc_tlast  <= 1'bx;
            axi4s_bgc_tdata  <= {AXI4S_TDATA_WIDTH{1'bx}};
            axi4s_bgc_tstrb  <= 1'bx;
            axi4s_bgc_tvalid <= 1'b0;
        end
        else if ( cke ) begin
            axi4s_bgc_tuser  <= axi4s_bilinear_tuser;
            axi4s_bgc_tlast  <= axi4s_bilinear_tlast;
            axi4s_bgc_tdata  <= axi4s_bilinear_tstrb ? axi4s_bilinear_tdata : reg_shadow_bgc;
            axi4s_bgc_tstrb  <= axi4s_bilinear_tstrb;
            axi4s_bgc_tvalid <= axi4s_bilinear_tvalid;
        end
    end
    
    
    
    // -------------------------------------
    //  出力(ckeにFF挿入)
    // -------------------------------------
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (AXI4S_TUSER_WIDTH + 1 + 1 + AXI4S_TDATA_WIDTH),
                .SLAVE_REGS     (1),
                .MASTER_REGS    (1)
            )
        i_pipeline_insert_ff
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_data         ({
                                    axi4s_bgc_tuser,
                                    axi4s_bgc_tlast,
                                    axi4s_bgc_tstrb,
                                    axi4s_bgc_tdata
                                }),
                .s_valid        (axi4s_bgc_tvalid),
                .s_ready        (cke),
                
                .m_data         ({
                                    m_axi4s_tuser,
                                    m_axi4s_tlast,
                                    m_axi4s_tstrb,
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
