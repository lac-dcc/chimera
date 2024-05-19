// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// TMNT arcade core
// Sean Gonsalves 2022
`timescale 1ns/100ps

// k052109 DB_DIR wrong: drops during reads AND writes

// Current state: FIX layer output works ok
// Next step: Init VRAM and config registers with snapshots from MAME to see if layers A and B work correctly
// Almost everything written except Z80 subsystem
// Shortened checksum test in fast ROM, locks up with fixmap set to check screen with ROMs marked "BAD" as expected :)
// Need to fix cell connections in k051960 (see modelsim output) to get rid of warnings
// Passes palette RAM test (check d7, selftest results are stored as a bitmap)
// Passes VRAM, WRAM and SPR RAM tests

// HVOT from k052109 -> HVIN of sprite chips for frame sync.
// k052109 H/V counters ok, checked HVOT output against real chip.
// k051962 H/V counters ok, checked NCSY, NHBK, NVBK, NVSY, OHBK and k052109 HVOT outputs against real chip.
// Very first frame after reset must be ignored, logic not fully init (checked against real chips).

// Clocks:
// 640kHz for the TMNT theme playback
// 640kHz for the NEC voice chip
// 3.58MHz for the Z80 and sound
// 24MHz for the 68000 and video

module top (
	input reset,
	input clk_main,

	input [3:0] P_up,
	input [3:0] P_down,
	input [3:0] P_left,
	input [3:0] P_right,
	input [3:0] P_jump,
	input [3:0] P_attack1,
	input [3:0] P_attack2,
	input [3:0] P_attack3,
	input [3:0] P_start,
	input [3:0] P_coin,
	
	input [3:0] service,
	
	output reg [1:0] coin_counter,

	output [5:0] video_r,
	output [5:0] video_g,
	output [5:0] video_b,
	output video_sync,

	input [7:0] dipswitch1,
	input [7:0] dipswitch2,
	input [3:0] dipswitch3
);

parameter CPU_RUN = 0;		// DEBUG

wire [23:1] m68k_addr;
reg [15:0] m68k_din;
wire [15:0] m68k_dout;
wire [15:0] m68k_rom_dout;
wire [15:0] m68k_ram_dout;
wire nAS;

wire [7:0] pal_dout;

wire [7:0] DB_OUT_k052109;	// Data from k052109
wire [7:0] DB_OUT_k051960;	// Data from k051960
wire [7:0] DB_OUT_k051962;	// Data from k051962
wire [7:0] DB_OUT_k051937;	// Data from k051937
wire [11:0] VA;				// Layer A palette and pixel
wire [11:0] VB;				// Layer B palette and pixel
wire [7:0] FX;					// Layer FIX palette and pixel
wire [11:0] OB;				// Sprites palette and pixel
reg INT16EN;
reg [7:0] k007644_reg;

reg PRI, PRI2;
wire SHA;
wire NFX, NOBJ, NVB, NVA;	// Pixel opaque signals (active high)
wire ODTAC, VDTAC;			// DTACKs from sprite and plane chips
wire NVBLK;

// ../../sim/roms/
rom_sim #(16, 18, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/roms/rom_68k_fast_16.txt") ROM_68K(m68k_addr[18:1], m68k_rom_dout);		// 256k * 16

wire [7:0] prio_addr;
wire [7:0] prio_dout;
assign prio_addr = {PRI2, PRI, VB[7], SHA, NFX, NOBJ, NVB, NVA};	// 2C6 = VB[7] ?
rom_sim #(8, 8, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/roms/prom_prio_8.txt") ROM_PRIO(prio_addr, prio_dout);	// 256 * 8 (really 256 * 4)

wire SHADOW = prio_dout[2];	// prio_dout[3] unused

//ram_sim #(16, 13, "") RAM_68K(m68k_addr[13:1], m68k_ram_we, 1'b0, m68k_dout, m68k_ram_dout);			// 8k * 16
ram_sim #(8, 13, "") RAM_68K_U(m68k_addr[13:1], NUWR, 1'b0, m68k_dout[15:8], m68k_ram_dout[15:8]);		// 8k * 8
ram_sim #(8, 13, "") RAM_68K_L(m68k_addr[13:1], NLWR, 1'b0, m68k_dout[7:0], m68k_ram_dout[7:0]);		// 8k * 8

// Everything below 100000 is full speed
assign nDTACK = &{ODTAC, VDTAC, nAS | m68k_addr[20]};

// LS74
reg OIPL;
always @(posedge ~NVBLK or negedge INT16EN) begin
	if (!INT16EN)
		OIPL <= 1'b1;
	else
		OIPL <= 1'b0;
end

wire [23:1] m68k_addr_pre;
wire nAS_pre;
cpu_68k CPU68K(
	.clk(CPU_RUN ? clk_main : 1'b0),
	.nRESET(~reset & CPU_RUN),
	.IPL2(OIPL), .IPL1(1'b1), .IPL0(OIPL),
	.nDTACK(nDTACK),
	.M68K_ADDR(m68k_addr_pre),
	.FX68K_DATAIN(m68k_din),
	.FX68K_DATAOUT(m68k_dout),
	.nLDS(nLDS), .nUDS(nUDS_pre),
	.nAS(nAS_pre),
	.M68K_RW(m68k_rw),
	.FC2(FC2), .FC1(FC1), .FC0(FC0),
	.nBG(nBG),
	.nBR(1'b1),
	.nBGACK(1'b1)
);

assign m68k_addr = CPU_RUN ? m68k_addr_pre : 23'h000000;
assign nAS = nAS_pre | ~CPU_RUN;
assign nUDS = nUDS_pre | ~CPU_RUN;

assign NLWR = nLDS | m68k_rw | ~CPU_RUN;
assign NUWR = nUDS | m68k_rw | ~CPU_RUN;
assign PDS = ~&{nLDS, nUDS, CPU_RUN};

reg [7:0] U47;	// CPU LS138
always @(*) begin
	case({nAS, m68k_addr[20], m68k_addr[19:17]})
		5'b0_0000: U47 <= 8'b11111110;
		5'b0_0001: U47 <= 8'b11111101;
		5'b0_0010: U47 <= 8'b11111011;
		5'b0_0011: U47 <= 8'b11110111;
		5'b0_0100: U47 <= 8'b11101111;
		5'b0_0101: U47 <= 8'b11011111;
		5'b0_0110: U47 <= 8'b10111111;
		5'b0_0111: U47 <= 8'b01111111;
		default: U47 <= 8'b11111111;
	endcase
end

assign nROMCS = &{U47[1:0]};	// Bottom ROMs
assign nW1CS = U47[2];			// Top ROMs
assign nW2CS = U47[3];			// Work RAM
assign COLCS = U47[4];			// Palette RAM
assign SYSWR = U47[6];			// Set PRI*

reg [7:0] U45;	// CPU LS138
always @(*) begin
	case({U47[5], m68k_addr[16], m68k_rw, m68k_addr[4:3]})
		5'b0_0000: U45 <= 8'b11111110;
		5'b0_0001: U45 <= 8'b11111101;
		5'b0_0010: U45 <= 8'b11111011;
		5'b0_0011: U45 <= 8'b11110111;
		5'b0_0100: U45 <= 8'b11101111;
		5'b0_0101: U45 <= 8'b11011111;
		5'b0_0110: U45 <= 8'b10111111;
		5'b0_0111: U45 <= 8'b01111111;
		default: U45 <= 8'b11111111;
	endcase
end

assign IOWR = U45[0];	// Coin lockouts, GFX ROM read...
assign SNDDT = U45[1];	// Sound code
assign AFR = U45[2];		// k051550 watchdog reset

assign SHOOT = U45[4];	// Read inputs
assign DIP = U45[6];
assign DIP3 = U45[7];

reg RMRD;
reg SNDON;
always @(posedge IOWR or posedge reset) begin
	if (reset) begin
		{RMRD, INT16EN, SNDON, coin_counter} <= 5'b000_00;
	end else begin
		RMRD <= m68k_dout[7];		// GFX ROM read
		INT16EN <= m68k_dout[5];	// Vblank IRQ en
		SNDON <= m68k_dout[3];		// Z80 IRQ trig
		coin_counter[1] <= m68k_dout[1];
		coin_counter[0] <= m68k_dout[0];
	end
end

always @(posedge SYSWR or posedge reset) begin
	if (reset) begin
		PRI <= 0;
		PRI2 <= 0;
	end else begin
		PRI <= m68k_dout[2];
		PRI2 <= m68k_dout[3];
	end
end

wire OEQ, PE;
// 68k data input mux
// OEQ == 0: Read video-side data bus
// DIP3 == 0: M68K_DIN[3:0] <= dipswitch3;
// DIP == 0, A[2:1] == 3: M68K_DIN[7:0] <= 8'hFF;
// DIP == 0, A[2:1] == 2: M68K_DIN[7:0] <= INPUTS_4P;	Start, Shoot3, Shoot2, Shoot1, Down, Up, Right, Left
// DIP == 0, A[2:1] == 1: M68K_DIN[7:0] <= dipswitch2;
// DIP == 0, A[2:1] == 0: M68K_DIN[7:0] <= dipswitch1;
// SHOOT == 0, A[2:1] == 3: M68K_DIN[7:0] <= INPUTS_3P;	Start, Shoot3, Shoot2, Shoot1, Down, Up, Right, Left
// SHOOT == 0, A[2:1] == 2: M68K_DIN[7:0] <= INPUTS_2P;	Start, Shoot3, Shoot2, Shoot1, Down, Up, Right, Left
// SHOOT == 0, A[2:1] == 1: M68K_DIN[7:0] <= INPUTS_1P;	Start, Shoot3, Shoot2, Shoot1, Down, Up, Right, Left
// SHOOT == 0, A[2:1] == 0: M68K_DIN[7:0] <= Service4, Service3, Service2, Service1, Coin4, Coin3, Coin2, Coin1
always @(*) begin
	casez({OEQ, COLCS | ~m68k_rw, nW2CS | ~m68k_rw, nW1CS, nROMCS, DIP3, DIP, SHOOT, m68k_addr[2:1]})
		10'b11_110z_zzzz: m68k_din <= m68k_rom_dout;	//m68k_rom_bot_dout;
		10'b11_101z_zzzz: m68k_din <= m68k_rom_dout;	//m68k_rom_top_dout;
		10'b11_011z_zzzz: m68k_din <= m68k_ram_dout;
		10'b10_111z_zzzz: m68k_din <= {8'h00, pal_dout};
		
		10'b11_1110_zzzz: m68k_din <= {12'h000, dipswitch3};

		10'b11_1111_0100: m68k_din <= 16'h00FF;
		10'b11_1111_0101: m68k_din <= {8'h00, P_start[3], P_attack3[3], P_attack2[3], P_attack1[3], P_down[3], P_up[3], P_right[3], P_left[3]};
		10'b11_1111_0110: m68k_din <= {8'h00, dipswitch2};
		10'b11_1111_0111: m68k_din <= {8'h00, dipswitch1};

		10'b11_1111_1000: m68k_din <= {8'h00, P_start[2], P_attack3[2], P_attack2[2], P_attack1[2], P_down[2], P_up[2], P_right[2], P_left[2]};
		10'b11_1111_1001: m68k_din <= {8'h00, P_start[1], P_attack3[1], P_attack2[1], P_attack1[1], P_down[1], P_up[1], P_right[1], P_left[1]};
		10'b11_1111_1010: m68k_din <= {8'h00, P_start[0], P_attack3[0], P_attack2[0], P_attack1[0], P_down[0], P_up[0], P_right[0], P_left[0]};
		10'b11_1111_1011: m68k_din <= {8'h00, service, P_coin};
		
		10'b0z_zzzz_zzzz: m68k_din <= {2{k007644_reg}};

		default: m68k_din <= 16'h0000;	//m68k_din <= 16'bzzzzzzzz_zzzzzzzz;
	endcase
end

// V24M = O24M = 24M

wire [15:1] AB = m68k_addr[15:1];	// Just 2x LS245 buffers

assign NREAD = ~m68k_rw | ~CPU_RUN;
assign OVCS = ~&{m68k_addr[20], ~nAS};
assign OBJCS = ~((m68k_addr[18:17] == 2'd2) & ~OVCS);
assign VRAMCS = ~((m68k_addr[18:17] == 2'd0) & ~OVCS);
assign OEQ = NREAD | OVCS;

assign OEL = ~({OVCS, m68k_rw, nUDS} == 3'b001);
assign OEU = ~({OVCS, m68k_rw, nUDS} == 3'b000);

// Video-side 8bit data bus
reg [7:0] DB_IN;
reg [7:0] DB_OUT;

// 007644 x2
always @(*) begin
	if (PE)
		k007644_reg <= DB_OUT;
	else
		k007644_reg <= k007644_reg;
end

always @(*) begin
	case({OEU, OEL})
		2'd0: DB_IN <= 8'bzzzzzzzz;	// Should never happen
		2'd1: DB_IN <= m68k_dout[15:8];
		2'd2: DB_IN <= m68k_dout[7:0];
		2'd3: DB_IN <= 8'h00;			// Really hi-z, zero to make sim happy
	endcase
end


// DB_OUT_k052109 talks when internal DBDIR=0
// DB_OUT_k051962 talks when internal DBDIR=0 (CRCS=0 and RMRD=1)
// DB_OUT_k051960 talks when internal DBDIR=0
// DB_OUT_k051937 talks when internal DBDIR=0 (NRD=0 and any ROMRDx=0)
wire DBDIR_k052109, DBDIR_k051962, DBDIR_k051960, DBDIR_k051937;

always @(*) begin
	case({DBDIR_k052109, DBDIR_k051962, DBDIR_k051960, DBDIR_k051937})
		4'b0111: DB_OUT <= DB_OUT_k052109;
		4'b1011: DB_OUT <= DB_OUT_k051962;
		4'b1101: DB_OUT <= DB_OUT_k051960;
		4'b1110: DB_OUT <= DB_OUT_k051937;
		default: DB_OUT <= 8'h00;		// Really hi-z, zero to make sim happy
	endcase
end

planes PLANES(
	.reset(reset),
	.clk_main(clk_main),
	.V6M(V6M),
	
	.RMRD(RMRD),
	.VRAMCS(VRAMCS),
	.PDS(PDS),
	.NREAD(NREAD),
	.VDTAC(VDTAC),
	
	.DB_IN(DB_IN),
	.m68k_addr_16(m68k_addr[16]),
	.AB(AB),
	.nUDS(nUDS),
	
	.DB_OUT_k052109(DB_OUT_k052109),
	.DBDIR_k052109(DBDIR_k052109),
	.DB_OUT_k051962(DB_OUT_k051962),
	.DBDIR_k051962(DBDIR_k051962),
	
	.HVOT(HVOT),
	.VA(VA),
	.VB(VB),
	.FX(FX),
	
	.NVA(NVA),
	.NVB(NVB),
	.NFX(NFX),
	
	.NVBLK(NVBLK),
	.NCBLK(NCBLK),
	.SYNC(video_sync)
);

//assign NOBJ = 1'b0;	// DEBUG
//assign SHA = 1'b0;	// DEBUG

sprites SPRITES(
	.reset(reset),
	.clk_main(clk_main),
	
	.OBJCS(OBJCS),
	.PDS(PDS),
	.NREAD(NREAD),
	.PE(PE),
	
	.HVOT(HVOT),
	
	.DB_IN(DB_IN),
	.AB(AB),
	.nUDS(nUDS),
	
	.DB_OUT_k051960(DB_OUT_k051960),
	.DBDIR_k051960(DBDIR_k051960),
	.DB_OUT_k051937(DB_OUT_k051937),
	.DBDIR_k051937(DBDIR_k051937),
	
	.SHA(SHA), .NOBJ(NOBJ),	// DEBUG .SHA(SHA), .NOBJ(NOBJ)
	.OB(OB),
	
	.ODTAC(ODTAC)
);

// Video plane mixing
// 4x LS153
reg [9:0] CD;

always @(*) begin
	case(prio_dout[1:0])
		2'd0: CD <= {2'b10, 1'b0, VA[7:5], VA[3:0]};	// VA[4] unused
		2'd1: CD <= {2'b10, 1'b1, VB[7:5], VB[3:0]};	// VB[4] unused
		2'd2: CD <= {2'b01, OB[7:4], OB[0], OB[1], OB[2], OB[3]};	// Sprites
		2'd3: CD <= {2'b00, 1'b0, FX[7:5], FX[3:0]};	// FX[4] unused
	endcase
end

TMNTColor color(
	.V6M(V6M),
	.AB(AB[12:1]),
	.CD(CD),
	.SHADOW(SHADOW),
	.CPU_DIN(m68k_dout[7:0]),
	.CPU_DOUT(pal_dout),
	.NCBLK(NCBLK),
	.COLCS(COLCS),
	.NLWR(NLWR),
	.NREAD(NREAD),
	.RED_OUT(video_r),
	.GREEN_OUT(video_g),
	.BLUE_OUT(video_b)
);

endmodule
