// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    b9_6bit_dec_mips_maindec lab3 (SW,LEDR[0],LEDR[1],LEDR[2],
										LEDR[3],LEDR[4],LEDR[5],LEDR[6],{LEDR[7],LEDR[8]});
 
endmodule

