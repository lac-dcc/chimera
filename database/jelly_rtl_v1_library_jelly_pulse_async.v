// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// pulse clock convert
module jelly_pulse_async
        #(
            parameter   ASYNC = 1
        )
        (
            input   wire                        s_reset,
            input   wire                        s_clk,
            input   wire                        s_pulse,
            
            input   wire                        m_reset,
            input   wire                        m_clk,
            output  wire                        m_pulse
        );
    
    generate
    if ( ASYNC ) begin : blk_async
        // semaphore
                                    reg                         reg_s_sem0;
        
        (* ASYNC_REG = "true" *)    reg                         reg_m_sem0_ff;
                                    reg                         reg_m_sem0;
                                    reg                         reg_m_sem1;
        
        
        
        // slave
        always @(posedge s_clk) begin
            if ( s_reset ) begin
                reg_s_sem0 <= 1'b0;
            end
            else begin
                if ( s_pulse ) begin
                    reg_s_sem0 <= ~reg_s_sem0;
                end
            end
        end
        
        
        // master
        always @(posedge m_clk) begin
            if ( m_reset ) begin
                reg_m_sem0_ff <= 1'b0;
                reg_m_sem0    <= 1'b0;
                reg_m_sem1    <= 1'b0;
            end
            else begin
                // double latch
                reg_m_sem0_ff <= reg_s_sem0;
                reg_m_sem0    <= reg_m_sem0_ff;
                
                if ( m_pulse ) begin
                    reg_m_sem1 <= ~reg_m_sem1;
                end
            end
        end
        
        assign m_pulse = (reg_m_sem0 != reg_m_sem1);
    end
    else begin : blk_sync
        assign m_pulse = s_pulse;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
