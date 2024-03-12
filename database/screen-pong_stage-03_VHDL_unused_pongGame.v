////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: pongGame.v
//
// Description: Module with the 'Pong' game.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module pongGame (
    input wire         px_clk,      // Pixel clock.
    input wire  [22:0] strVGA,      // Stream VGA input.
    input wire         reset,       // Reset game.
    input wire         play,        // Play game.
    input wire         snd_clk,     // Sound clock.
    input wire  [9:0]  pos_ply1,    // Position player 1.
    input wire  [9:0]  pos_ply2,    // Position player 2.
    output wire [25:0] strRGB,      // Stream RGB out.
    output wire right,              // Right sound signal.
    output wire left                // Left sound signal.
);
    // Wire module conections.
    wire [25:0] strRGB_p0;
    wire [25:0] strRGB_p1;
    wire [25:0] strRGB_p2;
    wire [9:0] x_ball;
    wire [9:0] y_ball;
    wire endframe;
    wire reset_goals;
    wire goal_ply1;
    wire goal_ply2;
    wire [1:0] sound;
    wire [1:0] channel;

    // Draw a tenis court.
    court court_0 (
        .px_clk (px_clk),
        .strVGA (strVGA),
        .strRGB (strRGB_p0)
    );

    // Draw scoreboard.
    scoreboard scoreboard_0 (
        .px_clk (px_clk),
        .strRGB_i (strRGB_p0),
        .dyn_clk (endframe),
        .reset(reset_goals),
        .goal_ply1 (goal_ply1),
        .goal_ply2 (goal_ply2),
        .strRGB_o (strRGB_p1)
    );

    // Draw players.
    verticalPlayers verticalPlayers_0 (
        .px_clk (px_clk),
        .strRGB_i (strRGB_p1),
        .pos_ply1 (pos_ply1),
        .pos_ply2 (pos_ply2),
        .strRGB_o(strRGB_p2)
    );

    // Draw ball.
    ball ball_0 (
        .px_clk (px_clk),
        .strRGB_i (strRGB_p2),
        .pos_x (x_ball),
        .pos_y (y_ball),
        .strRGB_o (strRGB)
    );

    // Sound card module.
    soundCard soundCard_0 (
        .snd_clk (snd_clk),
        .channel (channel),
        .sound (sound),
        .right_o (right),
        .left_o (left)
    );

    // Get endframe signal for dynamic logic.
    endframeVGA endframeVGA_0 (
        .strVGA(strVGA),
        .endframe(endframe)
    );

    // Change dynamic's game every frame.
    dynamicGame dynamicGame_0 (
        .dyn_clk (endframe),
        .reset (reset),
        .play (play),
        .pos_ply1 (pos_ply1),
        .pos_ply2 (pos_ply2),
        .reset_goals (reset_goals),
        .goal_ply1 (goal_ply1),
        .goal_ply2 (goal_ply2),
        .x_ball (x_ball),
        .y_ball (y_ball),
        .channel (channel),
        .sound (sound)
    );

endmodule
