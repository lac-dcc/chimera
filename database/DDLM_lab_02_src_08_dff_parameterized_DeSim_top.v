module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    dff_async_rst_n_param dff_async_rst_n_param (KEY[0], KEY[2], SW, LEDR);
 
endmodule

