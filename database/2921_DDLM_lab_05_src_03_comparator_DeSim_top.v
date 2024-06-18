// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module top (KEY, SW, LEDR);

    input wire [3:0] KEY;       // DE-series pushbuttons
    input wire [9:0] SW;        // DE-series switches
    
    output wire [9:0] LEDR;     // DE-series LEDs   

    lab5 lab5 (KEY[1:0], SW[9:0], LEDR[9:0]);

endmodule

