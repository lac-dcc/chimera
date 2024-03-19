

`timescale 1ns / 1ps
`default_nettype none


module zybo_sw
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
    
    
    assign led = dip_sw ^ push_sw;
    
    
endmodule


`default_nettype wire


// endof file
