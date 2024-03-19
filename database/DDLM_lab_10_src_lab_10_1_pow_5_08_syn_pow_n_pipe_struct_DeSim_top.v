module top (SW, KEY, LEDR);

	 input wire [9:0] SW;        // DE-series switches
    input wire [3:0] KEY;       // DE-series pushbuttons
	 
	 output wire [9:0] LEDR;     // DE-series LEDs   

    pow_n_pipe_struct pow_n_pipe_struct (KEY[0], KEY[3], SW[9], SW[7:0], LEDR[9:5], LEDR[4:0]);

endmodule

