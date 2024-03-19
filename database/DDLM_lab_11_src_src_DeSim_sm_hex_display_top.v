module top (SW, HEX0);

	 input wire [9:0] SW;        // DE-series switches
    output wire [6:0] HEX0;      // DE-series HEX displays

    sm_hex_display sm_hex_display (SW[3:0], HEX0[6:0]);

endmodule

