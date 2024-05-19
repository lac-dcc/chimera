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



// 幅変換時のアドレスサイズ変換
module jelly_address_width_convert
        #(
            parameter ALLOW_UNALIGNED = 1,     // UNALIGNEDあり
            parameter ADDR_WIDTH      = 32,    // アドレスのbit幅
            parameter USER_WIDTH      = 0,     // ユーザーデータのbit幅
            parameter S_UNIT          = 4,     // 入力データ幅のアドレス増加量
            parameter M_UNIT_SIZE     = 2,     // 出力データ幅でのアドレス増加量のlog2 (0:1byte, 1:2byte, 2:4byte, ...)
            parameter S_LEN_WIDTH     = 32,    // 入力側データ幅の点層サイズ
            parameter M_LEN_WIDTH     = 32,    // 入力側データ幅の点層サイズ
            parameter ALIGN_WIDTH     = M_UNIT_SIZE > 0 ? M_UNIT_SIZE : 1,
            parameter S_LEN_OFFSET    = 1'b1,
            parameter M_LEN_OFFSET    = 1'b1,
            parameter S_REGS          = 0,
            
            // loacal
            parameter USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [ADDR_WIDTH-1:0]    s_addr,
            input   wire    [S_LEN_WIDTH-1:0]   s_len,
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire    [ALIGN_WIDTH-1:0]   m_align,
            output  wire    [M_LEN_WIDTH-1:0]   m_len,
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    // inster FF
    wire    [ADDR_WIDTH-1:0]    ff_s_addr;
    wire    [S_LEN_WIDTH-1:0]   ff_s_len;
    wire    [USER_BITS-1:0]     ff_s_user;
    wire                        ff_s_valid;
    wire                        ff_s_ready;
    jelly_data_ff_pack
            #(
                .DATA0_WIDTH    (ADDR_WIDTH),
                .DATA1_WIDTH    (S_LEN_WIDTH),
                .DATA2_WIDTH    (USER_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         ((S_UNIT & (S_UNIT-1)) != 0)    // 2のべき乗でなければFF挿入
            )
        i_data_ff_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (s_addr),
                .s_data1        (s_len),
                .s_data2        (s_user),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data0        (ff_s_addr),
                .m_data1        (ff_s_len),
                .m_data2        (ff_s_user),
                .m_valid        (ff_s_valid),
                .m_ready        (ff_s_ready)
            );
    
    
    // core
    wire    [ADDR_WIDTH-1:0]    add_mask = ((1 << M_UNIT_SIZE) - 1);
    wire    [ALIGN_WIDTH-1:0]   align    = ALLOW_UNALIGNED ? (ff_s_addr & add_mask) : {ALIGN_WIDTH{1'b0}};
    
    reg     [ADDR_WIDTH-1:0]    reg_addr;
    reg     [ALIGN_WIDTH-1:0]   reg_align;
    reg     [M_LEN_WIDTH-1:0]   reg_len;
    reg     [USER_BITS-1:0]     reg_user;
    reg                         reg_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_addr  <= {ADDR_WIDTH{1'bx}};
            reg_align <= {ALIGN_WIDTH{1'bx}};
            reg_len   <= {M_LEN_WIDTH{1'bx}};
            reg_user  <= {USER_BITS{1'bx}};
            reg_valid <= 1'b0;
        end
        else if ( cke ) begin
            if ( ff_s_ready ) begin
                reg_addr  <= (ff_s_addr & ~add_mask);
                reg_align <= align;
                reg_len   <= ((align + ((ff_s_len + S_LEN_OFFSET) * S_UNIT) + ((1 << M_UNIT_SIZE) - 1)) >> M_UNIT_SIZE) - M_LEN_OFFSET;
                reg_user  <= ff_s_user;
                reg_valid <= ff_s_valid;
            end
        end
    end
    
    assign ff_s_ready  = ~m_valid || m_ready;
    
    assign m_addr      = reg_addr;
    assign m_align     = reg_align;
    assign m_len       = reg_len;
    assign m_user      = reg_user;
    assign m_valid     = reg_valid;
    
    
endmodule


`default_nettype wire


// end of file
