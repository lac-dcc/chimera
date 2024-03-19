module top (SW, LEDR);

    input wire [9:0] SW;        // DE-series switches
	 
    output wire [9:0] LEDR;     // DE-series LEDs   

    sr_latch sr_latch (SW[1], SW[0], LEDR[1], LEDR[0]);

endmodule

