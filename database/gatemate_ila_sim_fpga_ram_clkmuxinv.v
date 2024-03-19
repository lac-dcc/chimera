module common_clkmux (
	I0,
	I1,
	S,
	Z
	);

	// synopsys translate_off
	parameter C_DELAY = 0.0;
	// synopsys translate_on

	input I0;
	input I1;
	input S;

	output Z;

	// synopsys translate_off
	generate
	if (C_DELAY > 0) begin: DELAY
		assign #C_DELAY Z = S ? I1 : I0;
	end
	else begin: NO_DELAY
		// synopsys translate_on
		assign Z = S ? I1 : I0;
		// synopsys translate_off
	end
	endgenerate
	// synopsys translate_on
endmodule


module common_clkinv (  I,
	ZN
	);

	// synopsys translate_off
	parameter C_DELAY = 0.0;
	// synopsys translate_on

	input  I;

	output ZN;

	wire   ZN;

	// synopsys translate_off
	generate
	if (C_DELAY > 0) begin: DELAY
		assign #C_DELAY ZN = ~I;
	end
	else begin: NO_DELAY
		// synopsys translate_on
		assign ZN = ~I;
		// synopsys translate_off
	end
	endgenerate
	// synopsys translate_on
endmodule
