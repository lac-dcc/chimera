// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 固定小数点マルチサイクル atan2
module jelly_fixed_atan2_multicycle
        #(
            parameter   SCALED_RADIAN = 1,
            parameter   USER_WIDTH    = 0,
            parameter   X_WIDTH       = 32,
            parameter   Y_WIDTH       = 32,
            parameter   ANGLE_WIDTH   = 32,
            parameter   Q_WIDTH       = SCALED_RADIAN ? ANGLE_WIDTH : ANGLE_WIDTH - 4, // max:32
            
            parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            // input
            input   wire            [USER_BITS-1:0]     s_user,
            input   wire    signed  [X_WIDTH-1:0]       s_x,
            input   wire    signed  [Y_WIDTH-1:0]       s_y,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            // output
            output  wire            [USER_BITS-1:0]     m_user,
            output  wire    signed  [ANGLE_WIDTH-1:0]   m_angle,
            output  wire                                m_valid,
            input   wire                                m_ready
        );
    
    localparam  XY_WIDTH   = ((X_WIDTH > Y_WIDTH) ? X_WIDTH : Y_WIDTH) + Q_WIDTH;
    localparam  STEP_WIDTH = Q_WIDTH <= 2  ? 1 :
                             Q_WIDTH <= 4  ? 2 :
                             Q_WIDTH <= 8  ? 3 :
                             Q_WIDTH <= 16 ? 4 : 5;
    
    localparam  [34:0]   ANGLE_0   = SCALED_RADIAN ? 32'h00000000 : 35'h000000000;
    localparam  [34:0]   ANGLE_90  = SCALED_RADIAN ? 32'h40000000 : 35'h1921fb544;
    localparam  [34:0]   ANGLE_180 = SCALED_RADIAN ? 32'h80000000 : 35'h3243f6a88;
    localparam  [34:0]   ANGLE_270 = SCALED_RADIAN ? 32'hc0000000 : 35'h4b65f1fcc;
    localparam  [34:0]   ANGLE_360 = SCALED_RADIAN ? 32'h00000000 : 35'h6487ed511;
    
    
    // Q32で準備したテーブルを四捨五入して必要精度で取り出し
    function signed [ANGLE_WIDTH-1:0] q32_to_angle(input [34:0] q32);
    begin
        q32_to_angle = (q32 + (32'h80000000 >> Q_WIDTH)) >> (32 - Q_WIDTH);
    end
    endfunction
    
    // Q32のラジアンを四捨五入してScaledなQ32に変換
    function signed [31:0] q32rad_to_scaled(input [31:0] rad);
    begin
        q32rad_to_scaled = ((rad * 64'h00000000_28be60dc) + 64'h00000000_80000000) >> 32;
    end
    endfunction
    
    // table
    function signed [ANGLE_WIDTH-1:0] make_tbl(
                                            input [31:0] q32rad,
                                            input [4:0]  idx
                                        );
    begin
        if ( SCALED_RADIAN ) begin
            make_tbl = q32_to_angle(q32rad_to_scaled(q32rad));
        end
        else begin
            make_tbl = q32_to_angle(q32rad);
        end
        if ( idx >= Q_WIDTH ) begin
            make_tbl = {ANGLE_WIDTH{1'bx}};
        end
    end
    endfunction
    
    wire    signed  [ANGLE_WIDTH-1:0]   atan_tbl[0:31];
    assign atan_tbl[0]  = make_tbl(32'hc90fdaa2, 0);
    assign atan_tbl[1]  = make_tbl(32'h76b19c16, 1);
    assign atan_tbl[2]  = make_tbl(32'h3eb6ebf2, 2);
    assign atan_tbl[3]  = make_tbl(32'h1fd5ba9b, 3);
    assign atan_tbl[4]  = make_tbl(32'h0ffaaddc, 4);
    assign atan_tbl[5]  = make_tbl(32'h07ff556f, 5);
    assign atan_tbl[6]  = make_tbl(32'h03ffeaab, 6);
    assign atan_tbl[7]  = make_tbl(32'h01fffd55, 7);
    assign atan_tbl[8]  = make_tbl(32'h00ffffab, 8);
    assign atan_tbl[9]  = make_tbl(32'h007ffff5, 9);
    assign atan_tbl[10] = make_tbl(32'h003fffff, 10);
    assign atan_tbl[11] = make_tbl(32'h00200000, 11);
    assign atan_tbl[12] = make_tbl(32'h00100000, 12);
    assign atan_tbl[13] = make_tbl(32'h00080000, 13);
    assign atan_tbl[14] = make_tbl(32'h00040000, 14);
    assign atan_tbl[15] = make_tbl(32'h00020000, 15);
    assign atan_tbl[16] = make_tbl(32'h00010000, 16);
    assign atan_tbl[17] = make_tbl(32'h00008000, 17);
    assign atan_tbl[18] = make_tbl(32'h00004000, 18);
    assign atan_tbl[19] = make_tbl(32'h00002000, 19);
    assign atan_tbl[20] = make_tbl(32'h00001000, 20);
    assign atan_tbl[21] = make_tbl(32'h00000800, 21);
    assign atan_tbl[22] = make_tbl(32'h00000400, 22);
    assign atan_tbl[23] = make_tbl(32'h00000200, 23);
    assign atan_tbl[24] = make_tbl(32'h00000100, 24);
    assign atan_tbl[25] = make_tbl(32'h00000080, 25);
    assign atan_tbl[26] = make_tbl(32'h00000040, 26);
    assign atan_tbl[27] = make_tbl(32'h00000020, 27);
    assign atan_tbl[28] = make_tbl(32'h00000010, 28);
    assign atan_tbl[29] = make_tbl(32'h00000008, 29);
    assign atan_tbl[30] = make_tbl(32'h00000004, 30);
    assign atan_tbl[31] = make_tbl(32'h00000002, 31);
    
    
    // CORDIC core
    reg                                 reg_busy;
    reg                                 reg_ready;
    reg                                 reg_valid;
    
    reg             [STEP_WIDTH-1:0]    reg_step;
    reg             [USER_BITS-1:0]     reg_user;
    reg     signed  [XY_WIDTH-1:0]      reg_x;
    reg     signed  [XY_WIDTH-1:0]      reg_y;
    reg     signed  [ANGLE_WIDTH-1:0]   reg_angle;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_busy    <= 1'b0;
            reg_ready   <= 1'b0;
            reg_valid   <= 1'b0;
            reg_step    <= {STEP_WIDTH{1'bx}};
            reg_x       <= {XY_WIDTH{1'bx}};
            reg_y       <= {XY_WIDTH{1'bx}};
            reg_angle   <= {ANGLE_WIDTH{1'bx}};
        end
        else if ( cke ) begin
            if ( !reg_busy && !reg_valid ) begin
                reg_ready <= 1'b1;
            end
            
            if ( m_valid & m_ready ) begin
                reg_valid <= 1'b0;
                reg_ready <= 1'b1;
            end
            
            if ( s_valid & s_ready & !m_valid ) begin
                // start
                reg_user <= s_user;
                if ( s_y >= 0 ) begin
                    // XY入れ替えて 90度起点で計算
                    reg_x     <= +(s_y <<< Q_WIDTH);
                    reg_y     <= -(s_x <<< Q_WIDTH);
                    reg_angle <= q32_to_angle(ANGLE_90);
                end
                else begin
                    // XY入れ替えて270度起点で計算
                    reg_x     <= -(s_y <<< Q_WIDTH);
                    reg_y     <= +(s_x <<< Q_WIDTH);
                    reg_angle <= q32_to_angle(ANGLE_270);
                end
                reg_busy    <= 1'b1;
                reg_ready   <= 1'b0;
                reg_step    <= 0;
            end
            else if ( reg_busy ) begin
                if ( reg_y >= 0 ) begin
                    reg_x     <= reg_x + (reg_y >>> reg_step);
                    reg_y     <= reg_y - (reg_x >>> reg_step);
                    reg_angle <= reg_angle + atan_tbl[reg_step];
                end
                else begin
                    reg_x     <= reg_x - (reg_y >>> reg_step);
                    reg_y     <= reg_y + (reg_x >>> reg_step);
                    reg_angle <= reg_angle - atan_tbl[reg_step];
                end
                
                reg_step <= reg_step + 1'b1;
                if ( reg_step == (Q_WIDTH-1) ) begin
                    reg_busy    <= 1'b0;
                    reg_valid   <= 1'b1;
                end
            end
        end
    end
    
    assign s_ready = reg_ready;
    
    assign m_user  = reg_user;
    assign m_angle = reg_angle;
    assign m_valid = reg_valid;
    
endmodule


`default_nettype wire


// end of file
