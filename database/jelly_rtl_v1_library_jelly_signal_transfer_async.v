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


// データを持たないFIFO的挙動のカウンタ
// データではなくシグナルの回数だけを伝えるための


module jelly_signal_transfer_async
        #(
            parameter   PTR_WIDTH      = 6,
            parameter   CAPACITY_WIDTH = 8
        )
        (
            input   wire    s_reset,
            input   wire    s_clk,
            input   wire    s_valid,
            
            input   wire    m_reset,
            input   wire    m_clk,
            output  wire    m_valid,
            input   wire    m_ready
        );
    
    
    // gray code
    wire    [PTR_WIDTH-1:0] s_bin;
    wire    [PTR_WIDTH-1:0] s_gray;
    wire    [PTR_WIDTH-1:0] m_gray;
    wire    [PTR_WIDTH-1:0] m_bin;
    jelly_func_binary_to_graycode
            #(
                .WIDTH  (PTR_WIDTH)
            )
        i_func_binary_to_graycode
            (
                .binary     (s_bin),
                .graycode   (s_gray)
            );
    
    jelly_func_graycode_to_binary
            #(
                .WIDTH      (PTR_WIDTH)
            )
        i_func_graycode_to_binary
            (
                .graycode   (m_gray),
                .binary     (m_bin)
            );
    
    
    reg     [PTR_WIDTH-1:0] reg_s_ptr;
    reg     [PTR_WIDTH-1:0] reg_s_gray;
    
    wire    [PTR_WIDTH-1:0] next_s_ptr = reg_s_ptr + s_valid;
    
    always @(posedge s_clk) begin
        if ( s_reset ) begin
            reg_s_ptr  <= {PTR_WIDTH{1'b0}};
            reg_s_gray <= {PTR_WIDTH{1'b0}};
        end
        else begin
            reg_s_ptr  <= next_s_ptr;
            reg_s_gray <= s_gray;
        end
    end
    
    assign s_bin = next_s_ptr;
    
    (* ASYNC_REG="true" *)  reg     [PTR_WIDTH-1:0] reg_m_gray_ff, reg_m_gray;
                            reg     [PTR_WIDTH-1:0] reg_m_bin;
    
    assign m_gray = reg_m_gray;
    
    always @(posedge m_clk) begin
        if ( m_reset ) begin
            reg_m_gray_ff <= {PTR_WIDTH{1'b0}};
            reg_m_gray    <= {PTR_WIDTH{1'b0}};
            reg_m_bin     <= {PTR_WIDTH{1'b0}};
        end
        else begin
            reg_m_gray_ff <= reg_s_gray;
            reg_m_gray    <= reg_m_gray_ff;
            reg_m_bin     <= m_bin;
        end
    end
    
    wire    [PTR_WIDTH-1:0]         ptr_diff = m_bin - reg_m_bin;
    
    reg                             reg_valid;
    reg     [CAPACITY_WIDTH-1:0]    reg_capacity;
    wire    [CAPACITY_WIDTH-1:0]    next_capacity = reg_capacity + ptr_diff - (m_valid & m_ready);
    
    always @(posedge m_clk) begin
        if ( m_reset ) begin
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
