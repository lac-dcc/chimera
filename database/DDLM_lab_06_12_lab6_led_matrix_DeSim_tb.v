// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// Copyright (c) 2020 FPGAcademy
// Please see license at https://github.com/fpgacademy/DESim

`timescale 1ns / 1ns
`default_nettype none

// This testbench is designed to hide the details of using the VPI code

module tb();

    reg CLOCK_50 = 0;               // DE-series 50 MHz clock
    reg [9:0] SW = 0;               // DE-series SW switches
    reg [3:0] KEY = 0;              // DE-series pushbutton keys
    wire [(8*6) -1:0] HEX;          // HEX displays (six ports)
    wire [9:0] LEDR;                // DE-series LEDs

    reg key_action = 0;
    reg [7:0] scan_code = 0;
    wire [2:0] ps2_lock_control;

    wire [7:0] VGA_X;               // "VGA" column
    wire [6:0] VGA_Y;               // "VGA" row
    wire [2:0] VGA_COLOR;           // "VGA pixel" colour (0-7)
    wire plot;                      // "Pixel" is drawn when this is pulsed
    wire [31:0] GPIO;               // DE-series GPIO port

    initial $sim_fpga(CLOCK_50, SW, KEY, LEDR, HEX, key_action, scan_code, 
                      ps2_lock_control, VGA_X, VGA_Y, VGA_COLOR, plot, GPIO);

    wire [6:0] HEX0;                // DE-series HEX0 port
    wire [6:0] HEX1;                // DE-series HEX1 port
    wire [6:0] HEX2;                // ...
    wire [6:0] HEX3;
    wire [6:0] HEX4;
    wire [6:0] HEX5;

    // create the 50 MHz clock signal
    always #10
        CLOCK_50 <= ~CLOCK_50;

    // connect the single HEX port on "sim_fpga" to the six DE-series HEX ports
    assign HEX[47:40] = {1'b0, HEX0};
    assign HEX[39:32] = {1'b0, HEX1};
    assign HEX[31:24] = {1'b0, HEX2};
    assign HEX[23:16] = {1'b0, HEX3};
    assign HEX[15: 8] = {1'b0, HEX4};
    assign HEX[ 7: 0] = {1'b0, HEX5};
    
    top DUT (.CLOCK_50(CLOCK_50), .KEY(KEY), .GPIO(GPIO));

endmodule