`timescale 1ns / 1ps
module top( clk, reset,hsync,vsync,rgb);

    input clk,reset;
    output hsync,vsync;
    output  [11:0] rgb;
    wire video_on;
    wire [11:0] game_logo_rgb;
    wire [9:0] x, y;
    
    vga_sync v(.clk(clk),.reset(reset),.hsync(hsync),.vsync(vsync),.video_on(video_on),.p_tick(),.x(x),.y(y));
    game_logo_display game_logo_display_unit (.clk(clk), .x(x), .y(y), .rgb_out(game_logo_rgb));
    //assign the ouput here
    assign rgb= game_logo_rgb;
endmodule