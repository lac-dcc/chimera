// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_bilinear_axi4s
        #(
            parameter   COMPONENT_NUM = 3,
            parameter   DATA_WIDTH    = 8,
            parameter   TUSER_WIDTH   = 1,
            parameter   TDATA_WIDTH   = COMPONENT_NUM*DATA_WIDTH,
            parameter   X_WIDTH       = 4,
            parameter   Y_WIDTH       = 4,
            parameter   COMPACT       = 1,
            parameter   M_SLAVE_REGS  = 0,
            parameter   M_MASTER_REGS = 0
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire    [TUSER_WIDTH-1:0]   s_tuser,
            input   wire                        s_tlast,
            input   wire    [X_WIDTH-1:0]       s_tx,
            input   wire    [Y_WIDTH-1:0]       s_ty,
            input   wire    [TDATA_WIDTH-1:0]   s_tdata00,
            input   wire    [TDATA_WIDTH-1:0]   s_tdata01,
            input   wire    [TDATA_WIDTH-1:0]   s_tdata10,
            input   wire    [TDATA_WIDTH-1:0]   s_tdata11,
            input   wire                        s_tvalid,
            output  wire                        s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]   m_tuser,
            output  wire                        m_tlast,
            output  wire    [TDATA_WIDTH-1:0]   m_tdata,
            output  wire                        m_tvalid,
            input   wire                        m_tready
        );
    
    
    wire    [TUSER_WIDTH-1:0]   x_tuser;
    wire                        x_tlast;
    wire    [Y_WIDTH-1:0]       x_ty;
    wire    [TDATA_WIDTH-1:0]   x_tdata0;
    wire    [TDATA_WIDTH-1:0]   x_tdata1;
    wire                        x_tvalid;
    
    wire    [TUSER_WIDTH-1:0]   y_tuser;
    wire                        y_tlast;
    wire    [TDATA_WIDTH-1:0]   y_tdata;
    wire                        y_tvalid;
    wire                        y_tready;
    
    wire        reset = ~aresetn;
    wire        clk   =  aclk;
    wire        cke   = (aclken && (!y_tvalid || y_tready));
    
    assign s_tready = cke;
    
    
    jelly_linear_interpolation
            #(
                .USER_WIDTH         (TUSER_WIDTH+1+Y_WIDTH),
                .RATE_WIDTH         (X_WIDTH),
                .COMPONENT_NUM      (2*COMPONENT_NUM),
                .DATA_WIDTH         (DATA_WIDTH),
                .DATA_SIGNED        (0),
                .COMPACT            (COMPACT)
            )
        i_linear_interpolation_x
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_user             ({s_tuser, s_tlast, s_ty}),
                .s_rate             (s_tx),
                .s_data0            ({s_tdata10, s_tdata00}),
                .s_data1            ({s_tdata11, s_tdata01}),
                .s_valid            (s_tvalid),
                
                .m_user             ({x_tuser, x_tlast, x_ty}),
                .m_data             ({x_tdata1, x_tdata0}),
                .m_valid            (x_tvalid)
            );
    
    jelly_linear_interpolation
            #(
                .USER_WIDTH         (TUSER_WIDTH+1),
                .RATE_WIDTH         (Y_WIDTH),
                .COMPONENT_NUM      (COMPONENT_NUM),
                .DATA_WIDTH         (DATA_WIDTH),
                .DATA_SIGNED        (0),
                .COMPACT            (COMPACT)
            )
        i_linear_interpolation_y
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_user             ({x_tuser, x_tlast}),
                .s_rate             (x_ty),
                .s_data0            (x_tdata0),
                .s_data1            (x_tdata1),
                .s_valid            (x_tvalid),
                
                .m_user             ({y_tuser, y_tlast}),
                .m_data             (y_tdata),
                .m_valid            (y_tvalid)
            );
    
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (TUSER_WIDTH+1+TDATA_WIDTH),
                .SLAVE_REGS         (M_SLAVE_REGS),
                .MASTER_REGS        (M_MASTER_REGS)
            )
        i_pipeline_insert_ff
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_data             ({y_tuser, y_tlast, y_tdata}),
                .s_valid            (y_tvalid),
                .s_ready            (y_tready),
                
                .m_data             ({m_tuser, m_tlast, m_tdata}),
                .m_valid            (m_tvalid),
                .m_ready            (m_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
endmodule



`default_nettype wire



// end of file
