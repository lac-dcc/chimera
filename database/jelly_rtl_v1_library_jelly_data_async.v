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



// data clock convert
module jelly_data_async
        #(
            parameter   ASYNC      = 1,
            parameter   DATA_WIDTH = 8
        )
        (
            input   wire                        s_reset,
            input   wire                        s_clk,
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            input   wire                        m_reset,
            input   wire                        m_clk,
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    generate
    if ( ASYNC ) begin : blk_async
        // semaphore
                                    reg                         reg_s_sem0;
        (* ASYNC_REG = "true" *)    reg                         reg_s_sem1_ff;
                                    reg                         reg_s_sem1;
                                    reg     [DATA_WIDTH-1:0]    reg_s_data;
        
        (* ASYNC_REG = "true" *)    reg                         reg_m_sem0_ff0;
                                    reg                         reg_m_sem0_ff1;
                                    reg                         reg_m_sem0;
                                    reg                         reg_m_sem1;
                                    reg     [DATA_WIDTH-1:0]    reg_m_data;
        
        
        
        // slave
        always @(posedge s_clk) begin
            if ( s_reset ) begin
                reg_s_sem0    <= 1'b0;
                reg_s_sem1_ff <= 1'b0;
                reg_s_sem1    <= 1'b0;
                reg_s_data    <= {DATA_WIDTH{1'bx}};
            end
            else begin
                // double latch
                reg_s_sem1_ff <= reg_m_sem1;
                reg_s_sem1    <= reg_s_sem1_ff;
                
                // data
                if ( s_valid & s_ready ) begin
                    reg_s_sem0 <= ~reg_s_sem0;
                    reg_s_data <= s_data;
                end
            end
        end
        
        assign s_ready = (reg_s_sem0 == reg_s_sem1);
        
        
        
        // master
        always @(posedge m_clk) begin
            if ( m_reset ) begin
                reg_m_sem0_ff0 <= 1'b0;
                reg_m_sem0_ff1 <= 1'b0;
                reg_m_sem0     <= 1'b0;
                reg_m_sem1     <= 1'b0;
                reg_m_data     <= {DATA_WIDTH{1'bx}};
            end
            else begin
                // double latch
                reg_m_sem0_ff0 <= reg_s_sem0;
                reg_m_sem0_ff1 <= reg_m_sem0_ff0;
                reg_m_sem0     <= reg_m_sem0_ff1;
                
                reg_m_data     <= reg_s_data;
                
                if ( m_valid & m_ready ) begin
                    reg_m_sem1 <= ~reg_m_sem1;
                end
            end
        end
        
        assign m_data  = reg_m_data;
        assign m_valid = (reg_m_sem0 != reg_m_sem1);
    end
    else begin : blk_bypass
        assign m_data  = s_data;
        assign m_valid = s_valid;
        assign s_ready = m_ready;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
