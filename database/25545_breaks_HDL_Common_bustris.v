// This program was cloned from: https://github.com/emu-russia/breaks
// License: Creative Commons Zero v1.0 Universal

// Inverting tristate with inverted permission.

module bustris (a, n_x, n_en);

	input a;
	output n_x;
	input n_en;

	notif0 (n_x, a, n_en);

endmodule // bustris
