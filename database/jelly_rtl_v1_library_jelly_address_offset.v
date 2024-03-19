// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// オフセット付きでアドレス単位を変換
module jelly_address_offset
        #(
            parameter   BYPASS        = 0,
            parameter   OFFSET_WIDTH  = 32,
            parameter   S_ADDR_WIDTH  = 32,
            parameter   M_ADDR_WIDTH  = 32,
            parameter   USER_WIDTH    = 0,
            parameter   S_ADDR_UNIT   = 4,      // s_addrの実アドレスでの単位(バイト数など)
            parameter   OFFSET_UNIT   = 1,      // s_offsetの実アドレスでの単位(バイト数など)
            parameter   M_UNIT_SIZE   = 0,      // m_addrの実アドレスでの単位のlog2 (0:1byte, 2:2byte, 3:4byte, ...)
            parameter   S_REGS        = 0,
            parameter   M_REGS        = 1,
            
            // local
            parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [S_ADDR_WIDTH-1:0]  s_addr,
            input   wire    [OFFSET_WIDTH-1:0]  s_offset,
            input   wire    [USER_BITS-1:0]     s_user,
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
        assign m_addr  = s_addr * S_ADDR_UNIT;   // S_ADDR_UNIT は 2のべき乗を想定
        assign m_valid = s_valid;
        assign s_ready = m_ready;
    end
    else begin : blk_offset
        
        // ---------------------------------
        //  Insert FF
        // ---------------------------------
        
        wire    [S_ADDR_WIDTH-1:0]  ff_s_addr;
        wire    [OFFSET_WIDTH-1:0]  ff_s_offset;
        wire    [USER_BITS-1:0]     ff_s_user;
        wire                        ff_s_valid;
        wire                        ff_s_ready;
        
        wire    [M_ADDR_WIDTH-1:0]  ff_m_addr;
        wire    [USER_BITS-1:0]     ff_m_user;
        wire                        ff_m_valid;
        wire                        ff_m_ready;
        
        jelly_data_ff_pack
                #(
                    .DATA0_WIDTH        (S_ADDR_WIDTH),
                    .DATA1_WIDTH        (OFFSET_WIDTH),
                    .DATA2_WIDTH        (USER_WIDTH),
                    .S_REGS             (S_REGS),
                    .M_REGS             (0)
                )
            i_data_ff_pack_s
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .s_data0            (s_addr),
                    .s_data1            (s_offset),
                    .s_data2            (s_user),
                    .s_valid            (s_valid),
                    .s_ready            (s_ready),
                    
                    .m_data0            (ff_s_addr),
                    .m_data1            (ff_s_offset),
                    .m_data2            (ff_s_user),
                    .m_valid            (ff_s_valid),
                    .m_ready            (ff_s_ready)
                );
        
        jelly_data_ff_pack
                #(
                    .DATA0_WIDTH        (M_ADDR_WIDTH),
                    .DATA1_WIDTH        (USER_WIDTH),
                    .S_REGS             (0),
                    .M_REGS             (M_REGS)
                )
            i_data_ff_pack_m
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .s_data0            (ff_m_addr),
                    .s_data1            (ff_m_user),
                    .s_valid            (ff_m_valid),
                    .s_ready            (ff_m_ready),
                    
                    .m_data0            (m_addr),
                    .m_data1            (m_user),
                    .m_valid            (m_valid),
                    .m_ready            (m_ready)
                );
        
        
        
        // ---------------------------------
        //  Core
        // ---------------------------------
        
        assign ff_m_user  = ff_s_user;
        assign ff_m_addr  = ((ff_s_addr * S_ADDR_UNIT) + (ff_s_offset * OFFSET_UNIT)) >> M_UNIT_SIZE;
        assign ff_m_valid = ff_s_valid;
        assign ff_s_ready = ff_m_ready;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
