module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    dff_sync_rst_n dff_sync_rst_n (KEY[0], KEY[3], SW[0], LEDR[1]);
 
endmodule

