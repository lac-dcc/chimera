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



// マルチサイクル平方根
module jelly_unsigned_sqrt_multicycle
        #(
            parameter   DATA_WIDTH = 32
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            // input
            input   wire    [2*DATA_WIDTH-1:0]  s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            // output
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    reg                             reg_busy;
    reg                             reg_ready;
    reg                             reg_valid;
    
    reg     [DATA_WIDTH-1:0]        reg_counter;
    reg     [DATA_WIDTH-1:0]        reg_q;
    reg     [2*DATA_WIDTH-1:0]      reg_r;
    reg     [2*DATA_WIDTH-2-1:0]    reg_z;
    
    
    wire    [2*DATA_WIDTH-1:0]    remainder = reg_r - {1'b0, reg_q, 2'b01};
    wire                          r_sign    = ~remainder[2*DATA_WIDTH-1];
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_busy    <= 1'b0;
            reg_ready   <= 1'b0;
            reg_valid   <= 1'b0;
            reg_counter <= {DATA_WIDTH{1'bx}};
            reg_q       <= {DATA_WIDTH{1'bx}};
            reg_r       <= {(2*DATA_WIDTH){1'bx}};
            reg_z       <= {(2*DATA_WIDTH-2){1'bx}};
        end
        else if ( cke ) begin
            if ( !reg_busy && !reg_valid ) begin
                reg_ready <= 1'b1;
            end
            
            if ( m_valid & m_ready ) begin
                reg_valid <= 1'b0;
                reg_ready <= 1'b1;
            end
            
            if ( s_valid & s_ready & !m_valid ) begin
                // start
                {reg_r, reg_z} <= s_data;
                reg_q          <= 0;
                reg_busy       <= 1'b1;
                reg_ready      <= 1'b0;
                reg_counter    <= 0;
            end
            else if ( reg_busy ) begin
                reg_q <= {reg_q, r_sign};
                if ( r_sign ) begin
                    {reg_r, reg_z} <= {remainder, reg_z} << 2;
                end
                else begin
                    {reg_r, reg_z} <= {reg_r, reg_z} << 2;
                end
                reg_counter = {reg_counter, 1'b1};
                if ( reg_counter[DATA_WIDTH-1] ) begin
                    reg_busy  <= 1'b0;
                    reg_valid <= 1'b1;
                end
            end
        end
    end
    
    assign s_ready = reg_ready;
    
    assign m_data  = reg_q;
    assign m_valid = reg_valid;
    
endmodule


`default_nettype wire


// end of file
