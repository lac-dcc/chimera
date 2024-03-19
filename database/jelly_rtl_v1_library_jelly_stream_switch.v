// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ring bus unit
module jelly_stream_switch
        #(
            parameter   NUM         = 16,
            parameter   ID_WIDTH    = 2,
            parameter   DATA_WIDTH  = 32,
            parameter   S_REGS      = 1,
            parameter   M_REGS      = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [ID_WIDTH-1:0]          s_id,
            input   wire                            s_last,
            input   wire    [DATA_WIDTH-1:0]        s_data,
            input   wire                            s_valid,
            output  wire                            s_ready,
            
            output  wire    [NUM-1:0]               m_last,
            output  wire    [NUM*DATA_WIDTH-1:0]    m_data,
            output  wire    [NUM-1:0]               m_valid,
            input   wire    [NUM-1:0]               m_ready
        );
    
    genvar      i;
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    [ID_WIDTH-1:0]          ff_s_id;
    wire                            ff_s_last;
    wire    [DATA_WIDTH-1:0]        ff_s_data;
    wire                            ff_s_valid;
    wire                            ff_s_ready;
    
    wire    [NUM-1:0]               ff_m_last;
    wire    [NUM*DATA_WIDTH-1:0]    ff_m_data;
    wire    [NUM-1:0]               ff_m_valid;
    wire    [NUM-1:0]               ff_m_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (ID_WIDTH + 1 + DATA_WIDTH),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (S_REGS)
            )
        i_pipeline_insert_ff_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         ({s_id, s_last, s_data}),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         ({ff_s_id, ff_s_last, ff_s_data}),
                .m_valid        (ff_s_valid),
                .m_ready        (ff_s_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_ff_m
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (1+DATA_WIDTH),
                    .SLAVE_REGS     (M_REGS),
                    .MASTER_REGS    (M_REGS)
                )
            i_pipeline_insert_ff_m
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         ({ff_m_last[i], ff_m_data[i*DATA_WIDTH +: DATA_WIDTH]}),
                    .s_valid        (ff_m_valid[i]),
                    .s_ready        (ff_m_ready[i]),
                    
                    .m_data         ({m_last[i], m_data[i*DATA_WIDTH +: DATA_WIDTH]}),
                    .m_valid        (m_valid[i]),
                    .m_ready        (m_ready[i]),
                    
                    .buffered       (),
                    .s_ready_next   ()
                );
    end
    endgenerate
    
    
    
    // -----------------------------------------
    //  switch
    // -----------------------------------------
    
    reg                             sig_s_ready;
    reg     [NUM-1:0]               sig_m_valid;
    
    integer                         j;
    
    always @* begin
        sig_s_ready = 1'b0;
        sig_m_valid = {NUM{1'b0}};
        
        for ( j = 0; j < NUM; j = j+1 ) begin
            if ( ff_s_id == j ) begin
                sig_s_ready    = ff_m_ready[j];
                sig_m_valid[j] = ff_s_valid;
            end
        end
    end
    
    assign ff_s_ready = sig_s_ready;
    
    assign ff_m_last  = {NUM{ff_s_last}};
    assign ff_m_data  = {NUM{ff_s_data}};
    assign ff_m_valid = sig_m_valid;
    
    
endmodule


`default_nettype wire


// end of file
