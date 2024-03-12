////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: ball.v
//
// Description: Draw a simple ball in a stream RGB.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module ball (
    input wire         px_clk,      // Pixel clock.
    input wire  [25:0] strRGB_i,    // Input RGB stream.
    input wire  [9:0]  pos_x,       // X ball position.
    input wire  [9:0]  pos_y,       // Y ball position.
    output wire [25:0] strRGB_o     // Output RGB stream.
);

    // Bits address alias. 
    `define YC 12:3
    `define XC 22:13
    `define RGB 25:23
    `define VGA 22:0

    // Ball color and dimension.
    parameter [2:0] white = 3'b111;
    parameter size_ball = 10;

    // Output pipeline RGB stream register.
    reg [25:0] strRGB_reg;

    // Follow pipeline.
    assign strRGB_o = strRGB_reg;

    // Draw a ball in a RGB stream.
    always @(posedge px_clk)
    begin
        // Clone VGA stream input in a RGB stream register.
        strRGB_reg[`VGA] <= strRGB_i[`VGA];
        
        // Draw ball.
        strRGB_reg[`RGB] <= (
                (strRGB_i[`YC] > pos_y) && (strRGB_i[`YC] < pos_y+size_ball) &&
                (strRGB_i[`XC] > pos_x) && (strRGB_i[`XC] < pos_x+size_ball)
                ) ? white : strRGB_i[`RGB];
    end

endmodule
