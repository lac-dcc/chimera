module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    lab7_1 lab7_1 (KEY[0], SW[6:0], LEDR[3:0]);
 
endmodule

