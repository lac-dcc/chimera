`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:15 12/29/2016 
// Design Name: 
// Module Name:    lx9_root 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lx9_root(
            input OSCCLK,
            output hsync,
            output vsync,
            output [3:0] red,
            output [3:0] green,
            output [3:0] blue,
            
            output [7:0] sseg,
            output [3:0] an,
            
            input ps2_clk,
            input ps2_data
            );

// This LX9 doesn't need the pixel clock for something like a D/A converter            
wire vga_clk_in;
           
wire [7:0] vred;
wire [7:0] vgreen;
wire [7:0] vblue;
assign red = vred[7:4];
assign green = vgreen[7:4];
assign blue = vblue[7:4];           
        
demo_root lx9(  .OSCCLK(OSCCLK),
                .hsync(hsync),
                .vsync(vsync),
                .red(vred),
                .green(vgreen),
                .blue(vblue),
                .vga_clk(vga_clk_in),
                .sseg(sseg),
                .an(an),
                .ps2_clk(ps2_clk),
                .ps2_data(ps2_data)
               );
            
endmodule
