// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// データを持たないFIFO的挙動のカウンタ
// データではなくシグナルの回数だけを伝えるための


module jelly_signal_transfer_sync
        #(
            parameter CAPACITY_WIDTH = 8
        )
        (
            input   wire    reset,
            input   wire    clk,
            
            input   wire    s_valid,
            
            output  wire    m_valid,
            input   wire    m_ready
        );
    
    reg                             reg_valid;
    reg     [CAPACITY_WIDTH-1:0]    reg_capacity;
    wire    [CAPACITY_WIDTH-1:0]    next_capacity = reg_capacity + s_valid - (m_valid & m_ready);
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_valid    <= 1'b0;
            reg_capacity <= {CAPACITY_WIDTH{1'b0}};
        end
        else begin
            reg_valid    <= (next_capacity != 0);
            reg_capacity <= next_capacity;
        end
    end
    
    assign m_valid = reg_valid;
    
endmodule


`default_nettype wire


// end of file
