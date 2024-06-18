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
module jelly_cache_tag_directmap
        #(
            parameter   USER_WIDTH  = 0,
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
            output  wire    [TAG_WIDTH-1:0]         m_tag,
            output  wire                            m_hit,
            output  wire                            m_strb,
            output  wire                            m_valid
        );
    
    
    
    reg                             reg_clear;
    
    reg     [USER_BITS-1:0]         st0_user;
    reg     [INDEX_WIDTH-1:0]       st0_index;
    reg     [TAG_WIDTH-1:0]         st0_tag;
    reg                             st0_we = 1'b0;
    reg                             st0_strb;
    reg                             st0_valid;
    
    reg     [USER_BITS-1:0]         st1_user;
    reg     [INDEX_WIDTH-1:0]       st1_index;
    reg     [TAG_WIDTH-1:0]         st1_tag;
    reg                             st1_strb;
    reg                             st1_valid;
    
    reg     [USER_BITS-1:0]         st2_user;
    reg     [INDEX_WIDTH-1:0]       st2_index;
    reg     [TAG_WIDTH-1:0]         st2_tag;
    reg                             st2_hit;
    reg                             st2_strb;
    reg                             st2_valid;
    
    
    // TAG-RAM
    wire                            read_cache_valid;
    wire    [INDEX_WIDTH-1:0]       read_cache_index;
    
    jelly_ram_singleport
            #(
                .ADDR_WIDTH         (TAG_WIDTH),
                .DATA_WIDTH         (1 + INDEX_WIDTH),
                .RAM_TYPE           (RAM_TYPE),
                .DOUT_REGS          (0),
                .MODE               ("READ_FIRST"),
                
                .FILLMEM            (1),
                .FILLMEM_DATA       (0)
            )
        i_ram_singleport
            (
                .clk                (clk),
                .en                 (cke),
                .regcke             (cke),
                
                .we                 (st0_we),
                .addr               (st0_tag),
                .din                ({~reg_clear,       st0_index}),
                .dout               ({read_cache_valid, read_cache_index})
            );
    
    
    // pipeline
    always @(posedge clk) begin
        if ( reset ) begin
            reg_clear <= 1'b0;
            
            st0_user  <= {USER_BITS{1'bx}};
            st0_we    <= 1'b0;
            st0_index <= {INDEX_WIDTH{1'bx}};
            st0_tag   <= {TAG_WIDTH{1'bx}};
            st0_strb  <= 1'bx;
            st0_valid <= 1'b0;
            
            st1_user  <= {USER_BITS{1'bx}};
            st1_index <= {INDEX_WIDTH{1'bx}};
            st1_tag   <= {TAG_WIDTH{1'bx}};
            st1_strb  <= 1'bx;
            st1_valid <= 1'b0;
            
            st2_user  <= {USER_BITS{1'bx}};
            st2_index <= {INDEX_WIDTH{1'bx}};
            st2_tag   <= {TAG_WIDTH{1'bx}};
            st2_hit   <= 1'bx;
            st2_strb  <= 1'bx;
            st2_valid <= 1'b0;
        end
        else if ( cke ) begin
            // stage0
            st0_user      <= s_user;
            st0_we        <= s_valid && s_strb;
            st0_index     <= s_index;
            st0_tag       <= s_tag;
            st0_strb      <= s_strb;
            st0_valid     <= s_valid;
            if ( reg_clear ) begin
                if ( st0_tag == {TAG_WIDTH{1'b1}} ) begin
                    // clear end
                    reg_clear <= 1'b0;
                end
                else begin
                    // clear next
                    st0_we  <= 1'b1;
                    st0_tag <= st0_tag + 1'b1;
                end
            end
            if ( clear_start ) begin
                // start cache clear
                reg_clear <= 1'b1;
                st0_we    <= 1'b1;
                st0_tag   <= {TAG_WIDTH{1'b0}};
            end
            
            // stage1
            st1_user      <= st0_user;
            st1_index     <= st0_index;
            st1_tag       <= st0_tag;
            st1_strb      <= st0_strb;
            st1_valid     <= st0_valid;
            
            // stage 2
            st2_user      <= st1_user;
            st2_index     <= st1_index;
            st2_tag       <= st1_tag;
            st2_hit       <= (read_cache_valid && (st1_index == read_cache_index));
            st2_strb      <= st1_strb;
            st2_valid     <= st1_valid;
        end
    end
    
    assign clear_busy = reg_clear;
    
    
    assign  m_user  = st2_user;
    assign  m_index = st2_index;
    assign  m_tag   = st2_tag;
    assign  m_hit   = st2_hit;
    assign  m_strb  = st2_strb;
    assign  m_valid = st2_valid;
    
    
endmodule



`default_nettype wire


// end of file
