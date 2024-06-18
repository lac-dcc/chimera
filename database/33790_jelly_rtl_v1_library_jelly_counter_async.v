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



// カウンタ積算値を非同期先に伝播
module jelly_counter_async
        #(
            parameter   ASYNC         = 1,
            parameter   COUNTER_WIDTH = 16
        )
        (
            input   wire                        s_reset,
            input   wire                        s_clk,
            input   wire    [COUNTER_WIDTH-1:0] s_add,
            input   wire                        s_valid,
            
            input   wire                        m_reset,
            input   wire                        m_clk,
            output  wire    [COUNTER_WIDTH-1:0] m_counter,
            output  wire                        m_valid
        );
    
    
    generate
    if ( ASYNC ) begin : blk_async
        
        wire                            s_ready;
        
        reg     [COUNTER_WIDTH-1:0]     reg_counter, next_counter;
        
        always @* begin
            next_counter = reg_counter;
            
            if ( s_ready ) begin
                next_counter = {COUNTER_WIDTH{1'b0}};
            end
            
            if ( s_valid ) begin
                next_counter = next_counter + s_add;
            end
        end
        
        always @(posedge s_clk) begin
            if ( s_reset ) begin
                reg_counter <= {COUNTER_WIDTH{1'b0}};
            end
            else begin
                reg_counter <= next_counter;
            end
        end
        
        
        jelly_data_async
                #(
                    .DATA_WIDTH     (COUNTER_WIDTH)
                )
            i_data_async
                (
                    .s_reset        (s_reset),
                    .s_clk          (s_clk),
                    .s_data         (reg_counter),
                    .s_valid        (1'b1),
                    .s_ready        (s_ready),
                    
                    .m_reset        (m_reset),
                    .m_clk          (m_clk),
                    .m_data         (m_counter),
                    .m_valid        (m_valid),
                    .m_ready        (1'b1)
                );
    end
    else begin : blk_bypass
        assign m_counter = s_add;
        assign m_valid   = s_valid;
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
