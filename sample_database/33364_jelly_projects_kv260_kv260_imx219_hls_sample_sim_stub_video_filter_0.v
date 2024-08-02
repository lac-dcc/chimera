// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

`timescale 1ns/1ps

module video_filter_0
        (
            input   wire            ap_clk,
            input   wire            ap_rst_n,
            input   wire            ap_start,
            output  wire            ap_done,
            output  wire            ap_idle,
            output  wire            ap_ready,

            input   wire            s_axi4s_TVALID,
            output  wire            s_axi4s_TREADY,
            input   wire [23 : 0]   s_axi4s_TDATA,
            input   wire [0 : 0]    s_axi4s_TDEST,
            input   wire [2 : 0]    s_axi4s_TKEEP,
            input   wire [2 : 0]    s_axi4s_TSTRB,
            input   wire [0 : 0]    s_axi4s_TUSER,
            input   wire [0 : 0]    s_axi4s_TLAST,
            input   wire [0 : 0]    s_axi4s_TID,

            output  wire            m_axi4s_TVALID,
            input   wire            m_axi4s_TREADY,
            output  wire [23 : 0]   m_axi4s_TDATA,
            output  wire [0 : 0]    m_axi4s_TDEST,
            output  wire [2 : 0]    m_axi4s_TKEEP,
            output  wire [2 : 0]    m_axi4s_TSTRB,
            output  wire [0 : 0]    m_axi4s_TUSER,
            output  wire [0 : 0]    m_axi4s_TLAST,
            output  wire [0 : 0]    m_axi4s_TID,

            input   wire [15 : 0]   width,
            input   wire [15 : 0]   height,
            input   wire            inverse
        );


    assign m_axi4s_TVALID = s_axi4s_TVALID;
    assign m_axi4s_TDATA  = s_axi4s_TDATA;
    assign m_axi4s_TUSER  = s_axi4s_TUSER;
    assign m_axi4s_TLAST  = s_axi4s_TLAST;
    assign s_axi4s_TREADY = m_axi4s_TREADY;
    
endmodule

