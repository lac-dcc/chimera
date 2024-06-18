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



module jelly_data_combine
        #(
            parameter   NUM        = 32,
            parameter   DATA_WIDTH = 8,
            parameter   S_REGS     = 1,
            parameter   M_REGS     = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [NUM*DATA_WIDTH-1:0]    s_data,
            input   wire    [NUM-1:0]               s_valid,
            output  wire    [NUM-1:0]               s_ready,
            
            output  wire    [NUM*DATA_WIDTH-1:0]    m_data,
            output  wire                            m_valid,
            input   wire                            m_ready
        );
    
    
    genvar      i;
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    [NUM*DATA_WIDTH-1:0]    ff_s_data;
    wire    [NUM-1:0]               ff_s_valid;
    wire    [NUM-1:0]               ff_s_ready;
    
    wire    [NUM*DATA_WIDTH-1:0]    ff_m_data;
    wire                            ff_m_valid;
    wire                            ff_m_ready;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_ff_s
        jelly_data_ff
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .S_REGS         (S_REGS),
                    .M_REGS         (0)
                )
            i_data_ff_s
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         (s_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .s_valid        (s_valid[i]),
                    .s_ready        (s_ready[i]),
                    
                    .m_data         (ff_s_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .m_valid        (ff_s_valid[i]),
                    .m_ready        (ff_s_ready[i])
                );
    end
    endgenerate
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (NUM*DATA_WIDTH),
                .SLAVE_REGS     (0),
                .MASTER_REGS    (M_REGS)
            )
        i_pipeline_insert_ff_m
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m_data),
                .s_valid        (ff_m_valid),
                .s_ready        (ff_m_ready),
                
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    
    // -----------------------------------------
    //  combin
    // -----------------------------------------
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_s_ready
        assign ff_s_ready[i] = (ff_m_valid && ff_m_ready);
    end
    endgenerate
    
    assign ff_m_data  = ff_s_data;
    assign ff_m_valid = &ff_s_valid;
    
    
endmodule


`default_nettype wire


// end of file
