// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


//   フレーム期間中のデータ入力の無い期間は cke を落とすことを
// 前提としてデータ稠密で、メモリを READ_FIRST モードで最適化
//   フレーム末尾で吐き出しのためにブランクデータを入れる際は
// line_first と line_last は正しく制御が必要

module jelly_img_line_buffer
        #(
            parameter   USER_WIDTH   = 0,
            parameter   DATA_WIDTH   = 8,
            parameter   LINE_NUM     = 31,
            parameter   LINE_CENTER  = LINE_NUM / 2,
            parameter   MAX_X_NUM    = 1024,
            parameter   BORDER_MODE  = "REPLICATE",         // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
            parameter   BORDER_VALUE = {DATA_WIDTH{1'b0}},  // BORDER_MODE == "CONSTANT"
            parameter   RAM_TYPE     = "block",
            parameter   ENDIAN       = 0,                   // 0: little, 1:big
            
            parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            // slave (input)
            input   wire                                s_img_line_first,
            input   wire                                s_img_line_last,
            input   wire                                s_img_pixel_first,
            input   wire                                s_img_pixel_last,
            input   wire                                s_img_de,
            input   wire    [USER_BITS-1:0]             s_img_user,
            input   wire    [DATA_WIDTH-1:0]            s_img_data,
            input   wire                                s_img_valid,
            
            // master (output)
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire    [USER_BITS-1:0]             m_img_user,
            output  wire    [LINE_NUM*DATA_WIDTH-1:0]   m_img_data,
            output  wire                                m_img_valid
        );
    
    localparam  CENTER         = ENDIAN ? LINE_CENTER : LINE_NUM-1 - LINE_CENTER;
    
    localparam  MEM_ADDR_WIDTH = (MAX_X_NUM   <=    2) ?  1 :
                                 (MAX_X_NUM   <=    4) ?  2 :
                                 (MAX_X_NUM   <=    8) ?  3 :
                                 (MAX_X_NUM   <=   16) ?  4 :
                                 (MAX_X_NUM   <=   32) ?  5 :
                                 (MAX_X_NUM   <=   64) ?  6 :
                                 (MAX_X_NUM   <=  128) ?  7 :
                                 (MAX_X_NUM   <=  256) ?  8 :
                                 (MAX_X_NUM   <=  512) ?  9 :
                                 (MAX_X_NUM   <= 1024) ? 10 :
                                 (MAX_X_NUM   <= 2048) ? 11 :
                                 (MAX_X_NUM   <= 4096) ? 12 :
                                 (MAX_X_NUM   <= 8192) ? 13 : 14;
    
    localparam  MEM_DATA_WIDTH = USER_WIDTH+DATA_WIDTH;
    
    localparam  MEM_NUM        = LINE_NUM - 1;
    
    
    localparam  LINE_SEL_WIDTH = (MEM_NUM <=    2) ?  1 :
                                 (MEM_NUM <=    4) ?  2 :
                                 (MEM_NUM <=    8) ?  3 :
                                 (MEM_NUM <=   16) ?  4 :
                                 (MEM_NUM <=   32) ?  5 :
                                 (MEM_NUM <=   64) ?  6 :
                                 (MEM_NUM <=  128) ?  7 :
                                 (MEM_NUM <=  256) ?  8 : 9;
    
    localparam  POS_WIDTH      = (LINE_NUM <=   1) ?  1 :
                                 (LINE_NUM <=   3) ?  2 :
                                 (LINE_NUM <=   7) ?  3 :
                                 (LINE_NUM <=  15) ?  4 :
                                 (LINE_NUM <=  31) ?  5 :
                                 (LINE_NUM <=  63) ?  6 :
                                 (LINE_NUM <= 127) ?  7 :
                                 (LINE_NUM <= 255) ?  8 : 9;
    
    
    genvar                                  i;
    
    generate
    if ( LINE_NUM > 1 ) begin : blk_buffer
        // memory
        wire    [MEM_NUM-1:0]                   mem_we;
        wire    [MEM_ADDR_WIDTH-1:0]            mem_addr;
        wire    [USER_BITS-1:0]                 mem_wuser;
        wire    [DATA_WIDTH-1:0]                mem_wdata;
        wire                                    mem_wfirst;
        wire                                    mem_wlast;
        wire    [MEM_NUM*USER_BITS-1:0]         mem_ruser;
        wire    [MEM_NUM*DATA_WIDTH-1:0]        mem_rdata;
        
        for ( i = 0; i < MEM_NUM; i = i+1 ) begin : mem_loop
            
            wire    [MEM_DATA_WIDTH-1:0]        wdata;
            wire    [MEM_DATA_WIDTH-1:0]        rdata;
            assign wdata = {mem_wuser, mem_wdata};
            assign {mem_ruser[USER_BITS*i +: USER_BITS], mem_rdata[DATA_WIDTH*i +: DATA_WIDTH]} = rdata;
            
            jelly_ram_singleport
                    #(
                        .ADDR_WIDTH     (MEM_ADDR_WIDTH),
                        .DATA_WIDTH     (MEM_DATA_WIDTH),
                        .MEM_SIZE       (MAX_X_NUM),
                        .RAM_TYPE       (RAM_TYPE),
                        .DOUT_REGS      (1),
                        .MODE           ("READ_FIRST")
                    )
                jelly_ram_singleport
                    (
                        .clk            (clk),
                        .en             (cke),
                        .regcke         (cke),
                        .we             (mem_we[i]),
                        .addr           (mem_addr),
                        .din            (wdata),
                        .dout           (rdata)
                    );
            
        end
        
        
        // control
        reg     [MEM_NUM-1:0]               st0_we;
        reg     [MEM_ADDR_WIDTH-1:0]        st0_addr;
        reg                                 st0_line_first;
        reg                                 st0_line_last;
        reg                                 st0_pixel_first;
        reg                                 st0_pixel_last;
        reg                                 st0_de;
        reg     [USER_BITS-1:0]             st0_user;
        reg     [DATA_WIDTH-1:0]            st0_data;
        reg                                 st0_valid;
        
        reg                                 st1_line_first;
        reg                                 st1_line_last;
        reg                                 st1_pixel_first;
        reg                                 st1_pixel_last;
        reg                                 st1_de;
        reg     [USER_BITS-1:0]             st1_user;
        reg     [DATA_WIDTH-1:0]            st1_data;
        reg                                 st1_valid;
        
        reg     [LINE_SEL_WIDTH-1:0]        st2_sel;
        reg                                 st2_line_first;
        reg                                 st2_line_last;
        reg                                 st2_pixel_first;
        reg                                 st2_pixel_last;
        reg                                 st2_de;
        reg     [USER_BITS-1:0]             st2_user;
        reg     [DATA_WIDTH-1:0]            st2_data;
        reg                                 st2_valid;
        
        reg     [LINE_NUM-1:0]              st3_line_first;
        reg     [LINE_NUM-1:0]              st3_line_last;
        reg                                 st3_pixel_first;
        reg                                 st3_pixel_last;
        reg     [LINE_NUM-1:0]              st3_de;
        reg     [LINE_NUM*USER_BITS-1:0]    st3_user;
        reg     [LINE_NUM*DATA_WIDTH-1:0]   st3_data;
        reg                                 st3_valid;
        
        reg                                 st4_line_first;
        reg                                 st4_line_last;
        reg                                 st4_pixel_first;
        reg                                 st4_pixel_last;
        reg                                 st4_de;
        reg     [USER_BITS-1:0]             st4_user;
        reg     [LINE_NUM*DATA_WIDTH-1:0]   st4_data;
        reg     [POS_WIDTH-1:0]             st4_pos_first;
        reg     [POS_WIDTH-1:0]             st4_pos_last;
        reg                                 st4_valid;
        
        reg                                 st5_line_first;
        reg                                 st5_line_last;
        reg                                 st5_pixel_first;
        reg                                 st5_pixel_last;
        reg                                 st5_de;
        reg     [USER_BITS-1:0]             st5_user;
        reg     [LINE_NUM*DATA_WIDTH-1:0]   st5_data;
        reg     [LINE_NUM*POS_WIDTH-1:0]    st5_pos_data;
        reg                                 st5_valid;
        
        reg                                 st6_line_first;
        reg                                 st6_line_last;
        reg                                 st6_pixel_first;
        reg                                 st6_pixel_last;
        reg                                 st6_de;
        reg     [USER_BITS-1:0]             st6_user;
        reg     [LINE_NUM*DATA_WIDTH-1:0]   st6_data;
        reg                                 st6_valid;
        
        integer                             y;
        
        always @(posedge clk) begin
            if ( reset ) begin
                st0_we            <= {MEM_NUM{1'b0}};
                st0_we[MEM_NUM-1] <= 1'b1;
                st0_addr          <= {MEM_ADDR_WIDTH{1'b0}};
                st0_line_first    <= 1'b0;
                st0_line_last     <= 1'b0;
                st0_pixel_first   <= 1'b0;
                st0_pixel_last    <= 1'b0;
                st0_de            <= 1'b0;
                st0_user          <= {USER_BITS{1'bx}};
                st0_data          <= {DATA_WIDTH{1'bx}};
                st0_valid         <= 1'b0;
                
                st1_line_first    <= 1'b0;
                st1_line_last     <= 1'b0;
                st1_pixel_first   <= 1'b0;
                st1_pixel_last    <= 1'b0;
                st1_de            <= 1'b0;
                st1_user          <= {USER_BITS{1'bx}};
                st1_data          <= {DATA_WIDTH{1'bx}};
                st1_valid         <= 1'b0;
                
                st2_sel           <= {LINE_SEL_WIDTH{1'b0}};
                st2_line_first    <= 1'b0;
                st2_line_last     <= 1'b0;
                st2_pixel_first   <= 1'b0;
                st2_pixel_last    <= 1'b0;
                st2_de            <= 1'b0;
                st2_user          <= {USER_BITS{1'bx}};
                st2_data          <= {DATA_WIDTH{1'bx}};
                st2_valid         <= 1'b0;
                
                st3_line_first    <= {LINE_NUM{1'b0}};
                st3_line_last     <= {LINE_NUM{1'b0}};
                st3_pixel_first   <= 1'b0;
                st3_pixel_last    <= 1'b0;
                st3_de            <= {LINE_NUM{1'b0}};
                st3_user          <= {USER_BITS{1'bx}};
                st3_data          <= {(LINE_NUM*DATA_WIDTH){1'bx}};
                st3_valid         <= 1'b0;
                
                st4_line_first    <= 1'b0;
                st4_line_last     <= 1'b0;
                st4_pixel_first   <= 1'b0;
                st4_pixel_last    <= 1'b0;
                st4_de            <= 1'b0;
                st4_user          <= {USER_BITS{1'bx}};
                st4_data          <= {(LINE_NUM*DATA_WIDTH){1'bx}};
                st4_pos_first     <= {POS_WIDTH{1'bx}};
                st4_pos_last      <= {POS_WIDTH{1'bx}};
                st4_valid         <= 1'b0;
                
                st5_line_first    <= 1'b0;
                st5_line_last     <= 1'b0;
                st5_pixel_first   <= 1'b0;
                st5_pixel_last    <= 1'b0;
                st5_de            <= 1'b0;
                st5_user          <= {USER_BITS{1'bx}};
                st5_data          <= {(LINE_NUM*DATA_WIDTH){1'bx}};
                st5_pos_data      <= {(LINE_NUM*POS_WIDTH){1'bx}};
                st5_valid         <= 1'b0;
                
                st6_line_first    <= 1'b0;
                st6_line_last     <= 1'b0;
                st6_pixel_first   <= 1'b0;
                st6_pixel_last    <= 1'b0;
                st6_de            <= 1'b0;
                st6_user          <= {USER_BITS{1'bx}};
                st6_data          <= {(LINE_NUM*DATA_WIDTH){1'bx}};
                st6_valid         <= 1'b0;
            end
            else if ( cke ) begin
                // stage 0
                if ( s_img_valid && s_img_pixel_first ) begin
                    st0_we   <= ((st0_we >> 1) | (st0_we[0] << (MEM_NUM-1)));
                    st0_addr <= {MEM_ADDR_WIDTH{1'b0}};
                end
                else begin
                    st0_addr <= st0_addr + 1'b1;
                end
                
                st0_line_first  <= s_img_line_first  & s_img_valid;
                st0_line_last   <= s_img_line_last   & s_img_valid;
                st0_pixel_first <= s_img_pixel_first & s_img_valid;
                st0_pixel_last  <= s_img_pixel_last  & s_img_valid;
                st0_de          <= s_img_de          & s_img_valid;
                st0_user        <= s_img_user;
                st0_data        <= s_img_data;
                st0_valid       <= s_img_valid;
                
                // stage1
                st1_line_first  <= st0_line_first;
                st1_line_last   <= st0_line_last;
                st1_pixel_first <= st0_pixel_first;
                st1_pixel_last  <= st0_pixel_last;
                st1_de          <= st0_de;
                st1_user        <= st0_user;
                st1_data        <= st0_data;
                st1_valid       <= st0_valid;
                
                // stage2
                if ( st1_valid && st1_pixel_first ) begin
                    st2_sel <= st2_sel - 1'b1;
                    if ( st2_sel == {LINE_SEL_WIDTH{1'b0}} ) begin
                        st2_sel <= MEM_NUM-1;
                    end
                end
                st2_line_first  <= st1_line_first;
                st2_line_last   <= st1_line_last;
                st2_pixel_first <= st1_pixel_first;
                st2_pixel_last  <= st1_pixel_last;
                st2_de          <= st1_de;
                st2_user        <= st1_user;
                st2_data        <= st1_data;
                st2_valid       <= st1_valid;
                
                // stage3
                if ( st2_valid && st2_pixel_first ) begin
                    st3_line_first[LINE_NUM-1:1] <= st3_line_first[LINE_NUM-2:0];
                    st3_line_last[LINE_NUM-1:1]  <= st3_line_last[LINE_NUM-2:0];
                    st3_de[LINE_NUM-1:1]         <= st3_de[LINE_NUM-2:0];
                end
                st3_line_first[0] <= st2_line_first;
                st3_line_last[0]  <= st2_line_last;
                st3_de[0]         <= st2_de;
                
                st3_pixel_first                            <= st2_pixel_first;
                st3_pixel_last                             <= st2_pixel_last;
                st3_user[LINE_NUM*USER_BITS-1:USER_BITS]   <= ({mem_ruser, mem_ruser} >> (st2_sel * USER_BITS));
                st3_user[USER_BITS-1:0]                    <= st2_user;
                st3_data[LINE_NUM*DATA_WIDTH-1:DATA_WIDTH] <= ({mem_rdata, mem_rdata} >> (st2_sel * DATA_WIDTH));
                st3_data[DATA_WIDTH-1:0]                   <= st2_data;
                st3_valid                                  <= st2_valid;
                
                
                // stage4
                st4_line_first  <= st3_line_first[CENTER];
                st4_line_last   <= st3_line_last[CENTER];
                st4_pixel_first <= st3_pixel_first;
                st4_pixel_last  <= st3_pixel_last;
                st4_de          <= st3_de[CENTER];
                st4_user        <= st3_user[CENTER*USER_BITS +: USER_BITS];
                st4_data        <= st3_data;
                st4_pos_first   <= (LINE_NUM-1);
                st4_pos_last    <= 0;
                st4_valid       <= st3_valid;
                
                begin : search_first
                    for ( y = CENTER; y < LINE_NUM; y = y+1 ) begin
                        if ( st3_line_first[y] ) begin
                            st4_pos_first <= y;
                            disable search_first;
                        end
                    end
                end
                
                begin : search_last
                    for ( y = CENTER; y >= 0; y = y-1 ) begin
                        if ( st3_line_last[y] ) begin
                            st4_pos_last <= y;
                            disable search_last;
                        end
                    end
                end
                
                
                // stage5
                st5_line_first  <= st4_line_first;
                st5_line_last   <= st4_line_last;
                st5_pixel_first <= st4_pixel_first;
                st5_pixel_last  <= st4_pixel_last;
                st5_de          <= st4_de;
                st5_user        <= st4_user;
                st5_data        <= st4_data;
                st5_valid       <= st4_valid;
                
                for ( y = 0; y < LINE_NUM; y = y+1 ) begin
                    st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= y;
                    if ( y > CENTER ) begin
                        if ( y > st4_pos_first ) begin
                            if      ( BORDER_MODE == "CONSTANT"    ) begin st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= LINE_NUM;                end
                            else if ( BORDER_MODE == "REPLICATE"   ) begin st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st4_pos_first;           end
                            else if ( BORDER_MODE == "REFLECT"     ) begin st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st4_pos_first*2 - y + 1; end
                            else if ( BORDER_MODE == "REFLECT_101" ) begin st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st4_pos_first*2 - y;     end
                        end
                    end
                    else if ( y < CENTER ) begin
                        if ( y < st4_pos_last ) begin
                            if      ( BORDER_MODE == "CONSTANT"    ) begin st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= LINE_NUM;                end
                            else if ( BORDER_MODE == "REPLICATE"   ) begin st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st4_pos_last;            end
                            else if ( BORDER_MODE == "REFLECT"     ) begin st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st4_pos_last*2 - y - 1;  end
                            else if ( BORDER_MODE == "REFLECT_101" ) begin st5_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st4_pos_last*2 - y;      end
                        end
                    end
                end
                
                // stage6
                st6_line_first  <= st5_line_first;
                st6_line_last   <= st5_line_last;
                st6_pixel_first <= st5_pixel_first;
                st6_pixel_last  <= st5_pixel_last;
                st6_de          <= st5_de;
                st6_user        <= st5_user;
                st6_data        <= st5_data;
                for ( y = 0; y < LINE_NUM; y = y+1 ) begin
                    st6_data[y*DATA_WIDTH +: DATA_WIDTH] <= ({BORDER_VALUE, st5_data} >> (DATA_WIDTH * st5_pos_data[y*POS_WIDTH +: POS_WIDTH]));
                end
                st6_valid       <= st5_valid;
            end
        end
        
        assign mem_we     = st0_we;
        assign mem_addr   = st0_addr;
        assign mem_wuser  = st0_user;
        assign mem_wdata  = st0_data;
        assign mem_wfirst = st0_line_first;
        assign mem_wlast  = st0_line_last;
        
        
        wire                                out_line_first;
        wire                                out_line_last;
        wire                                out_pixel_first;
        wire                                out_pixel_last;
        wire                                out_de;
        wire    [USER_BITS-1:0]             out_user;
        wire    [LINE_NUM*DATA_WIDTH-1:0]   out_data;
        wire                                out_valid;
        
        if ( BORDER_MODE == "NONE" ) begin
            assign out_line_first  = st4_line_first;
            assign out_line_last   = st4_line_last;
            assign out_pixel_first = st4_pixel_first;
            assign out_pixel_last  = st4_pixel_last;
            assign out_de          = st4_de;
            assign out_user        = st4_user;
            assign out_data        = st4_data;
            assign out_valid       = st4_valid;
        end
        else begin
            assign out_line_first  = st6_line_first;
            assign out_line_last   = st6_line_last;
            assign out_pixel_first = st6_pixel_first;
            assign out_pixel_last  = st6_pixel_last;
            assign out_de          = st6_de;
            assign out_user        = st6_user;
            assign out_data        = st6_data;
            assign out_valid       = st6_valid;
        end
        
        assign m_img_line_first  = out_line_first;
        assign m_img_line_last   = out_line_last;
        assign m_img_pixel_first = out_pixel_first;
        assign m_img_pixel_last  = out_pixel_last;
        assign m_img_de          = out_de;
        assign m_img_user        = out_user;
        for ( i = 0; i < LINE_NUM; i = i+1 ) begin :loop_endian
            if ( ENDIAN ) begin
                assign m_img_data[i*DATA_WIDTH +: DATA_WIDTH] = out_data[i*DATA_WIDTH +: DATA_WIDTH];
            end
            else begin
                assign m_img_data[i*DATA_WIDTH +: DATA_WIDTH] = out_data[(LINE_NUM-1-i)*DATA_WIDTH +: DATA_WIDTH];
            end
        end
        assign m_img_valid       = out_valid;
    end
    else begin : blk_bypass
        assign m_img_line_first  = s_img_line_first;
        assign m_img_line_last   = s_img_line_last;
        assign m_img_pixel_first = s_img_pixel_first;
        assign m_img_pixel_last  = s_img_pixel_last;
        assign m_img_de          = s_img_de;
        assign m_img_user        = s_img_user;
        assign m_img_data        = s_img_data;
        assign m_img_valid       = s_img_valid;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
