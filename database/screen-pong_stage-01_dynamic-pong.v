//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
// 
// Create Date: 21:03:00 14/10/2017 
// Module Name: dynamic_pong
// Description: Pong game's dynamic.
//              Dinámica del juego pong.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dynamic_pong (
                input wire        clk,             // System clock.
                input wire        clr,             // Asynchronous reset.
                input wire [9:0]  pos_player1,     // Position player 1.
                input wire [9:0]  pos_player2,     // Position player 2.
                output reg [9:0]  x_ball,          // X position for ball.
                output reg [9:0]  y_ball,          // Y position for ball.
                input wire        inc_vel,         // Increase velocity.
                input wire        dec_vel,         // Decrease velocity.
                output wire       mute,            // Silence actual sound.
                output wire [1:0] code_sound       // Code of sound (silence, ping, pong, go). 
               );

    // Sounds definition.
    // Definición de sonidos.
    parameter [1:0] ping = 2'b10;
    parameter [1:0] pong = 2'b01;
    parameter [1:0] go   = 2'b11;
    parameter [1:0] stop = 2'b00;

	// Parámetros... son comunes al bloque graphics. Definir exteriormente para modificar un único valor.
    localparam size_ball = 10;
    localparam separator = 20;
    localparam width_screen = 640;
    localparam height_screen = 480;
    localparam width_player = 12;
    localparam height_player = 90;

    // Border definition.
    parameter border = 0;
    parameter [9:0] x_min = border;
    parameter [9:0] x_max = width_screen - size_ball - border;
    parameter [9:0] y_min = border;
    parameter [9:0] y_max = height_screen - size_ball - border;

    // Velocity increment in both direction.
    wire pixel;
    reg [9:0] incx = 1;              // Increment in a x direction.
    reg [9:0] incy = 2;              // Increment in a y direction.
    reg [5:0] delay = 16;            // Delay for animation.
    reg [31:0] counter = 0;          // Counter for delay.

    // Increment and decrement animation.
    always @(posedge counter[22])
    begin
        if (inc_vel) delay = delay + 1;
        if (dec_vel) delay = delay - 1;
    end

    // Actualice counter.
    always @(posedge clk)
    begin
        counter <= counter + 1;
    end

    // Init ball parameters.
    always @(posedge clk or posedge clr)
    begin
        if (clr)
        // If clr active, go back to initial values.
        begin
           //incx = 1;
           //incy = 2;
		   //x_ball = (width_screen - size_ball)/2;
		   //y_ball = (height_screen - size_ball)/2;
           //mute = 0;
           //code_sound = go;
        end
    end

    // If counter is zero, new animation and new delay.
    always @ (posedge counter[delay])
    begin
        //---
        // Actualiza las componentes 'x' e 'y' de la velocidad de la pelota.
        //---

        //---
        // Comprueba los choques para cambiar la dirección de la velocidad en 'x'.
        //---
        x_ball = x_ball + incx;
        if (
            // Límites del campo (en un futuro serán los goles, por ahora rebota).
            (x_ball > x_max) || (x_ball <= x_min)
        )
        begin
           //incx = 1;
           //incy = 2;
		   x_ball <= 320;
		   y_ball <= 240;            
        end
        
        if (    
            // Choque frontal con los jugadores.
            ((y_ball >= pos_player1) && (y_ball < pos_player1 + height_player) && (x_ball <= width_player + separator))
            || ((y_ball >= pos_player2) && (y_ball < pos_player2 + height_player) && (x_ball >= width_screen - separator - width_player - size_ball))
            )
        begin
            incx <= -incx;
            //mute = 0;
            //code_sound <= pong;
        end
        
        //---
        // Comprueba los choques para cambiar la dirección de la velocidad en 'y'.
        //---
        y_ball = y_ball + incy;
        if (
            // Choques superior e inferior con el borde del campo.
            (y_ball > y_max) || (y_ball <= y_min)
            
            // Choques con la parte superior de los jugadores.
            // || ((y_ball >= pos_player1-size_ball) && (x_ball >= separator) && (x_ball < separator + width_player))
            // || ((y_ball >= pos_player2-size_ball) && (x_ball >= width_screen - separator - width_player) && (x_ball < width_screen - separator))

            // Choques con la parte inferior de los jugadores.
            // || ((y_ball <= pos_player1+height_player) && (x_ball >= separator) && (x_ball < separator + width_player))
            // || ((y_ball <= pos_player2+height_player) && (x_ball >= width_screen - separator - width_player) && (x_ball < width_screen - separator))
           )
        begin
            incy <= -incy;
            //mute = 0;
            //code_sound <= ping;
        end
    end
endmodule
