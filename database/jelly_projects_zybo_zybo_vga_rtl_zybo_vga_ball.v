

`timescale 1ns / 1ps
`default_nettype none


module zybo_vga_ball
        (
            input   wire            in_clk125,
            
            output  wire            vga_hsync,
            output  wire            vga_vsync,
            output  wire    [4:0]   vga_r,
            output  wire    [5:0]   vga_g,
            output  wire    [4:0]   vga_b,
            
            input   wire    [3:0]   push_sw,
            input   wire    [3:0]   dip_sw,
            output  wire    [3:0]   led
        );
    
    
    // -----------------------------
    //  reset & clock
    // -----------------------------
    
    
    wire    reset;
    wire    clk;
    
    assign reset = 1'b0;    // ボタンがもったいないのでリセット付けない
    
    clk_wiz_0 
        i_clk_wiz_0
            (
                .clk_in1    (in_clk125),
                .clk_out1   (clk)
            );
    
    
    
    // -----------------------------
    //  VGA
    // -----------------------------
    
    // Video Signal
    localparam  HDISP = 640;    // Horizontal Active Video
    localparam  HFP   = 16;     // Horizontal Front Porch
    localparam  HPW   = 96;     // Horizontal Sync Pulse
    localparam  HBP   = 48;     // HorizontalBack Porch
    localparam  VDISP = 480;    // Vertical Active Video
    localparam  VFP   = 11;     // Vertical Front Porch
    localparam  VPW   = 2;      // Vertical Sync Pulse
    localparam  VBP   = 31;     // Vertical Back Porch
    
    localparam  HTOTAL      = HPW + HBP + HDISP + HFP;
    localparam  HDISP_START = HPW + HBP;
    localparam  HDISP_END   = HDISP_START + HDISP;
    
    localparam  VTOTAL      = VPW + VBP + VDISP + VFP;
    localparam  VDISP_START = VPW + VBP;
    localparam  VDISP_END   = VDISP_START + VDISP;
    
    
    // Object
    localparam  BALL_R      = 8;            // ボールの半径
    localparam  BAR_W       = 20;           // バーの幅の1/2
    localparam  BAR_H       = 3;            // バーの高さの1/2
    localparam  BAR_S       = 5;            // バーのスピード
    localparam  BAR_Y       = VDISP / 2;    // バーのY位置
    
    reg             [9:0]   st0_h;
    reg             [8:0]   st0_v;
    
    reg                     st1_fs;
    reg                     st1_hsync;
    reg                     st1_vsync;
    reg                     st1_de;
    reg             [9:0]   st1_x;
    reg             [8:0]   st1_y;
    
    reg                     st2_hsync;
    reg                     st2_vsync;
    reg                     st2_de;
    reg     signed  [10:0]  st2_x;
    reg     signed  [10:0]  st2_y;
    
    // 本来リセットで初期化すべきだがボタン足りないので...
    reg              [9:0]  st2_bar_x  = HDISP/2;
    reg     signed  [10:0]  st2_ball_x = 0;
    reg     signed  [10:0]  st2_ball_y = 0;
    reg                     st2_dir_x  = 0;
    reg                     st2_dir_y  = 0;
    reg             [7:0]   st2_speed_x = 2;
    reg             [7:0]   st2_speed_y = 2;
    reg                     st2_hit;
    reg                     tmp_dir_x;
    reg                     tmp_dir_y;
    reg     signed  [10:0]  tmp_ball_x;
    reg     signed  [10:0]  tmp_ball_y;
    
    reg                     st3_hsync;
    reg                     st3_vsync;
    reg                     st3_de;
    reg                     st3_bar;
    reg     signed  [10:0]  st3_ball_rx;
    reg     signed  [10:0]  st3_ball_ry;
    
    reg                     st4_hsync;
    reg                     st4_vsync;
    reg                     st4_de;
    reg                     st4_bar;
    reg                     st4_ball;
    reg                     st4_ball_x;
    reg                     st4_ball_y;
    reg                     st4_x;
    reg                     st4_y;
    
    reg                     st5_hsync;
    reg                     st5_vsync;
    reg             [4:0]   st5_r;
    reg             [5:0]   st5_g;
    reg             [4:0]   st5_b;
    
    always @(posedge clk) begin
        // stage0 H-V カウンタ
        st0_h <= st0_h + 1;
        if ( st0_h >= HTOTAL-1 ) begin
            st0_h <= 0;
            st0_v <= st0_v + 1;
            if ( st0_v >= VTOTAL-1 ) begin
                st0_v <= 0;
            end
        end
        
        
        // stage1
        st1_fs    <= (st0_h == 0 && st0_v == 0);
        st1_hsync <= ~(st0_h < HPW);
        st1_vsync <= ~(st0_v < VPW);
        st1_de    <= (st0_h >= HDISP_START && st0_h < HDISP_END && st0_v >= VDISP_START && st0_v < VDISP_END);
        st1_x     <= st0_h - HDISP_START;
        st1_y     <= st0_v - VDISP_START;
        
        // stage2
        st2_hsync <= st1_hsync;
        st2_vsync <= st1_vsync;
        st2_de    <= st1_de;
        st2_x     <= st1_x;
        st2_y     <= st1_y;
        
        if ( st1_fs ) begin
            if ( push_sw[0] && st2_bar_x > BAR_S )           begin st2_bar_x <= st2_bar_x - BAR_S; end
            if ( push_sw[1] && st2_bar_x < (HDISP - BAR_S) ) begin st2_bar_x <= st2_bar_x + BAR_S; end
            if ( push_sw[2] && st2_speed_y > 2  ) begin st2_speed_y <= st2_speed_y - 1; end
            if ( push_sw[3] && st2_speed_y < 64 ) begin st2_speed_y <= st2_speed_y + 1; end
            
            st2_hit <= 0;
            tmp_dir_x  = st2_dir_x;
            tmp_dir_y  = st2_dir_y;
            tmp_ball_x = st2_dir_x ? st2_ball_x + $signed(st2_speed_x) : st2_ball_x - $signed(st2_speed_x);
            tmp_ball_y = st2_dir_y ? st2_ball_y + $signed(st2_speed_y) : st2_ball_y - $signed(st2_speed_y);
            if ( tmp_ball_x <  0     ) begin tmp_dir_x = 1; end
            if ( tmp_ball_x >= HDISP ) begin tmp_dir_x = 0; end
            if ( tmp_ball_y <  0     ) begin tmp_dir_y = 1; end
            if ( tmp_ball_y >= VDISP ) begin tmp_dir_y = 0; end
            if ( tmp_ball_x >= (st2_bar_x - BAR_W) && tmp_ball_x < (st2_bar_x + BAR_W)
                        && tmp_ball_y >= (BAR_Y - BAR_H) && tmp_ball_y < (BAR_Y + BAR_H) ) begin
                  tmp_dir_y  = ~tmp_dir_y;
                  st2_hit   <= 1;
            end
            st2_dir_x <= tmp_dir_x;
            st2_dir_y <= tmp_dir_y;
            st2_ball_x = tmp_dir_x ? st2_ball_x + $signed(st2_speed_x) : st2_ball_x - $signed(st2_speed_x);
            st2_ball_y = tmp_dir_y ? st2_ball_y + $signed(st2_speed_y) : st2_ball_y - $signed(st2_speed_y);
        end
        
        
        // stage3
        st3_hsync   <= st2_hsync;
        st3_vsync   <= st2_vsync;
        st3_de      <= st2_de;
        st3_ball_rx <= st2_ball_x - st2_x;
        st3_ball_ry <= st2_ball_y - st2_y;
        st3_bar     <= (st2_x >= (st2_bar_x - BAR_W) && st2_x < (st2_bar_x + BAR_W)
                       && st2_y >= (BAR_Y - BAR_H) && st2_y < (BAR_Y + BAR_H));
        
        // stage4
        st4_hsync  <= st3_hsync;
        st4_vsync  <= st3_vsync;
        st4_de     <= st3_de;
        st4_ball_x <= (st3_ball_rx == 0);
        st4_ball_y <= (st3_ball_ry == 0);
        st4_ball   <= (st3_ball_rx * st3_ball_rx) + (st3_ball_ry * st3_ball_ry) < (BALL_R*BALL_R);
        st4_bar    <= st3_bar;
        
        
        // stage5
        st5_hsync <= st4_hsync;
        st5_vsync <= st4_vsync;
        st5_r     <= 0;
        st5_g     <= 0;
        st5_b     <= 0;
        if ( st4_de ) begin
            if ( st4_bar ) begin
                st5_r  <= 5'h1f;
                st5_g  <= 6'h3f;
                st5_b  <= 5'h1f;
            end
            else if ( st4_ball ) begin
                st5_r  <= 5'h00;
                st5_g  <= 6'h3f;
                st5_b  <= 5'h00;
            end
            else if ( st4_ball_x || st4_ball_y ) begin
                st5_r  <= 0;
                st5_g  <= 0;
                st5_b  <= 5'h1f;
            end
            else begin
                st5_r  <= st2_hit ? 5'h1f : 0;
                st5_g  <= 0;
                st5_b  <= 0;
            end
        end
    end
    
    assign vga_hsync = st5_hsync;
    assign vga_vsync = st5_vsync;
    assign vga_r     = st5_r;
    assign vga_g     = st5_g;
    assign vga_b     = st5_b;
    
    assign led = dip_sw;
    
endmodule


`default_nettype wire


// endof file
