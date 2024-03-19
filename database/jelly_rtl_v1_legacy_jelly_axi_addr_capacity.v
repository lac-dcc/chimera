// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// コマンド発行量の容量管理を行う
module jelly_axi_addr_capacity
        #(
            parameter   BYPASS                 = 0,
            parameter   USER_WIDTH             = 0,
            parameter   DATA_SIZE              = 3,     // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            parameter   ADDR_WIDTH             = 32,
            parameter   LEN_WIDTH              = 8,
            
            parameter   CAPACITY_ASYNC         = 1,
            parameter   CAPACITY_COUNTER_WIDTH = 10,
            parameter   CAPACITY_INIT_COUNTER  = 256,
            
            parameter   S_SLAVE_REGS           = 1,
            parameter   S_MASTER_REGS          = 1,
            parameter   M_SLAVE_REGS           = 1,
            parameter   M_MASTER_REGS          = 1,
            
            // local
            parameter   USER_BITS              = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                    aresetn,
            input   wire                                    aclk,
            input   wire                                    aclken,
            
            output  wire                                    busy,
            
            input   wire                                    capacity_reset,
            input   wire                                    capacity_clk,
            input   wire    [CAPACITY_COUNTER_WIDTH-1:0]    capacity_add,
            input   wire                                    capacity_valid,
            
            output  wire    [CAPACITY_COUNTER_WIDTH-1:0]    capacity_counter,
            
            input   wire    [USER_BITS-1:0]                 s_user,
            input   wire    [ADDR_WIDTH-1:0]                s_addr,
            input   wire    [LEN_WIDTH-1:0]                 s_len,
            input   wire                                    s_valid,
            output  wire                                    s_ready,
            
            output  wire    [USER_BITS-1:0]                 m_user,
            output  wire    [ADDR_WIDTH-1:0]                m_addr,
            output  wire    [LEN_WIDTH-1:0]                 m_len,
            output  wire                                    m_valid,
            input   wire                                    m_ready
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
                    .MASTER_REGS        (M_MASTER_REGS)
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
        
        jelly_semaphore
                #(
                    .ASYNC              (CAPACITY_ASYNC),
                    .COUNTER_WIDTH      (CAPACITY_COUNTER_WIDTH),
                    .INIT_COUNTER       (CAPACITY_INIT_COUNTER)
                )
            i_semaphore
                (
                    .rel_reset          (capacity_reset),
                    .rel_clk            (capacity_clk),
                    .rel_add            (capacity_add),
                    .rel_valid          (capacity_valid & aclken),
                    
                    .req_reset          (~aresetn),
                    .req_clk            (aclk),
                    .req_sub            (ff_m_len + 1'b1),
                    .req_valid          (ff_m_valid && ff_m_ready && aclken),
                    .req_empty          (),
                    .req_counter        (capacity_counter)
                );
        
        wire    capacity_ready = ff_s_valid && (capacity_counter > (ff_s_len));
        
        assign ff_m_user  = ff_s_user;
        assign ff_m_addr  = ff_s_addr;
        assign ff_m_len   = ff_s_len;
        assign ff_m_valid = ff_s_valid & capacity_ready;
        
        assign ff_s_ready = ff_m_ready & capacity_ready;
        
        assign  busy      = (ff_s_valid || ff_m_valid);
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
