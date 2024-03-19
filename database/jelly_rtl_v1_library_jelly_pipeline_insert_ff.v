// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// pipeline insert FF
module jelly_pipeline_insert_ff
        #(
            parameter   DATA_WIDTH  = 8,
            parameter   SLAVE_REGS  = 1,
            parameter   MASTER_REGS = 1,
            parameter   INIT_DATA   = {DATA_WIDTH{1'bx}}
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            // slave port
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            // master port
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready,
            
            // status
            output  wire                        buffered,
            output  wire                        s_ready_next
        );
    
    // internal signal
    wire    [DATA_WIDTH-1:0]    internal_data;
    wire                        internal_valid;
    wire                        internal_ready;
    
    // slave port
    generate
    if ( SLAVE_REGS ) begin : blk_slave
        reg                         reg_s_ready,   next_s_ready;
        reg     [DATA_WIDTH-1:0]    reg_buf_data,  next_buf_data;
        reg                         reg_buf_valid, next_buf_valid;
        
        always @* begin
            next_s_ready   = reg_s_ready;
            next_buf_data  = reg_buf_data;
            next_buf_valid = reg_buf_valid;
            
            if ( !reg_buf_valid && s_valid && !internal_ready ) begin
                // 次のステージに送れない状況でバッファリング
                next_s_ready   = 1'b0;
                next_buf_data  = s_data;
                next_buf_valid = 1'b1;
            end
            else begin
                if ( internal_ready ) begin
                    next_buf_valid = 1'b0;
                end
                if ( !internal_valid || internal_ready ) begin
                    next_s_ready = 1'b1;
                end
            end
        end
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_s_ready   <= 1'b0;
                reg_buf_valid <= 1'b0;
                reg_buf_data  <= INIT_DATA;
            end
            else if ( cke ) begin
                reg_s_ready   <= next_s_ready;
                reg_buf_data  <= next_buf_data;
                reg_buf_valid <= next_buf_valid;
            end
        end
        assign internal_data   = reg_buf_valid ? reg_buf_data : s_data;
        assign internal_valid  = reg_buf_valid ? 1'b1         : s_valid & reg_s_ready;
        assign s_ready         = reg_s_ready;
        assign buffered        = reg_buf_valid;
        assign s_ready_next    = next_s_ready;
    end
    else begin
        assign internal_data   = s_data;
        assign internal_valid  = s_valid;
        assign s_ready         = internal_ready;
        assign buffered        = 1'b0;
        assign s_ready_next    = 1'bx;
    end
    endgenerate
    
    
    // master port
    generate
    if ( MASTER_REGS ) begin : blk_master
        reg     [DATA_WIDTH-1:0]    reg_m_data;
        reg                         reg_m_valid;
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_m_data  <= INIT_DATA;
                reg_m_valid <= 1'b0;
            end
            else if ( cke ) begin
                if ( ~m_valid || m_ready ) begin
                    reg_m_data  <= internal_data;
                    reg_m_valid <= internal_valid;
                end
            end
        end
        
        assign internal_ready = (!m_valid || m_ready);
        assign m_data         = reg_m_data;
        assign m_valid        = reg_m_valid;
    end
    else begin
        assign internal_ready = m_ready;
        assign m_data         = internal_data;
        assign m_valid        = internal_valid;
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
