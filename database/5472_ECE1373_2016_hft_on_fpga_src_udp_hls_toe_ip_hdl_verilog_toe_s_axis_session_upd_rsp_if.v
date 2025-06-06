// This program was cloned from: https://github.com/mustafabbas/ECE1373_2016_hft_on_fpga
// License: MIT License

// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1ns/1ps

module toe_s_axis_session_upd_rsp_if (
    // AXI4-Stream singals
    input  wire        ACLK,
    input  wire        ARESETN,
    input  wire        TVALID,
    output wire        TREADY,
    input  wire [15:0] TDATA,
    // User signals
    output wire [15:0] sessionUpdate_rsp_V_dout,
    output wire        sessionUpdate_rsp_V_empty_n,
    input  wire        sessionUpdate_rsp_V_read
);
//------------------------Local signal-------------------
// register slice
wire [0:0]  s_valid;
wire [0:0]  s_ready;
wire [15:0] s_data;
wire [0:0]  m_valid;
wire [0:0]  m_ready;
wire [15:0] m_data;

//------------------------Instantiation------------------
// rs
toe_s_axis_session_upd_rsp_reg_slice #(
    .N       ( 16 )
) rs (
    .clk     ( ACLK ),
    .reset   ( ARESETN ),
    .s_data  ( s_data ),
    .s_valid ( s_valid ),
    .s_ready ( s_ready ),
    .m_data  ( m_data ),
    .m_valid ( m_valid ),
    .m_ready ( m_ready )
);

//------------------------Body---------------------------
// AXI4-Stream
assign TREADY                      = s_ready;
// Register Slice
assign s_valid                     = TVALID;
assign m_ready                     = sessionUpdate_rsp_V_read;
assign s_data[15:0]                = TDATA[15:0];
// User Signal
assign sessionUpdate_rsp_V_empty_n = m_valid;
assign sessionUpdate_rsp_V_dout    = m_data;

endmodule



`timescale 1ns/1ps

module toe_s_axis_session_upd_rsp_reg_slice
#(parameter
    N = 8   // data width
) (
    // system signals
    input  wire         clk,
    input  wire         reset,
    // slave side
    input  wire [N-1:0] s_data,
    input  wire         s_valid,
    output wire         s_ready,
    // master side
    output wire [N-1:0] m_data,
    output wire         m_valid,
    input  wire         m_ready
);
//------------------------Parameter----------------------
// state
localparam [1:0]
    ZERO = 2'b10,
    ONE  = 2'b11,
    TWO  = 2'b01;
//------------------------Local signal-------------------
reg  [N-1:0] data_p1;
reg  [N-1:0] data_p2;
wire         load_p1;
wire         load_p2;
wire         load_p1_from_p2;
reg          s_ready_t;
reg  [1:0]   state;
reg  [1:0]   next;
//------------------------Body---------------------------
assign s_ready = s_ready_t;
assign m_data  = data_p1;
assign m_valid = state[0];

assign load_p1 = (state == ZERO && s_valid) ||
                 (state == ONE && s_valid && m_ready) ||
                 (state == TWO && m_ready);
assign load_p2 = s_valid & s_ready;
assign load_p1_from_p2 = (state == TWO);

// data_p1
always @(posedge clk) begin
    if (load_p1) begin
        if (load_p1_from_p2)
            data_p1 <= data_p2;
        else
            data_p1 <= s_data;
    end
end

// data_p2
always @(posedge clk) begin
    if (load_p2) data_p2 <= s_data;
end

// s_ready_t
always @(posedge clk) begin
    if (~reset)
        s_ready_t <= 1'b0;
    else if (state == ZERO)
        s_ready_t <= 1'b1;
    else if (state == ONE && next == TWO)
        s_ready_t <= 1'b0;
    else if (state == TWO && next == ONE)
        s_ready_t <= 1'b1;
end

// state
always @(posedge clk) begin
    if (~reset)
        state <= ZERO;
    else
        state <= next;
end

// next
always @(*) begin
    case (state)
        ZERO:
            if (s_valid & s_ready)
                next = ONE;
            else
                next = ZERO;
        ONE:
            if (~s_valid & m_ready)
                next = ZERO;
            else if (s_valid & ~m_ready)
                next = TWO;
            else
                next = ONE;
        TWO:
            if (m_ready)
                next = ONE;
            else
                next = TWO;
        default:
            next = ZERO;
    endcase
end

endmodule

