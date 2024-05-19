// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_video_resize_half_core
        #(
            parameter   TUSER_WIDTH   = 1,
            parameter   COMPONENT_NUM = 3,
            parameter   DATA_WIDTH    = 8,
            parameter   TDATA_WIDTH   = COMPONENT_NUM*DATA_WIDTH,
            parameter   MAX_X_NUM     = 4096,
            parameter   RAM_TYPE      = MAX_X_NUM > 128 ? "block" : "distributed",
            parameter   M_SLAVE_REGS  = 1,
            parameter   M_MASTER_REGS = 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        param_v_enable,
            input   wire                        param_h_enable,
            
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    wire    [TUSER_WIDTH-1:0]   axi4s_v_tuser;
    wire                        axi4s_v_tlast;
    wire    [TDATA_WIDTH-1:0]   axi4s_v_tdata;
    wire                        axi4s_v_tvalid;
    wire                        axi4s_v_tready;
    
    jelly_video_resize_half_v_core
            #(
                .TUSER_WIDTH        (TUSER_WIDTH),
                .COMPONENT_NUM      (COMPONENT_NUM),
                .DATA_WIDTH         (DATA_WIDTH),
                .MAX_X_NUM          (MAX_X_NUM),
                .RAM_TYPE           (RAM_TYPE),
                .M_SLAVE_REGS       (0),
                .M_MASTER_REGS      (0)
            )
        i_video_resize_half_v_core
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .param_enable       (param_v_enable),
                
                .s_axi4s_tuser      (s_axi4s_tuser),
                .s_axi4s_tlast      (s_axi4s_tlast),
                .s_axi4s_tdata      (s_axi4s_tdata),
                .s_axi4s_tvalid     (s_axi4s_tvalid),
                .s_axi4s_tready     (s_axi4s_tready),
                
                .m_axi4s_tuser      (axi4s_v_tuser),
                .m_axi4s_tlast      (axi4s_v_tlast),
                .m_axi4s_tdata      (axi4s_v_tdata),
                .m_axi4s_tvalid     (axi4s_v_tvalid),
                .m_axi4s_tready     (axi4s_v_tready)
            );
    
    jelly_video_resize_half_h_core
            #(
                .TUSER_WIDTH        (TUSER_WIDTH),
                .COMPONENT_NUM      (COMPONENT_NUM),
                .DATA_WIDTH         (DATA_WIDTH),
                .TDATA_WIDTH        (TDATA_WIDTH),
                .M_SLAVE_REGS       (M_SLAVE_REGS),
                .M_MASTER_REGS      (M_MASTER_REGS)
            )
        i_video_resize_half_h_core
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .param_enable       (param_h_enable),
                
                .s_axi4s_tuser      (axi4s_v_tuser),
                .s_axi4s_tlast      (axi4s_v_tlast),
                .s_axi4s_tdata      (axi4s_v_tdata),
                .s_axi4s_tvalid     (axi4s_v_tvalid),
                .s_axi4s_tready     (axi4s_v_tready),
                
                .m_axi4s_tuser      (m_axi4s_tuser),
                .m_axi4s_tlast      (m_axi4s_tlast),
                .m_axi4s_tdata      (m_axi4s_tdata),
                .m_axi4s_tvalid     (m_axi4s_tvalid),
                .m_axi4s_tready     (m_axi4s_tready)
            );
    
    
endmodule



`default_nettype wire



// end of file
