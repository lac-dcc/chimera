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



module jelly_axi4s_fifo
        #(
            parameter   ASYNC       = 1,
            parameter   HAS_FIRST   = 0,
            parameter   HAS_LAST    = 1,
            parameter   HAS_STRB    = 0,
            parameter   HAS_KEEP    = 0,
            
            parameter   BYTE_WIDTH  = 8,
            parameter   TDATA_WIDTH = 64,
            parameter   TSTRB_WIDTH = HAS_STRB ? (TDATA_WIDTH / BYTE_WIDTH) : 0,
            parameter   TKEEP_WIDTH = HAS_KEEP ? (TDATA_WIDTH / BYTE_WIDTH) : 0,
            parameter   TUSER_WIDTH = 0,
            
            parameter   PTR_WIDTH   = 9,
            parameter   RAM_TYPE    = "block",
            parameter   LOW_DEALY   = 0,
            parameter   DOUT_REGS   = 1,
            parameter   S_REGS      = 1,
            parameter   M_REGS      = 1,
            
            // local
            parameter   TDATA_BITS  = TDATA_WIDTH > 0 ? TDATA_WIDTH : 1,
            parameter   TSTRB_BITS  = TSTRB_WIDTH > 0 ? TSTRB_WIDTH : 1,
            parameter   TKEEP_BITS  = TKEEP_WIDTH > 0 ? TKEEP_WIDTH : 1,
            parameter   TUSER_BITS  = TUSER_WIDTH > 0 ? TUSER_WIDTH : 1
        )
        (
            input   wire                        s_aresetn,
            input   wire                        s_aclk,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire    [TSTRB_BITS-1:0]    s_axi4s_tstrb,
            input   wire    [TKEEP_BITS-1:0]    s_axi4s_tkeep,
            input   wire                        s_axi4s_tfirst,
            input   wire                        s_axi4s_tlast,
            input   wire    [TUSER_BITS-1:0]    s_axi4s_tuser,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            output  wire    [PTR_WIDTH:0]       s_free_count,
            
            input   wire                        m_aresetn,
            input   wire                        m_aclk,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire    [TSTRB_BITS-1:0]    m_axi4s_tstrb,
            output  wire    [TKEEP_BITS-1:0]    m_axi4s_tkeep,
            output  wire                        m_axi4s_tfirst,
            output  wire                        m_axi4s_tlast,
            output  wire    [TUSER_BITS-1:0]    m_axi4s_tuser,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready,
            output  wire    [PTR_WIDTH:0]       m_data_count
        );
    
    
    jelly_fifo_pack
            #(
                .ASYNC          (ASYNC),
                .DATA0_WIDTH    (TDATA_WIDTH),
                .DATA1_WIDTH    (TSTRB_WIDTH),
                .DATA2_WIDTH    (TKEEP_WIDTH),
                .DATA3_WIDTH    (HAS_FIRST ? 1 : 0),
                .DATA4_WIDTH    (HAS_LAST  ? 1 : 0),
                .DATA5_WIDTH    (TUSER_WIDTH),
                .PTR_WIDTH      (PTR_WIDTH),
                .DOUT_REGS      (DOUT_REGS),
                .RAM_TYPE       (RAM_TYPE),
                .LOW_DEALY      (LOW_DEALY),
                .S_REGS         (S_REGS),
                .M_REGS         (M_REGS)
            )
        i_fifo_pack
            (
                .s_reset        (~s_aresetn),
                .s_clk          (s_aclk),
                .s_data0        (s_axi4s_tdata),
                .s_data1        (s_axi4s_tstrb),
                .s_data2        (s_axi4s_tkeep),
                .s_data3        (s_axi4s_tfirst),
                .s_data4        (s_axi4s_tlast),
                .s_data5        (s_axi4s_tuser),
                .s_valid        (s_axi4s_tvalid),
                .s_ready        (s_axi4s_tready),
                .s_free_count   (s_free_count),
                
                .m_reset        (~m_aresetn),
                .m_clk          (m_aclk),
                .m_data0        (m_axi4s_tdata),
                .m_data1        (m_axi4s_tstrb),
                .m_data2        (m_axi4s_tkeep),
                .m_data3        (m_axi4s_tfirst),
                .m_data4        (m_axi4s_tlast),
                .m_data5        (m_axi4s_tuser),
                .m_valid        (m_axi4s_tvalid),
                .m_ready        (m_axi4s_tready),
                .m_data_count   (m_data_count)
            );
    
    
endmodule


`default_nettype wire


// end of file

