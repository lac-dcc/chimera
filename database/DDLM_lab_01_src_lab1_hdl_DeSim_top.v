// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module top (KEY, LEDR);

    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    lab1 lab1 (KEY[1:0], LEDR[9:0]);

endmodule

