////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: number.v
//
// Description: Draw a simple number in a stream RGB.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module number
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
    input  wire        dec,         // Decrement number.
    output wire        carry,       // Carry out.
    output wire [25:0] strRGB_o     // Output RGB stream.
);
    // Wires conections.
    wire [3:0] number;

    // Draw digit.
    digit #(
        .color (color)
    )
    digit_0
    (
        .px_clk (px_clk),
        .strRGB_i (strRGB_i),
        .pos_x (pos_x),
        .pos_y (pos_y),
        .number (number),
        .strRGB_o (strRGB_o)
    );

    // Dynamic logic.
    dynamicNumber dynamicNumber_0 (
        .dyn_clk (dyn_clk),
        .reset (reset),
        .inc (inc),
        .dec (dec),
        .number (number),
        .carry (carry)
    );

endmodule
