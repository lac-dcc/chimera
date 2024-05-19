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



// joint
module jelly_data_joint_priority
        #(
            parameter   NUM         = 16,
            parameter   ID_WIDTH    = 4,
            parameter   DATA_WIDTH  = 32,
            parameter   NO_CONFLICT = 0,            // 同時にデータが来ない場合
            parameter   S_REGS      = !NO_CONFLICT,
            parameter   M_REGS      = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [NUM*DATA_WIDTH-1:0]    s_data,
            input   wire    [NUM-1:0]               s_valid,
            output  wire    [NUM-1:0]               s_ready,
            
            output  wire    [ID_WIDTH-1:0]          m_id,
            output  wire    [DATA_WIDTH-1:0]        m_data,
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
    
    wire    [ID_WIDTH-1:0]          ff_m_id;
    wire    [DATA_WIDTH-1:0]        ff_m_data;
    wire                            ff_m_valid;
    wire                            ff_m_ready;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_ff_s
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .SLAVE_REGS     (S_REGS),
                    .MASTER_REGS    (S_REGS)
                )
            i_pipeline_insert_ff_s
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         (s_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .s_valid        (s_valid[i]),
                    .s_ready        (s_ready[i]),
                    
                    .m_data         (ff_s_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .m_valid        (ff_s_valid[i]),
                    .m_ready        (ff_s_ready[i]),
                    
                    .buffered       (),
                    .s_ready_next   ()
                );
    end
    endgenerate
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (ID_WIDTH + DATA_WIDTH),
                .SLAVE_REGS     (M_REGS),
                .MASTER_REGS    (M_REGS)
            )
        i_pipeline_insert_ff_m
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         ({ff_m_id, ff_m_data}),
                .s_valid        (ff_m_valid),
                .s_ready        (ff_m_ready),
                
                .m_data         ({m_id, m_data}),
                .m_valid        (m_valid),
                .m_ready        (m_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    
    // -----------------------------------------
    //  joint
    // -----------------------------------------
    
    reg     [NUM-1:0]               sig_s_ready;
    
    reg     [ID_WIDTH-1:0]          sig_m_id;
    reg     [DATA_WIDTH-1:0]        sig_m_data;
    reg                             sig_m_valid;
    
    integer                         j;
    
    always @* begin
        sig_s_ready = {NUM{1'b0}};
        sig_m_data  = {DATA_WIDTH{1'bx}};
        sig_m_valid = 1'b0;
        
        if ( NO_CONFLICT ) begin
            sig_s_ready = {NUM{ff_m_ready}};
            sig_m_valid = |ff_s_valid;
        end
        else begin
            begin : loop_control
                for ( j = 0; j < NUM; j = j+1 ) begin
                    if ( ff_s_valid[j] ) begin
                        sig_s_ready[j] = ff_m_ready;
                        sig_m_valid    = ff_s_valid[j];
                        disable loop_control;
                    end
                end
            end
        end
        
        begin : loop_data
            for ( j = 0; j < NUM; j = j+1 ) begin
                if ( ff_s_valid[j] ) begin
                    sig_m_id   = j;
                    sig_m_data = ff_s_data[j*DATA_WIDTH +: DATA_WIDTH];
                    disable loop_data;
                end
            end
        end
    end
    
    assign ff_s_ready = sig_s_ready;
    
    assign ff_m_id    = sig_m_id;
    assign ff_m_data  = sig_m_data;
    assign ff_m_valid = sig_m_valid;
    
    
endmodule



`default_nettype wire


// end of file
