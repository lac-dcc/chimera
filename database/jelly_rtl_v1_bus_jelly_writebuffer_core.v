// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// write buffer
module jelly_writebuffer_core
        #(
            parameter   ADDR_WIDTH  = 32,
            parameter   DATA_SIZE   = 2,
            parameter   DATA_WIDTH  = (8 << DATA_SIZE),
            parameter   STRB_WIDTH  = (1 << DATA_SIZE)
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            // slave port
            input   wire    [ADDR_WIDTH-1:0]    s_addr,
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire    [STRB_WIDTH-1:0]    s_strb,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            // master port
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire    [STRB_WIDTH-1:0]    m_strb,
            output  wire                        m_valid,
            input   wire                        m_ready,
            
            // forwarding
            input   wire    [ADDR_WIDTH-1:0]    forward_addr,
            input   wire    [DATA_WIDTH-1:0]    forward_data,
            input   wire    [STRB_WIDTH-1:0]    forward_strb,
            input   wire                        forward_valid,
            output  wire                        forward_ready
        );
    
    reg     [ADDR_WIDTH-1:0]    reg_addr,  next_addr;
    reg     [DATA_WIDTH-1:0]    reg_data,  next_data;
    reg     [STRB_WIDTH-1:0]    reg_strb,  next_strb;
    reg                         reg_valid, next_valid;
    reg                         sig_s_ready;
    reg                         sig_forward_ready;
    integer                     i;
    always @* begin
        next_addr         = reg_addr;
        next_data         = reg_data;
        next_strb         = reg_strb;
        next_valid        = reg_valid;
        sig_s_ready       = 1'b0;
        sig_forward_ready = 1'b0;
        
        // write end
        if ( m_valid && m_ready ) begin
            next_strb  = {STRB_WIDTH{1'b0}};
            next_valid = 1'b0;
        end
        
        // write
        if ( !next_valid || (s_addr == next_addr) ) begin
            next_addr = s_addr;
            for ( i = 0; i < STRB_WIDTH; i = i+1 ) begin
                if ( s_strb[i] ) begin
                    next_data[i*8 +: 8] = s_data[i*8 +: 8];
                    next_strb[i]        = 1'b1;
                    next_valid          = 1'b1;
                end
            end
            sig_s_ready = 1'b1;
        end
        
        // forwarding (over write)
        if ( next_valid && (next_addr == forward_addr) ) begin
            for ( i = 0; i < STRB_WIDTH; i = i+1 ) begin
                if ( forward_strb[i] ) begin
                    next_data[i*8 +: 8] = forward_data[i*8 +: 8];
                    next_strb[i]        = 1'b1;
                    next_valid          = 1'b1;
                end
            end
            sig_forward_ready = 1'b1;
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_addr  <= {ADDR_WIDTH{1'bx}};
            reg_data  <= {DATA_WIDTH{1'bx}};
            reg_strb  <= {STRB_WIDTH{1'b0}};
            reg_valid <= 1'b0;
        end
        else if ( cke ) begin
            reg_addr  <= next_addr;
            reg_data  <= next_data;
            reg_strb  <= next_strb;
            reg_valid <= next_valid;
        end
    end
    
    assign s_ready       = sig_s_ready;
    
    assign m_addr        = reg_addr;
    assign m_data        = reg_data;
    assign m_strb        = reg_strb;
    assign m_valid       = reg_valid;
    
    assign forward_ready = sig_forward_ready;
    
endmodule


`default_nettype wire


// end of file
