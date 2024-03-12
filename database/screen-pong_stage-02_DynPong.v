//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date: 17/03/2018 
// Module Name: DynPong
// Description: Dynamic behavior Pong's game.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module DynPong (
    input wire       dyn_clk,            // Dynamic clock.
    input wire       reset,              // Reset the game.
    input wire       play,               // Play-Pause the game.
    input wire [9:0] pos_ply1,           // Actual player 1 position.
    input wire [9:0] pos_ply2,           // Actual player 2 position.
    output reg       reset_goals,        // Goals to zero.
    output reg       goal_ply1,          // New goal for player 1.
    output reg       goal_ply2,          // New goal for player 2.
    output reg [9:0] x_ball = 10'd100,   // New x ball position.
    output reg [9:0] y_ball = 10'd100,   // New y ball position.
    output reg       mute = 1'b1,        // Silence the sound.
    output reg [1:0] sound = 2'd0        // New type of sound.
);

// Screen.
localparam width_screen = 640;
localparam height_screen = 480;
localparam size_ball = 10;
localparam size_player = 80;
localparam offset_players = 20;
localparam width_players = 10;

// Sound.
reg [7:0] mseg = 0;

// Speed and direction.
reg [2:0] speed_x = 2;
reg [2:0] speed_y = 2;

reg dx = 1'b0;
reg dy = 1'b0;

// Task 1: Move the ball.
always @(posedge dyn_clk)
begin
    // Check reset.
    if (reset)
    begin
        x_ball <= width_screen/2;
        y_ball <= height_screen/2;
        dx <= ~dx;
        dy <= 1'b0;
    end

    // Check the goals.
    if (x_ball == 0)
        begin
        goal_ply2 <= 1'b1;
        sound <= 3; 
        mseg <= 40;
        end
    else
        goal_ply2 <= 1'b0;

    if (x_ball == width_screen-size_ball)
        begin
        goal_ply1 <= 1'b1;
        sound <= 3;
        mseg <= 40;
        end
    else
        goal_ply1 <= 1'b0;

    // Check bouncing... for vertical objects.
    if  (
        // Check the player 1 position.
        ((x_ball < offset_players + width_players) &&
        (y_ball > pos_ply1) && 
        (y_ball < pos_ply1 + size_player) &&
        (dx == 1'b1)) 
        ||
        // Check the player 2 position.
        ((x_ball > width_screen - offset_players - width_players - size_ball) &&
        (y_ball > pos_ply2) && 
        (y_ball < pos_ply2 + size_player) &&
        (dx == 1'b0))
        ||
        // Check the player 1 goal and bouncing.
        (x_ball == width_screen-size_ball)
        ||
        // Check the player 2 goal and bouncing.
        (x_ball == 0)
        )
        begin
        dx = ~dx;
        // It's not a goal, so... another sound.
        if (!((x_ball == width_screen-size_ball) || (x_ball == 0)))
            begin
            sound <= 2;
            mseg <= 30;
            end
        end

    // Check bouncing with top and bottom court.
    if ((y_ball == 0) || (y_ball == height_screen-size_ball))
        begin
        dy = ~dy;
        sound <= 1;
        mseg <= 10;
        end

    // Check mute sound.
    if (mseg == 0)
        begin
        mute <= 1'b1;
        end
    else
        begin
        mseg <= mseg - 1;
        mute <= 1'b0;
        end

    // Update x ball position.
    if (dx)
        x_ball <= x_ball - speed_x;
    else
        x_ball <= x_ball + speed_x; 

    // Update y ball position.
    if (dy)
        y_ball <= y_ball - speed_y;
    else
        y_ball <= y_ball + speed_y; 
end

endmodule
