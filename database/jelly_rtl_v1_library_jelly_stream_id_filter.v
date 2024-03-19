// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 
module jelly_stream_id_filter
        #(
            parameter   NUM            = 16,
            parameter   ID_WIDTH       = 4,
            parameter   DATA_WIDTH     = 32,
            parameter   BYPASS         = 0,
            parameter   FIFO_PTR_WIDTH = 6,
            parameter   FIFO_RAM_TYPE  = "distributed"
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [ID_WIDTH-1:0]          s_filter_id,
            input   wire                            s_filter_valid,
            output  wire                            s_filter_ready,
            
            input   wire    [NUM-1:0]               s_last,
            input   wire    [NUM*DATA_WIDTH-1:0]    s_data,
            input   wire    [NUM-1:0]               s_valid,
            output  wire    [NUM-1:0]               s_ready,
            
            output  wire    [NUM-1:0]               m_last,
            output  wire    [NUM*DATA_WIDTH-1:0]    m_data,
            output  wire    [NUM-1:0]               m_valid,
            input   wire    [NUM-1:0]               m_ready
        );
    
    genvar  i;
    
    generate
    if ( BYPASS ) begin : blk_bypass
        assign m_last  = s_last;
        assign m_data  = s_data;
        assign m_valid = s_valid;
        assign s_ready = m_ready;
    end
    else begin : blk_filter
        // FIFO
        wire    [ID_WIDTH-1:0]          filter_id;
        wire                            filter_valid;
        wire                            filter_ready;
        jelly_fifo_fwtf
                #(
                    .DATA_WIDTH     (ID_WIDTH),
                    .PTR_WIDTH      (FIFO_PTR_WIDTH),
                    .DOUT_REGS      (0),
                    .RAM_TYPE       (FIFO_RAM_TYPE),
                    .MASTER_REGS    (1)
                )
            jelly_fifo_fwtf
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .s_data         (s_filter_id),
                    .s_valid        (s_filter_valid),
                    .s_ready        (s_filter_ready),
                    .s_free_count   (),
                    
                    .m_data         (filter_id),
                    .m_valid        (filter_valid),
                    .m_ready        (filter_ready & cke),
                    .m_data_count   ()
                );
        
        assign filter_ready = |(m_valid & m_ready & m_last);
        
        for ( i = 0; i < NUM; i = i+1 ) begin : loop_filter
            
            wire    filter_ready = (filter_valid && (i == filter_id));
            
            assign m_last[i]                          = s_last[i];
            assign m_data[i*DATA_WIDTH +: DATA_WIDTH] = s_data[i*DATA_WIDTH +: DATA_WIDTH];
            assign m_valid[i]                         = (s_valid[i] & filter_ready);
            assign s_ready[i]                         = (m_ready[i] & filter_ready);
        end
    end
    endgenerate
    
    
endmodule



`default_nettype wire


// end of file
