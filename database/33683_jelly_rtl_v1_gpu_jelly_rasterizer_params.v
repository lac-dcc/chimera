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


module jelly_rasterizer_params
        #(
            parameter   X_WIDTH             = 12,
            parameter   Y_WIDTH             = 12,
            
            parameter   WB_ADR_WIDTH        = 14,
            parameter   WB_DAT_WIDTH        = 32,
            parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8),
            
            parameter   BANK_NUM            = 2,
            parameter   BANK_ADDR_WIDTH     = 12,
            parameter   PARAMS_ADDR_WIDTH   = 10,
            parameter   SELECT_WIDTH        = 1,
            
            parameter   EDGE_NUM            = 12,
            parameter   POLYGON_NUM         = 6,
            parameter   SHADER_PARAM_NUM    = 3,
            
            parameter   EDGE_PARAM_WIDTH    = 32,
            parameter   EDGE_RAM_TYPE       = "distributed",
            
            parameter   SHADER_PARAM_WIDTH  = 32,
            parameter   SHADER_RAM_TYPE     = "distributed",
            
            parameter   REGION_PARAM_WIDTH  = EDGE_NUM,
            parameter   REGION_RAM_TYPE     = "distributed",
            
            parameter   USE_PARAM_CFG_READ  = 1,
            
            parameter   CFG_SHADER_TYPE     = 32'h0000_0000,
            parameter   CFG_VERSION         = 32'h0000_0000,
            parameter   CFG_CORE_ADDR_WIDTH = 14,
            
            parameter   INIT_CTL_ENABLE     = 1'b0,
            parameter   INIT_CTL_UPDATE     = 1'b0,
            parameter   INIT_PARAM_WIDTH    = 640-1,
            parameter   INIT_PARAM_HEIGHT   = 480-1,
            parameter   INIT_PARAM_CULLING  = 2'b01,
            parameter   INIT_PARAM_BANK     = 0,
            parameter   INIT_PARAM_SELECT   = 0,
            
            // local
            parameter   PARAMS_EDGE_SIZE   = EDGE_NUM*3,
            parameter   PARAMS_SHADER_SIZE = POLYGON_NUM*SHADER_PARAM_NUM*3,
            parameter   PARAMS_REGION_SIZE = POLYGON_NUM*2
        )
        (
            input   wire                                                reset,
            input   wire                                                clk,
            input   wire                                                cke,
            
            output  wire                                                start,
            output  wire                                                update,
            input   wire                                                busy,
            
            output  wire    [X_WIDTH-1:0]                               param_width,
            output  wire    [Y_WIDTH-1:0]                               param_height,
            output  wire    [1:0]                                       param_culling,
            output  wire    [SELECT_WIDTH-1:0]                          param_select,
            
            output  wire    [PARAMS_EDGE_SIZE*EDGE_PARAM_WIDTH-1:0]     params_edge,
            output  wire    [PARAMS_SHADER_SIZE*SHADER_PARAM_WIDTH-1:0] params_shader,
            output  wire    [PARAMS_REGION_SIZE*REGION_PARAM_WIDTH-1:0] params_region,
            
            input   wire                                                s_wb_rst_i,
            input   wire                                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]                          s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]                          s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]                          s_wb_dat_i,
            input   wire                                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]                          s_wb_sel_i,
            input   wire                                                s_wb_stb_i,
            output  wire                                                s_wb_ack_o
        );
    
    
    // 一部処理系で $clog2 が正しく動かないので
    localparam  BANK_WIDTH        = BANK_NUM           <=     1 ?  0 :
                                    BANK_NUM           <=     2 ?  1 :
                                    BANK_NUM           <=     4 ?  2 :
                                    BANK_NUM           <=     8 ?  3 :
                                    BANK_NUM           <=    16 ?  4 :
                                    BANK_NUM           <=    32 ?  5 :
                                    BANK_NUM           <=    64 ?  6 :
                                    BANK_NUM           <=   128 ?  7 :
                                    BANK_NUM           <=   256 ?  8 :
                                    BANK_NUM           <=   512 ?  9 :
                                    BANK_NUM           <=  1024 ? 10 :
                                    BANK_NUM           <=  2048 ? 11 :
                                    BANK_NUM           <=  4096 ? 12 :
                                    BANK_NUM           <=  8192 ? 13 :
                                    BANK_NUM           <= 16384 ? 14 :
                                    BANK_NUM           <= 32768 ? 15 : 16;
    
    localparam  BANK_BITS         = BANK_WIDTH > 0 ? BANK_WIDTH : 1;
    
    localparam  EDGE_ADDR_WIDTH   = PARAMS_EDGE_SIZE   <=     2 ?  1 :
                                    PARAMS_EDGE_SIZE   <=     4 ?  2 :
                                    PARAMS_EDGE_SIZE   <=     8 ?  3 :
                                    PARAMS_EDGE_SIZE   <=    16 ?  4 :
                                    PARAMS_EDGE_SIZE   <=    32 ?  5 :
                                    PARAMS_EDGE_SIZE   <=    64 ?  6 :
                                    PARAMS_EDGE_SIZE   <=   128 ?  7 :
                                    PARAMS_EDGE_SIZE   <=   256 ?  8 :
                                    PARAMS_EDGE_SIZE   <=   512 ?  9 :
                                    PARAMS_EDGE_SIZE   <=  1024 ? 10 :
                                    PARAMS_EDGE_SIZE   <=  2048 ? 11 :
                                    PARAMS_EDGE_SIZE   <=  4096 ? 12 :
                                    PARAMS_EDGE_SIZE   <=  8192 ? 13 :
                                    PARAMS_EDGE_SIZE   <= 16384 ? 14 :
                                    PARAMS_EDGE_SIZE   <= 32768 ? 15 : 16;
    
    localparam  SHADER_ADDR_WIDTH = PARAMS_SHADER_SIZE <=     2 ?  1 :
                                    PARAMS_SHADER_SIZE <=     4 ?  2 :
                                    PARAMS_SHADER_SIZE <=     8 ?  3 :
                                    PARAMS_SHADER_SIZE <=    16 ?  4 :
                                    PARAMS_SHADER_SIZE <=    32 ?  5 :
                                    PARAMS_SHADER_SIZE <=    64 ?  6 :
                                    PARAMS_SHADER_SIZE <=   128 ?  7 :
                                    PARAMS_SHADER_SIZE <=   256 ?  8 :
                                    PARAMS_SHADER_SIZE <=   512 ?  9 :
                                    PARAMS_SHADER_SIZE <=  1024 ? 10 :
                                    PARAMS_SHADER_SIZE <=  2048 ? 11 :
                                    PARAMS_SHADER_SIZE <=  4096 ? 12 :
                                    PARAMS_SHADER_SIZE <=  8192 ? 13 :
                                    PARAMS_SHADER_SIZE <= 16384 ? 14 :
                                    PARAMS_SHADER_SIZE <= 32768 ? 15 : 16;
    
    localparam  REGION_ADDR_WIDTH = PARAMS_REGION_SIZE <=     2 ?  1 :
                                    PARAMS_REGION_SIZE <=     4 ?  2 :
                                    PARAMS_REGION_SIZE <=     8 ?  3 :
                                    PARAMS_REGION_SIZE <=    16 ?  4 :
                                    PARAMS_REGION_SIZE <=    32 ?  5 :
                                    PARAMS_REGION_SIZE <=    64 ?  6 :
                                    PARAMS_REGION_SIZE <=   128 ?  7 :
                                    PARAMS_REGION_SIZE <=   256 ?  8 :
                                    PARAMS_REGION_SIZE <=   512 ?  9 :
                                    PARAMS_REGION_SIZE <=  1024 ? 10 :
                                    PARAMS_REGION_SIZE <=  2048 ? 11 :
                                    PARAMS_REGION_SIZE <=  4096 ? 12 :
                                    PARAMS_REGION_SIZE <=  8192 ? 13 :
                                    PARAMS_REGION_SIZE <= 16384 ? 14 :
                                    PARAMS_REGION_SIZE <= 32768 ? 15 : 16;
    
    
    
    // -----------------------------------------
    //  レジスタ
    // -----------------------------------------

    wire    [WB_DAT_WIDTH-1:0]  wb_regs_dat_o;
    wire                        wb_regs_stb_i;
    wire                        wb_regs_ack_o;
    
    
    // アドレス定義
    localparam  REG_ADDR_WIDTH                  = 6;
    
    localparam  REG_ADDR_CFG_SHADER_TYPE        = 32'h00;
    localparam  REG_ADDR_CFG_VERSION            = 32'h01;
    localparam  REG_ADDR_CFG_CORE_ADDR_WIDTH    = 32'h04;
    localparam  REG_ADDR_CFG_BANK_ADDR_WIDTH    = 32'h05;
    localparam  REG_ADDR_CFG_PARAMS_ADDR_WIDTH  = 32'h06;
    localparam  REG_ADDR_CFG_BANK_NUM           = 32'h07;
    localparam  REG_ADDR_CFG_EDGE_NUM           = 32'h08;
    localparam  REG_ADDR_CFG_POLYGON_NUM        = 32'h09;
    localparam  REG_ADDR_CFG_SHADER_PARAM_NUM   = 32'h0a;
    localparam  REG_ADDR_CFG_EDGE_PARAM_WIDTH   = 32'h0b;
    localparam  REG_ADDR_CFG_SHADER_PARAM_WIDTH = 32'h0c;
    localparam  REG_ADDR_CFG_REGION_PARAM_WIDTH = 32'h0d;
    
    localparam  REG_ADDR_CTL_ENABLE             = 32'h20;
    localparam  REG_ADDR_CTL_UPDATE             = 32'h21;
    localparam  REG_ADDR_PARAM_WIDTH            = 32'h22;
    localparam  REG_ADDR_PARAM_HEIGHT           = 32'h23;
    localparam  REG_ADDR_PARAM_CULLING          = 32'h24;
    localparam  REG_ADDR_PARAM_BANK             = 32'h28;
    localparam  REG_ADDR_PARAM_SELECT           = 32'h29;
    
    
    // 制御レジスタ
    reg                         reg_ctl_enable;
    reg                         reg_ctl_update;
    
    // パラメータ(表)
    reg     [X_WIDTH-1:0]       reg_param_width;
    reg     [Y_WIDTH-1:0]       reg_param_height;
    reg     [1:0]               reg_param_culling;
    reg     [BANK_BITS-1:0]     reg_param_bank;
    reg     [SELECT_WIDTH-1:0]  reg_param_select;
    
    // パラメータ(裏)
    reg     [X_WIDTH-1:0]       reg_shadow_width;
    reg     [Y_WIDTH-1:0]       reg_shadow_height;
    reg     [1:0]               reg_shadow_culling;
    reg     [BANK_BITS-1:0]     reg_shadow_bank;
    reg     [SELECT_WIDTH-1:0]  reg_shadow_select;
    
    // 非同期ラッチ(パラメータの更新完了を受け取る)
    wire                        update_ack;
    
    (* ASYNC_REG="true" *)  reg     ff0_update_ack, ff1_update_ack, ff2_update_ack;
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            ff0_update_ack <= 1'b0;
            ff1_update_ack <= 1'b0;
            ff2_update_ack <= 1'b0;
        end
        else begin
            ff0_update_ack   <= update_ack;
            ff1_update_ack   <= ff0_update_ack;
            ff2_update_ack   <= ff1_update_ack;
        end
    end
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_enable    <= INIT_CTL_ENABLE;
            reg_ctl_update    <= INIT_CTL_UPDATE;
            reg_param_width   <= INIT_PARAM_WIDTH;
            reg_param_height  <= INIT_PARAM_HEIGHT;
            reg_param_culling <= INIT_PARAM_CULLING;
            reg_param_bank    <= INIT_PARAM_BANK;
            reg_param_select  <= INIT_PARAM_SELECT;
        end
        else begin
            if ( ff1_update_ack != ff2_update_ack ) begin
                reg_ctl_update <= 1'b0;
            end
            
            if ( wb_regs_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i[REG_ADDR_WIDTH-1:0] )
                REG_ADDR_CTL_ENABLE:    reg_ctl_enable    <= s_wb_dat_i;
                REG_ADDR_CTL_UPDATE:    reg_ctl_update    <= s_wb_dat_i;
                REG_ADDR_PARAM_WIDTH:   reg_param_width   <= s_wb_dat_i;
                REG_ADDR_PARAM_HEIGHT:  reg_param_height  <= s_wb_dat_i;
                REG_ADDR_PARAM_CULLING: reg_param_culling <= s_wb_dat_i;
                REG_ADDR_PARAM_BANK:    reg_param_bank    <= s_wb_dat_i;
                REG_ADDR_PARAM_SELECT:  reg_param_select  <= s_wb_dat_i;
                endcase
            end
            
            // バンク無しなら値を固定(合成で消される)
            if ( BANK_WIDTH == 0 ) begin
                reg_param_bank <= INIT_PARAM_BANK;
            end
        end
    end
    
    reg     [WB_DAT_WIDTH-1:0]  tmp_wb_regs_dat_o;
    always @* begin
        tmp_wb_regs_dat_o = {WB_DAT_WIDTH{1'b0}};
        
        if ( USE_PARAM_CFG_READ ) begin
            case ( s_wb_adr_i[REG_ADDR_WIDTH-1:0] )
            REG_ADDR_CFG_SHADER_TYPE:           tmp_wb_regs_dat_o = CFG_SHADER_TYPE;
            REG_ADDR_CFG_VERSION:               tmp_wb_regs_dat_o = CFG_VERSION;
            REG_ADDR_CFG_CORE_ADDR_WIDTH:       tmp_wb_regs_dat_o = CFG_CORE_ADDR_WIDTH;
            REG_ADDR_CFG_BANK_ADDR_WIDTH:       tmp_wb_regs_dat_o = BANK_ADDR_WIDTH;
            REG_ADDR_CFG_PARAMS_ADDR_WIDTH:     tmp_wb_regs_dat_o = PARAMS_ADDR_WIDTH;
            REG_ADDR_CFG_BANK_NUM:              tmp_wb_regs_dat_o = BANK_NUM;
            REG_ADDR_CFG_EDGE_NUM:              tmp_wb_regs_dat_o = EDGE_NUM;
            REG_ADDR_CFG_POLYGON_NUM:           tmp_wb_regs_dat_o = POLYGON_NUM;
            REG_ADDR_CFG_SHADER_PARAM_NUM:      tmp_wb_regs_dat_o = SHADER_PARAM_NUM;
            REG_ADDR_CFG_EDGE_PARAM_WIDTH:      tmp_wb_regs_dat_o = EDGE_PARAM_WIDTH;
            REG_ADDR_CFG_SHADER_PARAM_WIDTH:    tmp_wb_regs_dat_o = SHADER_PARAM_WIDTH;
            REG_ADDR_CFG_REGION_PARAM_WIDTH:    tmp_wb_regs_dat_o = REGION_PARAM_WIDTH;
            endcase
        end
        
        case ( s_wb_adr_i[REG_ADDR_WIDTH-1:0] )
        REG_ADDR_CTL_ENABLE:    tmp_wb_regs_dat_o = reg_ctl_enable;
        REG_ADDR_CTL_UPDATE:    tmp_wb_regs_dat_o = reg_ctl_update;
        REG_ADDR_PARAM_WIDTH:   tmp_wb_regs_dat_o = reg_param_width;
        REG_ADDR_PARAM_HEIGHT:  tmp_wb_regs_dat_o = reg_param_height;
        REG_ADDR_PARAM_CULLING: tmp_wb_regs_dat_o = reg_param_culling;
        REG_ADDR_PARAM_BANK:    tmp_wb_regs_dat_o = reg_param_bank;
        REG_ADDR_PARAM_SELECT:  tmp_wb_regs_dat_o = reg_param_select;
        endcase
        
    end
    
    assign wb_regs_dat_o = tmp_wb_regs_dat_o;
    assign wb_regs_ack_o = wb_regs_stb_i;
    
    
    // update_param信号の前後ではレジスタ変化が無い前提で非同期受け渡し
    always @(posedge clk ) begin
        if ( update ) begin
            reg_shadow_width   <= reg_param_width;
            reg_shadow_height  <= reg_param_height;
            reg_shadow_culling <= reg_param_culling;
            reg_shadow_bank    <= reg_param_bank;
            reg_shadow_select  <= reg_param_select;
        end
    end
    
    assign param_width   = reg_shadow_width;
    assign param_height  = reg_shadow_height;
    assign param_culling = reg_shadow_culling;
    assign param_select  = reg_shadow_select;
    
    
    
    // -----------------------------------------
    //  エッジ判定器用ラスタライザパラメータ
    // -----------------------------------------
    
    wire    [WB_DAT_WIDTH-1:0]  wb_edge_dat_o;
    wire                        wb_edge_stb_i;
    wire                        wb_edge_ack_o;
    
    wire                        edge_busy;
    
    jelly_params_ram
            #(
                .NUM            (PARAMS_EDGE_SIZE),
                .ADDR_WIDTH     (EDGE_ADDR_WIDTH),
                .DATA_WIDTH     (EDGE_PARAM_WIDTH),
                .BANK_NUM       (BANK_NUM),
                .WRITE_ONLY     (1),
                .MEM_DOUT_REGS  (0),
                .RD_DOUT_REGS   (1),
                .RAM_TYPE       (EDGE_RAM_TYPE),
                .ENDIAN         (0)
            )
        i_params_ram_edge
            (
                .reset          (reset),
                .clk            (clk),
                
                .start          (update),
                .busy           (edge_busy),
                
                .bank           (reg_shadow_bank),
                .params         (params_edge),
                
                .mem_clk        (s_wb_clk_i),
                .mem_en         (wb_edge_stb_i),
                .mem_regcke     (1'b0),
                .mem_we         (s_wb_we_i),
                .mem_bank       (s_wb_adr_i[BANK_ADDR_WIDTH +: BANK_BITS]),
                .mem_addr       (s_wb_adr_i[EDGE_ADDR_WIDTH-1:0]),
                .mem_din        (s_wb_dat_i),
                .mem_dout       ()
            );
    
    assign wb_edge_dat_o = {WB_DAT_WIDTH{1'b0}};
    assign wb_edge_ack_o = wb_edge_stb_i;
    
    
    // シェーダーパラメータ用ラスタライザパラメータ
    wire    [WB_DAT_WIDTH-1:0]  wb_shader_dat_o;
    wire                        wb_shader_stb_i;
    wire                        wb_shader_ack_o;
    
    wire                        shader_busy;
    
    jelly_params_ram
            #(
                .NUM            (PARAMS_SHADER_SIZE),
                .ADDR_WIDTH     (SHADER_ADDR_WIDTH),
                .DATA_WIDTH     (SHADER_PARAM_WIDTH),
                .BANK_NUM       (BANK_NUM),
                .WRITE_ONLY     (1),
                .MEM_DOUT_REGS  (0),
                .RD_DOUT_REGS   (1),
                .RAM_TYPE       (SHADER_RAM_TYPE),
                .ENDIAN         (0)
            )
        i_params_ram_shader
            (
                .reset          (reset),
                .clk            (clk),
                
                .start          (update),
                .busy           (shader_busy),
                
                .bank           (reg_shadow_bank),
                .params         (params_shader),
                
                .mem_clk        (s_wb_clk_i),
                .mem_en         (wb_shader_stb_i),
                .mem_regcke     (1'b0),
                .mem_we         (s_wb_we_i),
                .mem_bank       (s_wb_adr_i[BANK_ADDR_WIDTH +: BANK_BITS]),
                .mem_addr       (s_wb_adr_i[SHADER_ADDR_WIDTH-1:0]),
                .mem_din        (s_wb_dat_i),
                .mem_dout       ()
            );
    
    assign wb_shader_dat_o = {WB_DAT_WIDTH{1'b0}};
    assign wb_shader_ack_o = wb_shader_stb_i;
    
    
    // ポリゴン領域判定用パラメータ
    wire    [WB_DAT_WIDTH-1:0]  wb_region_dat_o;
    wire                        wb_region_stb_i;
    wire                        wb_region_ack_o;
    
    wire                        region_busy;
    
    jelly_params_ram
            #(
                .NUM            (PARAMS_REGION_SIZE),
                .ADDR_WIDTH     (REGION_ADDR_WIDTH),
                .DATA_WIDTH     (REGION_PARAM_WIDTH),
                .WRITE_ONLY     (1),
                .MEM_DOUT_REGS  (0),
                .RD_DOUT_REGS   (1),
                .RAM_TYPE       (REGION_RAM_TYPE),
                .ENDIAN         (0)
            )
        i_params_ram_region
            (
                .reset          (reset),
                .clk            (clk),
                
                .start          (update),
                .busy           (region_busy),
                
                .bank           (reg_shadow_bank),
                .params         (params_region),
                
                .mem_clk        (s_wb_clk_i),
                .mem_en         (wb_region_stb_i),
                .mem_regcke     (1'b0),
                .mem_we         (s_wb_we_i),
                .mem_bank       (s_wb_adr_i[BANK_ADDR_WIDTH +: BANK_BITS]),
                .mem_addr       (s_wb_adr_i[REGION_ADDR_WIDTH-1:0]),
                .mem_din        (s_wb_dat_i[REGION_PARAM_WIDTH-1:0]),
                .mem_dout       ()
            );
    
    assign wb_region_dat_o = {WB_DAT_WIDTH{1'b0}};
    assign wb_region_ack_o = wb_region_stb_i;
    
    
    // busy (一番遅いものを基準にする)
    wire    params_busy = (PARAMS_EDGE_SIZE   >= PARAMS_SHADER_SIZE && PARAMS_EDGE_SIZE   >= PARAMS_REGION_SIZE) ? edge_busy   :
                          (PARAMS_SHADER_SIZE >= PARAMS_EDGE_SIZE   && PARAMS_SHADER_SIZE >= PARAMS_REGION_SIZE) ? shader_busy :
                          region_busy;
    
    
    
    // 非同期ラッチ
    (* ASYNC_REG="true" *)  reg     ff0_ctl_enable, ff1_ctl_enable;
    (* ASYNC_REG="true" *)  reg     ff0_ctl_update, ff1_ctl_update;
    always @(posedge clk) begin
        if ( reset ) begin
            ff0_ctl_enable <= INIT_CTL_ENABLE;
            ff1_ctl_enable <= INIT_CTL_ENABLE;
            
            ff0_ctl_update <= INIT_CTL_UPDATE;
            ff1_ctl_update <= INIT_CTL_UPDATE;
        end
        else begin
            ff0_ctl_enable <= reg_ctl_enable;
            ff1_ctl_enable <= ff0_ctl_enable;
            
            ff0_ctl_update <= reg_ctl_update;
            ff1_ctl_update <= ff0_ctl_update;
        end
    end
    
    
    // ステートマシン
    localparam  ST_IDLE         = 4'b0000;
    localparam  ST_UPDATE_START = 4'b1001;
    localparam  ST_UPDATE_BUSY  = 4'b1100;
    localparam  ST_CORE_START   = 4'b1010;
    localparam  ST_CORE_BUSY    = 4'b1000;
    
    reg     [3:0]               reg_state;
    reg                         reg_update_ack;
    
    assign update = reg_state[0];
    assign start  = reg_state[1];
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_state      <= ST_IDLE;
            reg_update_ack <= 1'b0;
        end
        else if ( cke ) begin
            case ( reg_state )
            ST_IDLE:
                begin
                    if ( ff1_ctl_enable ) begin
                        if ( ff0_ctl_update ) begin
                            reg_state <= ST_UPDATE_START;
                        end
                        else begin
                            reg_state <= ST_CORE_START;
                        end
                    end
                end
                
            ST_UPDATE_START:
                begin
                    reg_state <= ST_UPDATE_BUSY;
                end
                
            ST_UPDATE_BUSY:
                begin
                    if ( !params_busy ) begin
                        reg_state      <= ST_CORE_START;
                        reg_update_ack <= ~reg_update_ack;
                    end
                end
                
            ST_CORE_START:
                begin
                    reg_state <= ST_CORE_BUSY;
                end
            
            ST_CORE_BUSY:
                begin
                    if ( !busy ) begin
                        reg_state <= ST_IDLE;
                    end
                end
            
            default:
                begin
                    reg_state      <= 4'bxxxx;
                    reg_update_ack <= 1'bx;
                end
            endcase
        end
    end
    
    assign update_ack = reg_update_ack;
    
    
    
    // WISHBONE addr decode
    assign wb_regs_stb_i   = s_wb_stb_i && (s_wb_adr_i[PARAMS_ADDR_WIDTH +: 2] == 2'b00);
    assign wb_edge_stb_i   = s_wb_stb_i && (s_wb_adr_i[PARAMS_ADDR_WIDTH +: 2] == 2'b01);
    assign wb_shader_stb_i = s_wb_stb_i && (s_wb_adr_i[PARAMS_ADDR_WIDTH +: 2] == 2'b10);
    assign wb_region_stb_i = s_wb_stb_i && (s_wb_adr_i[PARAMS_ADDR_WIDTH +: 2] == 2'b11);
    
    assign s_wb_dat_o      = wb_regs_stb_i   ? wb_regs_dat_o   :
                             wb_edge_stb_i   ? wb_edge_dat_o   :
                             wb_shader_stb_i ? wb_shader_dat_o :
                             wb_region_stb_i ? wb_region_dat_o :
                             0;
    
    assign s_wb_ack_o      = wb_regs_stb_i   ? wb_regs_ack_o   :
                             wb_edge_stb_i   ? wb_edge_ack_o   :
                             wb_shader_stb_i ? wb_shader_ack_o :
                             wb_region_stb_i ? wb_region_ack_o :
                             s_wb_stb_i;
    
    
    
endmodule


`default_nettype wire


// End of file
