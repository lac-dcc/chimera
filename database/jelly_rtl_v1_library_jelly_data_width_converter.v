// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_data_width_converter
        #(
            parameter   UNIT_WIDTH   = 1,
            parameter   S_DATA_SIZE  = 0,   // log2 (0:1bit, 1:2bit, 2:4bit, 3:8bit...)
            parameter   M_DATA_SIZE  = 0,   // log2 (0:1bit, 1:2bit, 2:4bit, 3:8bit...)
            parameter   S_DATA_WIDTH = (1 << S_DATA_SIZE) * UNIT_WIDTH,
            parameter   M_DATA_WIDTH = (1 << M_DATA_SIZE) * UNIT_WIDTH,
            parameter   INIT_DATA    = {M_DATA_WIDTH{1'bx}}
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        endian,
            
            input   wire    [S_DATA_WIDTH-1:0]  s_data,
            input   wire                        s_first,
            input   wire                        s_last,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [M_DATA_WIDTH-1:0]  m_data,
            output  wire                        m_first,
            output  wire                        m_last,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    localparam  SEL_WIDTH = (M_DATA_SIZE > S_DATA_SIZE) ? (M_DATA_SIZE - S_DATA_SIZE) : (S_DATA_SIZE - M_DATA_SIZE);
    
    generate
    if ( M_DATA_SIZE == S_DATA_SIZE ) begin : through
        // through
        assign s_ready = m_ready & cke;
        assign m_data  = s_data;
        assign m_first = s_first;
        assign m_last  = s_last;
        assign m_valid = s_valid & !reset;
    end
    else if ( M_DATA_SIZE > S_DATA_SIZE ) begin : upsize
        // upsizer
        reg     [M_DATA_WIDTH-1:0]  reg_m_data,  next_m_data;
        reg                         reg_m_first, next_m_first;
        reg                         reg_m_last,  next_m_last;
        reg                         reg_m_valid, next_m_valid;
        reg     [SEL_WIDTH-1:0]     reg_sel,     next_sel;
        
        wire    [M_DATA_WIDTH-1:0]  next_data;
        wire    [M_DATA_WIDTH-1:0]  next_mask;
        
        jelly_demultiplexer
                #(
                    .SEL_WIDTH      (SEL_WIDTH),
                    .IN_WIDTH       (S_DATA_WIDTH)
                )
            i_demultiplexer_data
                (
                    .endian         (endian),
                    .sel            (reg_sel),
                    .din            (s_data),
                    .dout           (next_data)
                );
        
        jelly_demultiplexer
                #(
                    .SEL_WIDTH      (SEL_WIDTH),
                    .IN_WIDTH       (S_DATA_WIDTH)
                )
            i_demultiplexer_mask
                (
                    .endian         (endian),
                    .sel            (reg_sel),
                    .din            ({S_DATA_WIDTH{1'b1}}),
                    .dout           (next_mask)
                );
        
        always @* begin
            next_m_data  = reg_m_data;
            next_m_first = reg_m_first;
            next_m_last  = reg_m_last;
            next_m_valid = reg_m_valid;
            next_sel     = reg_sel;
            
            if ( m_valid & m_ready ) begin
                next_m_data  = INIT_DATA;
                next_m_first = 1'b0;
                next_m_last  = 1'b0;
                next_m_valid = 1'b0;
            end
            
            if ( s_valid & s_ready ) begin
                if ( s_first ) begin
                    next_m_data  = INIT_DATA;
                    next_m_first = 1'b1;
                    next_sel     = {SEL_WIDTH{1'b0}};
                end
                
                next_m_data = ((next_m_data & ~next_mask) | next_data);
                next_m_last = s_last;
                
                next_sel    = reg_sel + 1'b1;
                if ( (reg_sel == {SEL_WIDTH{1'b1}}) || s_last ) begin
                    next_m_valid = 1'b1;
                    next_sel     = {SEL_WIDTH{1'b0}};
                end
            end
        end
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_m_data  <= INIT_DATA;
                reg_m_first <= 1'bx;
                reg_m_last  <= 1'bx;
                reg_m_valid <= 1'b0;
                reg_sel     <= {SEL_WIDTH{1'b0}};
            end
            else if ( cke ) begin
                reg_m_data  <= next_m_data;
                reg_m_first <= next_m_first;
                reg_m_last  <= next_m_last;
                reg_m_valid <= next_m_valid;
                reg_sel     <= next_sel;
            end
        end
        
        assign s_ready = ((!m_valid || m_ready) && cke);
        assign m_data  = reg_m_data;
        assign m_first = reg_m_first;
        assign m_last  = reg_m_last;
        assign m_valid = reg_m_valid;
    end
    else begin : downsize
        // downsizer
        reg     [M_DATA_WIDTH-1:0]  reg_m_data,  next_m_data;
        reg                         reg_m_first, next_m_first;
        reg                         reg_m_last,  next_m_last;
        reg                         reg_m_valid, next_m_valid;
        reg     [SEL_WIDTH-1:0]     reg_sel,     next_sel;
        
        wire    [M_DATA_WIDTH-1:0]  next_data;
        
        jelly_multiplexer
                #(
                    .SEL_WIDTH      (SEL_WIDTH),
                    .OUT_WIDTH      (M_DATA_WIDTH)
                )
            i_multiplexer
                (
                    .endian         (endian),
                    .sel            (reg_sel),
                    .din            (s_data),
                    .dout           (next_data)
                );
        
        always @* begin
            next_m_data  = reg_m_data;
            next_m_first = reg_m_first;
            next_m_last  = reg_m_last;
            next_m_valid = reg_m_valid;
            next_sel     = reg_sel;
            
            if ( m_ready ) begin
                next_m_valid = 1'b0;
            end
            
            if ( !next_m_valid ) begin
                next_m_data  = next_data;
                next_m_first = 1'b0;
                next_m_last  = 1'b0;
                next_m_valid = s_valid;
                
                next_sel     = reg_sel + s_valid;
                if ( (reg_sel == {SEL_WIDTH{1'b0}}) ) begin
                    next_m_first = s_first;
                end
                if ( (reg_sel == {SEL_WIDTH{1'b1}}) ) begin
                    next_m_last  = s_last;
                end
            end
        end
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_m_data  <= INIT_DATA;
                reg_m_first <= 1'bx;
                reg_m_last  <= 1'bx;
                reg_m_valid <= 1'b0;
                reg_sel     <= {SEL_WIDTH{1'b0}};
            end
            else if ( cke ) begin
                reg_m_data  <= next_m_data;
                reg_m_first <= next_m_first;
                reg_m_last  <= next_m_last;
                reg_m_valid <= next_m_valid;
                reg_sel     <= next_sel;
            end
        end
        
        assign s_ready  = ((reg_sel == {SEL_WIDTH{1'b1}}) && m_ready && cke);
        assign m_data   = reg_m_data;
        assign m_first  = reg_m_first;
        assign m_last   = reg_m_last;
        assign m_valid  = reg_m_valid;
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
