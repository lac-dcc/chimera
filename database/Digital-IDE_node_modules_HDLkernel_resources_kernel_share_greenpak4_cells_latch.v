// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

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
