////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: scoreboard.v
//
// Description: Draw a scoreboard in a stream RGB.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module scoreboard (
    input  wire        px_clk,      // Pixel clock.
    input  wire [25:0] strRGB_i,    // Input RGB stream.
    input  wire        dyn_clk,     // Dynamic clock.
    input  wire        reset,       // Reset scoreboard.
    input  wire        goal_ply1,   // Increment goal for player 1.
    input  wire        goal_ply2,   // Increment goal for player 2.
    output wire [25:0] strRGB_o     // Output RGB stream.
);

    // Screen dimentions.
    parameter width_screen  = 800;
    parameter width_digit   = 30;
    parameter separator     = 5;
    parameter width_counter = 2*width_digit + separator;
    parameter offset        = 20;

    // Calculate digits positions.
    localparam pos_xply1 = width_screen/2 - width_counter - offset;
    localparam pos_xply2 = width_screen/2 + offset;
    localparam pos_y = offset;

    // Scoreboard color.
    localparam yellow = 3'b110;

    // Wire conections.
    wire [25:0] strRGB_p0;

    // Draw counter goals player 1.
    counter #(
        .color (yellow)
    )
    counter_ply1
    (
        .px_clk (px_clk),
        .strRGB_i (strRGB_i),
        .pos_x (pos_xply1),
        .pos_y (pos_y),
        .dyn_clk (dyn_clk),
        .reset (reset),
        .inc (goal_ply1),
        .strRGB_o (strRGB_p0)
    );

    // Draw counter goals player 2.
    counter #(
        .color (yellow)
    )
    counter_ply2
    (
        .px_clk (px_clk),
        .strRGB_i (strRGB_p0),
        .pos_x (pos_xply2),
        .pos_y (pos_y),
        .dyn_clk (dyn_clk),
        .reset (reset),
        .inc (goal_ply2),
        .strRGB_o (strRGB_o)
    );

endmodule
