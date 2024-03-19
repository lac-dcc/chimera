

`timescale 1ns / 1ps
`default_nettype none


module zybo_vga
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
    reg     signed  [10:0]  st2_ball_x = 0;
    reg     signed  [10:0]  st2_ball_y = 0;
    reg     signed  [7:0]   st2_speed_x = 1;
    reg     signed  [7:0]   st2_speed_y = 1;
    
    reg                     st3_hsync;
    reg                     st3_vsync;
    reg                     st3_de;
    reg     signed  [10:0]  st3_len_x;
    reg     signed  [10:0]  st3_len_y;
    
    reg                     st4_hsync;
    reg                     st4_vsync;
    reg                     st4_de;
    reg                     st4_ball;
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
            if ( push_sw[0] && st2_speed_x < +127 ) begin st2_speed_x <= st2_speed_x + 1; end
            if ( push_sw[1] && st2_speed_x > -127 ) begin st2_speed_x <= st2_speed_x - 1; end
            if ( push_sw[2] && st2_speed_y < +127 ) begin st2_speed_y <= st2_speed_y + 1; end
            if ( push_sw[3] && st2_speed_y > -127 ) begin st2_speed_y <= st2_speed_y - 1; end
            
            st2_ball_x <= st2_ball_x + st2_speed_x;
            st2_ball_y <= st2_ball_y + st2_speed_y;
            if ( st2_ball_x < 0      && st2_speed_x < 0 ) begin st2_speed_x <= -st2_speed_x; end
            if ( st2_ball_y < 0      && st2_speed_y < 0 ) begin st2_speed_y <= -st2_speed_y; end
            if ( st2_ball_x >= HDISP && st2_speed_x > 0 ) begin st2_speed_x <= -st2_speed_x; end
            if ( st2_ball_y >= VDISP && st2_speed_y > 0 ) begin st2_speed_y <= -st2_speed_y; end
        end
        
        
        // stage3
        st3_hsync <= st2_hsync;
        st3_vsync <= st2_vsync;
        st3_de    <= st2_de;
        st3_len_x <= st2_ball_x - st2_x;
        st3_len_y <= st2_ball_y - st2_y;
        
        
        // stage4
        st4_hsync <= st3_hsync;
        st4_vsync <= st3_vsync;
        st4_de    <= st3_de;
        st4_x     <= (st3_len_x == 0);
        st4_y     <= (st3_len_y == 0);
        st4_ball  <= (st3_len_x * st3_len_x) + (st3_len_y * st3_len_y) < 16*16;
        
        
        // stage5
        st5_hsync <= st4_hsync;
        st5_vsync <= st4_vsync;
        if ( st4_de ) begin
            if ( st4_ball ) begin
                st5_r  <= st4_ball ? st2_speed_x : 0;
                st5_g  <= st4_ball ? 6'h3f       : 0;
                st5_b  <= st4_ball ? st2_speed_y : 0;
            end
            else begin
                st5_r  <= st4_x ? 5'h1f : 0;
                st5_b  <= st4_y ? 5'h1f : 0;
                st5_g  <= 0;
            end
        end
        else begin
            st5_r  <= 0;
            st5_g  <= 0;
            st5_b  <= 0;
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
