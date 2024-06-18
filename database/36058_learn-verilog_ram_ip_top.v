// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

module top(
	input wire sys_clk,
	input wire [2:0] addr,
	output wire [15:0] data
);

	ram_buffer ram_buffer_inst (
	    .rdclock (sys_clk),
	    .wrclock (sys_clk),
	    .data (16'd0),
	    .rdaddress (addr),
	    .wraddress (3'd0),
	    .wren (1'b0),
	    .q (data)
	);
endmodule
