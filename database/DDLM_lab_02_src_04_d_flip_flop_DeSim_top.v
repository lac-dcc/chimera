module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    d_flip_flop d_flip_flop (KEY[0], SW[0], LEDR[1]);
 
endmodule

