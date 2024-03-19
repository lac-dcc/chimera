// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------




`timescale 1ns / 1ps
`default_nettype none



// アドレスを生成する
module jelly_address_generator_range
        #(
            parameter   SIZE_WIDTH  = 32,
            parameter   LEN_WIDTH   = 8,
            parameter   SIZE_OFFSET = 1'b0,
            parameter   LEN_OFFSET  = 1'b1,
            parameter   S_REGS      = 1'b1,
            parameter   INIT_ADDR   = 0,
            
            // 個別変更もできるようにしておく
            parameter   ADDR_WIDTH   = SIZE_WIDTH,  // param_size の表現範囲以上であること
            parameter   S_LEN_WIDTH  = LEN_WIDTH,
            parameter   M_LEN_WIDTH  = LEN_WIDTH,   // s_len の表現範囲以上であること
            parameter   S_LEN_OFFSET = LEN_OFFSET,
            parameter   M_LEN_OFFSET = LEN_OFFSET
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [SIZE_WIDTH-1:0]    param_size,
            
            input   wire    [S_LEN_WIDTH-1:0]   s_len,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire    [M_LEN_WIDTH-1:0]   m_len,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    wire    [SIZE_WIDTH:0]  mem_size = {1'b0, param_size} + SIZE_OFFSET;
    
    
    //  insert FF
    wire    [S_LEN_WIDTH-1:0]   ff_s_len;
    wire                        ff_s_valid;
    wire                        ff_s_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (S_LEN_WIDTH),
                .SLAVE_REGS         (S_REGS),
                .MASTER_REGS        (0)
            )
        i_pipeline_insert_ff_s
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             (s_len),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             (ff_s_len),
                .m_valid            (ff_s_valid),
                .m_ready            (ff_s_ready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    // stage0
    reg     [ADDR_WIDTH-1:0]        st0_addr;
    reg     [M_LEN_WIDTH-1:0]       st0_len;
    reg                             st0_valid;
    wire                            st0_ready;
    
    wire    [ADDR_WIDTH:0]          st0_addr_next = {1'b0, st0_addr} + st0_len + M_LEN_OFFSET;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_addr  <= INIT_ADDR;
            st0_len   <= {M_LEN_WIDTH{1'bx}};
            st0_valid <= 1'b0;
        end
        else if ( cke ) begin
            if ( !st0_valid || st0_ready ) begin
                if ( st0_valid ) begin
                    if ( st0_addr_next >= mem_size ) begin
                        st0_addr <= st0_addr_next - mem_size;
                    end
                    else begin
                        st0_addr <= st0_addr_next;
                    end
                end
                st0_len   <= ff_s_len;
                st0_valid <= ff_s_valid;
            end
        end
    end
    
    assign ff_s_ready = (!st0_valid || st0_ready);
    
    
    // stage1
    reg     [M_LEN_WIDTH-1:0]       st1_split_len;
    reg                             st1_split_valid;
    reg     [ADDR_WIDTH-1:0]        st1_addr;
    reg     [M_LEN_WIDTH-1:0]       st1_len;
    reg                             st1_valid;
    wire                            st1_ready;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st1_split_len   <= {M_LEN_WIDTH{1'bx}};
            st1_split_valid <= 1'b0;
            st1_addr        <= {ADDR_WIDTH{1'bx}};
            st1_len         <= {M_LEN_WIDTH{1'bx}};
            st1_valid       <= 1'b0;
        end
        else if ( cke ) begin
            if ( !st1_valid || st1_ready ) begin
                st1_valid <= 1'b0;
                if ( !st1_split_valid ) begin
                    if ( st0_valid ) begin
                        if ( {1'b0, st0_addr} + st0_len + M_LEN_OFFSET <= mem_size ) begin
                            // 通常
                            st1_split_len   <= {M_LEN_WIDTH{1'bx}};
                            st1_split_valid <= 1'b0;
                            st1_addr        <= st0_addr;
                            st1_len         <= st0_len;
                            st1_valid       <= 1'b1;
                        end
                        else begin
                            // 分割処理(前半)
                            st1_split_len   <= st0_len;
                            st1_split_valid <= 1'b1;
                            st1_addr        <= st0_addr;
                            st1_len         <= mem_size - st0_addr - M_LEN_OFFSET;
                            st1_valid       <= 1'b1;
                        end
                    end
                end
                else begin
                    // 分割処理(後半)
                    st1_split_len   <= {M_LEN_WIDTH{1'bx}};
                    st1_split_valid <= 1'b0;
                    st1_addr        <= {ADDR_WIDTH{1'b0}};
                    st1_len         <= st1_split_len - st1_len - M_LEN_OFFSET;
                    st1_valid       <= 1'b1;
                end
            end
        end
    end
    
    assign st0_ready = (!st1_valid || st1_ready) && !st1_split_valid;
    
    
    // master
    assign m_addr    = st1_addr;
    assign m_len     = st1_len;
    assign m_valid   = st1_valid;
    
    assign st1_ready = m_ready;
    
    
endmodule


`default_nettype wire


// end of file
