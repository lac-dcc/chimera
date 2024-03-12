////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: court.v
//
// Description: Draw a tennis court in a stream RGB.
//
// Dependencies:
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module court (
    input wire         px_clk,      // Pixel clock.
    input wire  [22:0] strVGA,      // Stream VGA input.
    output wire [25:0] strRGB       // Stream RGB out.
);

    // Bit address alias.
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
    localparam width_screen = 800;
    localparam height_screen = 600;

    // Colors.
    localparam black = 3'b000;
    localparam white = 3'b111;

    // Output RGB stream.
    reg [25:0] strRGB_reg;
    assign strRGB = strRGB_reg;

    // Task 1: Draw lines.
    always @(posedge px_clk)
    begin
        // Clone VGA stream signals in a RGB stream.
        strRGB_reg[`VGA] <= strVGA[`VGA];

        // Draw lines.
        strRGB_reg[`RGB] <= (
                            // Middle line.
                            ((strVGA[`XC] > (width_screen/2 - width_line/2)) && (strVGA[`XC] < (width_screen/2 + width_line/2)) && (strVGA[`separator_line])) ||
                            // Top line.
                            ((strVGA[`YC] > 0) && (strVGA[`YC] < width_line)) ||
                            // Bottom line.
                            ((strVGA[`YC] > (height_screen - width_line)) && (strVGA[`YC] < height_screen))
                            ) ? white : black;
    end

endmodule
