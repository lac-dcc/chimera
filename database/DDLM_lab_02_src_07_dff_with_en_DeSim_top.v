module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    dff_with_en dff_with_en (KEY[0], KEY[2], SW[0], LEDR[1]);
 
endmodule

