module top (SW, KEY, LEDR);

	 input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons
	 
	 output wire [9:0] LEDR;     // DE-series LEDs   

    pow_5_en_single_cycle_always pow_5_en_single_cycle_always (KEY[0], KEY[3], KEY[1], SW[9], SW[7:0], LEDR[9], LEDR[7:0]);

endmodule

