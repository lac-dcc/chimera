// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Interrupt request and interrupt service register pair

module rzrp(
	input clk_sys,
	input imask,		// interrupt mask
	input irq,			// async irq source
	input w,				// clocked irq source
	input rz_c,			// irq clock
	input rz_r,			// irq clear
	input rp_c,			// interrupt service clock
	input prio_in,	// interrupt priority chain input
	output rz,			// irq
	output sz,			// irq & mask
	output rp,			// interrupt service register
	output prio_out	// interrupt priority chain output
);

	assign sz = rz & imask;

	always @ (posedge clk_sys, posedge irq) begin
		if (irq) rz <= 1'b1;
		else if (rz_r) rz <= 1'b0;
		else if (rz_c) case ({w, rp})
			2'b00 : rz <= rz;
			2'b01 : rz <= 1'b0;
			2'b10 : rz <= 1'b1;
			2'b11 : rz <= ~rz;
		endcase
	end

	// NOTE: rp_c should be too long to be a clock enable signal here, but it seems to work just fine
	always @ (posedge clk_sys, posedge prio_in) begin
		if (prio_in) rp <= 1'b0;
		else if (rp_c) rp <= sz;
	end

	assign prio_out = rp | prio_in;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
