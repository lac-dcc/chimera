module top (SW, LEDR);

    input wire [9:0] SW;        // DE-series switches

    output wire [9:0] LEDR;     // DE-series LEDs   

    b10_gray2bin_v2 lab3 (SW,LEDR);
 
endmodule

