// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_linear_interpolation
        #(
            parameter   USER_WIDTH    = 0,
            parameter   RATE_WIDTH    = 4,
            parameter   COMPONENT_NUM = 3,
            parameter   DATA_WIDTH    = 8,
            parameter   DATA_SIGNED   = 1,
            parameter   ROUNDING      = 0,
            parameter   COMPACT       = 0,
            parameter   BLENDING      = 0,      // αブレンド用(rate のmaxを 1.0扱いする)
            
            // local
            parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire    [USER_BITS-1:0]                 s_user,
            input   wire    [RATE_WIDTH-1:0]                s_rate,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  s_data0,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  s_data1,
            input   wire                                    s_valid,
            
            output  wire    [USER_BITS-1:0]                 m_user,
            output  wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_data,
            output  wire                                    m_valid
        );
    
    localparam      DATA_BITS       = COMPACT ? DATA_WIDTH : DATA_WIDTH + RATE_WIDTH;
    localparam      ROUNDING_OFFSET = !COMPACT && ROUNDING ? (1 << (RATE_WIDTH-1)) : 0;
    
    genvar          i;
    
    // パイプライン構成
    wire    [(RATE_WIDTH+1)*USER_BITS-1:0]                  pipeline_user;
    wire    [(RATE_WIDTH+1)*RATE_WIDTH-1:0]                 pipeline_rate;
    wire    [(RATE_WIDTH+1)*COMPONENT_NUM*DATA_BITS-1:0]    pipeline_data0;
    wire    [(RATE_WIDTH+1)*COMPONENT_NUM*DATA_BITS-1:0]    pipeline_data1;
    wire    [(RATE_WIDTH+1)-1:0]                            pipeline_valid;
    
    assign pipeline_user [USER_BITS-1:0]  = USER_WIDTH > 0 ? s_user : 1'bx;
    assign pipeline_rate [RATE_WIDTH-1:0] = s_rate;
    assign pipeline_valid[0]              = s_valid;
    
    // 符号拡張
    jelly_data_expand
            #(
                .NUM                (COMPONENT_NUM),
                .IN_DATA_WIDTH      (DATA_WIDTH),
                .OUT_DATA_WIDTH     (DATA_BITS),
                .DATA_SIGNED        (DATA_SIGNED),
                .OFFSET             (0),
                .RSHIFT             (0),
                .LSHIFT             (0)
            )
        i_data_expand_s0
            (
                .din                (s_data0),
                .dout               (pipeline_data0[COMPONENT_NUM*DATA_BITS-1:0])
            );
    
    jelly_data_expand
            #(
                .NUM                (COMPONENT_NUM),
                .IN_DATA_WIDTH      (DATA_WIDTH),
                .OUT_DATA_WIDTH     (DATA_BITS),
                .DATA_SIGNED        (DATA_SIGNED),
                .OFFSET             (0),
                .RSHIFT             (0),
                .LSHIFT             (0)
            )
        i_data_expand_s1
            (
                .din                (s_data1),
                .dout               (pipeline_data1[COMPONENT_NUM*DATA_BITS-1:0])
            );
    
    // パイプライン演算
    generate
    for ( i = 0; i < RATE_WIDTH; i = i+1 ) begin : loop_rate
        jelly_linear_interpolation_unit
                #(
                    .USER_WIDTH     (USER_BITS),
                    .RATE_WIDTH     (RATE_WIDTH),
                    .COMPONENT_NUM  (COMPONENT_NUM),
                    .DATA_WIDTH     (DATA_BITS),
                    .DATA_SIGNED    (DATA_SIGNED),
                    .COMPACT        (COMPACT),
                    .BLENDING       (BLENDING)
                )
            i_linear_interpolation_unit
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_user         (pipeline_user [i*USER_BITS               +: USER_BITS]),
                    .s_rate         (pipeline_rate [i*RATE_WIDTH              +: RATE_WIDTH]),
                    .s_data0        (pipeline_data0[i*COMPONENT_NUM*DATA_BITS +: COMPONENT_NUM*DATA_BITS]),
                    .s_data1        (pipeline_data1[i*COMPONENT_NUM*DATA_BITS +: COMPONENT_NUM*DATA_BITS]),
                    .s_valid        (pipeline_valid[i]),
                                     
                    .m_user         (pipeline_user [(i+1)*USER_BITS               +: USER_BITS]),
                    .m_rate         (pipeline_rate [(i+1)*RATE_WIDTH              +: RATE_WIDTH]),
                    .m_data0        (pipeline_data0[(i+1)*COMPONENT_NUM*DATA_BITS +: COMPONENT_NUM*DATA_BITS]),
                    .m_data1        (pipeline_data1[(i+1)*COMPONENT_NUM*DATA_BITS +: COMPONENT_NUM*DATA_BITS]),
                    .m_valid        (pipeline_valid[(i+1)])
                );
    end
    endgenerate
    
    // 丸め
    jelly_data_expand
            #(
                .NUM                (COMPONENT_NUM),
                .IN_DATA_WIDTH      (DATA_BITS),
                .OUT_DATA_WIDTH     (DATA_WIDTH),
                .DATA_SIGNED        (DATA_SIGNED),
                .OFFSET             (ROUNDING_OFFSET),
                .RSHIFT             (COMPACT ? 0 : RATE_WIDTH),
                .LSHIFT             (0)
            )
        i_data_expand_m
            (
                .din                (pipeline_data0[RATE_WIDTH*COMPONENT_NUM*DATA_BITS +: COMPONENT_NUM*DATA_BITS]),
                .dout               (m_data)
            );
    
    assign m_user  = USER_WIDTH > 0 ? pipeline_user [RATE_WIDTH*USER_BITS +: USER_BITS] : 1'bx;
    assign m_valid = pipeline_valid[RATE_WIDTH];
    
endmodule



// unit
module jelly_linear_interpolation_unit
        #(
            parameter   USER_WIDTH    = 1,
            parameter   RATE_WIDTH    = 4,
            parameter   COMPONENT_NUM = 3,
            parameter   DATA_WIDTH    = 8,
            parameter   DATA_SIGNED   = 1,
            parameter   COMPACT       = 0,
            parameter   BLENDING      = 0
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire    [USER_WIDTH-1:0]                s_user,
            input   wire    [RATE_WIDTH-1:0]                s_rate,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  s_data0,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  s_data1,
            input   wire                                    s_valid,
            
            output  wire    [USER_WIDTH-1:0]                m_user,
            output  wire    [RATE_WIDTH-1:0]                m_rate,
            output  wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_data0,
            output  wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_data1,
            output  wire                                    m_valid
        );
    
    genvar      i;
    
    generate
    for ( i = 0; i < COMPONENT_NUM; i = i+1 ) begin : loop_data
        if ( DATA_SIGNED ) begin : blk_signed
            jelly_linear_interpolation_signed
                    #(
                        .DATA_WIDTH     (DATA_WIDTH),
                        .COMPACT        (COMPACT),
                        .BLENDING       (BLENDING)
                    )
                i_linear_interpolation_signed
                    (
                        .clk            (clk),
                        .cke            (cke),
                        
                        .s_sel          (s_rate[RATE_WIDTH-1]),
                        .s_data0        (s_data0[i*DATA_WIDTH +: DATA_WIDTH]),
                        .s_data1        (s_data1[i*DATA_WIDTH +: DATA_WIDTH]),
                        
                        .m_data0        (m_data0[i*DATA_WIDTH +: DATA_WIDTH]),
                        .m_data1        (m_data1[i*DATA_WIDTH +: DATA_WIDTH])
                    );
        end
        else begin  : blk_unsigned
            jelly_linear_interpolation_unsigned
                    #(
                        .DATA_WIDTH     (DATA_WIDTH),
                        .COMPACT        (COMPACT),
                        .BLENDING       (BLENDING)
                    )
                i_linear_interpolation_unsigned
                    (
                        .clk            (clk),
                        .cke            (cke),
                        
                        .s_sel          (s_rate[RATE_WIDTH-1]),
                        .s_data0        (s_data0[i*DATA_WIDTH +: DATA_WIDTH]),
                        .s_data1        (s_data1[i*DATA_WIDTH +: DATA_WIDTH]),
                        
                        .m_data0        (m_data0[i*DATA_WIDTH +: DATA_WIDTH]),
                        .m_data1        (m_data1[i*DATA_WIDTH +: DATA_WIDTH])
                    );
        end
    end
    endgenerate
    
    
    reg     [USER_WIDTH-1:0]    reg_user;
    reg     [RATE_WIDTH-1:0]    reg_rate;
    reg                         reg_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_user  <= {USER_WIDTH{1'bx}};
            reg_rate  <= {RATE_WIDTH{1'bx}};
            reg_valid <= 1'b0;
        end
        else if ( cke ) begin
            reg_user  <= s_user;
            reg_rate  <= (s_rate << 1) | s_rate[RATE_WIDTH-1];
            reg_valid <= s_valid;
        end
    end
    
    assign m_user  = reg_user;
    assign m_rate  = reg_rate;
    assign m_valid = reg_valid;
    
endmodule



// signed
module jelly_linear_interpolation_signed
        #(
            parameter   DATA_WIDTH = 8,
            parameter   COMPACT    = 0,
            parameter   BLENDING   = 0
        )
        (
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire                                s_sel,
            input   wire    signed  [DATA_WIDTH-1:0]    s_data0,
            input   wire    signed  [DATA_WIDTH-1:0]    s_data1,
            
            output  wire    signed  [DATA_WIDTH-1:0]    m_data0,
            output  wire    signed  [DATA_WIDTH-1:0]    m_data1
        );

    reg     signed  [DATA_WIDTH:0]      reg_data0;
    reg     signed  [DATA_WIDTH:0]      reg_data1;  
    wire    signed  [DATA_WIDTH-1:0]    tmp_data = s_sel ? s_data1 : s_data0;
    
    always @(posedge clk) begin
        if ( cke ) begin
            reg_data0 <= s_data0 + tmp_data;
            reg_data1 <= s_data1 + tmp_data;
        end
    end
    
    assign m_data0 = reg_data0[COMPACT +: DATA_WIDTH];
    assign m_data1 = reg_data1[COMPACT +: DATA_WIDTH];
    
endmodule



// unsigned
module jelly_linear_interpolation_unsigned
        #(
            parameter   DATA_WIDTH = 8,
            parameter   COMPACT    = 0,
            parameter   BLENDING   = 0
        )
        (
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        s_sel,
            input   wire    [DATA_WIDTH-1:0]    s_data0,
            input   wire    [DATA_WIDTH-1:0]    s_data1,
            
            output  wire    [DATA_WIDTH-1:0]    m_data0,
            output  wire    [DATA_WIDTH-1:0]    m_data1
        );

    reg     [DATA_WIDTH:0]      reg_data0;
    reg     [DATA_WIDTH:0]      reg_data1;
    wire    [DATA_WIDTH-1:0]    tmp_data = s_sel ? s_data1 : s_data0;
    
    always @(posedge clk) begin
        if ( cke ) begin
            if ( BLENDING ) begin
                reg_data0 <= s_data0 + tmp_data + s_sel;
                reg_data1 <= s_data1 + tmp_data + s_sel;
            end
            else begin
                reg_data0 <= s_data0 + tmp_data;
                reg_data1 <= s_data1 + tmp_data;
            end
        end
    end
    
    assign m_data0 = reg_data0[COMPACT +: DATA_WIDTH];
    assign m_data1 = reg_data1[COMPACT +: DATA_WIDTH];
    
endmodule



`default_nettype wire



// end of file
