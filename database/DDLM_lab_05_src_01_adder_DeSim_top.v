module top (SW, LEDR);

    input wire [9:0] SW;        // DE-series switches

    output wire [9:0] LEDR;     // DE-series LEDs   

    lab5 adder (SW[9:0], LEDR[9:0]);

endmodule
