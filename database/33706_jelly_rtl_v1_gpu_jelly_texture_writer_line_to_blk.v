// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// パラメータを変える場合は busy が落ちてから行うこと

module jelly_texture_writer_line_to_blk
        #(
            parameter   COMPONENT_NUM        = 3,
            parameter   COMPONENT_SEL_WIDTH  = COMPONENT_NUM <= 2  ?  1 :
                                               COMPONENT_NUM <= 4  ?  2 :
                                               COMPONENT_NUM <= 8  ?  3 :
                                               COMPONENT_NUM <= 16 ?  4 :
                                               COMPONENT_NUM <= 32 ?  5 :
                                               COMPONENT_NUM <= 64 ?  6 : 7,
            
            parameter   BLK_X_SIZE           = 2,       // 2^n (0:1, 1:2, 2:4, 3:8... )
            parameter   BLK_Y_SIZE           = 2,       // 2^n (0:1, 1:2, 2:4, 3:8... )
            parameter   STEP_Y_SIZE          = 1,       // 2^n (0:1, 1:2, 2:4, 3:8... )
            
            parameter   X_WIDTH              = 10,
            parameter   Y_WIDTH              = 10,
            parameter   STRIDE_C_WIDTH       = BLK_X_SIZE + BLK_Y_SIZE,
            parameter   STRIDE_X_WIDTH       = BLK_X_SIZE + BLK_Y_SIZE + COMPONENT_SEL_WIDTH,
            parameter   STRIDE_Y_WIDTH       = X_WIDTH + BLK_Y_SIZE,
            
            parameter   ADDR_WIDTH           = 24,
            parameter   S_DATA_WIDTH         = 8*3,
            parameter   M_DATA_SIZE          = 2,
            
            parameter   BUF_ADDR_WIDTH       = 1 + X_WIDTH + STEP_Y_SIZE,
            parameter   BUF_RAM_TYPE         = "block",
            
            // local
            parameter   M_DATA_WIDTH         = (S_DATA_WIDTH << M_DATA_SIZE)
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            
            input   wire                                endian,
            
            input   wire                                enable,
            output  wire                                busy,
            
            input   wire    [X_WIDTH-1:0]               param_width,
            input   wire    [Y_WIDTH-1:0]               param_height,
            input   wire    [STRIDE_C_WIDTH-1:0]        param_stride_c,
            input   wire    [STRIDE_X_WIDTH-1:0]        param_stride_x,
            input   wire    [STRIDE_Y_WIDTH-1:0]        param_stride_y,
            
            input   wire                                s_first,
            input   wire    [S_DATA_WIDTH-1:0]          s_data,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            output  wire    [COMPONENT_SEL_WIDTH-1:0]   m_component,
            output  wire    [ADDR_WIDTH-1:0]            m_addr,
            output  wire    [M_DATA_WIDTH-1:0]          m_data,
            output  wire                                m_last,
            output  wire                                m_valid,
            input   wire                                m_ready
        );
    
    
    // ---------------------------------
    //  common
    // ---------------------------------
    
    localparam  S_DATA_SIZE      = 0;
    
    localparam  S_UNIT           = (1 << S_DATA_SIZE);
    localparam  M_UNIT           = (1 << M_DATA_SIZE);
    
    
    localparam  PIX_X_NUM        = (1 << BLK_X_SIZE);
    localparam  PIX_X_WIDTH      = BLK_X_SIZE >= 0 ? BLK_X_SIZE : 1;
    
    localparam  PIX_STEP_Y_NUM   = (1 << STEP_Y_SIZE);
    localparam  PIX_STEP_Y_WIDTH = STEP_Y_SIZE >= 0 ? STEP_Y_SIZE : 1;
    
    localparam  PIX_SIZE         = BLK_X_SIZE + BLK_Y_SIZE;
    localparam  PIX_NUM          = (1 << PIX_SIZE);
    localparam  PIX_WIDTH        = PIX_SIZE > 0 ? PIX_SIZE : 1;
    
    localparam  PIX_STEP_SIZE    = BLK_X_SIZE + STEP_Y_SIZE;
    localparam  PIX_STEP_NUM     = (1 << PIX_STEP_SIZE);
    localparam  PIX_STEP_WIDTH   = PIX_STEP_SIZE > 0 ? PIX_STEP_SIZE : 1;
    
    localparam  BLK_STEP_SIZE    = BLK_Y_SIZE - STEP_Y_SIZE;
    localparam  BLK_STEP_NUM     = (1 << BLK_STEP_SIZE);
    localparam  BLK_STEP_WIDTH   = BLK_STEP_SIZE > 0 ? BLK_STEP_SIZE : 1;
    
    localparam  BLK_X_WIDTH      = X_WIDTH - BLK_X_SIZE;
    localparam  BLK_Y_WIDTH      = Y_WIDTH - BLK_Y_SIZE;
    localparam  STEP_Y_WIDTH     = Y_WIDTH - STEP_Y_SIZE;
    
    wire    [BLK_X_WIDTH-1:0]   blk_x_num  = (param_width  >> BLK_X_SIZE);
    wire    [BLK_Y_WIDTH-1:0]   blk_y_num  = (param_height >> BLK_Y_SIZE);
    wire    [STEP_Y_WIDTH-1:0]  step_y_num = (param_height >> STEP_Y_SIZE);
    
    
    
    // ---------------------------------
    //  buffer memory
    // ---------------------------------
    
    localparam  BUF_NUM            = (1 << M_DATA_SIZE);
    localparam  BUF_UNIT_WIDTH     = S_DATA_WIDTH;
    localparam  BUF_DATA_WIDTH     = M_DATA_WIDTH;
    
    localparam  MEM_ADDR_WIDTH     = BUF_ADDR_WIDTH - M_DATA_SIZE;
    
    wire                                    buf_full;
    wire                                    buf_empty;
    
    wire                                    buf_wr_req;
    wire                                    buf_wr_end;
    
    wire                                    buf_rd_req;
    wire                                    buf_rd_end;
    
    wire                                    buf_wr_cke;
    wire    [BUF_ADDR_WIDTH-1:0]            buf_wr_addr;
    wire    [S_DATA_WIDTH-1:0]              buf_wr_din;
    
    wire                                    buf_rd_cke;
    wire    [BUF_ADDR_WIDTH-1:0]            buf_rd_addr;
    wire    [M_DATA_WIDTH-1:0]              buf_rd_dout;

    genvar                                  i;
    
    generate
    for ( i = 0; i < BUF_NUM; i = i+1 ) begin : loop_buf
        wire                            wr_en;
        wire    [MEM_ADDR_WIDTH-1:0]    wr_addr;
        wire    [BUF_UNIT_WIDTH-1:0]    wr_din;
        
        wire                            rd_en;
        wire                            rd_regcke;
        wire    [MEM_ADDR_WIDTH-1:0]    rd_addr;
        wire    [BUF_UNIT_WIDTH-1:0]    rd_dout;
        
        jelly_ram_simple_dualport
                #(
                    .ADDR_WIDTH     (MEM_ADDR_WIDTH),
                    .DATA_WIDTH     (BUF_UNIT_WIDTH),
                    .RAM_TYPE       (BUF_RAM_TYPE),
                    .DOUT_REGS      (1)
                )
            i_ram_simple_dualport
                (
                    .wr_clk         (clk),
                    .wr_en          (wr_en),
                    .wr_addr        (wr_addr),
                    .wr_din         (wr_din),
                    
                    .rd_clk         (clk),
                    .rd_en          (rd_en),
                    .rd_regcke      (rd_regcke),
                    .rd_addr        (rd_addr),
                    .rd_dout        (rd_dout)
                );
        
        assign  wr_en     = (((buf_wr_addr & ((1 << M_DATA_SIZE) - 1)) == (endian ? (BUF_NUM-1) - i : i)) & buf_wr_cke);
        assign  wr_addr   = (buf_wr_addr >> M_DATA_SIZE);
        assign  wr_din    = buf_wr_din;
        
        assign  rd_en     = buf_rd_cke;
        assign  rd_regcke = buf_rd_cke;
        assign  rd_addr   = (buf_rd_addr >> M_DATA_SIZE);
        assign  buf_rd_dout[i*BUF_UNIT_WIDTH +: BUF_UNIT_WIDTH] = rd_dout;
        
    end
    endgenerate
    
    localparam  BUF_BLKLINE_WIDTH  = (BUF_ADDR_WIDTH - (X_WIDTH + STEP_Y_SIZE));
    localparam  BUF_BLKLINE_NUM    = (1 << BUF_BLKLINE_WIDTH);
    
    localparam  BUF_BLK_WIDTH      = (BUF_ADDR_WIDTH - (BLK_X_SIZE + STEP_Y_SIZE));
    localparam  BUF_BLK_NUM        = (1 << BUF_BLK_WIDTH);
    
    reg     [BUF_BLKLINE_WIDTH:0]   reg_buf_wr_count;   // writable block counter
    reg                             reg_buf_full;
    
    reg     [BUF_BLK_WIDTH:0]       reg_buf_rd_count;   // readable block counter
    reg                             reg_buf_empty;
    
    integer iBUF_BLKLINE_WIDTH = BUF_BLKLINE_WIDTH;
    integer iBUF_BLKLINE_NUM   = BUF_BLKLINE_NUM;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_buf_wr_count <= BUF_BLKLINE_NUM;
            reg_buf_full     <= 1'b0;
            
            reg_buf_rd_count <= 0;
            reg_buf_empty    <= 1'b1;
        end
        else begin
            reg_buf_wr_count <= reg_buf_wr_count - buf_wr_req + buf_rd_end;
            reg_buf_full     <= ((reg_buf_wr_count - buf_wr_req + buf_rd_end) == 0);
            
            reg_buf_rd_count <= reg_buf_rd_count + buf_wr_end - buf_rd_req;
            reg_buf_empty    <= ((reg_buf_rd_count + buf_wr_end - buf_rd_req) == 0);
        end
    end
    
    assign buf_full  = reg_buf_full;
    assign buf_empty = reg_buf_empty;
    
    
    
    
    // ---------------------------------
    //  write to buffer
    // ---------------------------------
    
    wire                                wr_cke;
    
    reg                                 wr_busy;
    reg     [BLK_X_WIDTH-1:0]           wr_blk_x_num;
    reg     [STEP_Y_WIDTH-1:0]          wr_step_y_num;
    reg     [STRIDE_C_WIDTH-1:0]        wr_stride_c;
    reg     [STRIDE_X_WIDTH-1:0]        wr_stride_x;
    reg     [STRIDE_Y_WIDTH-1:0]        wr_stride_y;
    
    reg     [PIX_X_WIDTH-1:0]           wr0_x_count;
    reg                                 wr0_x_last;
    reg     [BLK_X_WIDTH-1:0]           wr0_blk_count;
    reg                                 wr0_blk_last;
    reg     [PIX_STEP_Y_WIDTH-1:0]      wr0_step_y_count;
    reg                                 wr0_step_y_last;
    reg     [STEP_Y_WIDTH-1:0]          wr0_y_count;
    reg                                 wr0_y_last;
    reg     [BUF_ADDR_WIDTH-1:0]        wr0_addr;
    reg     [BUF_ADDR_WIDTH-1:0]        wr0_addr_blk;
    reg     [BUF_ADDR_WIDTH-1:0]        wr0_addr_line;
    wire        [S_DATA_WIDTH-1:0]      wr0_data  = s_data;
    wire                                wr0_valid = s_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            wr_busy       <= 1'b0;
            wr_blk_x_num  <= {BLK_X_WIDTH{1'bx}};
            wr_step_y_num <= {STEP_Y_WIDTH{1'bx}};
            wr_stride_c   <= {STRIDE_C_WIDTH{1'bx}};
            wr_stride_x   <= {STRIDE_X_WIDTH{1'bx}};
            wr_stride_y   <= {STRIDE_Y_WIDTH{1'bx}};
        end
        else begin
            if ( !wr_busy ) begin
                wr_busy       <= (enable && (s_first && s_valid));  // frame start で開始
                wr_blk_x_num  <= blk_x_num;
                wr_step_y_num <= step_y_num;
                wr_stride_c   <= param_stride_c;
                wr_stride_x   <= param_stride_x;
                wr_stride_y   <= param_stride_y;
            end
            else if ( wr_cke ) begin
                if ( wr0_valid && wr0_x_last && wr0_blk_last && wr0_step_y_last && wr0_y_last ) begin
                    wr_busy <= 1'b0;
                end
            end
        end
    end
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            wr0_x_count      <= {PIX_X_WIDTH{1'bx}};
            wr0_x_last       <= 1'b0;
            wr0_blk_count    <= {BLK_X_WIDTH{1'bx}};
            wr0_blk_last     <= 1'b0;
            wr0_step_y_count <= {PIX_STEP_Y_WIDTH{1'b0}};
            wr0_step_y_last  <= 1'b0;
            wr0_y_count      <= {STEP_Y_WIDTH{1'b0}};
            wr0_y_last       <= 1'b0;
            
            wr0_addr         <= {BUF_ADDR_WIDTH{1'b0}};
            wr0_addr_blk     <= {BUF_ADDR_WIDTH{1'b0}};
            wr0_addr_line    <= {BUF_ADDR_WIDTH{1'b0}};
        end
        else if ( wr_cke ) begin
            if ( !wr_busy ) begin
                // ポインタアドレスはそのままに他の要素をリセット
                wr0_x_count      <= {PIX_X_WIDTH{1'b0}};
                wr0_x_last       <= (PIX_X_NUM == 1);
                wr0_blk_count    <= {BLK_X_WIDTH{1'b0}};
                wr0_blk_last     <= (blk_x_num == 0);
                wr0_step_y_count <= {PIX_STEP_Y_WIDTH{1'b0}};
                wr0_step_y_last  <= (PIX_STEP_Y_NUM == 1);
                wr0_y_count      <= {STEP_Y_WIDTH{1'b0}};
                wr0_y_last       <= (step_y_num == 0);
            end
            else begin
                // stage0
                if ( wr0_valid ) begin
                    wr0_addr <= wr0_addr + (1 << S_DATA_SIZE);
                    
                    wr0_x_count  <= wr0_x_count + S_UNIT;
                    wr0_x_last   <= ((wr0_x_count + S_UNIT) == (PIX_X_NUM-S_UNIT));
                    if ( wr0_x_last ) begin
                        wr0_x_count   <= {PIX_X_WIDTH{1'b0}};
                        wr0_x_last    <= (PIX_X_NUM == 1);
                        
                        wr0_addr      <= wr0_addr_blk + (1 << (BLK_X_SIZE + STEP_Y_SIZE));
                        wr0_addr_blk  <= wr0_addr_blk + (1 << (BLK_X_SIZE + STEP_Y_SIZE));
                        
                        wr0_blk_count <= wr0_blk_count + 1'b1;
                        wr0_blk_last  <= ((wr0_blk_count + 1'b1) == wr_blk_x_num);
                        if ( wr0_blk_last ) begin
                            wr0_blk_count <= {BLK_X_WIDTH{1'b0}};
                            wr0_blk_last  <= (wr_blk_x_num == 0);
                            
                            wr0_addr      <= wr0_addr_line + (1 << (BLK_X_SIZE));
                            wr0_addr_blk  <= wr0_addr_line + (1 << (BLK_X_SIZE));
                            wr0_addr_line <= wr0_addr_line + (1 << (BLK_X_SIZE));
                            
                            wr0_step_y_count <= wr0_step_y_count + 1'b1;
                            wr0_step_y_last  <= ((wr0_step_y_count + 1'b1) == (PIX_STEP_Y_NUM - 1));
                            if ( wr0_step_y_last ) begin
                                wr0_step_y_count <= {PIX_STEP_Y_WIDTH{1'b0}};
                                wr0_step_y_last  <= (PIX_STEP_Y_NUM == 1);
                                
                                wr0_addr         <= wr0_addr + 1'b1;
                                wr0_addr_blk     <= wr0_addr + 1'b1;
                                wr0_addr_line    <= wr0_addr + 1'b1;
                                
                                wr0_y_count      <= wr0_y_count + 1'b1;
                                wr0_y_last       <= ((wr0_y_count + 1'b1) == wr_step_y_num);
                            end
                        end
                    end
                end
            end
        end
    end
    
    assign  wr_cke      = !buf_full;
    
    assign  s_ready     = wr_cke && (wr_busy || !(s_valid & s_first));  // 非busy 時 frame start 以外をスキップ
    
    assign  buf_wr_req  = (wr_cke && wr0_valid && wr0_x_last && wr0_step_y_last && wr0_blk_last);
    assign  buf_wr_end  = (wr_cke && wr0_valid && wr0_x_last && wr0_step_y_last);
    
    assign  buf_wr_cke  = wr_cke;
    assign  buf_wr_addr = wr0_addr;
    assign  buf_wr_din  = wr0_data;
    
    
    
    // ---------------------------------
    //  read from buffer
    // ---------------------------------
    
    wire                                rd_cke;
    
    reg                                 rd_ready;
    reg                                 rd_busy;
    reg     [BLK_X_WIDTH-1:0]           rd_blk_x_num;
    reg     [STEP_Y_WIDTH-1:0]          rd_step_y_num;
    reg     [STRIDE_C_WIDTH-1:0]        rd_stride_c;
    reg     [STRIDE_X_WIDTH-1:0]        rd_stride_x;
    reg     [STRIDE_Y_WIDTH-1:0]        rd_stride_y;
    
    reg     [PIX_STEP_WIDTH-1:0]        rd0_pix_count;
    reg                                 rd0_pix_last;
    reg     [COMPONENT_SEL_WIDTH-1:0]   rd0_cmp_count;
    reg                                 rd0_cmp_last;
    reg     [BLK_X_WIDTH-1:0]           rd0_blk_count;
    reg                                 rd0_blk_last;
    reg     [STEP_Y_WIDTH-1:0]          rd0_step_y_count;
    reg                                 rd0_step_y_last;
    reg                                 rd0_blk_y_last;
    reg     [BUF_ADDR_WIDTH-1:0]        rd0_addr;
    reg     [BUF_ADDR_WIDTH-1:0]        rd0_addr_blk;
    wire                                rd0_valid = (!buf_empty && rd_ready);
    
    reg     [COMPONENT_SEL_WIDTH-1:0]   rd1_component;
    reg                                 rd1_pix_last;
    reg                                 rd1_cmp_last;
    reg                                 rd1_blk_last;
    reg                                 rd1_blk_y_last;
    reg                                 rd1_step_y_last;
    reg                                 rd1_last;
    reg                                 rd1_valid;
    
    reg                                 rd2_pix_last;
    reg                                 rd2_cmp_last;
    reg                                 rd2_blk_last;
    reg                                 rd2_blk_y_last;
    reg                                 rd2_last;
    reg     [COMPONENT_SEL_WIDTH-1:0]   rd2_component;
    reg     [ADDR_WIDTH-1:0]            rd2_addr;
    reg     [ADDR_WIDTH-1:0]            rd2_addr_cmp;
    reg     [ADDR_WIDTH-1:0]            rd2_addr_blk;
    reg     [ADDR_WIDTH-1:0]            rd2_addr_step;
    reg     [ADDR_WIDTH-1:0]            rd2_addr_blk_y;
    wire    [M_DATA_WIDTH-1:0]          rd2_data = buf_rd_dout;
    reg                                 rd2_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            rd_ready      <= 1'b0;
            rd_busy       <= 1'b0;
            rd_blk_x_num  <= {BLK_X_WIDTH{1'bx}};
            rd_step_y_num <= {STEP_Y_WIDTH{1'bx}};
            rd_stride_c   <= {STRIDE_C_WIDTH{1'bx}};
            rd_stride_x   <= {STRIDE_X_WIDTH{1'bx}};
            rd_stride_y   <= {STRIDE_Y_WIDTH{1'bx}};
        end
        else begin
            if ( !rd_busy ) begin
                // 各パラメータは wr から伝播
                rd_ready      <= wr_busy;
                rd_busy       <= wr_busy;
                rd_blk_x_num  <= wr_blk_x_num;
                rd_step_y_num <= wr_step_y_num;
                rd_stride_c   <= wr_stride_c;
                rd_stride_x   <= wr_stride_x;
                rd_stride_y   <= wr_stride_y;
            end
            else begin
                if ( rd_cke && rd0_pix_last && rd0_cmp_last && rd0_blk_last && rd0_step_y_last && rd0_valid ) begin
                    rd_ready <= 1'b0;
                end
                
                if ( m_last && m_valid && m_ready ) begin
                    rd_busy <= 1'b0;
                end
            end
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            rd0_pix_count    <= {PIX_STEP_WIDTH{1'bx}};
            rd0_pix_last     <= 1'bx;
            rd0_cmp_count    <= {COMPONENT_SEL_WIDTH{1'bx}};
            rd0_cmp_last     <= 1'bx;
            rd0_blk_count    <= {BLK_X_WIDTH{1'bx}};
            rd0_blk_last     <= 1'bx;
            rd0_blk_y_last   <= 1'bx;
            rd0_step_y_count <= {STEP_Y_WIDTH{1'bx}};
            rd0_step_y_last  <= 1'bx;
            rd0_addr         <= {BUF_ADDR_WIDTH{1'b0}};
            rd0_addr_blk     <= {BUF_ADDR_WIDTH{1'b0}};
            
            rd1_pix_last     <= 1'bx;
            rd1_cmp_last     <= 1'bx;
            rd1_blk_last     <= 1'bx;
            rd1_blk_y_last   <= 1'bx;
            rd1_last         <= 1'bx;
            rd1_component    <= {COMPONENT_SEL_WIDTH{1'bx}};
            rd1_valid        <= 1'bx;
            
            rd2_pix_last     <= 1'bx;
            rd2_cmp_last     <= 1'bx;
            rd2_blk_last     <= 1'bx;
            rd2_blk_y_last   <= 1'bx;
            rd2_last         <= 1'bx;
            rd2_addr         <= {ADDR_WIDTH{1'bx}};
            rd2_addr_cmp     <= {ADDR_WIDTH{1'bx}};
            rd2_addr_blk     <= {ADDR_WIDTH{1'bx}};
            rd2_addr_step    <= {ADDR_WIDTH{1'bx}};
            rd2_addr_blk_y   <= {ADDR_WIDTH{1'bx}};
            rd2_valid        <= 1'bx;
        end
        else if ( rd_cke ) begin
            if ( !rd_busy ) begin
                // ポインタアドレスはそのままに他の要素をリセット
                rd0_pix_count    <= {PIX_STEP_WIDTH{1'b0}};
                rd0_pix_last     <= (PIX_STEP_NUM == M_UNIT);
                rd0_cmp_count    <= {COMPONENT_SEL_WIDTH{1'b0}};
                rd0_cmp_last     <= (COMPONENT_NUM == 1);
                rd0_blk_count    <= {BLK_X_WIDTH{1'b0}};
                rd0_blk_last     <= (wr_blk_x_num == 0);
                rd0_step_y_count <= {STEP_Y_WIDTH{1'b0}};
                rd0_step_y_last  <= (wr_step_y_num == 0);
                rd0_blk_y_last   <= (BLK_STEP_NUM == 1);
                
                rd1_pix_last     <= 1'bx;
                rd1_cmp_last     <= 1'bx;
                rd1_blk_last     <= 1'bx;
                rd1_blk_y_last   <= 1'bx;
                rd1_last         <= 1'bx;
                rd1_component    <= {COMPONENT_SEL_WIDTH{1'bx}};
                
                rd2_pix_last     <= 1'bx;
                rd2_cmp_last     <= 1'bx;
                rd2_blk_last     <= 1'bx;
                rd2_blk_y_last   <= 1'bx;
                rd2_last         <= 1'bx;
                rd2_component    <= {COMPONENT_SEL_WIDTH{1'bx}};
                rd2_addr         <= {ADDR_WIDTH{1'b0}};
                rd2_addr_cmp     <= {ADDR_WIDTH{1'b0}}; // wr_stride_c;
                rd2_addr_blk     <= {ADDR_WIDTH{1'b0}}; // wr_stride_x;
                rd2_addr_step    <= {ADDR_WIDTH{1'b0}}; // PIX_STEP_NUM;
                rd2_addr_blk_y   <= {ADDR_WIDTH{1'b0}}; // wr_stride_y;
                rd2_valid        <= 1'b0;
            end
            else begin
                // stage0
                if ( rd0_valid ) begin
                    rd0_addr <= rd0_addr + M_UNIT;
                    
                    rd0_pix_count <= rd0_pix_count + M_UNIT;
                    rd0_pix_last  <= ((rd0_pix_count + M_UNIT) == (PIX_STEP_NUM - M_UNIT));
                    if ( rd0_pix_last ) begin
                        rd0_pix_count  <= {PIX_STEP_WIDTH{1'b0}};
                        rd0_pix_last   <= (PIX_STEP_NUM == 1);
                        
                        rd0_addr       <= rd0_addr_blk;
                        
                        rd0_cmp_count  <= rd0_cmp_count + 1'b1;
                        rd0_cmp_last   <= ((rd0_cmp_count + 1'b1) == (COMPONENT_NUM - 1));
                        if ( rd0_cmp_last ) begin
                            rd0_cmp_count <= {COMPONENT_SEL_WIDTH{1'b0}};
                            rd0_cmp_last  <= (COMPONENT_NUM == 1);
                            
                            rd0_addr      <= rd0_addr_blk + (1 << PIX_STEP_SIZE);
                            rd0_addr_blk  <= rd0_addr_blk + (1 << PIX_STEP_SIZE);
                            
                            rd0_blk_count <= rd0_blk_count + 1'b1;
                            rd0_blk_last  <= ((rd0_blk_count + 1'b1) == rd_blk_x_num);
                            if ( rd0_blk_last ) begin
                                rd0_blk_count  <= {BLK_X_WIDTH{1'b0}};
                                rd0_blk_last   <= (rd_blk_x_num == 0);
                                
                                rd0_blk_y_last   <= (((rd0_step_y_count + 1'b1) & (BLK_STEP_NUM-1)) == (BLK_STEP_NUM - 1));
                                
                                rd0_step_y_count <= rd0_step_y_count + 1'b1;
                                rd0_step_y_last  <= ((rd0_step_y_count + 1'b1) == rd_step_y_num);
                                if ( rd0_step_y_last ) begin
                                    rd0_step_y_count <= {STEP_Y_WIDTH{1'b0}};
                                    rd0_step_y_last  <= (rd_step_y_num == 0);
                                end
                            end
                        end
                    end
                end
                
                
                // stage1
                rd1_pix_last   <= rd0_pix_last;
                rd1_cmp_last   <= (rd0_pix_last && rd0_cmp_last);
                rd1_blk_last   <= (rd0_pix_last && rd0_cmp_last && rd0_blk_last);
                rd1_blk_y_last <= (rd0_pix_last && rd0_cmp_last && rd0_blk_last && rd0_blk_y_last);
                rd1_last       <= (rd0_pix_last && rd0_cmp_last && rd0_blk_last && rd0_step_y_last);
                rd1_component  <= rd0_cmp_count;
                rd1_valid      <= rd0_valid;
                
                
                // stage2
                rd2_pix_last   <= rd1_pix_last;
                rd2_cmp_last   <= rd1_cmp_last;
                rd2_blk_last   <= rd1_blk_last;
                rd2_blk_y_last <= rd1_blk_y_last;
                rd2_last       <= rd1_last;
                
                if ( rd2_valid ) begin
                    rd2_addr <= rd2_addr + M_UNIT;
                    if ( rd2_pix_last ) begin
                        rd2_addr     <= rd2_addr_cmp + rd_stride_c;
                        rd2_addr_cmp <= rd2_addr_cmp + rd_stride_c;
                    end
                    if ( rd2_cmp_last ) begin
                        rd2_addr     <= rd2_addr_blk + rd_stride_x;
                        rd2_addr_cmp <= rd2_addr_blk + rd_stride_x;
                        rd2_addr_blk <= rd2_addr_blk + rd_stride_x;
                    end
                    if ( rd2_blk_last ) begin
                        rd2_addr      <= rd2_addr_step + PIX_STEP_NUM;
                        rd2_addr_cmp  <= rd2_addr_step + PIX_STEP_NUM;
                        rd2_addr_blk  <= rd2_addr_step + PIX_STEP_NUM;
                        rd2_addr_step <= rd2_addr_step + PIX_STEP_NUM;
                    end
                    if ( rd2_blk_y_last ) begin
                        rd2_addr       <= rd2_addr_blk_y + rd_stride_y;
                        rd2_addr_cmp   <= rd2_addr_blk_y + rd_stride_y;
                        rd2_addr_blk   <= rd2_addr_blk_y + rd_stride_y;
                        rd2_addr_step  <= rd2_addr_blk_y + rd_stride_y;
                        rd2_addr_blk_y <= rd2_addr_blk_y + rd_stride_y;
                    end
                end
                
                rd2_component <= rd1_component;
                rd2_valid     <= rd1_valid;
            end
        end
    end
    
    assign  rd_cke      = (!m_valid || m_ready);
    
    assign  buf_rd_req  = (rd_cke && rd0_valid && rd0_pix_last && rd0_cmp_last);
    assign  buf_rd_end  = (rd_cke && rd0_valid && rd0_pix_last && rd0_cmp_last && rd0_blk_last);
    
    assign  buf_rd_cke  = rd_cke;
    assign  buf_rd_addr = rd0_addr;
    
    assign  m_component = rd2_component;
    assign  m_addr      = rd2_addr;
    assign  m_data      = rd2_data;
    assign  m_last      = rd2_last;
    assign  m_valid     = rd2_valid;
    
//  assign  busy        = wr_busy;
    assign  busy        = wr_busy || rd_busy;
    
endmodule



`default_nettype wire


// end of file
