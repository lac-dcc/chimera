//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date: 16/03/2018 
// Module Name: PxsCourt
// Description: Draw a tennis court in a stream RGB.
//
// Dependencies: 
//
// Revision: 
// Revision 1.00 - File Created
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module PxsCourt (
                input wire        px_clk,       // Pixel clock.
                input wire [22:0] VGAStr_i,     // Input VGA stream.
                output reg [25:0] RGBStr_o      // Output RGB stream.
                );

// Address alias.
`define Active 0:0
`define VS     1:1
`define HS     2:2
`define YC     12:3
`define XC     22:13
`define R      23:23
`define G      24:24
`define B      25:25
`define RGB    25:23
`define VGA    22:0
`define separator_line 6:6

// Dimensions.
localparam width_line = 6;
localparam width_screen = 640;
localparam height_screen = 480;

// Colors.
localparam black = 3'b000;
localparam white = 3'b111;

// Task 1: Draw lines.
always @(posedge px_clk)
begin
    // Clone VGA stream in a RGB stream.
    RGBStr_o[`VGA] <= VGAStr_i[`VGA];

    // Draw lines.
    RGBStr_o[`RGB] <= (
                       // Middle line.
                       ((VGAStr_i[`XC] > (width_screen/2 - width_line/2)) && (VGAStr_i[`XC] < (width_screen/2 + width_line/2)) && (VGAStr_i[`separator_line])) ||
                       // Top line.
                       ((VGAStr_i[`YC] > 0) && (VGAStr_i[`YC] < width_line)) ||
                       // Bottom line.
                       ((VGAStr_i[`YC] > (height_screen - width_line)) && (VGAStr_i[`YC] < height_screen))
                      ) ? white : black;
end

endmodule
