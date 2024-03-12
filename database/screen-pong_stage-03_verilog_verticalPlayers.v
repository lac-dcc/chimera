////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: verticalPlayers.v
//
// Description: Draw two vertical players in a stream RGB.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module verticalPlayers (
    input wire         px_clk,      // Pixel clock.
    input wire  [25:0] strRGB_i,    // Stream RGB input.
    input wire  [9:0]  pos_ply1,    // Position player 1.
    input wire  [9:0]  pos_ply2,    // Position player 2.
    output wire [25:0] strRGB_o     // Stream RGB out.
);
    // Wire module conections.
    wire [25:0] strRGB_p1;

    // Draw a player 1.
    player #(
        .type_ply(1'b0),
        .pos_offset(20)
    )
    player_1 (
        .px_clk (px_clk),
        .strRGB_i (strRGB_i),
        .pos (pos_ply1),
        .strRGB_o(strRGB_p1)
    );

    // Draw a player 2.
    player #(
        .type_ply(1'b0),
        .pos_offset(770)
    )
    player_2 (
        .px_clk (px_clk),
        .strRGB_i (strRGB_p1),
        .pos (pos_ply2),
        .strRGB_o(strRGB_o)
    );

endmodule
