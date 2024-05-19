// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_video_combiner2
        #(
            parameter   S0_TUSER_WIDTH = 1,
            parameter   S0_TDATA_WIDTH = 8,
            parameter   S1_TUSER_WIDTH = 1,
            parameter   S1_TDATA_WIDTH = 8,
            parameter   S0_REGS        = 1,
            parameter   S1_REGS        = 1,
            parameter   M_REGS         = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [S0_TUSER_WIDTH-1:0]    s0_axi4s_tuser,
            input   wire    [S0_TDATA_WIDTH-1:0]    s0_axi4s_tdata,
            input   wire                            s0_axi4s_tlast,
            input   wire                            s0_axi4s_tvalid,
            output  wire                            s0_axi4s_tready,
            
            input   wire    [S1_TUSER_WIDTH-1:0]    s1_axi4s_tuser,
            input   wire    [S1_TDATA_WIDTH-1:0]    s1_axi4s_tdata,
            input   wire                            s1_axi4s_tlast,
            input   wire                            s1_axi4s_tvalid,
            output  wire                            s1_axi4s_tready,
            
            output  wire    [S0_TUSER_WIDTH-1:0]    m_axi4s_tuser0,
            output  wire    [S1_TUSER_WIDTH-1:0]    m_axi4s_tuser1,
            output  wire    [S0_TDATA_WIDTH-1:0]    m_axi4s_tdata0,
            output  wire    [S1_TDATA_WIDTH-1:0]    m_axi4s_tdata1,
            output  wire                            m_axi4s_tlast,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready
        );
    
    
    genvar      i;
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    [S0_TUSER_WIDTH-1:0]    ff_s0_axi4s_tuser;
    wire    [S0_TDATA_WIDTH-1:0]    ff_s0_axi4s_tdata;
    wire                            ff_s0_axi4s_tlast;
    wire                            ff_s0_axi4s_tvalid;
    wire                            ff_s0_axi4s_tready;
    
    wire    [S1_TUSER_WIDTH-1:0]    ff_s1_axi4s_tuser;
    wire    [S1_TDATA_WIDTH-1:0]    ff_s1_axi4s_tdata;
    wire                            ff_s1_axi4s_tlast;
    wire                            ff_s1_axi4s_tvalid;
    wire                            ff_s1_axi4s_tready;
    
    wire    [S0_TUSER_WIDTH-1:0]    ff_m_axi4s_tuser0;
    wire    [S1_TUSER_WIDTH-1:0]    ff_m_axi4s_tuser1;
    wire    [S0_TDATA_WIDTH-1:0]    ff_m_axi4s_tdata0;
    wire    [S1_TDATA_WIDTH-1:0]    ff_m_axi4s_tdata1;
    wire                            ff_m_axi4s_tlast;
    wire                            ff_m_axi4s_tvalid;
    wire                            ff_m_axi4s_tready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (1+S0_TUSER_WIDTH+S0_TDATA_WIDTH),
                .SLAVE_REGS     (S0_REGS),
                .MASTER_REGS    (S0_REGS)
            )
        i_pipeline_insert_ff_s0
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         ({s0_axi4s_tlast, s0_axi4s_tuser, s0_axi4s_tdata}),
                .s_valid        (s0_axi4s_tvalid),
                .s_ready        (s0_axi4s_tready),
                
                .m_data         ({ff_s0_axi4s_tlast, ff_s0_axi4s_tuser, ff_s0_axi4s_tdata}),
                .m_valid        (ff_s0_axi4s_tvalid),
                .m_ready        (ff_s0_axi4s_tready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (1+S1_TUSER_WIDTH+S1_TDATA_WIDTH),
                .SLAVE_REGS     (S1_REGS),
                .MASTER_REGS    (S1_REGS)
            )
        i_pipeline_insert_ff_s1
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         ({s1_axi4s_tlast, s1_axi4s_tuser, s1_axi4s_tdata}),
                .s_valid        (s1_axi4s_tvalid),
                .s_ready        (s1_axi4s_tready),
                
                .m_data         ({ff_s1_axi4s_tlast, ff_s1_axi4s_tuser, ff_s1_axi4s_tdata}),
                .m_valid        (ff_s1_axi4s_tvalid),
                .m_ready        (ff_s1_axi4s_tready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (1+S1_TUSER_WIDTH+S1_TDATA_WIDTH+S0_TUSER_WIDTH+S0_TDATA_WIDTH),
                .SLAVE_REGS     (M_REGS),
                .MASTER_REGS    (M_REGS)
            )
        i_pipeline_insert_ff_m
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         ({
                                    ff_m_axi4s_tlast,
                                    ff_m_axi4s_tuser0,
                                    ff_m_axi4s_tuser1,
                                    ff_m_axi4s_tdata0,
                                    ff_m_axi4s_tdata1
                                }),
                .s_valid        (ff_m_axi4s_tvalid),
                .s_ready        (ff_m_axi4s_tready),
                
                .m_data         ({
                                    m_axi4s_tlast,
                                    m_axi4s_tuser0,
                                    m_axi4s_tuser1,
                                    m_axi4s_tdata0,
                                    m_axi4s_tdata1
                                }),
                
                .m_valid        (m_axi4s_tvalid),
                .m_ready        (m_axi4s_tready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    
    // -----------------------------------------
    //  combiner
    // -----------------------------------------
    
    assign ff_m_axi4s_tuser0  = ff_s0_axi4s_tuser;
    assign ff_m_axi4s_tuser1  = ff_s1_axi4s_tuser;
    assign ff_m_axi4s_tdata0  = ff_s0_axi4s_tdata;
    assign ff_m_axi4s_tdata1  = ff_s1_axi4s_tdata;
    assign ff_m_axi4s_tlast   = ff_s0_axi4s_tlast;
    assign ff_m_axi4s_tvalid  = ff_s1_axi4s_tvalid & ff_s0_axi4s_tvalid;
    
    assign ff_s0_axi4s_tready = ff_m_axi4s_tvalid && ff_m_axi4s_tready;
    assign ff_s1_axi4s_tready = ff_m_axi4s_tvalid && ff_m_axi4s_tready;
    
    
endmodule


`default_nettype wire


// end of file
