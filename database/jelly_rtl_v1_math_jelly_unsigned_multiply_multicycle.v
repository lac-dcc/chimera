// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 符号なし整数マルチサイクル乗算器
module jelly_unsigned_multiply_multicycle
        #(
            parameter   DATA_WIDTH0 = 32,
            parameter   DATA_WIDTH1 = 32
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            // input
            input   wire    [DATA_WIDTH0-1:0]               s_data0,
            input   wire    [DATA_WIDTH1-1:0]               s_data1,
            input   wire                                    s_valid,
            output  wire                                    s_ready,
            
            // output
            output  wire    [DATA_WIDTH0+DATA_WIDTH1-1:0]   m_data,
            output  wire                                    m_valid,
            input   wire                                    m_ready
        );
    
    reg                                     reg_busy;
    reg                                     reg_ready;
    reg                                     reg_valid;
    
    reg     [DATA_WIDTH1-1:0]               reg_k;
    reg     [DATA_WIDTH0+DATA_WIDTH1-1:0]   reg_m;
    reg     [DATA_WIDTH0+DATA_WIDTH1-1:0]   reg_q;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_busy    <= 1'b0;
            reg_ready   <= 1'b0;
            reg_valid   <= 1'b0;
            reg_k       <= {DATA_WIDTH1{1'bx}};
            reg_m       <= {(DATA_WIDTH0+DATA_WIDTH1){1'bx}};
            reg_q       <= {(DATA_WIDTH0+DATA_WIDTH1){1'bx}};
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
                reg_m       <= s_data0;
                reg_k       <= s_data1;
                reg_q       <= 0;
                reg_busy    <= 1'b1;
                reg_ready   <= 1'b0;
            end
            else if ( reg_busy ) begin
                if ( reg_k[0] ) begin
                    reg_q <= reg_q + reg_m;
                end
                reg_k <= reg_k >> 1;
                reg_m <= reg_m << 1;
                
                if ( reg_k == 0 ) begin
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
