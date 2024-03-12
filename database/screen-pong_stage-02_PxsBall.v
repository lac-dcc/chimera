//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date: 17/03/2018 
// Module Name: PxsBall
// Description: Draw a simple ball in a stream RGB.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module PxsBall (
                input wire        px_clk,      // Pixel clock.
                input wire [25:0] RGBStr_i,    // Input RGB stream.
                input wire [9:0]  pos_x,       // X ball position.
                input wire [9:0]  pos_y,       // Y ball position.
                output reg [25:0] RGBStr_o     // Output RGB stream.
               );

// Address alias. 
`define Active 0:0
`define VS 1:1
`define HS 2:2
`define YC 12:3
`define XC 22:13
`define R 23:23
`define G 24:24
`define B 25:25
`define RGB 25:23
`define VGA 22:0

// Ball color and dimension.
parameter [3:0] white = 3'b111;
parameter size_ball = 10;

// Task 1.
always @(posedge px_clk)
begin
    // Clone VGA stream in a RGB stream.
    RGBStr_o[`VGA] <= RGBStr_i[`VGA];
    
    // Draw ball.
    RGBStr_o[`RGB] <= (
               (RGBStr_i[`YC] > pos_y) && (RGBStr_i[`YC] < pos_y+size_ball) &&
               (RGBStr_i[`XC] > pos_x) && (RGBStr_i[`XC] < pos_x+size_ball)
             ) ? white : RGBStr_i[`RGB];
end

endmodule
