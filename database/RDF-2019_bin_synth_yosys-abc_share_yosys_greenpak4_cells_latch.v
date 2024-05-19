// This program was cloned from: https://github.com/ieee-ceda-datc/RDF-2019
// License: MIT License

module $_DLATCH_P_(input E, input D, output Q);
	GP_DLATCH _TECHMAP_REPLACE_ (
		.D(D),
		.nCLK(!E),
		.Q(Q)
		);
endmodule

module $_DLATCH_N_(input E, input D, output Q);
	GP_DLATCH _TECHMAP_REPLACE_ (
		.D(D),
		.nCLK(E),
		.Q(Q)
		);
endmodule
