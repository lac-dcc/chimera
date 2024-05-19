// This program was cloned from: https://github.com/emu-russia/SEGAChips
// License: Creative Commons Zero v1.0 Universal

// Z80 terminal logic

module pad_inout ( read_enable, vout_from_core, vin_to_core, pad );

	input read_enable;
	input vout_from_core;
	output vin_to_core;
	inout pad;

	bufif0 (pad, vout_from_core, read_enable);
	assign vin_to_core = pad;

endmodule // pad_inout
