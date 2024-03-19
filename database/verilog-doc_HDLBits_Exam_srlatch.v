module top_module (
	input set,
	input reset,
	output reg q
);

	// Two NOR gates
	// wire qn = ~( ~(reset | qn)  |  set );
	// assign q = ~qn;

	// set has priority. If set=0, then see if user wants to reset.
	assign q = set ? 1'b1 : (reset ? 1'b0 : q);
	
	// If statements in a procedural block. Recall: If a variable isn't assigned
	
	
endmodule


