// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

module iverilog_dump();
	integer levels;
	reg [4096:0] vcdfile, sdffile;
	initial begin
		if ($value$plusargs("vcd=%s", vcdfile) &&
		    $value$plusargs("levels=%d", levels)) begin
			$dumpfile(vcdfile);
			$dumpvars(levels, `TOP);
		end
		if ($value$plusargs("sdf=%s", sdffile))
			$sdf_annotate(sdffile, `TOP);
	end
endmodule
