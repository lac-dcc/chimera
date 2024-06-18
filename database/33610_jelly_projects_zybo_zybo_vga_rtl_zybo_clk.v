// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License



`timescale 1ns / 1ps
`default_nettype none


module zybo_clk
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
    
    wire    reset;
    wire    clk;
    
    assign reset = push_sw[0];
    
    clk_wiz_0 
        i_clk_wiz_0
            (
                .clk_in1    (in_clk125),
                .clk_out1   (clk)
            );
    
    
    reg     [31:0]      counter;
    reg     [3:0]       led_out;
    
    always @(posedge clk or posedge reset) begin
        if ( reset ) begin
            led_out <= 4'b0000;
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
            if ( counter >= 25000000-1 ) begin
                counter <= 0;
                led_out <= led_out + 1;
            end
        end
    end
    
    assign led = led_out;
    
    
endmodule


`default_nettype wire


// endof file
