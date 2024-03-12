////////////////////////////////////////////////////////////////////////////////
// Company:     Ridotech
// Engineer:    Juan Manuel Rico
// Create Date: 29/03/2020
// Module Name: top.v
//
// Description: Top module from 'pong' game.
//
// Dependencies: 
//
// Revisions: 
//     0.01 - File created.
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module top (
    input wire CLK,         // System clock (16Mhz).

    input wire PIN_21,      // Player 1 - Up button.
    input wire PIN_22,      // Player 1 - Down button.
    input wire PIN_23,      // Player 2 - Up button.
    input wire PIN_24,      // Player 2 - Down button.

    output wire USBPU,       // USB pull resistor.

    output wire PIN_13,     // VGA - VSync.
    output wire PIN_12,     // VGA - HSync.
    output wire PIN_11,     // VGA - R.
    output wire PIN_10,     // VGA - G.
    output wire PIN_9,      // VGA - B.

    output wire PIN_20,     // Right channel.
    output wire PIN_19      // Left channel.
);

    // Drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    // Module wire conections. 
    wire px_clk;                // Pixel clk.
    wire [22:0] strVGA;         // Stream VGA.
    wire [25:0] strRGB;         // Stream RGB.
    wire endframe;              // End frame signal.
    wire [9:0] pos_ply1;        // Position player 1.
    wire [9:0] pos_ply2;        // Position player 2.
    wire reset;
    wire play;

    // Generated VGA stream module.
    strVGAGen strVGAGen_0 (
        .sys_clk (CLK),
        .px_clk (px_clk),
        .strVGA (strVGA)
    );

    // Generated VGA endframe module.
    endframeVGA endframeVGA_0 (
        .strVGA(strVGA),
        .endframe(endframe)
    );

    // Control game module.
    ctlButtons ctlButtons_0 (
        .clk (endframe),
        .ply1_up   (PIN_21),
        .ply1_down (PIN_22),
        .ply2_up   (PIN_23),
        .ply2_down (PIN_24),
        .pos_ply1 (pos_ply1),
        .pos_ply2 (pos_ply2)
    );

    // Game module.
    pongGame pongGame_0 (
        .px_clk (px_clk),
        .strVGA (strVGA),
        .reset (reset),
        .play (play),
        .snd_clk (CLK),
        .pos_ply1(pos_ply1),
        .pos_ply2(pos_ply2),
        .strRGB (strRGB),
        .right (PIN_20),
        .left (PIN_19)
    );

    // Unzip RGB stream module.
    unzipRGB unzipRGB_0 (
        .strRGB (strRGB),
        .vsync (PIN_13),
        .hsync (PIN_12),
        .Red (PIN_11),
        .Green (PIN_10),
        .Blue (PIN_9)
    );

endmodule
