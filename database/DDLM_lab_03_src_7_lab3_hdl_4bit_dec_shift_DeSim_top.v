module top (SW, KEY, LEDR);

    input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons

    output wire [9:0] LEDR;     // DE-series LEDs   

    b7_4bit_dec_assign_shift lab3 (SW, LEDR, KEY[0]);
 
endmodule

