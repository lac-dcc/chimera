// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// 許可した分だけデータを通すゲート
// first や last は 上位次元でbitが立っているとき下位次元は必ず立っているとみなす



// 境界や個数でストリーム通過を制御
module jelly_stream_gate
        #(
            parameter N               = 1,          // 次元数(dimension)
            parameter BYPASS          = 0,          // バイパス
            parameter BYPASS_COMBINE  = 0,          // バイパス時にpermitもcombineするか
            parameter DETECTOR_ENABLE = 0,          // フラグ検出器(読み飛ばし/パディング)を使うか
            parameter AUTO_FIRST      = {N{1'b1}},  // lastの後を自動的にfirst扱いにする(first利用時にあえて無視したい場合に倒す)
            
            parameter DATA_WIDTH      = 32,
            parameter LEN_WIDTH       = 32,
            parameter LEN_OFFSET      = 1'b1,
            parameter USER_WIDTH      = 0,
            parameter S_REGS          = 1,
            parameter M_REGS          = 1,
            
            parameter ASYNC           = 0,
            parameter FIFO_PTR_WIDTH  = ASYNC ? 4 : 0,
            parameter FIFO_DOUT_REGS  = 0,
            parameter FIFO_RAM_TYPE   = "distributed",
            parameter FIFO_LOW_DEALY  = 1,
            parameter FIFO_S_REGS     = 0,
            parameter FIFO_M_REGS     = 0,
            
            
            // local
            parameter USER_BITS       = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        skip,           // 非busy時に読み飛ばす
            input   wire    [N-1:0]             detect_first,
            input   wire    [N-1:0]             detect_last,
            input   wire                        padding_en,
            input   wire    [DATA_WIDTH-1:0]    padding_data,
            
            input   wire    [N-1:0]             s_first,
            input   wire    [N-1:0]             s_last,
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [N-1:0]             m_first,
            output  wire    [N-1:0]             m_last,
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire                        m_valid,
            input   wire                        m_ready,
            
            
            input   wire                        s_permit_reset,
            input   wire                        s_permit_clk,
            input   wire    [N-1:0]             s_permit_first,
            input   wire    [N-1:0]             s_permit_last,
            input   wire    [LEN_WIDTH-1:0]     s_permit_len,
            input   wire    [USER_BITS-1:0]     s_permit_user,
            input   wire                        s_permit_valid,
            output  wire                        s_permit_ready
        );
    
    
    // clock convert
    wire    [N-1:0]             fifo_s_permit_first;
    wire    [N-1:0]             fifo_s_permit_last;
    wire    [LEN_WIDTH-1:0]     fifo_s_permit_len;
    wire    [USER_BITS-1:0]     fifo_s_permit_user;
    wire                        fifo_s_permit_valid;
    wire                        fifo_s_permit_ready;
    
    generate
    if ( !BYPASS || (BYPASS_COMBINE && ASYNC) ) begin : blk_async_fifo
        jelly_fifo_pack
                #(
                    .ASYNC              (ASYNC),
                    .DATA0_WIDTH        (N),
                    .DATA1_WIDTH        (N),
                    .DATA2_WIDTH        (LEN_WIDTH),
                    .DATA3_WIDTH        (USER_WIDTH),
                    
                    .PTR_WIDTH          (FIFO_PTR_WIDTH),
                    .DOUT_REGS          (FIFO_DOUT_REGS),
                    .RAM_TYPE           (FIFO_RAM_TYPE),
                    .LOW_DEALY          (FIFO_LOW_DEALY),
                    .S_REGS             (FIFO_S_REGS),
                    .M_REGS             (FIFO_M_REGS)
                )
            i_fifo_pack_sr
                (
                    .s_reset            (s_permit_reset),
                    .s_clk              (s_permit_clk),
                    .s_data0            (s_permit_first),
                    .s_data1            (s_permit_last),
                    .s_data2            (s_permit_len),
                    .s_data3            (s_permit_user),
                    .s_valid            (s_permit_valid),
                    .s_ready            (s_permit_ready),
                    
                    .m_reset            (reset),
                    .m_clk              (clk),
                    .m_data0            (fifo_s_permit_first),
                    .m_data1            (fifo_s_permit_last),
                    .m_data2            (fifo_s_permit_len),
                    .m_data3            (fifo_s_permit_user),
                    .m_valid            (fifo_s_permit_valid),
                    .m_ready            (fifo_s_permit_ready & cke)
                );
    end
    else begin : blk_sync
        assign fifo_s_permit_first = s_permit_first;
        assign fifo_s_permit_last  = s_permit_last;
        assign fifo_s_permit_len   = s_permit_len;
        assign fifo_s_permit_user  = s_permit_user;
        assign fifo_s_permit_valid = s_permit_valid;
        assign s_permit_ready      = fifo_s_permit_ready;
    end
    endgenerate
    
    
    
    generate
    if ( BYPASS ) begin : blk_bypass
        assign m_first             = s_first;
        assign m_last              = s_last;
        assign m_data              = s_data;
        assign m_user              = BYPASS_COMBINE ? (fifo_s_permit_user)              : {USER_BITS{1'bx}};
        assign m_valid             = BYPASS_COMBINE ? (s_valid & fifo_s_permit_valid)   : s_valid;
        assign s_ready             = BYPASS_COMBINE ? (m_ready & fifo_s_permit_valid)   : m_ready;
        assign fifo_s_permit_ready = BYPASS_COMBINE ? (m_ready & s_valid & s_last)      : 1'b1;
    end
    else begin : blk_gate
        // parameter
        wire                        param_skip         = skip;
        wire    [N-1:0]             param_detect_first = DETECTOR_ENABLE ? detect_first : {N{1'b0}};
        wire    [N-1:0]             param_detect_last  = DETECTOR_ENABLE ? detect_last  : {N{1'b0}};
        wire                        param_padding_en   = DETECTOR_ENABLE ? padding_en   : 1'b0;
        
        // insert FF
        wire    [N-1:0]             ff_s_first;
        wire    [N-1:0]             ff_s_last;
        wire    [DATA_WIDTH-1:0]    ff_s_data;
        wire                        ff_s_valid;
        wire                        ff_s_ready;
        
        wire    [N-1:0]             ff_m_first;
        wire    [N-1:0]             ff_m_last;
        wire    [DATA_WIDTH-1:0]    ff_m_data;
        wire    [USER_BITS-1:0]     ff_m_user;
        wire                        ff_m_valid;
        wire                        ff_m_ready;
        
        jelly_data_ff_pack
                #(
                    .DATA0_WIDTH    (N),
                    .DATA1_WIDTH    (N),
                    .DATA2_WIDTH    (DATA_WIDTH),
                    .S_REGS         (S_REGS),
                    .M_REGS         (0)
                )
            i_data_ff_pack_s
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data0        (s_first),
                    .s_data1        (s_last),
                    .s_data2        (s_data),
                    .s_valid        (s_valid),
                    .s_ready        (s_ready),
                    
                    .m_data0        (ff_s_first),
                    .m_data1        (ff_s_last),
                    .m_data2        (ff_s_data),
                    .m_valid        (ff_s_valid),
                    .m_ready        (ff_s_ready)
                );
        
        
        jelly_data_ff_pack
                #(
                    .DATA0_WIDTH    (N),
                    .DATA1_WIDTH    (N),
                    .DATA2_WIDTH    (DATA_WIDTH),
                    .DATA3_WIDTH    (USER_WIDTH),
                    .S_REGS         (0),
                    .M_REGS         (M_REGS)
                )
            i_data_ff_pack_m
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data0        (ff_m_first),
                    .s_data1        (ff_m_last),
                    .s_data2        (ff_m_data),
                    .s_data3        (ff_m_user),
                    .s_valid        (ff_m_valid),
                    .s_ready        (ff_m_ready),
                    
                    .m_data0        (m_first),
                    .m_data1        (m_last),
                    .m_data2        (m_data),
                    .m_data3        (m_user),
                    .m_valid        (m_valid),
                    .m_ready        (m_ready)
                );
        
        
        // auto first
        reg     [N-1:0]     reg_auto_first;
        always @(posedge clk) begin
            if ( reset ) begin
                reg_auto_first <= {N{1'b1}};
            end
            else begin
                if ( ff_s_valid && ff_s_ready ) begin
                    reg_auto_first <= (ff_s_last & param_detect_last) & AUTO_FIRST;
                end
            end
        end
        
        // flag detect
        wire    [N-1:0]     sig_s_first = ({N{ff_s_valid}} & ff_s_first & param_detect_first) | reg_auto_first;
        wire    [N-1:0]     sig_s_last  = ({N{ff_s_valid}} & ff_s_last  & param_detect_last);
        
        wire    [N-1:0]     param_detect_first2 = (param_detect_first | (detect_last & AUTO_FIRST));
        
        
        // len count
        reg                     reg_busy;
        reg     [LEN_WIDTH-1:0] reg_len;
        reg                     reg_end;
        always @(posedge clk) begin
            if ( reset ) begin
                reg_busy <= 1'b0;
                reg_len  <= {LEN_WIDTH{1'bx}};
                reg_end  <= 1'bx;
            end
            else if ( cke ) begin
                if ( ff_m_valid && ff_m_ready ) begin
                    if ( !reg_busy && (fifo_s_permit_len != (1'b1 - LEN_OFFSET)) ) begin
                        // 2個以上の転送ならカウント
                        reg_busy <= 1'b1;
                        reg_len  <= fifo_s_permit_len;
                        reg_end  <= (fifo_s_permit_len == (2'd2 - LEN_OFFSET));
                    end
                    else begin
                        reg_len  <= reg_len - 1'b1;
                        reg_end  <= (reg_len == (2'd3 - LEN_OFFSET));
                        if ( reg_end ) begin
                            reg_busy <= 1'b0;
                            reg_len  <= {LEN_WIDTH{1'bx}};
                            reg_end  <= 1'bx;
                        end
                    end
                end
            end
        end
        
        wire    sig_start = !reg_busy;
        wire    sig_end   = (!reg_busy && (fifo_s_permit_len == (1'b1 - LEN_OFFSET))) || (reg_busy && reg_end);
        
        wire    sig_start_overflow  = DETECTOR_ENABLE && sig_start && (param_detect_first2 & fifo_s_permit_first & ~sig_s_first); // 期待するfirstが来ていない(データ余り)
        wire    sig_start_underflow = DETECTOR_ENABLE && sig_start && (param_detect_first2 & ~fifo_s_permit_first & sig_s_first); // 期待するより先のfirstが来ている(データ不足)
        
        reg                     reg_underflow;
        always @(posedge clk) begin
            if ( reset ) begin
                reg_underflow <= 1'b0;
            end
            else if ( cke ) begin
                if ( ff_m_valid && ff_m_ready ) begin
                    if ( !sig_end && (sig_s_last != 0) ) begin
                        reg_underflow <= 1'b1;    // 末尾以外で last が来た(データ不足)
                    end
                    if ( sig_start_underflow ) begin
                        reg_underflow <= 1'b1;
                    end
                    if ( sig_end ) begin
                        reg_underflow <= 1'b0;
                    end
                end
            end
        end
        
        wire    sig_skip    = sig_start_overflow;
        wire    sig_padding = padding_en && (sig_start_underflow || reg_underflow);
        
        
        assign fifo_s_permit_ready = (ff_m_valid && ff_m_ready && sig_end);
        
        assign ff_s_ready = (fifo_s_permit_valid && ((ff_m_ready && !sig_padding) || sig_skip)) || (!fifo_s_permit_valid && skip);
        
        assign ff_m_first = sig_start   ? fifo_s_permit_first : {N{1'b0}};
        assign ff_m_last  = sig_end     ? fifo_s_permit_last  : {N{1'b0}};
        assign ff_m_data  = sig_padding ? padding_data      : ff_s_data;
        assign ff_m_user  = fifo_s_permit_user;
        assign ff_m_valid = fifo_s_permit_valid && ((ff_s_valid && !sig_skip) || sig_padding);
    end
    endgenerate
    
    
    
    // for simulation
    integer count_permit_len;
    always @(posedge s_permit_clk) begin
        if ( s_permit_reset ) begin
            count_permit_len <= 0;
        end
        else begin
            if ( s_permit_valid & s_permit_ready ) begin
                count_permit_len <= count_permit_len + s_permit_len + LEN_OFFSET;
            end
        end
    end
    
    integer count_s;
    integer count_m;
    always @(posedge clk) begin
        if ( reset ) begin
            count_s <= 0;
            count_m <= 0;
        end
        else if ( cke ) begin
            count_s <= count_s + s_valid && s_ready;
            count_m <= count_m + m_valid && m_ready;
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
