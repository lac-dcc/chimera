// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module top (SW, LEDR);

    input wire [9:0] SW;        // DE-series switches

    output wire [9:0] LEDR;     // DE-series LEDs   

    b11_seven_seg lab3 (SW,LEDR);
 
endmodule

