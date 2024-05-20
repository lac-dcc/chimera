// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

/*
 * bram_512x32.v - byte-addressable RAM in block ram
 * 07-01-19 E. Brombaugh
 */
 
`default_nettype none

module bram_512x32(
	input clk,
	input sel,
	input [3:0] we,
	input [10:0] addr,
	input [31:0] wdat,
	output reg [31:0] rdat
);
	// memory
	reg [31:0] ram[511:0];
	
	// write logic
	always @(posedge clk)
		if(sel)
		begin
			if(we[0])
				ram[addr[10:2]][7:0] <= wdat[7:0];
			if(we[1])
				ram[addr[10:2]][15:8] <= wdat[15:8];
			if(we[2])
				ram[addr[10:2]][23:16] <= wdat[23:16];
			if(we[3])
				ram[addr[10:2]][31:24] <= wdat[31:24];
		end
	
	// read logic
	always @(posedge clk)
		rdat <= ram[addr[10:2]];

endmodule
