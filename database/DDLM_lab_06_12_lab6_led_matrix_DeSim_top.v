module top (CLOCK_50, KEY, GPIO);

    input CLOCK_50;        // DE-series switches
    input wire [1:0] KEY;       // DE-series pushbuttons

    inout wire [31:0] GPIO;     // DE-series LEDs   

    de10_lite lab6 (CLOCK_50, KEY[1:0], GPIO);
 
endmodule

