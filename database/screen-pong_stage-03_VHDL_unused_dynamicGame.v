////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 31/03/2020
// Module Name: dynamicGame.v
//
// Description: Dynamic behavior Pong's game.
//
// Dependencies: 
//
// Revisions: 
//     0.02 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module dynamicGame (
    input wire        dyn_clk,            // Dynamic clock.
    input wire        reset,              // Reset the game.
    input wire        play,               // Play-Pause the game.
    input wire  [9:0] pos_ply1,           // Actual player 1 position.
    input wire  [9:0] pos_ply2,           // Actual player 2 position.
    output wire       reset_goals,        // Goals to zero.
    output wire       goal_ply1,          // Goal for player 1.
    output wire       goal_ply2,          // Goal for player 2.
    output wire [9:0] x_ball,             // X ball position.
    output wire [9:0] y_ball,             // Y ball position.
    output wire [1:0] channel,            // Channel of sound.
    output wire [1:0] sound               // Type of sound.
);

    // Screen parameters.
    localparam width_screen = 800;
    localparam height_screen = 600;
    localparam size_ball = 10;
    localparam size_player = 80;
    localparam size_corner = 20;
    localparam offset_players = 20;
    localparam width_players = 10;

    // Sound control.
    // Type sounds.
    localparam ping = 2'd1;
    localparam pong = 2'd2;
    localparam goal = 2'd3;

    // Channel of sounds.
    localparam none  = 2'd0;
    localparam right = 2'd1;
    localparam left  = 2'd2;
    localparam both  = 2'd3;

    // Registers of sound.
    reg [6:0] mseg = 0;           // Time of sound.
    reg [1:0] channel = none;     // Channel of sounds.
    reg [1:0] sound = ping;       // Type of sound.

    // Speed and direction.
    reg [2:0] speed_x = 2;
    reg [2:0] speed_y = 2;

    reg dx = 1'b1;
    reg dy = 1'b1;

    // Outputs.
    //reg reset_goals_reg;          // Goals to zero.
    reg goal_ply1_reg;            // Goal for player 1.
    reg goal_ply2_reg;            // Goal for player 2.
    reg [9:0] x_pos = 10'd100;    // X ball position.
    reg [9:0] y_pos = 10'd100;    // Y ball position.

    // Outputs assign.
    assign x_ball = x_pos;
    assign y_ball = y_pos;
    assign reset_goals = 1'b0; 
    assign goal_ply1 = goal_ply1_reg;
    assign goal_ply2 = goal_ply2_reg;

    // Task 1: Move the ball.
    always @(posedge dyn_clk)
    begin
        // Check reset.
        //if (reset)
        //begin
        //     x_pos <= width_screen/2;
        //     y_pos <= height_screen/2;
        //     dx <= 1'b1;
        //     dy <= 1'b1;
        //    reset_goals_reg <= 1'b0;
        //end

        // Check time sound.
        if (mseg == 0) begin
            channel <= none;
        end else
            mseg <= mseg - 1;

        // Check bouncing with top court.
        if (y_pos <= speed_y)
        begin
            dy <= 1'b1;
            y_pos <= speed_y;
            sound <= ping;
            channel <= both;
            mseg <= 7'd10;
        end

        // Check bouncing with bottom court.
        if (y_pos >= height_screen-size_ball)
        begin
            // Change direction in y.
            dy <= 1'b0;
            y_pos <= height_screen-size_ball;
            sound <= ping;
            channel <= both;
            mseg <= 7'd10;
        end

        // Check the vertical player left position.
        if  (
            (x_pos < offset_players + width_players) &&
            (x_pos > offset_players) &&
            (y_pos > pos_ply1) && 
            (y_pos < pos_ply1 + size_player - size_ball) &&
            (dx == 0)
            )
        begin
            dx <= 1'b1;
            sound <= pong;
            channel <= left;
            mseg <= 7'd30;
        end

        // Check the vertical player right position.
        if  (
            (x_pos > width_screen - offset_players - width_players - size_ball) &&
            (x_pos < width_screen - width_players - size_ball) &&
            (y_pos > pos_ply2) && 
            (y_pos < pos_ply2 + size_player - size_ball) &&
            (dx == 1)
            )
        begin
            dx <= 1'b0;
            sound <= pong;
            channel <= right;
            mseg <= 7'd30;
        end

        // Check goal left.
        if (x_pos <= speed_x)
        begin
            x_pos <= speed_x;
            goal_ply2_reg <= 1'b1;
            dx <= 1'b1;
            sound <= goal;
            channel <= left;
            mseg <= 7'd40;
        end
        else
            goal_ply2_reg <= 1'b0;

        // Check goal right.
        if (x_pos >= width_screen - size_ball)
        begin
            goal_ply1_reg <= 1'b1;
            x_pos <= width_screen - size_ball;
            dx <= 1'b0;
            sound <= goal;
            channel <= right;
            mseg <= 7'd40;
        end
        else
            goal_ply1_reg <= 1'b0;

        // Update x ball position.
        if (dx)
            x_pos <= x_pos + speed_x;
        else
            x_pos <= x_pos - speed_x; 

        // Update y ball position.
        if (dy)
            y_pos <= y_pos + speed_y;
        else
            y_pos <= y_pos - speed_y; 
    end

endmodule
