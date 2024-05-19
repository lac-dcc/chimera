// This program was cloned from: https://github.com/neogeodev/NeoChips
// License: GNU General Public License v2.0

// SNK PCM logic definition
// 2020 Sean 'furrtek' Gonsalves - See LICENSE file
// TESTED: Everything - Original chip's logic implementation

module PCM(
	input CLK_68KCLKB,
	input nSDROE, SDRMPX,
	input nSDPOE, SDPMPX,
	inout [7:0] SDRAD,
	input [9:8] SDRA_L,
	input [23:20] SDRA_U,
	inout [7:0] SDPAD,
	input [11:8] SDPA,
	input [7:0] D,
	output [23:0] A,
	input INV_IN,
	output INV_OUT,
	input MODE
);

	reg [19:0] RALATCH;
	reg [23:0] PALATCH;
	reg [4:0] SR;
	reg [7:0] D_LATCH;
	wire [7:0] RD_LATCH;

	always @(posedge SDRMPX)
	   RALATCH[9:0] <= {SDRA_L, SDRAD};
	always @(negedge SDRMPX)
	   RALATCH[19:10] <= {SDRA_L, SDRAD};

	always @(posedge SDPMPX)
	   PALATCH[11:0] <= {SDPA, SDPAD};
	always @(negedge SDPMPX)
	   PALATCH[23:12] <= {SDPA, SDPAD};

	wire [23:0] RAPA;
	reg [3:0] ADEC;
	assign RAPA = nSDPOE ? {SDRA_U, RALATCH} : PALATCH;

	always @(*) begin
		case(RAPA[21:20])
			2'd0: ADEC <= 4'b1110;
			2'd1: ADEC <= 4'b1101;
			2'd2: ADEC <= 4'b1011;
			2'd3: ADEC <= 4'b0111;
		endcase
	end

	assign A = MODE ? RAPA : {ADEC, RAPA[19:0]};

	assign INV_OUT = ~INV_IN;

	assign TRIGTEST = SR[4];

	assign C49B = ~(TRIGTEST | nSDPOE);
	assign C68B = ~(C49B | nSDROE);

	// A37 C49A
	always @(posedge CLK_68KCLKB or negedge C68B) begin
		if (!C68B)
			SR <= 5'b00000;
		else
			SR <= {SR[3:0], 1'b1};
	end

    	always @(posedge TRIGTEST)
        	D_LATCH <= D;

	assign RD_LATCH = TRIGTEST ? D_LATCH : D;
	assign SDRAD = nSDROE ? 8'bzzzzzzzz : RD_LATCH;
	assign SDPAD = nSDPOE ? 8'bzzzzzzzz : D;

endmodule

