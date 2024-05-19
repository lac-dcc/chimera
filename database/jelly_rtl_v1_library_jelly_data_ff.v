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



// insert FF
module jelly_data_ff
        #(
            parameter   DATA_WIDTH = 8,
            parameter   S_REGS     = 1,
            parameter   M_REGS     = 1,
            
            parameter   DATA_BITS  = DATA_WIDTH > 0 ? DATA_WIDTH : 1,
            parameter   INIT_DATA  = {DATA_BITS{1'bx}}
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            // slave port
            input   wire    [DATA_BITS-1:0]     s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            // master port
            output  wire    [DATA_BITS-1:0]     m_data,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (DATA_BITS),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (M_REGS),
                .INIT_DATA      (INIT_DATA)
            )
        i_pipeline_insert_ff
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
endmodule


`default_nettype wire


// end of file
