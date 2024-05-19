// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



///// 削除候補 //////


`timescale 1ns / 1ps
`default_nettype none



module jelly_data_spliter
        #(
            parameter   NUM        = 16,
            parameter   DATA_WIDTH = 8,
            parameter   S_REGS     = 1,
            parameter   M_REGS     = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            output  wire                            busy,
            
            input   wire    [NUM*DATA_WIDTH-1:0]    s_data,
            input   wire                            s_valid,
            output  wire                            s_ready,
            
            output  wire    [NUM*DATA_WIDTH-1:0]    m_data,
            output  wire    [NUM-1:0]               m_valid,
            input   wire    [NUM-1:0]               m_ready
        );
    
    
    genvar      i;
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    [NUM*DATA_WIDTH-1:0]    ff_s_data;
    wire                            ff_s_valid;
    wire                            ff_s_ready;
    
    wire    [NUM*DATA_WIDTH-1:0]    ff_m_data;
    wire    [NUM-1:0]               ff_m_valid;
    wire    [NUM-1:0]               ff_m_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (NUM*DATA_WIDTH),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (S_REGS)
            )
        i_pipeline_insert_ff_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (ff_s_data),
                .m_valid        (ff_s_valid),
                .m_ready        (ff_s_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_ff_m
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .SLAVE_REGS     (M_REGS),
                    .MASTER_REGS    (M_REGS)
                )
            i_pipeline_insert_ff_m
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         (ff_m_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .s_valid        (ff_m_valid[i]),
                    .s_ready        (ff_m_ready[i]),
                    
                    .m_data         (m_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .m_valid        (m_valid[i]),
                    .m_ready        (m_ready[i]),
                    
                    .buffered       (),
                    .s_ready_next   ()
                );
    end
    endgenerate
    
    
    
    // -----------------------------------------
    //  spliter
    // -----------------------------------------
    
    reg     [NUM-1:0]               sig_s_ready;
    
    reg     [DATA_WIDTH-1:0]        sig_m_data;
    reg                             sig_m_valid;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_m_valid
        assign ff_m_valid[i] = (ff_s_valid && ff_s_ready);
    end
    endgenerate
    
    assign ff_m_data  = ff_s_data;
    assign ff_s_ready = &ff_m_ready;
    
    assign busy       = |ff_m_valid;
    
endmodule


`default_nettype wire


// end of file
