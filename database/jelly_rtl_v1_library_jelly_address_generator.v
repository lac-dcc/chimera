// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// アドレスを生成する
module jelly_address_generator
        #(
            parameter   ADDR_WIDTH  = 32,
            parameter   ADDR_UNIT   = 1,
            parameter   SIZE_WIDTH  = 32,
            parameter   LEN_WIDTH   = 8,
            parameter   SIZE_OFFSET = 1'b0,
            parameter   LEN_OFFSET  = 1'b1,
            parameter   S_REGS      = 1'b1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [ADDR_WIDTH-1:0]    s_addr,
            input   wire    [SIZE_WIDTH-1:0]    s_size,
            input   wire    [LEN_WIDTH-1:0]     s_max_len,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire    [LEN_WIDTH-1:0]     m_len,
            output  wire                        m_last,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    //  insert FF
    wire    [ADDR_WIDTH-1:0]    ff_s_addr;
    wire    [SIZE_WIDTH-1:0]    ff_s_size;
    wire    [LEN_WIDTH-1:0]     ff_s_max_len;
    wire                        ff_s_valid;
    wire                        ff_s_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (ADDR_WIDTH + SIZE_WIDTH + LEN_WIDTH),
                .SLAVE_REGS         (S_REGS),
                .MASTER_REGS        (0)
            )
        i_pipeline_insert_ff_s
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({s_addr, s_size, s_max_len}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({ff_s_addr, ff_s_size, ff_s_max_len}),
                .m_valid            (ff_s_valid),
                .m_ready            (ff_s_ready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    
    // stage0
    reg     [ADDR_WIDTH-1:0]        st0_addr_base;
    reg     [LEN_WIDTH-1:0]         st0_max_len;
    reg     [SIZE_WIDTH-1:0]        st0_addr;
    reg     [SIZE_WIDTH-1:0]        st0_size;
    reg                             st0_valid;
    wire                            st0_ready;
    
    wire                            st0_last = (({1'b0, st0_size} + SIZE_OFFSET) <= ({1'b0, st0_max_len} + LEN_OFFSET));
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_addr_base <= {ADDR_WIDTH{1'bx}};
            st0_max_len   <= {LEN_WIDTH{1'bx}};
            st0_addr      <= {SIZE_WIDTH{1'bx}};
            st0_size      <= {SIZE_WIDTH{1'bx}};
            st0_valid     <= 1'b0;
        end
        else if ( cke ) begin
            if ( !st0_valid || st0_ready ) begin
                if ( !st0_valid ) begin
                    st0_addr_base <= ff_s_addr;
                    st0_size      <= ff_s_size;
                    st0_max_len   <= ff_s_max_len;
                    st0_addr      <= {SIZE_WIDTH{1'b0}};
                    st0_valid     <= ff_s_valid;
                end
                else begin
                    st0_addr      <= st0_addr + (st0_max_len + LEN_OFFSET) * ADDR_UNIT;
                    st0_size      <= st0_size - st0_max_len - LEN_OFFSET;
                    st0_valid     <= !st0_last;
                end
            end
        end
    end
    
    assign ff_s_ready = (!st0_valid || st0_ready) && !st0_valid;
    
    
    // stage1
    reg     [ADDR_WIDTH-1:0]        st1_addr;
    reg     [LEN_WIDTH-1:0]         st1_len;
    reg                             st1_last;
    reg                             st1_valid;
    wire                            st1_ready;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st1_addr   <= {ADDR_WIDTH{1'bx}};
            st1_len    <= {LEN_WIDTH{1'bx}};
            st1_last   <= 1'bx;
            st1_valid  <= 1'b0;
        end
        else if ( cke ) begin
            if ( st1_ready ) begin
                st1_addr   <= {ADDR_WIDTH{1'bx}};
                st1_len    <= {LEN_WIDTH{1'bx}};
                st1_last   <= 1'bx;
                st1_valid  <= 1'b0;
            end
            if ( st0_valid && st0_ready ) begin
                st1_addr  <= st0_addr_base + st0_addr;
                st1_len   <= st0_last ? (st0_size + SIZE_OFFSET - LEN_OFFSET) : st0_max_len;
                st1_last  <= st0_last;
                st1_valid <= 1'b1;
            end
        end
    end
    
    assign st0_ready = (!st1_valid || st1_ready);
    
    
    
    // master
    assign m_addr    = st1_addr;
    assign m_len     = st1_len;
    assign m_last    = st1_last;
    assign m_valid   = st1_valid;
    
    assign st1_ready = m_ready;
    
    
endmodule


`default_nettype wire


// end of file
