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


// フレーム単位で同期させる
module jelly_data_frame_combiner
        #(
            parameter   NUM        = 2,
            parameter   DATA_WIDTH = 32,
            parameter   S_REGS     = 1,
            parameter   M_REGS     = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [NUM-1:0]               s_frame_start,
            input   wire    [NUM*DATA_WIDTH-1:0]    s_data,
            input   wire    [NUM-1:0]               s_valid,
            output  wire    [NUM-1:0]               s_ready,
            
            output  wire                            m_frame_start,
            output  wire    [NUM*DATA_WIDTH-1:0]    m_data,
            output  wire                            m_valid,
            input   wire                            m_ready
        );
    
    
    genvar      i;
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    [NUM-1:0]               ff_s_frame_start;
    wire    [NUM*DATA_WIDTH-1:0]    ff_s_data;
    wire    [NUM-1:0]               ff_s_valid;
    wire    [NUM-1:0]               ff_s_ready;
    
    wire                            ff_m_frame_start;
    wire    [NUM*DATA_WIDTH-1:0]    ff_m_data;
    wire                            ff_m_valid;
    wire                            ff_m_ready;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_ff_s
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (1+DATA_WIDTH),
                    .SLAVE_REGS     (S_REGS),
                    .MASTER_REGS    (S_REGS)
                )
            i_pipeline_insert_ff_s
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         ({s_frame_start[i], s_data[i*DATA_WIDTH +: DATA_WIDTH]}),
                    .s_valid        (s_valid[i]),
                    .s_ready        (s_ready[i]),
                    
                    .m_data         ({ff_s_frame_start[i], ff_s_data[i*DATA_WIDTH +: DATA_WIDTH]}),
                    .m_valid        (ff_s_valid[i]),
                    .m_ready        (ff_s_ready[i]),
                    
                    .buffered       (),
                    .s_ready_next   ()
                );
    end
    endgenerate
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (1+NUM*DATA_WIDTH),
                .SLAVE_REGS     (M_REGS),
                .MASTER_REGS    (M_REGS)
            )
        i_pipeline_insert_ff_m
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         ({ff_m_frame_start, ff_m_data}),
                .s_valid        (ff_m_valid),
                .s_ready        (ff_m_ready),
                
                .m_data         ({m_frame_start, m_data}),
                .m_valid        (m_valid),
                .m_ready        (m_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    
    // -----------------------------------------
    //  combiner
    // -----------------------------------------
    
    wire    [NUM-1:0]   frame_start = ff_s_frame_start & ff_s_valid;
    
    reg     [NUM-1:0]               sig_s_ready;
    reg                             sig_m_valid;
    
    always @* begin
        sig_s_ready = {NUM{1'b1}};
        sig_m_valid = 1'b0;
        
        if ( |frame_start ) begin
            // 1つでも frame_start があればすべて揃うまで流す
            if ( &frame_start ) begin
                sig_m_valid = 1'b1;
                sig_s_ready = {NUM{1'b1}};
            end
            else begin
                sig_s_ready = ~ff_s_frame_start;
            end
        end
        else begin
            // それ以外では通常の combiner 動作
            sig_s_ready = {NUM{&ff_s_valid}};
            sig_m_valid = &ff_s_valid;
        end
    end
    
    assign ff_s_ready       = sig_s_ready;
    
    assign ff_m_frame_start = &frame_start;
    assign ff_m_data        = ff_s_data;
    assign ff_m_valid       = sig_m_valid;
    
endmodule


`default_nettype wire


// end of file
