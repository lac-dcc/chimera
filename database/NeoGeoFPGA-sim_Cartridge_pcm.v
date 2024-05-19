// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

// SIMULATION - UNUSED
// SNK "PCM" chip (in cartridge)

module pcm(
	input CLK_68KCLKB,
	input nSDROE, SDRMPX,
	input nSDPOE, SDPMPX,
	inout [7:0] SDRAD,
	input [9:8] SDRA_L,
	input [23:20] SDRA_U,
	inout [7:0] SDPAD,
	input [11:8] SDPA,
	input [7:0] D,
	output [23:0] A
);

	reg [1:0] COUNT;
	reg [7:0] RDLATCH;
	reg [7:0] PDLATCH;
	reg [23:0] RALATCH;
	reg [23:0] PALATCH;

	always @(posedge CLK_68KCLKB or negedge nSDPOE)
	begin
		if (!nSDPOE)
			COUNT <= 0;
		else
			if (!COUNT[1]) COUNT <= COUNT + 1'b1;
	end

	assign SDRAD = nSDROE ? 8'bzzzzzzzz : RDLATCH;
	always @*
		if (COUNT[1]) RDLATCH <= D;

	assign SDPAD = nSDPOE ? 8'bzzzzzzzz : PDLATCH;
	always @*
		if (!nSDPOE) PDLATCH <= D;

	assign A = nSDPOE ? RALATCH[23:0] : PALATCH[23:0];
	
	always @(posedge SDRMPX)
	begin
		RALATCH[7:0] <= SDRAD;
		RALATCH[9:8] <= SDRA_L[9:8];
	end

	always @(negedge SDRMPX)
	begin
		RALATCH[17:10] <= SDRAD;
		RALATCH[23:18] <= {SDRA_U[23:20], SDRA_L[9:8]};
	end

	always @(posedge SDPMPX)
	begin
		PALATCH[7:0] <= SDPAD;
		PALATCH[11:8] <= SDPA[11:8];
	end
	always @(negedge SDPMPX)
	begin
		PALATCH[19:12] <= SDPAD;
		PALATCH[23:20] <= SDPA[11:8];
	end

endmodule
