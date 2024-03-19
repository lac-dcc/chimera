// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  アドレスに値を加算する
module jelly_axi_addr_offset
        #(
            parameter   BYPASS        = 0,
            parameter   USER_WIDTH    = 0,
            parameter   OFFSET_SIZE   = 0,
            parameter   OFFSET_WIDTH  = 32,
            parameter   S_UNIT_SIZE   = 3,      // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            parameter   S_ADDR_WIDTH  = 46,
            parameter   M_UNIT_SIZE   = 0,      // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            parameter   M_ADDR_WIDTH  = S_ADDR_WIDTH + S_UNIT_SIZE - M_UNIT_SIZE,
            parameter   S_REGS        = 1,
            parameter   M_REGS        = 1,
            
            // local
            parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            output  wire                        busy,
            
            input   wire    [OFFSET_WIDTH-1:0]  param_offset,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [S_ADDR_WIDTH-1:0]  s_addr,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [M_ADDR_WIDTH-1:0]  m_addr,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
        
    generate
    if ( BYPASS ) begin : blk_bypass
        assign m_user  = s_user;
        assign m_addr  = (s_addr << S_UNIT_SIZE) >> M_UNIT_SIZE;
        assign m_valid = s_valid;
        assign s_ready = m_ready;
        
        assign  busy    = 1'b0;
    end
    else begin : blk_offset
        
        // ---------------------------------
        //  Insert FF
        // ---------------------------------
        
        wire    [USER_BITS-1:0]     ff_s_user;
        wire    [S_ADDR_WIDTH-1:0]  ff_s_addr;
        wire                        ff_s_valid;
        wire                        ff_s_ready;
        
        wire    [USER_BITS-1:0]     ff_m_user;
        wire    [M_ADDR_WIDTH-1:0]  ff_m_addr;
        wire                        ff_m_valid;
        wire                        ff_m_ready;
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH         (USER_BITS+S_ADDR_WIDTH),
                    .SLAVE_REGS         (S_REGS),
                    .MASTER_REGS        (0)
                )
            i_pipeline_insert_ff_s
                (
                    .reset              (~aresetn),
                    .clk                (aclk),
                    .cke                (aclken),
                    
                    .s_data             ({s_user, s_addr}),
                    .s_valid            (s_valid),
                    .s_ready            (s_ready),
                    
                    .m_data             ({ff_s_user, ff_s_addr}),
                    .m_valid            (ff_s_valid),
                    .m_ready            (ff_s_ready),
                    
                    .buffered           (),
                    .s_ready_next       ()
                );
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH         (USER_BITS+M_ADDR_WIDTH),
                    .SLAVE_REGS         (0),
                    .MASTER_REGS        (M_REGS)
                )
            i_pipeline_insert_ff_m
                (
                    .reset              (~aresetn),
                    .clk                (aclk),
                    .cke                (aclken),
                    
                    .s_data             ({ff_m_user, ff_m_addr}),
                    .s_valid            (ff_m_valid),
                    .s_ready            (ff_m_ready),
                    
                    .m_data             ({m_user, m_addr}),
                    .m_valid            (m_valid),
                    .m_ready            (m_ready),
                    
                    .buffered           (),
                    .s_ready_next       ()
                );
        
        
        
        // ---------------------------------
        //  Core
        // ---------------------------------
        
        assign ff_m_user  = ff_s_user;
        assign ff_m_addr  = ((ff_s_addr << S_UNIT_SIZE) + (param_offset << OFFSET_SIZE)) >> M_UNIT_SIZE;
        assign ff_m_valid = ff_s_valid;
        assign ff_s_ready = ff_m_ready;
        
        assign busy       = ff_s_valid;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
