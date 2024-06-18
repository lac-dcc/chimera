// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    always @(posedge clk)
    	if (a == b) state <= a;
    	else state <= state;
    
	assign q = a == b ? state : ~state;


endmodule
