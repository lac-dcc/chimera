module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    crc32 lab6 (KEY[0], SW[0], SW[9:2], KEY[2], LEDR);
 
endmodule

