//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
//
// Create Date: 19:12:32 19/09/2017
// Module Name: logo
// Description: Complete logo behaviour (dinamic, graphics and sound).
//
// Dependencies: dinamic, graphics
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module logo (
                input  wire        clk,         // System clock.
                input  wire        clr,         // Asynchronous reset.
                input  wire [9:0]  x_px,        // X position for actual pixel.
                input  wire [9:0]  y_px,        // Y position for actual pixel.
                output wire [2:0]  color_px,    // Color for actual pixel.
                input  wire        inc_vel,     // Increase velocity.
                input  wire        dec_vel,     // Decrease velocity.
                output wire        mute,        // Silence the sound.
                output wire [1:0]  code_sound   // Code of sound (ping, pong, go, stop).
            );

    // Registers with logo position.
    reg [9:0] x_logo;
    reg [9:0] y_logo;
/*
    always @(posedge clk)
    begin
        if (clr)
        begin
            x_logo = (640-80)/2;
            y_logo = (480-96)/2;
        end
    end
*/
    // Instance of dynamic part of logo.
    dynamic
    dynamic01 (
            .clk (clk),
            .clr (clr),
            .x_logo (x_logo),
            .y_logo (y_logo),
            .inc_vel (inc_vel),
            .dec_vel (dec_vel),
            .mute(mute),
            .code_sound (code_sound)
    );

    // Instance of graphics part of logo.
    graphics
    graphics01 (
            .clk (clk),
            .clr (clr),
            .x_px (x_px),
            .y_px (y_px),
            .x_logo (x_logo),
            .y_logo (y_logo),
            .color_px (color_px)
    );

endmodule
