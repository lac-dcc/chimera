// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

module planes(
	input reset,
	input clk_main,
	output V6M,
	
	input RMRD,
	input VRAMCS,
	input PDS,
	input NREAD,
	output reg VDTAC,
	
	input [7:0] DB_IN,
	input m68k_addr_16,
	input [15:1] AB,
	input nUDS,
	
	output [7:0] DB_OUT_k052109,
	output DBDIR_k052109,
	output [7:0] DB_OUT_k051962,
	output DBDIR_k051962,
	
	output HVOT,
	output [11:0] VA,
	output [11:0] VB,
	output [7:0] FX,
	
	output NVA,
	output NVB,
	output NFX,
	
	output NVBLK,
	output NCBLK,
	output SYNC
);

	wire clk_12M;
	wire PQ;
	wire [17:0] tiles_rom_addr;
	wire [31:0] tiles_rom_dout;
	wire [31:0] tiles_rom_planar;
	wire [7:0] COL;
	wire [10:0] VC;
	wire [2:1] CAB;
	wire [15:0] VD_OUT;
	wire [15:0] VD_IN;
	wire [12:0] RA;
	wire [1:0] RCS;
	wire [2:0] ROE;
	wire [2:0] RWE;

	// LS74
	reg I20_Q;
	always @(posedge PQ or negedge PDS) begin
		if (!PDS)
			I20_Q <= 1'b1;
		else
			I20_Q <= VRAMCS;
	end

	// LS74
	always @(posedge clk_12M or negedge PDS) begin
		if (!PDS)
			VDTAC <= 1'b1;
		else
			VDTAC <= I20_Q;
	end

	k052109 k052109_1(
		.nRES(~reset),
		.clk_24M(clk_main),
		.clk_12M(clk_12M),
		
		.CRCS(VDTAC),		// CPU GFX ROM access
		.RMRD(RMRD),
		.VCS(VDTAC),		// CPU VRAM access
		.NRD(NREAD),		// CPU read
		.PQ(PQ),
		.HVOT(HVOT),
		.DB_DIR(DBDIR_k052109),
		
		// CPU interface
		.DB_IN(DB_IN),
		.DB_OUT(DB_OUT_k052109),
		.AB({m68k_addr_16, AB[15], nUDS, AB[14:13], AB[11:1]}),
		
		// VRAM interface
		.VD_OUT(VD_OUT),
		.VD_IN(VD_IN),
		.RA(RA),
		.RCS(RCS),
		.ROE(ROE),
		.RWE(RWE),
		
		// GFX ROMs interface
		.CAB(CAB),
		.VC(VC),
		
		// k051962 interface
		.COL(COL),				// To k051962 (partially)
		.ZA1H(ZA1H), .ZA2H(ZA2H), .ZA4H(ZA4H),	// To k051962
		.ZB1H(ZB1H), .ZB2H(ZB2H), .ZB4H(ZB4H),	// To k051962
		.BEN(BEN)	// To k051962
	);

	// Tile VRAM
	ram_sim #(8, 13, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/tools/vram_bg_L_8.txt") RAM_TILES_U(RA, RWE[1], RCS[1], VD_OUT[15:8], VD_IN[15:8]);		// 8k * 8
	ram_sim #(8, 13, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/tools/vram_bg_U_8.txt") RAM_TILES_L(RA, RWE[2], 1'b0, VD_OUT[7:0], VD_IN[7:0]);			// 8k * 8

	assign tiles_rom_addr = {CAB, COL[3:2], COL[4], COL[1:0], VC};
	// COL[3:2] in VRAM -> mapped to nibbles from regs 1D80 and 1F00 to {CAB, COL[3:2]} (2 to 4 bit indirection)
	// 10 00 0 xx nnnnnnnn rrr
	
	// ../../sim/roms/
	rom_sim #(32, 18, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/roms/rom_tiles_32.txt") ROM_TILES(tiles_rom_addr, tiles_rom_dout);	// 256k * 32

	// Chunky to planar (routing on PCB)
	assign tiles_rom_planar = {
		tiles_rom_dout[31],	// V
		tiles_rom_dout[27],	// R
		tiles_rom_dout[23],	// N
		tiles_rom_dout[19],	// J
		
		tiles_rom_dout[15],	// F
		tiles_rom_dout[11],	// B
		tiles_rom_dout[7],	// 7
		tiles_rom_dout[3],	// 3
		
		tiles_rom_dout[30],	// U
		tiles_rom_dout[26],	// Q
		tiles_rom_dout[22],	// M
		tiles_rom_dout[18],	// I
		
		tiles_rom_dout[14],	// E
		tiles_rom_dout[10],	// A
		tiles_rom_dout[6],	// 6
		tiles_rom_dout[2],	// 2
		
		tiles_rom_dout[29],	// T
		tiles_rom_dout[25],	// P
		tiles_rom_dout[21],	// L
		tiles_rom_dout[17],	// H
		
		tiles_rom_dout[13],	// D
		tiles_rom_dout[9],	// 9
		tiles_rom_dout[5],	// 5
		tiles_rom_dout[1],	// 1
		
		tiles_rom_dout[28],	// S
		tiles_rom_dout[24],	// O
		tiles_rom_dout[20],	// K
		tiles_rom_dout[16],	// G
		
		tiles_rom_dout[12],	// C
		tiles_rom_dout[8],	// 8
		tiles_rom_dout[4],	// 4
		tiles_rom_dout[0]		// 0
	};
	
	k051962 k051962_1(
		.nRES(~reset),
		.clk_24M(clk_main),
		.clk_6M(V6M),
		
		.DSA(VA),
		.DSB(VB),
		.DFI(FX),
		
		.NSAC(NVA),
		.NSBC(NVB),
		.NFIC(NFX),

		.CRCS(VDTAC),
		.BEN(BEN),	// From k052109
		.RMRD(RMRD),
		.DB_DIR(DBDIR_k051962),
		
		.ZA1H(ZA1H), .ZA2H(ZA2H), .ZA4H(ZA4H),	// From k052109
		.ZB1H(ZB1H), .ZB2H(ZB2H), .ZB4H(ZB4H),	// From k052109
		.COL({COL[7:5], 5'b00000}),	// From k052109 (partially) - Only 3 bits used for tile palette selection
		
		.VC(tiles_rom_planar),		// GFX ROM data
		
		// Video sync and blanking
		.NVBK(NVBLK),
		.NHBK(NHBK),
		.NVSY(NVSY),
		.NCSY(SYNC),
		
		// CPU interface
		.DB_IN(DB_IN),
		.DB_OUT(DB_OUT_k051962),
		.AB(AB[2:1])
	);
	
	assign NCBLK = NVBLK & NHBK;

endmodule
