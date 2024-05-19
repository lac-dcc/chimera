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



module jelly_data_split
        #(
            parameter NUM        = 16,
            parameter DATA_WIDTH = 8,
            parameter S_REGS     = 0,
            parameter M_REGS     = 0
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
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
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (NUM*DATA_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (S_REGS)
            )
        i_data_ff_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (ff_s_data),
                .m_valid        (ff_s_valid),
                .m_ready        (ff_s_ready)
            );
    
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_ff_m
        jelly_data_ff
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .S_REGS         (M_REGS),
                    .M_REGS         (M_REGS)
                )
            i_data_ff_m
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         (ff_m_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .s_valid        (ff_m_valid[i]),
                    .s_ready        (ff_m_ready[i]),
                    
                    .m_data         (m_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .m_valid        (m_valid[i]),
                    .m_ready        (m_ready[i])
                );
    end
    endgenerate
    
    
    
    // -----------------------------------------
    //  split
    // -----------------------------------------
    
    reg     [NUM-1:0]           reg_complete;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_complete <= {NUM{1'b0}};
        end
        else if ( cke ) begin
            if ( ff_s_valid & ff_s_ready ) begin
                reg_complete <= {NUM{1'b0}};
            end
            else if ( |ff_m_valid ) begin
                reg_complete <= (reg_complete | ff_m_ready);
            end
        end
    end
    
    assign ff_s_ready = |ff_m_valid && ((ff_m_ready | reg_complete)) == {NUM{1'b1}};
    
    assign ff_m_data  = ff_s_data;
    assign ff_m_valid = {NUM{ff_s_valid}} & ~reg_complete;
    
    
    
endmodule


`default_nettype wire


// end of file
