// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// read only cache tag (set associative)
module jelly_cache_tag_set_associative
        #(
            parameter   USER_WIDTH  = 0,
            parameter   WAY_NUM     = 4,
            parameter   WAY_WIDTH   = WAY_NUM <=   2 ? 1 :
                                      WAY_NUM <=   4 ? 2 :
                                      WAY_NUM <=   8 ? 3 :
                                      WAY_NUM <=  16 ? 4 :
                                      WAY_NUM <=  32 ? 5 :
                                      WAY_NUM <=  64 ? 6 :
                                      WAY_NUM <= 128 ? 7 : 8,
            parameter   INDEX_WIDTH = 12,
            parameter   TAG_WIDTH   = 6,
            parameter   RAM_TYPE    = "distributed",
            
            // local
            parameter   USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            clear_start,
            output  wire                            clear_busy,
            
            input   wire    [USER_BITS-1:0]         s_user,
            input   wire    [INDEX_WIDTH-1:0]       s_index,
            input   wire    [TAG_WIDTH-1:0]         s_tag,
            input   wire                            s_strb,
            input   wire                            s_valid,
            
            output  wire    [USER_BITS-1:0]         m_user,
            output  wire    [INDEX_WIDTH-1:0]       m_index,
            output  wire    [WAY_WIDTH-1:0]         m_way,
            output  wire    [TAG_WIDTH-1:0]         m_tag,
            output  wire                            m_hit,
            output  wire                            m_strb,
            output  wire                            m_valid
        );
    
    localparam  MEM_SIZE  = (1 << TAG_WIDTH);
    localparam  MEM_WIDTH = WAY_NUM * (1 + WAY_WIDTH + INDEX_WIDTH);
    
    genvar                          i;
    integer                         j;
    
    // initial data
    wire    [WAY_NUM*WAY_WIDTH-1:0] ini_way;
    generate
    for ( i = 0; i < WAY_NUM; i = i+1 ) begin : loop_ini_way
        assign ini_way[i*WAY_WIDTH +: WAY_WIDTH] = (WAY_NUM-1)-i;
    end
    endgenerate
    wire    [MEM_WIDTH-1:0]             ini_mem = {{WAY_NUM{1'b0}}, ini_way, {(WAY_NUM*INDEX_WIDTH){1'bx}}};
    

    // pipeline
    wire    [USER_BITS-1:0]             st0_user   = s_user;
    wire    [INDEX_WIDTH-1:0]           st0_index  = s_index;
    wire    [TAG_WIDTH-1:0]             st0_tag    = s_tag;
    wire                                st0_strb   = s_strb;
    wire                                st0_valid  = s_valid;
    
    reg                                 st1_fw_st2;
    reg                                 st1_fw_st3;
    reg     [USER_BITS-1:0]             st1_user;
    reg     [INDEX_WIDTH-1:0]           st1_index;
    reg     [TAG_WIDTH-1:0]             st1_tag;
    reg                                 st1_strb;
    reg                                 st1_valid;
    
    reg     [MEM_WIDTH-1:0]             st1_dout;
    reg     [MEM_WIDTH-1:0]             st1_rdata;
    wire    [WAY_NUM-1:0]               st1_cache_valid;
    wire    [WAY_NUM*WAY_WIDTH-1:0]     st1_cache_way;
    wire    [WAY_NUM*INDEX_WIDTH-1:0]   st1_cache_index;
    reg                                 st1_hit;
    reg     [WAY_WIDTH-1:0]             st1_pos;
    
    reg     [USER_BITS-1:0]             st2_user;
    reg                                 st2_we = 1'b0;
    reg     [WAY_NUM-1:0]               st2_cache_valid;
    reg     [WAY_NUM*WAY_WIDTH-1:0]     st2_cache_way;
    reg     [WAY_NUM*INDEX_WIDTH-1:0]   st2_cache_index;
    reg                                 st2_clear;
    reg     [TAG_WIDTH-1:0]             st2_tag;
    reg                                 st2_hit;
    reg                                 st2_strb;
    reg                                 st2_valid;
    
    wire    [MEM_WIDTH-1:0]             st2_data = {st2_cache_valid, st2_cache_way, st2_cache_index};
    
    reg     [MEM_WIDTH-1:0]             st3_data;
    
    
    // fowarding
    always @* begin
        st1_rdata = st1_dout;
        if ( st1_fw_st3 ) begin st1_rdata = st3_data; end
        if ( st1_fw_st2 ) begin st1_rdata = st2_data; end
    end
    
    assign  {st1_cache_valid, st1_cache_way, st1_cache_index} = st1_rdata;
    
    
    // hit test
    always @* begin
        st1_hit = 1'b0;
        st1_pos = WAY_NUM-1;
        for ( j = 0; j < WAY_NUM; j = j+1 ) begin
            if ( st1_cache_valid[j] && (st1_cache_index[j*INDEX_WIDTH +: INDEX_WIDTH] == st1_index) ) begin
                st1_hit = 1'b1;
                st1_pos = j;
            end
        end
    end
    
    
    // pipeline
    always @(posedge clk) begin
        if ( reset ) begin
            st1_fw_st2      <= 1'bx;
            st1_fw_st3      <= 1'bx;
            st1_user        <= {USER_BITS{1'bx}};
            st1_index       <= {INDEX_WIDTH{1'bx}};
            st1_tag         <= {TAG_WIDTH{1'bx}};
            st1_strb        <= 1'bx;
            st1_valid       <= 1'b0;
            
            st2_we          <= 1'b0;
            st2_cache_valid <= {WAY_NUM{1'bx}};
            st2_cache_way   <= {(WAY_NUM*WAY_WIDTH){1'bx}};
            st2_cache_index <= {(WAY_NUM*INDEX_WIDTH){1'bx}};
            st2_user        <= {USER_BITS{1'bx}};
            st2_clear       <= 1'b0;
            st2_tag         <= {TAG_WIDTH{1'bx}};
            st2_hit         <= 1'bx;
            st2_strb        <= 1'bx;
            st2_valid       <= 1'b0;
            
            st3_data        <= {MEM_WIDTH{1'bx}};
        end
        else if ( cke ) begin
            // stage 1
            st1_fw_st2    <= st0_valid && st1_strb && (st0_tag == st1_tag);
            st1_fw_st3    <= st0_valid && st2_strb && (st0_tag == st2_tag);
            st1_user      <= st0_user;
            st1_tag       <= st0_tag;
            st1_index     <= st0_index;
            st1_strb      <= st0_strb && st0_valid;
            st1_valid     <= st0_valid;
            
            
            // stage 2
            st2_user  <= st1_user;
            st2_tag   <= st1_tag;
            st2_hit   <= st1_hit;
            st2_strb  <= st1_strb;
            st2_valid <= st1_valid;
            
            st2_we    <= (st1_valid && st1_strb) || st2_clear;
            if ( st1_valid ) begin
                st2_cache_valid <= st1_cache_valid;
                st2_cache_index <= st1_cache_index;
                st2_cache_way   <= st1_cache_way;
                
                st2_cache_valid[0]                            <= 1'b1;
                st2_cache_index[0*INDEX_WIDTH +: INDEX_WIDTH] <= st1_index;
                st2_cache_way  [0*WAY_WIDTH   +: WAY_WIDTH]   <= st1_cache_way[st1_pos*WAY_WIDTH +: WAY_WIDTH];
                for ( j = 1; j < WAY_NUM; j = j+1 ) begin
                    if ( st1_pos >= j ) begin
                        st2_cache_valid[j]                            <= st1_cache_valid[(j-1)];
                        st2_cache_way  [j*WAY_WIDTH   +: WAY_WIDTH]   <= st1_cache_way  [(j-1)*WAY_WIDTH    +: WAY_WIDTH];
                        st2_cache_index[j*INDEX_WIDTH +: INDEX_WIDTH] <= st1_cache_index[(j-1)*INDEX_WIDTH +: INDEX_WIDTH];
                    end
                end
            end
            
            if ( st2_clear ) begin
                st2_tag <= st2_tag + 1'b1;
            end
            if ( st2_tag == {TAG_WIDTH{1'b1}} ) begin
                st2_clear <= 1'b0;
            end
            if ( clear_start ) begin
                st2_clear <= 1'b1;
                st2_tag   <= {TAG_WIDTH{1'b0}};
                for ( j = 0; j < WAY_NUM; j = j+1 ) begin
                    st2_cache_valid[j]                            <= 1'b0;
                    st2_cache_way  [j*WAY_WIDTH   +: WAY_WIDTH]   <= (WAY_NUM-1)-j;
                    st2_cache_index[j*INDEX_WIDTH +: INDEX_WIDTH] <= {INDEX_WIDTH{1'bx}};
                end
            end
            
            
            // stage 3
            st3_data  <= st2_data;
        end
    end
    
    assign  clear_busy = st2_clear;
    
    assign  m_user  = st2_user;
    assign  m_index = st2_cache_index[0*INDEX_WIDTH +: INDEX_WIDTH];
    assign  m_way   = st2_cache_way  [0*WAY_WIDTH   +: WAY_WIDTH];
    assign  m_tag   = st2_tag;
    assign  m_hit   = st2_hit;
    assign  m_strb  = st2_strb;
    assign  m_valid = st2_valid;
    
    
    
    // memory
    (* ram_style = RAM_TYPE *)
    reg     [MEM_WIDTH-1:0]         mem_data    [0:MEM_SIZE-1];
    reg     [MEM_WIDTH-1:0]         mem_dout;
    
    initial begin
        for ( j = 0; j < MEM_SIZE; j = j+1 ) begin
            mem_data[j] = ini_mem;
        end
    end
    
    always @(posedge clk) begin
        if ( cke ) begin
            st1_dout <= mem_data[st0_tag];
            if ( st2_we ) begin
                mem_data[st2_tag] <= {st2_cache_valid, st2_cache_way, st2_cache_index};
            end
        end
    end
    
    
endmodule


`default_nettype wire


// End of file
