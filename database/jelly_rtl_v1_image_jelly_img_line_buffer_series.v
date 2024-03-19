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

// メモリ直列配置版
module jelly_img_line_buffer_series
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
    
    localparam  POS_WIDTH      = (LINE_NUM <=   1) ?  1 :
                                 (LINE_NUM <=   3) ?  2 :
                                 (LINE_NUM <=   7) ?  3 :
                                 (LINE_NUM <=  15) ?  4 :
                                 (LINE_NUM <=  31) ?  5 :
                                 (LINE_NUM <=  63) ?  6 :
                                 (LINE_NUM <= 127) ?  7 :
                                 (LINE_NUM <= 255) ?  8 : 9;
    
    
    genvar  i;
    
    generate
    if ( LINE_NUM > 1 ) begin : line_buffer
        
        wire    [LINE_NUM*LINE_NUM-1:0]                 linebuf_array_line_first;
        wire    [LINE_NUM*LINE_NUM-1:0]                 linebuf_array_line_last;
        wire    [LINE_NUM-1:0]                          linebuf_array_pixel_first;
        wire    [LINE_NUM-1:0]                          linebuf_array_pixel_last;
        wire    [LINE_NUM*LINE_NUM-1:0]                 linebuf_array_de;
        wire    [LINE_NUM*LINE_NUM*USER_BITS-1:0]       linebuf_array_user;
        wire    [LINE_NUM*LINE_NUM*DATA_WIDTH-1:0]      linebuf_array_data;
        wire    [LINE_NUM*MEM_ADDR_WIDTH-1:0]           linebuf_array_addr;
        wire    [LINE_NUM-1:0]                          linebuf_array_valid;
        
        for ( i = 0; i < LINE_NUM-1; i = i+1 ) begin : line_buf_loop
            jelly_img_line_buf_unit
                    #(
                        .N              (LINE_NUM),
                        .USER_WIDTH     (USER_WIDTH),
                        .DATA_WIDTH     (DATA_WIDTH),
                        .ADDR_WIDTH     (MEM_ADDR_WIDTH),
                        .MEM_SIZE       (MAX_X_NUM),
                        .RAM_TYPE       (RAM_TYPE)
                    )
                i_img_line_buf_unit
                    (
                        .reset          (reset),
                        .clk            (clk),
                        .cke            (cke),
                        
                        .s_line_first   (linebuf_array_line_first [i*LINE_NUM            +: LINE_NUM]),
                        .s_line_last    (linebuf_array_line_last  [i*LINE_NUM            +: LINE_NUM]),
                        .s_pixel_first  (linebuf_array_pixel_first[i]),
                        .s_pixel_last   (linebuf_array_pixel_last [i]),
                        .s_de           (linebuf_array_de         [i*LINE_NUM            +: LINE_NUM]),
                        .s_user         (linebuf_array_user       [i*LINE_NUM*USER_BITS  +: LINE_NUM*USER_BITS]),
                        .s_data         (linebuf_array_data       [i*LINE_NUM*DATA_WIDTH +: LINE_NUM*DATA_WIDTH]),
                        .s_addr         (linebuf_array_addr       [i*MEM_ADDR_WIDTH      +: MEM_ADDR_WIDTH]),
                        .s_valid        (linebuf_array_valid      [i]),
                        
                        .m_line_first   (linebuf_array_line_first [(i+1)*LINE_NUM            +: LINE_NUM]),
                        .m_line_last    (linebuf_array_line_last  [(i+1)*LINE_NUM            +: LINE_NUM]),
                        .m_pixel_first  (linebuf_array_pixel_first[(i+1)]),
                        .m_pixel_last   (linebuf_array_pixel_last [(i+1)]),
                        .m_de           (linebuf_array_de         [(i+1)*LINE_NUM            +: LINE_NUM]),
                        .m_user         (linebuf_array_user       [(i+1)*LINE_NUM*USER_BITS  +: LINE_NUM*USER_BITS]),
                        .m_data         (linebuf_array_data       [(i+1)*LINE_NUM*DATA_WIDTH +: LINE_NUM*DATA_WIDTH]),
                        .m_addr         (linebuf_array_addr       [(i+1)*MEM_ADDR_WIDTH      +: MEM_ADDR_WIDTH]),
                        .m_valid        (linebuf_array_valid      [(i+1)])
                    );
        end
        
        reg                             reg_s_line_first;
        reg                             reg_s_line_last;
        reg                             reg_s_pixel_first;
        reg                             reg_s_pixel_last;
        reg                             reg_s_de;
        reg     [USER_BITS-1:0]         reg_s_user;
        reg     [DATA_WIDTH-1:0]        reg_s_data;
        reg     [MEM_ADDR_WIDTH-1:0]    reg_s_addr;
        reg                             reg_s_valid;
        always @(posedge clk) begin
            if ( reset ) begin
                reg_s_line_first  <= 1'bx;
                reg_s_line_last   <= 1'bx;
                reg_s_pixel_first <= 1'bx;
                reg_s_pixel_last  <= 1'bx;
                reg_s_de          <= 1'bx;
                reg_s_user        <= {USER_BITS{1'bx}};
                reg_s_data        <= {DATA_WIDTH{1'bx}};
                reg_s_addr        <= {MEM_ADDR_WIDTH{1'bx}};
                reg_s_valid       <= 1'b0;
            end
            else if ( cke ) begin
                reg_s_line_first  <= s_img_line_first  & s_img_valid;
                reg_s_line_last   <= s_img_line_last   & s_img_valid;
                reg_s_pixel_first <= s_img_pixel_first & s_img_valid;
                reg_s_pixel_last  <= s_img_pixel_last  & s_img_valid;
                reg_s_de          <= s_img_de          & s_img_valid;
                reg_s_user        <= s_img_user;
                reg_s_data        <= s_img_data;
                reg_s_valid       <= s_img_valid;
                
                if ( s_img_valid && s_img_pixel_first ) begin
                    reg_s_addr <= {MEM_ADDR_WIDTH{1'b0}};
                end
                else begin
                    reg_s_addr <= reg_s_addr + 1'b1;
                end
            end
        end
        
        
        assign  linebuf_array_line_first [0 +: LINE_NUM           ] = reg_s_line_first;
        assign  linebuf_array_line_last  [0 +: LINE_NUM           ] = reg_s_line_last;
        assign  linebuf_array_pixel_first[0 +: 1                  ] = reg_s_pixel_first;
        assign  linebuf_array_pixel_last [0 +: 1                  ] = reg_s_pixel_last;
        assign  linebuf_array_de         [0 +: LINE_NUM           ] = reg_s_de;
        assign  linebuf_array_user       [0 +: LINE_NUM*USER_BITS ] = reg_s_user;
        assign  linebuf_array_data       [0 +: LINE_NUM*DATA_WIDTH] = reg_s_data;
        assign  linebuf_array_addr       [0 +: MEM_ADDR_WIDTH     ] = reg_s_addr;
        assign  linebuf_array_valid      [0 +: 1                  ] = reg_s_valid;
        
//      assign  linebuf_array_line_first [(LINE_NUM-1)*LINE_NUM            +: LINE_NUM           ] = reg_s_line_first;
//      assign  linebuf_array_line_last  [(LINE_NUM-1)*LINE_NUM            +: LINE_NUM           ] = reg_s_line_last;
//      assign  linebuf_array_pixel_first[(LINE_NUM-1)*1                   +: 1                  ] = reg_s_pixel_first;
//      assign  linebuf_array_pixel_last [(LINE_NUM-1)*1                   +: 1                  ] = reg_s_pixel_last;
//      assign  linebuf_array_de         [(LINE_NUM-1)*LINE_NUM            +: LINE_NUM           ] = reg_s_de;
//      assign  linebuf_array_user       [(LINE_NUM-1)*LINE_NUM*USER_BITS  +: LINE_NUM*USER_BITS ] = reg_s_user;
//      assign  linebuf_array_data       [(LINE_NUM-1)*LINE_NUM*DATA_WIDTH +: LINE_NUM*DATA_WIDTH] = reg_s_data;
//      assign  linebuf_array_addr       [(LINE_NUM-1)*MEM_ADDR_WIDTH      +: MEM_ADDR_WIDTH     ] = reg_s_addr;
//      assign  linebuf_array_valid      [(LINE_NUM-1)*1                   +: 1                  ] = reg_s_valid;
        
        wire    [LINE_NUM-1:0]              linebuf_line_first;
        wire    [LINE_NUM-1:0]              linebuf_line_last;
        wire                                linebuf_pixel_first;
        wire                                linebuf_pixel_last;
        wire    [LINE_NUM-1:0]              linebuf_de;
        wire    [LINE_NUM*USER_BITS-1:0]    linebuf_user;
        wire    [LINE_NUM*DATA_WIDTH-1:0]   linebuf_data;
        wire                                linebuf_valid;
        
        assign linebuf_line_first  = linebuf_array_line_first [(LINE_NUM-1)*LINE_NUM            +: LINE_NUM           ];
        assign linebuf_line_last   = linebuf_array_line_last  [(LINE_NUM-1)*LINE_NUM            +: LINE_NUM           ];
        assign linebuf_pixel_first = linebuf_array_pixel_first[(LINE_NUM-1)*1                   +: 1                  ];
        assign linebuf_pixel_last  = linebuf_array_pixel_last [(LINE_NUM-1)*1                   +: 1                  ];
        assign linebuf_de          = linebuf_array_de         [(LINE_NUM-1)*LINE_NUM            +: LINE_NUM           ];
        assign linebuf_user        = linebuf_array_user       [(LINE_NUM-1)*LINE_NUM*USER_BITS  +: LINE_NUM*USER_BITS ];
        assign linebuf_data        = linebuf_array_data       [(LINE_NUM-1)*LINE_NUM*DATA_WIDTH +: LINE_NUM*DATA_WIDTH];
        assign linebuf_valid       = linebuf_array_valid      [(LINE_NUM-1)*1                   +: 1                  ];

//      assign linebuf_line_first  = linebuf_array_line_first [0 +: LINE_NUM           ];
//      assign linebuf_line_last   = linebuf_array_line_last  [0 +: LINE_NUM           ];
//      assign linebuf_pixel_first = linebuf_array_pixel_first[0 +: 1                  ];
//      assign linebuf_pixel_last  = linebuf_array_pixel_last [0 +: 1                  ];
//      assign linebuf_de          = linebuf_array_de         [0 +: LINE_NUM           ];
//      assign linebuf_user        = linebuf_array_user       [0 +: LINE_NUM*USER_BITS ];
//      assign linebuf_data        = linebuf_array_data       [0 +: LINE_NUM*DATA_WIDTH];
//      assign linebuf_valid       = linebuf_array_valid      [0 +: 1                  ];
            
        
        // control
        reg                                 st1_line_first;
        reg                                 st1_line_last;
        reg                                 st1_pixel_first;
        reg                                 st1_pixel_last;
        reg                                 st1_de;
        reg     [USER_BITS-1:0]             st1_user;
        reg     [LINE_NUM*DATA_WIDTH-1:0]   st1_data;
        reg     [POS_WIDTH-1:0]             st1_pos_first;
        reg     [POS_WIDTH-1:0]             st1_pos_last;
        reg                                 st1_valid;
        
        reg                                 st2_line_first;
        reg                                 st2_line_last;
        reg                                 st2_pixel_first;
        reg                                 st2_pixel_last;
        reg                                 st2_de;
        reg     [USER_BITS-1:0]             st2_user;
        reg     [LINE_NUM*DATA_WIDTH-1:0]   st2_data;
        reg     [LINE_NUM*POS_WIDTH-1:0]    st2_pos_data;
        reg                                 st2_valid;
        
        reg                                 st3_line_first;
        reg                                 st3_line_last;
        reg                                 st3_pixel_first;
        reg                                 st3_pixel_last;
        reg                                 st3_de;
        reg     [USER_BITS-1:0]             st3_user;
        reg     [LINE_NUM*DATA_WIDTH-1:0]   st3_data;
        reg                                 st3_valid;
        
        integer                             y;
        
        always @(posedge clk) begin
            if ( reset ) begin
                st1_line_first    <= 1'b0;
                st1_line_last     <= 1'b0;
                st1_pixel_first   <= 1'b0;
                st1_pixel_last    <= 1'b0;
                st1_de            <= 1'b0;
                st1_user          <= {USER_BITS{1'bx}};
                st1_data          <= {(LINE_NUM*DATA_WIDTH){1'bx}};
                st1_pos_first     <= {POS_WIDTH{1'bx}};
                st1_pos_last      <= {POS_WIDTH{1'bx}};
                st1_valid         <= 1'b0;
                
                st2_line_first    <= 1'b0;
                st2_line_last     <= 1'b0;
                st2_pixel_first   <= 1'b0;
                st2_pixel_last    <= 1'b0;
                st2_de            <= 1'b0;
                st2_user          <= {USER_BITS{1'bx}};
                st2_data          <= {(LINE_NUM*DATA_WIDTH){1'bx}};
                st2_pos_data      <= {(LINE_NUM*POS_WIDTH){1'bx}};
                st2_valid         <= 1'b0;
                
                st3_line_first    <= 1'b0;
                st3_line_last     <= 1'b0;
                st3_pixel_first   <= 1'b0;
                st3_pixel_last    <= 1'b0;
                st3_de            <= 1'b0;
                st3_user          <= {USER_BITS{1'bx}};
                st3_data          <= {(LINE_NUM*DATA_WIDTH){1'bx}};
                st3_valid         <= 1'b0;
            end
            else if ( cke ) begin
                // stage 1
                st1_line_first  <= linebuf_line_first[CENTER];
                st1_line_last   <= linebuf_line_last [CENTER];
                st1_pixel_first <= linebuf_pixel_first;
                st1_pixel_last  <= linebuf_pixel_last;
                st1_de          <= linebuf_de        [CENTER];
                st1_user        <= linebuf_user      [CENTER*USER_BITS +: USER_BITS];
                st1_data        <= linebuf_data;
                st1_pos_first   <= 0;
                st1_pos_last    <= (LINE_NUM-1);
                st1_valid       <= linebuf_valid;
                
                begin : search_first
                    for ( y = CENTER; y >= 0; y = y-1 ) begin
                        if ( linebuf_line_first[y] ) begin
                            st1_pos_first <= y;
                            disable search_first;
                        end
                    end
                end
                
                begin : search_last
                    for ( y = CENTER; y < LINE_NUM; y = y+1 ) begin
                        if ( linebuf_line_last[y] ) begin
                            st1_pos_last <= y;
                            disable search_last;
                        end
                    end
                end
                
                
                // stage2
                st2_line_first  <= st1_line_first;
                st2_line_last   <= st1_line_last;
                st2_pixel_first <= st1_pixel_first;
                st2_pixel_last  <= st1_pixel_last;
                st2_de          <= st1_de;
                st2_user        <= st1_user;
                st2_data        <= st1_data;
                st2_valid       <= st1_valid;
                
                for ( y = 0; y < LINE_NUM; y = y+1 ) begin
                    st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= y;
                    if ( y < CENTER ) begin
                        if ( y < st1_pos_first ) begin
                            if      ( BORDER_MODE == "CONSTANT"    ) begin st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= LINE_NUM;                end
                            else if ( BORDER_MODE == "REPLICATE"   ) begin st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st1_pos_first;           end
                            else if ( BORDER_MODE == "REFLECT"     ) begin st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st1_pos_first*2 - y - 1; end
                            else if ( BORDER_MODE == "REFLECT_101" ) begin st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st1_pos_first*2 - y;     end
                        end
                    end
                    else if ( y > CENTER ) begin
                        if ( y > st1_pos_last ) begin
                            if      ( BORDER_MODE == "CONSTANT"    ) begin st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= LINE_NUM;                end
                            else if ( BORDER_MODE == "REPLICATE"   ) begin st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st1_pos_last;            end
                            else if ( BORDER_MODE == "REFLECT"     ) begin st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st1_pos_last*2 - y + 1;  end
                            else if ( BORDER_MODE == "REFLECT_101" ) begin st2_pos_data[y*POS_WIDTH +: POS_WIDTH] <= st1_pos_last*2 - y;      end
                        end
                    end
                end
                
                // stage3
                st3_line_first  <= st2_line_first;
                st3_line_last   <= st2_line_last;
                st3_pixel_first <= st2_pixel_first;
                st3_pixel_last  <= st2_pixel_last;
                st3_de          <= st2_de;
                st3_user        <= st2_user;
                st3_data        <= st2_data;
                for ( y = 0; y < LINE_NUM; y = y+1 ) begin
                    st3_data[y*DATA_WIDTH +: DATA_WIDTH] <= ({BORDER_VALUE, st2_data} >> (DATA_WIDTH * st2_pos_data[y*POS_WIDTH +: POS_WIDTH]));
                end
                st3_valid       <= st2_valid;
            end
        end
        
        wire                                out_line_first;
        wire                                out_line_last;
        wire                                out_pixel_first;
        wire                                out_pixel_last;
        wire                                out_de;
        wire    [USER_BITS-1:0]             out_user;
        wire    [LINE_NUM*DATA_WIDTH-1:0]   out_data;
        wire                                out_valid;
        
        if ( BORDER_MODE == "NONE" ) begin
            assign out_line_first  = st1_line_first;
            assign out_line_last   = st1_line_last;
            assign out_pixel_first = st1_pixel_first;
            assign out_pixel_last  = st1_pixel_last;
            assign out_de          = st1_de;
            assign out_user        = st1_user;
            assign out_data        = st1_data;
            assign out_valid       = st1_valid;
        end
        else begin
            assign out_line_first  = st3_line_first;
            assign out_line_last   = st3_line_last;
            assign out_pixel_first = st3_pixel_first;
            assign out_pixel_last  = st3_pixel_last;
            assign out_de          = st3_de;
            assign out_user        = st3_user;
            assign out_data        = st3_data;
            assign out_valid       = st3_valid;
        end
        
        assign m_img_line_first  = out_line_first;
        assign m_img_line_last   = out_line_last;
        assign m_img_pixel_first = out_pixel_first;
        assign m_img_pixel_last  = out_pixel_last;
        assign m_img_de          = out_de;
        assign m_img_user        = out_user;
        for ( i = 0; i < LINE_NUM; i = i+1 ) begin :loop_endian
            if ( ENDIAN ) begin
                assign m_img_data[i*DATA_WIDTH +: DATA_WIDTH] = out_data[(LINE_NUM-1-i)*DATA_WIDTH +: DATA_WIDTH];
            end
            else begin
                assign m_img_data[i*DATA_WIDTH +: DATA_WIDTH] = out_data[i*DATA_WIDTH +: DATA_WIDTH];
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




// unit
module jelly_img_line_buf_unit
        #(
            parameter   N          = 1,
            parameter   USER_WIDTH = 0,
            parameter   DATA_WIDTH = 8,
            parameter   ADDR_WIDTH = 10,
            parameter   MEM_SIZE   = (1 << ADDR_WIDTH),
            parameter   RAM_TYPE   = "block",
            
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire    [N-1:0]                     s_line_first,
            input   wire    [N-1:0]                     s_line_last,
            input   wire                                s_pixel_first,
            input   wire                                s_pixel_last,
            input   wire    [N-1:0]                     s_de,
            input   wire    [N*USER_BITS-1:0]           s_user,
            input   wire    [N*DATA_WIDTH-1:0]          s_data,
            input   wire    [ADDR_WIDTH-1:0]            s_addr,
            input   wire                                s_valid,
            
            output  wire    [N-1:0]                     m_line_first,
            output  wire    [N-1:0]                     m_line_last,
            output  wire                                m_pixel_first,
            output  wire                                m_pixel_last,
            output  wire    [N-1:0]                     m_de,
            output  wire    [N*USER_BITS-1:0]           m_user,
            output  wire    [N*DATA_WIDTH-1:0]          m_data,
            output  wire    [ADDR_WIDTH-1:0]            m_addr,
            output  wire                                m_valid
        );
    
    
    // -------------------------------------
    //  line buffer meory
    // -------------------------------------
    
    // data
    wire                                    mem_we;
    wire    [ADDR_WIDTH-1:0]                mem_addr;
    wire    [USER_WIDTH+DATA_WIDTH-1:0]     mem_wdata;
    wire    [USER_WIDTH+DATA_WIDTH-1:0]     mem_rdata;
    
    jelly_ram_singleport
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DATA_WIDTH     (USER_WIDTH+DATA_WIDTH),
                .MEM_SIZE       (MEM_SIZE),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1),
                .MODE           ("READ_FIRST")
            )
        i_ram_singleport
            (
                .clk            (clk),
                .en             (cke),
                .regcke         (cke),
                .we             (mem_we),
                .addr           (mem_addr),
                .din            (mem_wdata),
                .dout           (mem_rdata)
            );
    
    assign mem_we    = s_de[0];
    assign mem_addr  = s_addr;
    assign mem_wdata = {s_user[USER_BITS-1:0], s_data[DATA_WIDTH-1:0]};
    
    wire    [USER_BITS-1:0]     mem_read_user;
    wire    [DATA_WIDTH-1:0]    mem_read_data;
    assign {mem_read_user, mem_read_data} = mem_rdata;
    
    
    // -------------------------------------
    //  pixel pipeline
    // -------------------------------------
    
    reg     [N-2:0]                 st0_line_first;
    reg     [N-2:0]                 st0_line_last;
    reg     [N-2:0]                 st0_pixel_first;
    reg     [N-2:0]                 st0_pixel_last;
    reg     [N-2:0]                 st0_de;
    reg     [(N-1)*USER_BITS-1:0]   st0_user;
    reg     [(N-1)*DATA_WIDTH-1:0]  st0_data;
    reg     [ADDR_WIDTH-1:0]        st0_addr;
    reg                             st0_valid;
    
    reg     [N-2:0]                 st1_line_first;
    reg     [N-2:0]                 st1_line_last;
    reg     [N-2:0]                 st1_pixel_first;
    reg     [N-2:0]                 st1_pixel_last;
    reg     [N-2:0]                 st1_de;
    reg     [(N-1)*USER_BITS-1:0]   st1_user;
    reg     [(N-1)*DATA_WIDTH-1:0]  st1_data;
    reg     [ADDR_WIDTH-1:0]        st1_addr;
    reg                             st1_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_line_first  <= {(N-1){1'bx}};
            st0_line_last   <= {(N-1){1'bx}};
            st0_pixel_first <= 1'bx;
            st0_pixel_last  <= 1'bx;
            st0_de          <= {(N-1){1'bx}};
            st0_user        <= {((N-1)*USER_BITS){1'bx}};
            st0_data        <= {((N-1)*DATA_WIDTH){1'bx}};
            st0_addr        <= {ADDR_WIDTH{1'bx}};
            st0_valid       <= 1'b0;
            
            st1_line_first  <= {(N-1){1'bx}};
            st1_line_last   <= {(N-1){1'bx}};
            st1_pixel_first <= 1'bx;
            st1_pixel_last  <= 1'bx;
            st1_de          <= {(N-1){1'bx}};
            st1_user        <= {((N-1)*USER_BITS){1'bx}};
            st1_data        <= {((N-1)*DATA_WIDTH){1'bx}};
            st1_addr        <= {ADDR_WIDTH{1'bx}};
            st1_valid       <= 1'b0;
        end
        if ( cke ) begin
            st0_line_first  <= s_line_first;
            st0_line_last   <= s_line_last;
            st0_de          <= s_de;
            st0_pixel_first <= s_pixel_first;
            st0_pixel_last  <= s_pixel_last;
            st0_user        <= s_user;
            st0_data        <= s_data;
            st0_addr        <= s_addr;
            st0_valid       <= s_valid;
            
            st1_line_first  <= st0_line_first;
            st1_line_last   <= st0_line_last;
            st1_pixel_first <= st0_pixel_first;
            st1_pixel_last  <= st0_pixel_last;
            st1_de          <= st0_de;
            st1_user        <= st0_user;
            st1_data        <= st0_data;
            st1_addr        <= st0_addr;
            st1_valid       <= st0_valid;
        end
    end
    
    reg                         mem_line_first;
    reg                         mem_line_last;
    reg                         mem_de;
    always @(posedge clk) begin
        if ( reset ) begin
            mem_line_first <= 1'b0;
            mem_line_last  <= 1'b0;
            mem_de         <= 1'b0;
        end
        if ( cke ) begin
            if ( st1_valid && st1_pixel_last[0] ) begin
                mem_line_first <= st1_line_first[0];
                mem_line_last  <= st1_line_last[0];
                mem_de         <= st1_de[0];
            end
        end
    end
    
    assign m_line_first  = {st1_line_first, mem_line_first};
    assign m_line_last   = {st1_line_last , mem_line_last };
    assign m_pixel_first = st1_pixel_first;
    assign m_pixel_last  = st1_pixel_last;
    assign m_de          = {st1_de,         mem_de        };
    assign m_user        = {st1_user,       mem_read_user };
    assign m_data        = {st1_data,       mem_read_data };
    assign m_addr        = st1_addr;
    assign m_valid       = st1_valid;
    
//  assign m_line_first  = {mem_line_first, st1_line_first};
//  assign m_line_last   = {mem_line_last , st1_line_last };
//  assign m_pixel_first = st1_pixel_first;
//  assign m_pixel_last  = st1_pixel_last;
//  assign m_de          = {mem_de,         st1_de        };
//  assign m_user        = {mem_read_user,  st1_user      };
//  assign m_data        = {mem_read_data,  st1_data      };
//  assign m_addr        = st1_addr;
//  assign m_valid       = st1_valid;
    
endmodule



`default_nettype wire


// end of file
