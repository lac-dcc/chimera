// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    pmod_als pmod_als (KEY[0], KEY[3], LEDR[8], LEDR[9], SW[0], LEDR[7:0]);

endmodule

