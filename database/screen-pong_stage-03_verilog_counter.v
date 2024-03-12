////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: counter.v
//
// Description: Draw a counter of two numbers in a stream RGB.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module counter
#(
    parameter color = 3'b111
)(
    input  wire        px_clk,      // Pixel clock.
    input  wire [25:0] strRGB_i,    // Input RGB stream.
    input  wire [9:0]  pos_x,       // X number position.
    input  wire [9:0]  pos_y,       // Y number position.
    input  wire        dyn_clk,     // Dynamic clock.
    input  wire        reset,       // Reset number to zero.
    input  wire        inc,         // Increment number.
    output wire [25:0] strRGB_o     // Output RGB stream.
);

    // Dimensions.
    parameter width_digit = 30;
    parameter separation = 5;

    // Positions numbers.
    wire [9:0] posx_units;
    wire [9:0] posx_tens;
    assign posx_units = pos_x + width_digit + separation;
    assign posx_tens = pos_x;

    // Wires conections.
    wire [25:0] strRGB_p0;
    wire carry_out;

    // Draw units number.
    number #(
        .color(color)
    )
    number_units
    (
        .px_clk(px_clk),
        .strRGB_i(strRGB_i),
        .pos_x (posx_units),
        .pos_y (pos_y),
        .dyn_clk (dyn_clk),
        .reset (reset),
        .inc (inc),
        .dec (1'b0),
        .carry (carry_out),
        .strRGB_o (strRGB_p0)
    );

    // Draw tens number.
    number #(
        .color(color)
    )
    number_tens
    (
        .px_clk(px_clk),
        .strRGB_i(strRGB_p0),
        .pos_x (posx_tens),
        .pos_y (pos_y),
        .dyn_clk (dyn_clk),
        .reset (reset),
        .inc (carry_out),
        .dec (1'b0),
        .strRGB_o (strRGB_o)
    );

endmodule
