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



//  アドレスが範囲を超えたら折り返す(先頭アドレスは範囲内であること)
module jelly_axi_addr_range
        #(
            parameter   BYPASS        = 0,
            parameter   USER_WIDTH    = 0,
            parameter   DATA_SIZE     = 3,      // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            parameter   ADDR_WIDTH    = 32,
            parameter   LEN_WIDTH     = 8,
            parameter   SIZE_WIDTH    = ADDR_WIDTH,
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
            
            input   wire    [ADDR_WIDTH-1:0]    param_range_start,
            input   wire    [ADDR_WIDTH-1:0]    param_range_end,
            
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
        
        reg     [USER_BITS-1:0]     st0_user;
        reg     [ADDR_WIDTH-1:0]    st0_addr;
        reg     [LEN_WIDTH-1:0]     st0_len;
        reg     [ADDR_WIDTH-1:0]    st0_len_max;
        reg                         st0_valid;
        
        reg                         st1_split;
        reg     [USER_BITS-1:0]     st1_user;
        reg     [ADDR_WIDTH-1:0]    st1_addr;
        reg     [LEN_WIDTH-1:0]     st1_len;
        reg     [LEN_WIDTH-1:0]     st1_len_base;
        reg                         st1_valid;
        
        always @(posedge aclk) begin
            if ( ~aresetn ) begin
                st0_user     <= {USER_BITS{1'bx}};
                st0_addr     <= {ADDR_WIDTH{1'bx}};
                st0_len      <= {LEN_WIDTH{1'bx}};
                st0_len_max  <= {LEN_WIDTH{1'bx}};
                st0_valid    <= 1'b0;
                
                st1_split    <= 1'b0;
                st1_user     <= {USER_BITS{1'bx}};
                st1_addr     <= {ADDR_WIDTH{1'bx}};
                st1_len      <= {LEN_WIDTH{1'bx}};
                st1_len_base <= {LEN_WIDTH{1'bx}};
                st1_valid    <= 1'b0;
            end
            else if ( cke ) begin
                // stage 0
                if ( ff_s_ready ) begin
                    st0_user     <= ff_s_user;
                    st0_addr     <= ff_s_addr;
                    st0_len      <= ff_s_len;
                    st0_len_max  <= ((param_range_end - ff_s_addr) >> DATA_SIZE);
                    st0_valid    <= ff_s_valid;
                end
                
                // stage 1
                if ( !st1_split ) begin
                    st1_user     <= st0_user;
                    st1_addr     <= st0_addr;
                    st1_len      <= st0_len;
                    st1_len_base <= st0_len;
                    st1_valid    <= st0_valid;
                    if ( st0_valid && (st0_len > st0_len_max) ) begin
                        st1_split <= 1'b1;
                        st1_len   <= st0_len_max;
                    end
                end
                else begin
                    st1_split <= 1'b0;
                    st1_addr  <= param_range_start;
                    st1_len   <= st1_len_base - st1_len - 1'b1;
                    st1_valid <= 1'b1;
                end
            end
        end
        
        assign ff_m_user  = st1_user;
        assign ff_m_addr  = st1_addr;
        assign ff_m_len   = st1_len;
        assign ff_m_valid = st1_valid;
        
        assign ff_s_ready = (cke && ~st1_split);
        
        assign  busy      = (ff_s_valid || st0_valid || st1_valid);
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
