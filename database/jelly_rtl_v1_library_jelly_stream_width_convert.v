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



module jelly_stream_width_convert
        #(
            parameter UNIT_WIDTH          = 8,
            parameter S_NUM               = 1,
            parameter M_NUM               = 1,
            parameter HAS_FIRST           = 0,                          // first を備える
            parameter HAS_LAST            = 0,                          // last を備える
            parameter HAS_STRB            = 0,                          // strb を備える
            parameter HAS_KEEP            = 0,                          // keep を備える
            parameter AUTO_FIRST          = !HAS_FIRST,                 // last の次を自動的に first とする
            parameter HAS_ALIGN_S         = 0,                          // slave 側のアライメントを指定する
            parameter HAS_ALIGN_M         = 0,                          // master 側のアライメントを指定する
            parameter FIRST_OVERWRITE     = 0,  // first時前方に残変換があれば吐き出さずに上書き
            parameter FIRST_FORCE_LAST    = 1,  // first時前方に残変換があれば強制的にlastを付与(残が無い場合はlastはつかない)
            parameter REDUCE_KEEP         = 0,
            parameter ALIGN_S_WIDTH       = S_NUM <=   2 ? 1 :
                                            S_NUM <=   4 ? 2 :
                                            S_NUM <=   8 ? 3 :
                                            S_NUM <=  16 ? 4 :
                                            S_NUM <=  32 ? 5 :
                                            S_NUM <=  64 ? 6 :
                                            S_NUM <= 128 ? 7 :
                                            S_NUM <= 256 ? 8 :
                                            S_NUM <= 512 ? 9 : 10,
            parameter ALIGN_M_WIDTH       = M_NUM <=   2 ? 1 :
                                            M_NUM <=   4 ? 2 :
                                            M_NUM <=   8 ? 3 :
                                            M_NUM <=  16 ? 4 :
                                            M_NUM <=  32 ? 5 :
                                            M_NUM <=  64 ? 6 :
                                            M_NUM <= 128 ? 7 :
                                            M_NUM <= 256 ? 8 :
                                            M_NUM <= 512 ? 9 : 10,
            parameter USER_F_WIDTH        = 0,
            parameter USER_L_WIDTH        = 0,
            parameter S_REGS              = 1,
            parameter M_REGS              = 1,
            
            // local
            parameter S_DATA_WIDTH        = S_NUM*UNIT_WIDTH,
            parameter M_DATA_WIDTH        = M_NUM*UNIT_WIDTH,
            parameter USER_F_BITS         = USER_F_WIDTH > 0 ? USER_F_WIDTH : 1,
            parameter USER_L_BITS         = USER_L_WIDTH > 0 ? USER_L_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        endian,
            input   wire    [UNIT_WIDTH-1:0]    padding,
            
            input   wire    [ALIGN_S_WIDTH-1:0] s_align_s,
            input   wire    [ALIGN_M_WIDTH-1:0] s_align_m,
            input   wire                        s_first,        // アライメント先頭
            input   wire                        s_last,         // アライメント末尾
            input   wire    [S_DATA_WIDTH-1:0]  s_data,
            input   wire    [S_NUM-1:0]         s_strb,
            input   wire    [S_NUM-1:0]         s_keep,
            input   wire    [USER_F_BITS-1:0]   s_user_f,       // アライメント先頭前提で伝搬するユーザーデータ
            input   wire    [USER_L_BITS-1:0]   s_user_l,       // アライメント末尾前提で伝搬するユーザーデータ
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire                        m_first,
            output  wire                        m_last,
            output  wire    [M_DATA_WIDTH-1:0]  m_data,
            output  wire    [M_NUM-1:0]         m_strb,
            output  wire    [M_NUM-1:0]         m_keep,
            output  wire    [USER_F_BITS-1:0]   m_user_f,
            output  wire    [USER_L_BITS-1:0]   m_user_l,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    // -----------------------------------------
    //  localparam
    // -----------------------------------------
    
    localparam  BUF_NUM     = S_NUM != M_NUM ? (S_NUM + M_NUM - 1) : S_NUM;
    localparam  BUF_WIDTH   = BUF_NUM * UNIT_WIDTH;
    localparam  COUNT_WIDTH = BUF_NUM <     2 ?  1 :
                              BUF_NUM <     4 ?  2 :
                              BUF_NUM <     8 ?  3 :
                              BUF_NUM <    16 ?  4 :
                              BUF_NUM <    32 ?  5 :
                              BUF_NUM <    64 ?  6 :
                              BUF_NUM <   128 ?  7 :
                              BUF_NUM <   256 ?  8 :
                              BUF_NUM <   512 ?  9 :
                              BUF_NUM <  1024 ? 10 :
                              BUF_NUM <  2048 ? 11 :
                              BUF_NUM <  4096 ? 12 :
                              BUF_NUM <  8192 ? 13 :
                              BUF_NUM < 16384 ? 14 :
                              BUF_NUM < 32768 ? 15 : 16;
    
    
    
    // -----------------------------------------
    //  functions
    // -----------------------------------------
     
    // strb to data
    function [BUF_WIDTH-1:0] strb_to_data(
                                        input [BUF_NUM-1:0] strb
                                    );
    integer i;
    begin
        for ( i = 0; i < BUF_WIDTH; i = i+1 ) begin
            strb_to_data[i] = strb[i/UNIT_WIDTH];
        end
    end
    endfunction
    
    
    // set data
    function [BUF_WIDTH-1:0] set_data(
                                        input                       endian,
                                        input [BUF_WIDTH-1:0]       orgn,
                                        input [S_DATA_WIDTH-1:0]    data,
                                        input [COUNT_WIDTH-1:0]     position
                                    );
    integer     i;
    begin
        set_data = orgn;
        for ( i = 0; i < S_DATA_WIDTH; i = i+1 ) begin
            if ( endian ) begin
                set_data[(BUF_WIDTH-1) - (position * UNIT_WIDTH + i)] = data[S_DATA_WIDTH-1 - i];
            end
            else begin
                set_data[position* UNIT_WIDTH + i] = data[i];
            end
        end
    end
    endfunction
    
    // set strb
    function [BUF_NUM-1:0]  set_strb(
                                        input                       endian,
                                        input [BUF_NUM-1:0]         orgn,
                                        input [S_NUM-1:0]           strb,
                                        input [COUNT_WIDTH-1:0]     position
                                    );
    integer     i;
    begin
        set_strb = orgn;
        for ( i = 0; i < S_NUM; i = i+1 ) begin
            if ( endian ) begin
                set_strb[(BUF_NUM-1) - (position + i)] = strb[S_NUM-1 - i];
            end
            else begin
                set_strb[position + i] = strb[i];
            end
        end
    end
    endfunction
    
    
    // get data
    function [M_DATA_WIDTH-1:0] get_data(
                                        input                       endian,
                                        input [BUF_WIDTH-1:0]       data,
                                        input [COUNT_WIDTH-1:0]     position
                                    );
    integer i;
    begin
        get_data = {M_DATA_WIDTH{1'b0}};
        for ( i = 0; i < M_DATA_WIDTH; i = i+1 ) begin
            if ( position*UNIT_WIDTH + i < BUF_WIDTH ) begin
                if ( endian ) begin
                    get_data[M_DATA_WIDTH-1 - i] = data[BUF_WIDTH-1 - (position*UNIT_WIDTH + i)];
                end
                else begin
                    get_data[i] = data[position*UNIT_WIDTH + i];
                end
            end
        end
    end
    endfunction
    
    // get strb
    function [M_NUM-1:0]  get_strb(
                                        input                       endian,
                                        input [BUF_NUM-1:0]         strb,
                                        input [COUNT_WIDTH-1:0]     position
                                    );
    integer i;
    begin
        get_strb = {M_NUM{1'b0}};
        for ( i = 0; i < M_NUM; i = i+1 ) begin
            if ( position + i < BUF_NUM ) begin
                if ( endian ) begin
                    get_strb[M_NUM-1 - i] = strb[BUF_NUM-1 - (position + i)];
                end
                else begin
                    get_strb[i] = strb[position + i];
                end
            end
        end
    end
    endfunction
    
    
    // shift strb
    function [BUF_NUM-1:0]  shift_strb(
                                        input                       endian,
                                        input [BUF_NUM-1:0]         strb,
                                        input [COUNT_WIDTH-1:0]     count
                                    );
    begin
        if ( endian ) begin
            shift_strb = (strb << count);
        end
        else begin
            shift_strb = (strb >> count);
        end
    end
    endfunction
    
    // shift data
    function [BUF_WIDTH-1:0]  shift_data(
                                        input                       endian,
                                        input [BUF_WIDTH-1:0]       data,
                                        input [COUNT_WIDTH-1:0]     count
                                    );
    begin
        if ( endian ) begin
            shift_data = (data << (count * UNIT_WIDTH));
        end
        else begin
            shift_data = (data >> (count * UNIT_WIDTH));
        end
    end
    endfunction
    
    
    
    // data strb
    function [M_DATA_WIDTH-1:0]  strb_data(
                                        input [M_DATA_WIDTH-1:0]    orgn,
                                        input [M_DATA_WIDTH-1:0]    data,
                                        input [M_NUM-1:0]           strb
                                    );
    integer i;
    begin
        for ( i = 0; i < M_DATA_WIDTH; i = i+1 ) begin
            strb_data[i] = strb[i/UNIT_WIDTH] ? data[i] : orgn[i];
        end
    end
    endfunction
    
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    // auto first flag
    reg     reg_auto_first;
    always @(posedge clk ) begin
        if ( reset ) begin
            reg_auto_first <= 1'b1;
        end
        else if ( cke ) begin
            if ( s_valid && s_ready ) begin
                reg_auto_first <= (HAS_LAST && s_last);
            end
        end
    end
    wire    auto_first = (AUTO_FIRST && HAS_LAST && reg_auto_first);
    
    
    wire    [S_DATA_WIDTH-1:0]      ff_s_data;
    wire    [S_NUM-1:0]             ff_s_strb;
    wire    [S_NUM-1:0]             ff_s_keep;
    wire    [USER_F_BITS-1:0]       ff_s_user_f;
    wire    [USER_L_BITS-1:0]       ff_s_user_l;
    wire                            ff_s_first;
    wire                            ff_s_last;
    wire    [ALIGN_S_WIDTH-1:0]     ff_s_align_s;
    wire    [ALIGN_M_WIDTH-1:0]     ff_s_align_m;
    wire                            ff_s_valid;
    wire                            ff_s_ready;
    
    jelly_data_ff_pack
            #(
                .DATA0_WIDTH    (S_DATA_WIDTH),
                .DATA1_WIDTH    (S_NUM),
                .DATA2_WIDTH    (S_NUM),
                .DATA3_WIDTH    (USER_F_WIDTH),
                .DATA4_WIDTH    (USER_L_WIDTH),
                .DATA5_WIDTH    (1),
                .DATA6_WIDTH    (1),
                .DATA7_WIDTH    (ALIGN_S_WIDTH),
                .DATA8_WIDTH    (ALIGN_M_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (1)
            )
        i_data_ff_pack_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (s_data),
                .s_data1        (HAS_STRB ? s_strb : {S_NUM{1'b1}}),
                .s_data2        (HAS_KEEP ? s_keep : {S_NUM{1'b1}}),
                .s_data3        (s_user_f),
                .s_data4        (s_user_l),
                .s_data5        ((HAS_FIRST  ? s_first   : 1'b0) | auto_first),
                .s_data6        (HAS_LAST    ? s_last    : 1'b0),
                .s_data7        (HAS_ALIGN_S ? s_align_s : {ALIGN_S_WIDTH{1'b0}}),
                .s_data8        (HAS_ALIGN_M ? s_align_m : {ALIGN_M_WIDTH{1'b0}}),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data0        (ff_s_data),
                .m_data1        (ff_s_strb),
                .m_data2        (ff_s_keep),
                .m_data3        (ff_s_user_f),
                .m_data4        (ff_s_user_l),
                .m_data5        (ff_s_first),
                .m_data6        (ff_s_last),
                .m_data7        (ff_s_align_s),
                .m_data8        (ff_s_align_m),
                .m_valid        (ff_s_valid),
                .m_ready        (ff_s_ready)
            );
    
    
    
    // -----------------------------------------
    //  stage0 alignment
    // -----------------------------------------
    
    // alignment
    wire    [S_DATA_WIDTH-1:0]      st0_data;
    wire    [S_NUM-1:0]             st0_strb;
    wire    [S_NUM-1:0]             st0_keep;
    wire    [USER_F_BITS-1:0]       st0_user_f;
    wire    [USER_L_BITS-1:0]       st0_user_l;
    wire                            st0_first;
    wire                            st0_last;
    wire    [COUNT_WIDTH-1:0]       st0_count;
    wire                            st0_valid;
    wire                            st0_ready;
    
    generate
    if ( HAS_ALIGN_S || HAS_ALIGN_M ) begin : st0_align
        reg     [S_DATA_WIDTH-1:0]      tmp_data;
        reg     [S_NUM-1:0]             tmp_strb;
        reg     [S_NUM-1:0]             tmp_keep;
        
        reg     [S_DATA_WIDTH-1:0]      reg_data;
        reg     [S_NUM-1:0]             reg_strb;
        reg     [S_NUM-1:0]             reg_keep;
        reg     [USER_F_BITS-1:0]       reg_user_f;
        reg     [USER_L_BITS-1:0]       reg_user_l;
        reg                             reg_first;
        reg                             reg_last;
        reg     [COUNT_WIDTH-1:0]       reg_count;
        reg                             reg_valid;
        always @(posedge clk) begin
            if ( cke && ff_s_ready ) begin
                if ( ff_s_first ) begin
                    if ( endian ) begin
                        tmp_data = (ff_s_data >> (ff_s_align_s * UNIT_WIDTH));
                        tmp_strb = (ff_s_strb >> ff_s_align_s);
                        tmp_keep = (ff_s_keep >> ff_s_align_s);
                    end
                    else begin
                        tmp_data = (ff_s_data << (ff_s_align_s * UNIT_WIDTH));
                        tmp_strb = (ff_s_strb << ff_s_align_s);
                        tmp_keep = (ff_s_keep << ff_s_align_s);
                    end
                end
                else begin
                    tmp_data = ff_s_data;
                    tmp_strb = ff_s_strb;
                    tmp_keep = ff_s_keep;
                end
                
                reg_data   <= tmp_data;
                reg_strb   <= tmp_strb;
                reg_keep   <= tmp_keep;
                reg_user_f <= ff_s_user_f;
                reg_user_l <= ff_s_user_l;
                reg_first  <= ff_s_first;
                reg_last   <= ff_s_last;
                reg_count  <= ff_s_first ? (S_NUM - ff_s_align_s + ff_s_align_m) : S_NUM;
            end
        end
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_valid <= 1'b0;
            end
            else if ( cke && ff_s_ready ) begin
                reg_valid <= ff_s_valid;
            end
        end
        
        assign ff_s_ready  = !st0_valid || st0_ready;
        
        assign st0_data    = reg_data;
        assign st0_strb    = reg_strb;
        assign st0_keep    = reg_keep;
        assign st0_user_f  = reg_user_f;
        assign st0_user_l  = reg_user_l;
        assign st0_first   = reg_first;
        assign st0_last    = reg_last;
        assign st0_count   = reg_count;
        assign st0_valid   = reg_valid;
    end
    else begin : st0_bypass
        assign ff_s_ready  = st0_ready;
        
        assign st0_data    = ff_s_data;
        assign st0_strb    = ff_s_strb;
        assign st0_keep    = ff_s_keep;
        assign st0_user_f  = ff_s_user_f;
        assign st0_user_l  = ff_s_user_l;
        assign st0_first   = ff_s_first;
        assign st0_last    = ff_s_last;
        assign st0_count   = S_NUM;
        assign st0_valid   = ff_s_valid;
    end
    endgenerate
    
    
    
    // -----------------------------------------
    //  stage1 data buffer
    // -----------------------------------------
    
    wire    [COUNT_WIDTH-1:0]       st1_count;
    wire    [BUF_WIDTH-1:0]         st1_data;
    wire    [BUF_NUM-1:0]           st1_strb;
    wire    [BUF_NUM-1:0]           st1_keep;
    wire    [USER_F_BITS-1:0]       st1_user_f;
    wire    [USER_L_BITS-1:0]       st1_user_l;
    wire                            st1_first;
    wire                            st1_last;
    wire                            st1_valid;
    wire                            st1_ready;
    
    generate
    if ( S_NUM != M_NUM ) begin : st1_buffer
        reg     [COUNT_WIDTH-1:0]   reg_count,  next_count;
        reg     [BUF_WIDTH-1:0]     reg_data,   next_data;
        reg     [BUF_NUM-1:0]       reg_strb,   next_strb;
        reg     [BUF_NUM-1:0]       reg_keep,   next_keep;
        reg     [USER_F_BITS-1:0]   reg_user_f, next_user_f;
        reg     [USER_L_BITS-1:0]   reg_user_l, next_user_l;
        reg                         reg_first,  next_first;
        reg                         reg_last,   next_last;
        reg                         reg_flag_l, next_flag_l;    // フラグ予約
        reg                         reg_flush,  next_flush;     // 最終データがバッファに入ったフラグ
        reg                         reg_empty,  next_empty;     // 完全に空
        reg                         reg_free,   next_free;      // 即時受け入れ可
        reg                         reg_ready,  next_ready;     // 今のデータが吐き出せれば受け入れ可
        reg                         reg_valid,  next_valid;
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_count  <= {COUNT_WIDTH{1'b0}};
                reg_data   <= {BUF_WIDTH{1'bx}}; 
                reg_strb   <= {BUF_NUM{1'b0}};
                reg_keep   <= {BUF_NUM{1'b0}};
                reg_user_f <= {USER_F_BITS{1'b0}};
                reg_user_l <= {USER_L_BITS{1'b0}};
                reg_first  <= 1'b0;
                reg_last   <= 1'b0;
                reg_flag_l <= 1'b1;
                reg_flush  <= 1'b0;
                reg_empty  <= 1'b1;
                reg_free   <= 1'b1;
                reg_valid  <= 1'b0;
            end
            else if ( cke ) begin
                reg_count  <= next_count;
                reg_data   <= next_data;
                reg_strb   <= next_strb;
                reg_keep   <= next_keep;
                reg_user_f <= next_user_f;
                reg_user_l <= next_user_l;
                reg_first  <= next_first;
                reg_last   <= next_last;
                reg_flag_l <= next_flag_l;
                reg_flush  <= next_flush;
                reg_empty  <= next_empty;
                reg_free   <= next_free;
                reg_ready  <= next_ready;
                reg_valid  <= next_valid;
            end
        end
        
        always @* begin
            next_count  = reg_count;
            next_data   = reg_data;
            next_strb   = reg_strb;
            next_keep   = reg_keep;
            next_user_f = reg_user_f;
            next_user_l = reg_user_l;
            next_first  = reg_first;
            next_last   = reg_last;
            next_flag_l = reg_flag_l;
            next_flush  = reg_flush;
            next_empty  = reg_empty;
            next_free   = reg_free;
            next_ready  = reg_ready;
            next_valid  = reg_valid;
            
            
            // 出力があればサイズを減らしてフラグクリア
            if ( st1_valid & st1_ready ) begin
                next_count  = (next_count > M_NUM) ? (next_count - M_NUM) : 0;
                next_first  = 1'b0;
                if ( reg_last ) begin
                    next_last  = 1'b0;
                    next_flush = 1'b0;
                end
            end
            
            // 上書きモード以外でバッファ残があるときにfirstが来たら強制的にflush開始
            if ( !reg_flush && next_count > 0 && st0_valid && st0_first ) begin
                next_flush  = 1'b1;
                next_flag_l = FIRST_FORCE_LAST;
                next_user_l = {USER_L_BITS{1'b0}};
            end
            
            if ( st0_ready & st0_valid ) begin
                if ( st0_first ) begin
                    // 先頭ならリフレッシュ
                    next_data   = {BUF_WIDTH{1'bx}};
                    next_strb   = {BUF_NUM{1'b0}};
                    next_keep   = {BUF_NUM{1'b0}};
                    next_count  = st0_count;
                    next_user_f = st0_user_f;
                    next_flush  = 1'b0;
                    next_first  = 1'b1;
                end
                else begin
                    // 継続ならシフト
                    next_data   = shift_data(endian, next_data, S_NUM);
                    next_strb   = shift_strb(endian, next_strb, S_NUM);
                    next_keep   = shift_strb(endian, next_keep, S_NUM);
                    next_count  = next_count + st0_count;
                end
                
                next_data = set_data(endian, next_data, st0_data, BUF_NUM-S_NUM);
                next_strb = set_strb(endian, next_strb, st0_strb, BUF_NUM-S_NUM);
                next_keep = set_strb(endian, next_keep, st0_keep, BUF_NUM-S_NUM);
                
                // last ならフラグを立てる
                if ( st0_last ) begin
                    next_user_l = st0_user_l;
                    next_flush  = 1'b1;
                    next_flag_l = 1'b1;
                end
            end
            
            next_empty = (next_count == 0);
            next_free  = (BUF_NUM - next_count >= S_NUM) && !next_flush;
            next_last  = (next_flush && next_count <= M_NUM);
            
            next_valid = (next_count >= M_NUM) || next_flush;
            next_ready = ((BUF_NUM - next_count + M_NUM >= S_NUM) && next_valid && !next_flush) || (next_valid && next_last && next_count <= M_NUM);
        end
        
//      assign st0_ready  = (reg_ready && st1_ready)    // 次で空く
//                       || reg_free                    // flush中ではなく空いている
//                       || (FIRST_OVERWRITE && HAS_FIRST && st0_valid && st0_first);   // 上書きモード

        assign st0_ready  = ((reg_ready && st1_ready) || reg_free) && (FIRST_OVERWRITE || !HAS_FIRST || !(!reg_empty && st0_valid && st0_first));
        
        assign st1_count  = reg_count;
        assign st1_data   = reg_data;
        assign st1_strb   = reg_strb;
        assign st1_keep   = reg_keep;
        assign st1_user_f = reg_first ? reg_user_f : {USER_F_BITS{1'b0}};
        assign st1_user_l = reg_last  ? reg_user_l : {USER_L_BITS{1'b0}};
        assign st1_first  = reg_first;
        assign st1_last   = reg_last & reg_flag_l;
        assign st1_valid  = reg_valid;
    end
    else begin : st1_bypass
        assign st0_ready  = st1_ready;
        
        assign st1_count  = S_NUM;
        assign st1_data   = st0_data;
        assign st1_strb   = st0_strb;
        assign st1_keep   = st0_keep;
        assign st1_user_f = st0_user_f;
        assign st1_user_l = st0_user_l;
        assign st1_first  = st0_first;
        assign st1_last   = st0_last;
        assign st1_valid  = st0_valid;
    end
    endgenerate
    
    
    
    
    // -----------------------------------------
    //  stage2 multiplexer
    // -----------------------------------------
    
    wire    [M_DATA_WIDTH-1:0]      st2_data;
    wire    [M_NUM-1:0]             st2_strb;
    wire    [M_NUM-1:0]             st2_keep;
    wire    [USER_F_BITS-1:0]       st2_user_f;
    wire    [USER_L_BITS-1:0]       st2_user_l;
    wire                            st2_first;
    wire                            st2_last;
    wire                            st2_none;
    wire                            st2_valid;
    wire                            st2_ready;
    
    generate
    if ( S_NUM != M_NUM ) begin : st2_multiplexer
        reg     [M_DATA_WIDTH-1:0]  reg_data,   next_data;
        reg     [M_NUM-1:0]         reg_strb,   next_strb;
        reg     [M_NUM-1:0]         reg_keep,   next_keep;
        reg     [USER_F_BITS-1:0]   reg_user_f, next_user_f;
        reg     [USER_L_BITS-1:0]   reg_user_l, next_user_l;
        reg                         reg_first,  next_first;
        reg                         reg_last,   next_last;
        reg                         reg_none,   next_none;
        reg                         reg_valid,  next_valid;
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_data   <= {M_DATA_WIDTH{1'bx}};
                reg_strb   <= {M_NUM{1'b0}};
                reg_keep   <= {M_NUM{1'b0}};
                reg_user_f <= {USER_F_BITS{1'b0}};
                reg_user_l <= {USER_L_BITS{1'b0}};
                reg_first  <= 1'b0;
                reg_last   <= 1'b0;
                reg_none   <= 1'b0;
                reg_valid  <= 1'b0;
            end
            else if ( cke ) begin
                reg_data   <= next_data;
                reg_strb   <= next_strb;
                reg_keep   <= next_keep;
                reg_user_f <= next_user_f;
                reg_user_l <= next_user_l;
                reg_first  <= next_first;
                reg_last   <= next_last;
                reg_none   <= next_none;
                reg_valid  <= next_valid;
            end
        end
        
        always @* begin
            next_data   = reg_data;
            next_strb   = reg_strb;
            next_keep   = reg_keep;
            next_user_f = reg_user_f;
            next_user_l = reg_user_l;
            next_first  = reg_first;
            next_last   = reg_last;
            next_none   = reg_none;
            next_valid  = reg_valid;
            
            if ( st2_ready ) begin
                next_valid = 1'b0;
            end
            
            if ( st1_ready & st1_valid ) begin
                next_data = get_data(endian, st1_data, BUF_NUM - st1_count);
                next_strb = get_strb(endian, st1_strb, BUF_NUM - st1_count);
                next_keep = get_strb(endian, st1_keep, BUF_NUM - st1_count);
                
                next_user_f = st1_user_f;
                next_user_l = st1_user_l;
                next_first  = st1_first;
                next_last   = st1_last;
                next_valid  = st1_valid;
            end
            
            next_none = ((next_keep == 0) && REDUCE_KEEP);
        end
        
        assign st1_ready  = (!st2_valid || st2_ready);
        
        assign st2_data   = reg_data;
        assign st2_strb   = reg_strb;
        assign st2_keep   = reg_keep;
        assign st2_user_f = reg_user_f;
        assign st2_user_l = reg_user_l;
        assign st2_first  = reg_first;
        assign st2_last   = reg_last;
        assign st2_none   = reg_none;
        assign st2_valid  = reg_valid;
    end
    else begin : st2_bypass
        assign st1_ready  = st2_ready;
        
        assign st2_data   = st1_data;
        assign st2_strb   = st1_strb;
        assign st2_keep   = st1_keep;
        assign st2_user_f = st1_user_f;
        assign st2_user_l = st1_user_l;
        assign st2_first  = st1_first;
        assign st2_last   = st1_last;
        assign st2_none   = ((st1_keep == 0) && REDUCE_KEEP);
        assign st2_valid  = st1_valid;
    end
    endgenerate
    
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    ff_m_ready;
    assign st2_ready = (ff_m_ready | st2_none);
    
    jelly_data_ff_pack
            #(
                .DATA0_WIDTH    (M_DATA_WIDTH),
                .DATA1_WIDTH    (M_NUM),
                .DATA2_WIDTH    (M_NUM),
                .DATA3_WIDTH    (USER_F_WIDTH),
                .DATA4_WIDTH    (USER_L_WIDTH),
                .DATA5_WIDTH    (1),
                .DATA6_WIDTH    (1),
                .S_REGS         (1),
                .M_REGS         (M_REGS)
            )
        i_data_ff_pack_m
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (strb_data({M_NUM{padding}}, st2_data, st2_strb)),
                .s_data1        (st2_strb),
                .s_data2        (HAS_KEEP ? st2_keep : {M_NUM{1'b1}}),
                .s_data3        (st2_user_f),
                .s_data4        (st2_user_l),
                .s_data5        (st2_last),
                .s_data6        (st2_first),
                .s_valid        (st2_valid & ~st2_none),
                .s_ready        (ff_m_ready),
                
                .m_data0        (m_data),
                .m_data1        (m_strb),
                .m_data2        (m_keep),
                .m_data3        (m_user_f),
                .m_data4        (m_user_l),
                .m_data5        (m_last),
                .m_data6        (m_first),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
