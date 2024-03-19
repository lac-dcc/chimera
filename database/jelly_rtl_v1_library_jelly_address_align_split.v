// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// アライン跨ぎ分割(2回以上跨ぐのは対象外なので事前に上限制御すること)
module jelly_address_align_split
        #(
            parameter   BYPASS        = 0,
            parameter   USER_WIDTH    = 0,
            parameter   ADDR_WIDTH    = 32,
            parameter   UNIT_SIZE     = 3,      // log2 (0:1byte, 1:2byte, 2:4byte, 3:8byte, ...)
            parameter   LEN_WIDTH     = 8,
            parameter   LEN_OFFSET    = 1'b1,
            parameter   ALIGN         = 12,     // 2^n
            parameter   S_REGS        = 1,
            
            // local
            parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        s_first,
            input   wire                        s_last,
            input   wire    [ADDR_WIDTH-1:0]    s_addr,
            input   wire    [LEN_WIDTH-1:0]     s_len,
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire                        m_first,
            output  wire                        m_last,
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire    [LEN_WIDTH-1:0]     m_len,
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    localparam  UNIT_ALIGN = ALIGN - UNIT_SIZE;
    
    
    generate
    if ( BYPASS ) begin : blk_bypass
        assign  m_first = s_first;
        assign  m_last  = s_last;
        assign  m_addr  = s_addr;
        assign  m_len   = s_len;
        assign  m_user  = s_user;
        assign  m_valid = s_valid;
        assign  s_ready = m_ready;
    end
    else begin : blk_split
        
        // ---------------------------------
        //  Insert FF
        // ---------------------------------
        
        wire    [ADDR_WIDTH-1:0]    ff_s_addr;
        wire    [LEN_WIDTH-1:0]     ff_s_len;
        wire                        ff_s_first;
        wire                        ff_s_last;
        wire    [USER_BITS-1:0]     ff_s_user;
        wire                        ff_s_valid;
        wire                        ff_s_ready;
        
        jelly_data_ff_pack
                #(
                    .DATA0_WIDTH        (ADDR_WIDTH),
                    .DATA1_WIDTH        (LEN_WIDTH),
                    .DATA2_WIDTH        (1),
                    .DATA3_WIDTH        (1),
                    .DATA4_WIDTH        (USER_WIDTH),
                    .S_REGS             (S_REGS),
                    .M_REGS             (0)
                )
            i_data_ff_pack_s
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .s_data0            (s_addr),
                    .s_data1            (s_len),
                    .s_data2            (s_first),
                    .s_data3            (s_last),
                    .s_data4            (s_user),
                    .s_valid            (s_valid),
                    .s_ready            (s_ready),
                    
                    .m_data0            (ff_s_addr),
                    .m_data1            (ff_s_len),
                    .m_data2            (ff_s_first),
                    .m_data3            (ff_s_last),
                    .m_data4            (ff_s_user),
                    .m_valid            (ff_s_valid),
                    .m_ready            (ff_s_ready)
                );
        
        
        // ---------------------------------
        //  Core
        // ---------------------------------
        
        wire    [UNIT_ALIGN:0]      align_addr = (1 << UNIT_ALIGN);
        wire    [UNIT_ALIGN:0]      unit_addr  = ff_s_addr[ALIGN-1:UNIT_SIZE];
        wire    [UNIT_ALIGN:0]      end_addr   = {1'b0, unit_addr} + ff_s_len + (LEN_OFFSET - 1'b1);
        wire                        align_over = ff_s_valid && end_addr[UNIT_ALIGN];
        
        reg                         reg_split;
        reg                         reg_first;
        reg                         reg_last;
        reg                         reg_lflasg;
        reg     [USER_BITS-1:0]     reg_user;
        reg     [ADDR_WIDTH-1:0]    reg_addr;
        reg     [LEN_WIDTH-1:0]     reg_len;
        reg     [LEN_WIDTH-1:0]     reg_len_base;
        reg                         reg_valid;
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_split    <= 1'b0;
                reg_first    <= 1'bx;
                reg_last     <= 1'bx;
                reg_lflasg   <= 1'bx;
                reg_user     <= {USER_BITS{1'bx}};
                reg_addr     <= {ADDR_WIDTH{1'bx}};
                reg_len      <= {LEN_WIDTH{1'bx}};
                reg_len_base <= {LEN_WIDTH{1'bx}};
                reg_valid    <= 1'b0;
            end
            else if ( cke && (!m_valid || m_ready) ) begin
                reg_valid <= 1'b0;
                if ( !reg_split ) begin
                    reg_first    <= ff_s_first;
                    reg_last     <= ff_s_last;
                    reg_lflasg   <= ff_s_last;
                    reg_user     <= ff_s_user;
                    reg_addr     <= ff_s_addr;
                    reg_len      <= ff_s_len;
                    reg_len_base <= ff_s_len;
                    reg_valid    <= ff_s_valid;
                    if ( align_over ) begin
                        reg_split <= 1'b1;
                        reg_last  <= 1'b0;
                        reg_len   <= align_addr - unit_addr - LEN_OFFSET;
                    end
                end
                else begin
                    reg_first <= 1'b0;
                    reg_last  <= reg_lflasg;
                    reg_split <= 1'b0;
                    reg_addr  <= reg_addr + ((reg_len + 1'b1) << UNIT_SIZE);
                    reg_len   <= reg_len_base - reg_len - LEN_OFFSET;
                    reg_valid <= 1'b1;
                end
            end
        end
        
        assign m_first = reg_first;
        assign m_last  = reg_last;
        assign m_user  = reg_user;
        assign m_addr  = reg_addr;
        assign m_len   = reg_len;
        assign m_valid = reg_valid;
        
        assign ff_s_ready = (!m_valid || m_ready) && ~reg_split;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
