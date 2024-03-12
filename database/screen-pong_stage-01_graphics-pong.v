//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
//
// Create Date: 21:15:00 14/10/2017
// Module Name: graphics_pong
// Description: Graphics pong game.
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module graphics_pong (
                input wire        clk,        // System clock.
                input wire        clr,        // Asyncronous reset.
                input wire [9:0]  x_px,       // X position actual pixel.
                input wire [9:0]  y_px,       // Y position actual pixel.
                input wire [9:0]  x_ball,     // X position actual logo.
                input wire [9:0]  y_ball,     // Y position actual logo.
                input wire [9:0]  pos_player1, // Player 1 position.
                input wire [9:0]  pos_player2, // Player 1 position.
                output reg [2:0]  color_px     // Actual pixel color.
                );

    // Some colors.
    parameter [2:0] black = 3'b000;
    parameter [2:0] blue  = 3'b001;
    parameter [2:0] green = 3'b010;
    parameter [2:0] white = 3'b111;

    parameter ink = green;
    parameter background = black;

	// Parámetros... son comunes al bloque dynamic. Definir exteriormente para modificar un único valor.
    localparam size_ball = 10;
    localparam separator = 20;
    localparam width_screen = 640;
    localparam height_screen = 480;
    localparam width_player = 12;
    localparam height_player = 90;

    // Draw or not the ball.
    always @(posedge clk)
    begin
        // Drawing the ball...
        if ((x_px >= x_ball) && (x_px < x_ball + size_ball) && (y_px >= y_ball) && (y_px < y_ball + size_ball))
                color_px = white;
        else
            // Drawing Player 1.
            if ((x_px >= separator) && (x_px < separator + width_player) && (y_px >= pos_player1) && (y_px < pos_player1 + height_player))
                color_px = white;
            else
                // Drawing Player 2.
                if ((x_px >= width_screen-separator-width_player) && (x_px < width_screen-separator) && (y_px >= pos_player2) && (y_px < pos_player2 +height_player))
                    color_px = white;
                else
                    // Drawing lines.
                    if (
                         ((x_px > width_screen/2-2) && (x_px < width_screen/2+2) && y_px[3])       // Midle
//                        || ((y_px > 0) && (y_px < 4) && x_px[3])                                 // Top
//                        || ((y_px > height_screen-4) && (y_px < height_screen) && x_px[3])       // Bottom
                       )
                       color_px = white;
                    else
                        color_px = background;
    end
endmodule
