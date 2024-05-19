// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI に対するアドレスコマンドアライン調整(4k境界跨ぎ分割用)
module jelly_axi_addr_align
        #(
            parameter   BYPASS        = 0,
            parameter   USER_WIDTH    = 0,
            parameter   DATA_SIZE     = 3,      // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            parameter   ADDR_WIDTH    = 32,
            parameter   LEN_WIDTH     = 8,
            parameter   ALIGN         = 12,     // 2^n (4kbyte)
            parameter   S_SLAVE_REGS  = 1,
            parameter   S_MASTER_REGS = 1,
            parameter   M_SLAVE_REGS  = 1,
            parameter   M_MASTER_REGS = 1,
            
            // local
            parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            output  wire                        busy,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [ADDR_WIDTH-1:0]    s_addr,
            input   wire    [LEN_WIDTH-1:0]     s_len,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire    [LEN_WIDTH-1:0]     m_len,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    localparam  UNIT_ALIGN = ALIGN - DATA_SIZE;
    
    
    generate
    if ( BYPASS ) begin : blk_bypass
        assign  m_user  = s_user;
        assign  m_addr  = s_addr;
        assign  m_len   = s_len;
        assign  m_valid = s_valid;
        assign  s_ready = m_ready;
        
        assign  busy    = 1'b0;
    end
    else begin : blk_split
        
        // ---------------------------------
        //  Insert FF
        // ---------------------------------
        
        wire    [USER_BITS-1:0]     ff_s_user;
        wire    [ADDR_WIDTH-1:0]    ff_s_addr;
        wire    [LEN_WIDTH-1:0]     ff_s_len;
        wire                        ff_s_valid;
        wire                        ff_s_ready;
        
        wire    [USER_BITS-1:0]     ff_m_user;
        wire    [ADDR_WIDTH-1:0]    ff_m_addr;
        wire    [LEN_WIDTH-1:0]     ff_m_len;
        wire                        ff_m_valid;
        wire                        ff_m_ready;
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH         (USER_BITS+ADDR_WIDTH+LEN_WIDTH),
                    .SLAVE_REGS         (S_SLAVE_REGS),
                    .MASTER_REGS        (S_MASTER_REGS)
                )
            i_pipeline_insert_ff_s
                (
                    .reset              (~aresetn),
                    .clk                (aclk),
                    .cke                (aclken),
                    
                    .s_data             ({s_user, s_addr, s_len}),
                    .s_valid            (s_valid),
                    .s_ready            (s_ready),
                    
                    .m_data             ({ff_s_user, ff_s_addr, ff_s_len}),
                    .m_valid            (ff_s_valid),
                    .m_ready            (ff_s_ready),
                    
                    .buffered           (),
                    .s_ready_next       ()
                );
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH         (USER_BITS+ADDR_WIDTH+LEN_WIDTH),
                    .SLAVE_REGS         (M_SLAVE_REGS),
                    .MASTER_REGS        (0) // M_MASTER_REGS)
                )
            i_pipeline_insert_ff_m
                (
                    .reset              (~aresetn),
                    .clk                (aclk),
                    .cke                (aclken),
                    
                    .s_data             ({ff_m_user, ff_m_addr, ff_m_len}),
                    .s_valid            (ff_m_valid),
                    .s_ready            (ff_m_ready),
                    
                    .m_data             ({m_user, m_addr, m_len}),
                    .m_valid            (m_valid),
                    .m_ready            (m_ready),
                    
                    .buffered           (),
                    .s_ready_next       ()
                );
        
        
        
        // ---------------------------------
        //  Core
        // ---------------------------------
        
        wire                        cke        = aclken && (!ff_m_valid || ff_m_ready);
        
        wire    [UNIT_ALIGN:0]      align_addr = (1 << UNIT_ALIGN);
        wire    [UNIT_ALIGN:0]      unit_addr  = ff_s_addr[ALIGN-1:DATA_SIZE];
        wire    [UNIT_ALIGN:0]      end_addr   = {1'b0, unit_addr} + ff_s_len;
        wire                        align_over = ff_s_valid && end_addr[UNIT_ALIGN];
        
        reg                         reg_split;
        reg     [USER_BITS-1:0]     reg_user;
        reg     [ADDR_WIDTH-1:0]    reg_addr;
        reg     [LEN_WIDTH-1:0]     reg_len;
        reg     [LEN_WIDTH-1:0]     reg_len_base;
        reg                         reg_valid;
        
        always @(posedge aclk) begin
            if ( ~aresetn ) begin
                reg_split    <= 1'b0;
                reg_user     <= {USER_BITS{1'bx}};
                reg_addr     <= {ADDR_WIDTH{1'bx}};
                reg_len      <= {LEN_WIDTH{1'bx}};
                reg_len_base <= {LEN_WIDTH{1'bx}};
                reg_valid    <= 1'b0;
            end
            else if ( cke ) begin
                reg_valid <= 1'b0;
                if ( !reg_split ) begin
                    reg_user     <= ff_s_user;
                    reg_addr     <= ff_s_addr;
                    reg_len      <= ff_s_len;
                    reg_len_base <= ff_s_len;
                    reg_valid    <= ff_s_valid;
                    if ( align_over ) begin
                        reg_split <= 1'b1;
                        reg_len   <= align_addr - unit_addr - 1'b1;
                    end
                end
                else begin
                    reg_split <= 1'b0;
                    reg_addr  <= reg_addr + ((reg_len + 1'b1) << DATA_SIZE);
                    reg_len   <= reg_len_base - reg_len - 1'b1;
                    reg_valid <= 1'b1;
                end
            end
        end
        
        assign ff_m_user  = reg_user;
        assign ff_m_addr  = reg_addr;
        assign ff_m_len   = reg_len;
        assign ff_m_valid = reg_valid;
        
        assign ff_s_ready = (cke && ~reg_split);
        
        assign  busy      = (ff_s_valid || reg_valid);
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
