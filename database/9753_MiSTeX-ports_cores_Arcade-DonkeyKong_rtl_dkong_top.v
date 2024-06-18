// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

//===============================================================================
// FPGA DONKEY KONG TOP
//
// Version : 4.00
//
// Copyright(c) 2003 - 2004 Katsumi Degawa , All rights reserved
//
// Important !
//
// This program is freeware for non-commercial use.
// An author does no guarantee about this program.
// You can use this under your own risk.
//
// 2020-12-28 converted a big part to totally syncronous logic (by slingshot)
// 2004- 3- 3 first release.
// 2004- 6- 8 Quartus2 v4.0sp1 used (bug fix) K.Degawa
// 2004- 8-24 T80-IP was include.  K.Degawa
// 2004- 9- 2 T48-IP(beta3) was include.  K.Degawa
// 2004- 9-14 T48-IP was changed to beta4.  K.Degawa
// 2005- 2- 9 Data on the ROM are initialized at the time of the start.
//            added device.
//            changed module I/O.
//
// This description is largely based on the TKG4 schematics, with some extensions
// to support Radarscope and Donkey Kong Jr (although MiSter currently has a separate DKJR core).
//
// In the schematics, ICs are denoted by their position on the board, i.e. IC 6M
// is the IC in column 6, row M. Unfortunataly, this makes reverse lookup from
// Verilog to schematic hard, but at least ICs with similar coordinates are often cloase
// together in the schematic too.
// In the Verilog description, signals were orignally named by the source IC and pin
// name. Later changes did not always follow this convention.
// This naming can be confusing, because is not always unique:
// e.g. IC 4H occurs both on the VIDEO and CPU board.
//
// Contrary to Radarscope and TGK2, the TKG4 does not really have a sound board,
// so even in that code, numbering and naming of the TKG4 CPU board is largely
// followed.
//
//================================================================================

module dkong_top
(
	//    FPGA_USE
	input  I_CLK_24576M,
	input  I_RESETn,
	output O_PIX,

	//    INPORT SW IF
	input  I_U1,I_D1,I_L1,I_R1,I_J1,
	input  I_U2,I_D2,I_L2,I_R2,I_J2,
	input  I_S1,I_S2,I_C1,

	input  [7:0] I_DIP_SW,
	input  I_DKJR,
	input  I_DK3B,
	input  I_RADARSCP,
	input  I_PESTPLCE,

	//    VGA (VIDEO) IF
	input flip_screen,
	input use_emulated_sfx,
	input [8:0] H_OFFSET,
	input [8:0] V_OFFSET,

	output [3:0]O_VGA_R,
	output [3:0]O_VGA_G,
	output [3:0]O_VGA_B,
	output O_H_BLANK,
	output O_V_BLANK,
	output O_VGA_H_SYNCn,
	output O_VGA_V_SYNCn,

	//    SOUND IF
	output  [15:0] O_SOUND_DAT,

	// EXTERNAL ROMS
	input  [15:0] DL_ADDR,
	input         DL_WR,
	input   [7:0] DL_DATA,

	output reg [15:0] MAIN_CPU_A,
	input   [7:0] MAIN_CPU_DO,
	output [11:0] SND_ROM_A,
	input   [7:0] SND_ROM_DO,
	output [18:0] WAV_ROM_A,
	input   [7:0] WAV_ROM_DO,

	input				paused,

	//- HISCORE
	input [15:0]	hs_address,
	output [7:0]	hs_data_out,
	input  [7:0]	hs_data_in,
	input 			hs_write,
	input 			hs_access

);

assign O_H_BLANK = ~W_H_BLANKn;
assign O_V_BLANK = ~W_V_BLANKn;

wire   W_CLK_24576M = I_CLK_24576M;
wire   W_CLK_12288M,WB_CLK_12288M;
wire   W_CLK_12288M_EN;
wire   W_RESETn = I_RESETn;

//============   CPU MODULE ( Donkey Kong )   ====================================
//========  Assign Wire  =========================================================
//  INPUT DATA BUS
wire   [7:0]ZDO,ZDI;
wire   [7:0]WI_D = ZDI;
//  INPORT DATA OUT
wire   [7:0]W_SW_DO;
//  ADDRESS DECODER
wire   W_ROM_CSn;
wire   W_RAM1_CSn;
wire   W_RAM2_CSn;
wire   W_RAM3_CSn;
wire   W_RAMDK3B_CSn;
//wire   W_6A_Gn;
wire   W_OBJ_RQn;
wire   W_OBJ_RDn;
wire   W_OBJ_WRn;
wire   W_VRAM_RDn;
wire   W_VRAM_WRn;
wire   W_SW1_OEn ;
wire   W_SW2_OEn ;
wire   W_SW3_OEn ;
wire   W_DIP_OEn ;

wire   [1:0]W_4H_Q;
wire   [7:0]W_5H_Q;
wire   [7:0]W_6H_Q;
wire   [4:0]W_3D_Q;

//  RAM DATA
wire   [7:0]W_RAM1_DO;
wire   [7:0]W_RAM2_DO;
wire   [7:0]W_RAM3_DO;
wire   [7:0]W_RAMDK3B_DO;

//  ROM DATA
wire   [7:0]W_ROM_DO;

//  H&V COUNTER
wire   [9:0]W_H_CNT;
//wire   [7:0]W_V_CNT;
wire   W_H_BLANKn;
wire   W_V_BLANKn;
wire   W_C_BLANKn;


wire   [7:0]W_VRAM_DB;
wire   [7:0]W_OBJ_DI;

wire   W_CPU_WAITn;
wire   W_CPU_RFSHn;
wire   W_CPU_M1n;
wire   W_CPU_NMIn;
wire   W_CPU_IORQn;
wire   W_CPU_MREQn;
wire   W_CPU_BUSRQ;
wire   W_CPU_BUSAKn;
wire   W_CPU_RDn;
wire   W_CPU_WRn;
wire   [15:0]W_CPU_A;

assign WB_CLK_12288M = W_CLK_12288M; // 12.288MHz
//wire   W_CPU_CLK = W_H_CNT[1];       //  3.072MHz
wire   W_CPU_CLK_EN_P = W_H_CNT[1:0] == 2'b01;
wire   W_CPU_CLK_EN_N = W_H_CNT[1:0] == 2'b11;

T80pa z80core(
	.RESET_n(W_RESETn),
	.CLK(I_CLK_24576M),
	.CEN_p(W_CPU_CLK_EN_N),
	.CEN_n(W_CPU_CLK_EN_P),
	.WAIT_n((W_CPU_WAITn | (W_CPU_IORQn & W_CPU_MREQn)) & (~paused)),
	.INT_n(1'b1),
	.NMI_n(W_CPU_NMIn),
	.BUSRQ_n(~W_CPU_BUSRQ),
	.BUSAK_n(W_CPU_BUSAKn),
	.M1_n(W_CPU_M1n),
	.IORQ_n(W_CPU_IORQn),
	.MREQ_n(W_CPU_MREQn),
	.RD_n(W_CPU_RDn),
	.WR_n(W_CPU_WRn),
	.RFSH_n(W_CPU_RFSHn),
	.A(W_CPU_A),
	.DI(ZDO),
	.DO(ZDI)
	);
//=========   CPU  DATA BUS[7:0]    ==============================================
wire   [7:0]WO_D = W_SW_DO | W_RAM1_DO |W_RAM2_DO |W_RAM3_DO |W_RAMDK3B_DO | W_ROM_DO | W_VRAM_DB ;
assign ZDO = WO_D;

wire  [11:0]OBJ_ROM_A;
reg   [7:0]OBJ_ROM1_DO,OBJ_ROM2_DO,OBJ_ROM3_DO,OBJ_ROM4_DO;

wire   [7:0]WB_ROM_DO;
assign W_ROM_DO = (~W_ROM_CSn & ~W_CPU_RDn)? WB_ROM_DO :8'h00;

//---------------------------------------------------------
/*
prog ROM(
	.clk(I_CLK_24576M),
	.addr(W_CPU_A[13:0]),
	.data(WB_ROM_DO)
);
*/
//assign MAIN_CPU_A = W_CPU_A[13:0];

always @(*) begin
	case({!I_DKJR, W_CPU_A[15:11]})
		6'h02: MAIN_CPU_A = {5'h06,W_CPU_A[10:0]}; // 0x1000-0x17FF -> 0x3000-0x37FF in ROM file
		6'h03: MAIN_CPU_A = {5'h0B,W_CPU_A[10:0]}; // 0x1800-0x1FFF -> 0x5800-0x5FFF in ROM file
		6'h05: MAIN_CPU_A = {5'h09,W_CPU_A[10:0]}; // 0x2800-0x2FFF -> 0x4800-0x4FFF in ROM file
		6'h06: MAIN_CPU_A = {5'h02,W_CPU_A[10:0]}; // 0x3000-0x37FF -> 0x1000-0x17FF in ROM file
		6'h07: MAIN_CPU_A = {5'h03,W_CPU_A[10:0]}; // 0x3800-0x3FFF -> 0x1800-0x1FFF in ROM file
		6'h09: MAIN_CPU_A = {5'h05,W_CPU_A[10:0]}; // 0x4800-0x4FFF -> 0x2800-0x2FFF in ROM file
		6'h0B: MAIN_CPU_A = {5'h07,W_CPU_A[10:0]}; // 0x5800-0x5FFF -> 0x3800-0x3FFF in ROM file
		//pestplace
		6'h16: MAIN_CPU_A = {5'h0C,W_CPU_A[10:0]}; // 0xB000-0xB7FF -> 0x6000-0x6FFF in ROM file
		6'h17: MAIN_CPU_A = {5'h0D,W_CPU_A[10:0]}; // 0xB800-0xBFFF -> 0x6000-0x6FFF in ROM file
		// dkong3b
		6'h12: MAIN_CPU_A = {5'h0C,W_CPU_A[10:0]}; // 0x9000-0x97FF -> 0x6000-0x6FFF in ROM file
		6'h13: MAIN_CPU_A = {5'h0D,W_CPU_A[10:0]}; // 0x9800-0x9FFF -> 0x6000-0x6FFF in ROM file
		6'h1A: MAIN_CPU_A = {5'h0E,W_CPU_A[10:0]}; // 0xD000-0xD7FF -> 0x7000-0x7FFF in ROM file
		6'h1B: MAIN_CPU_A = {5'h0F,W_CPU_A[10:0]}; // 0xD800-0xDFFF -> 0x7000-0x7FFF in ROM file
		default: MAIN_CPU_A = W_CPU_A[15:0];
	endcase
end
assign WB_ROM_DO = MAIN_CPU_DO;

// HIGHSCORES
wire hs_cs_RAM1  = hs_address[15:11] == 5'b01100;
wire hs_cs_RAM3  = hs_address[15:10] == 6'b011010;
wire hs_cs_RAMDK3  = hs_address[15:10] == 6'b011011;
wire hs_cs_VRAM = hs_address[15:12] == 4'b0111;
wire [7:0]	hs_data_out_RAM1;
wire [7:0]	hs_data_out_RAM3;
wire [7:0]	hs_data_out_RAMDK3;
wire [7:0]	hs_data_out_VRAM;
assign hs_data_out = hs_cs_RAM1 ? hs_data_out_RAM1 :
							hs_cs_RAM3 ? hs_data_out_RAM3 :
							hs_cs_RAMDK3 ? hs_data_out_RAMDK3 :
							hs_cs_VRAM ? hs_data_out_VRAM : 8'h0;

//========   INT RAM Interface  ==================================================

ram_1024_8_8 U_3C4C
(
	.I_CLKA(I_CLK_24576M),
	.I_ADDRA(W_CPU_A[9:0]),
	.I_DA(WI_D),
	.I_CEA(~W_RAM1_CSn),
	.I_WEA(~W_CPU_WRn),
	.O_DA(W_RAM1_DO),

	.I_CLKB(I_CLK_24576M),
	.I_ADDRB(hs_address[9:0]),
	.I_DB(hs_data_in),
	.I_CEB(hs_cs_RAM1),
	.I_WEB(hs_write),
	.O_DB(hs_data_out_RAM1)
);

ram_1024_8 U_3B4B
(
	.I_CLK(I_CLK_24576M),
	.I_ADDR(W_CPU_A[9:0]),
	.I_D(WI_D),
	.I_CE(~W_RAM2_CSn),
	.I_WE(~W_CPU_WRn),
	.O_D(W_RAM2_DO)
);

ram_1024_8_8 U_DK3BRAM
(
	.I_CLKA(I_CLK_24576M),
	.I_ADDRA(W_CPU_A[9:0]),
	.I_DA(WI_D),
	.I_CEA(~W_RAMDK3B_CSn),
	.I_WEA(~W_CPU_WRn),
	.O_DA(W_RAMDK3B_DO),

	.I_CLKB(I_CLK_24576M),
	.I_ADDRB(hs_address[9:0]),
	.I_DB(hs_data_in),
	.I_CEB(hs_cs_RAMDK3),
	.I_WEB(hs_write),
	.O_DB(hs_data_out_RAMDK3)
);

//=============== Sprite DMA ======================

wire   [9:0]W_OBJ_AB = {W_2PSL, W_H_CNT[8:0]};

wire [9:0]W_DMA_A;
wire [7:0]W_DMA_D;
wire W_DMA_CE;

wire [9:0]W_DMA_AB;
wire [7:0]W_DMA_DB;
wire W_DMA_CEB;

wire hs_access_RAM3 = hs_access & hs_cs_RAM3;
wire [9:0]RAM3_ADDR = hs_access_RAM3 ? hs_address[9:0] : W_CPU_A[9:0];
wire      RAM3_CE = hs_access_RAM3 ? hs_cs_RAM3 : ~W_RAM3_CSn;
wire      RAM3_WE = hs_access_RAM3 ? hs_write : ~W_CPU_WRn;
wire [7:0]RAM3_DIN = hs_access_RAM3 ? hs_data_in : WI_D;
wire [7:0]RAM3_DOUT;
assign W_RAM3_DO = ~hs_access_RAM3 ? RAM3_DOUT : 8'b0;
assign hs_data_out_RAM3 = hs_access_RAM3 ? RAM3_DOUT : 8'b0;

ram_1024_8_8 U_3A4A
(
	//   A Port
	.I_CLKA(I_CLK_24576M),
	.I_ADDRA(RAM3_ADDR),
	.I_DA(RAM3_DIN),
	.I_CEA(RAM3_CE),
	.I_WEA(RAM3_WE),
	.O_DA(RAM3_DOUT),
	//   B Port
	.I_CLKB(I_CLK_24576M),
	.I_ADDRB(W_DMA_A),
	.I_DB(8'h00),
	.I_CEB(W_DMA_CE),
	.I_WEB(1'b0),
	.O_DB(W_DMA_D)
);

dkong_dma sprite_dma
(
	.I_CLK(I_CLK_24576M),
	.I_CLK_EN(W_CPU_CLK_EN_P),// 3.072 Mhz
	.I_DMA_TRIG(W_DREQ),
	.I_DMA_DS(W_DMA_D),
	.I_HLDA(~W_CPU_BUSAKn),

	.O_HRQ(W_CPU_BUSRQ),
	.O_DMA_AS(W_DMA_A),
	.O_DMA_AD(W_DMA_AB),
	.O_DMA_DD(W_DMA_DB),
	.O_DMA_CES(W_DMA_CE),
	.O_DMA_CED(W_DMA_CEB)
);

ram_1024_8_8 U_6PR
(
	//   A Port
	.I_CLKA(I_CLK_24576M),
	.I_ADDRA(W_DMA_AB),
	.I_DA(W_DMA_DB),
	.I_CEA(W_DMA_CEB),
	.I_WEA(1'b1),
	.O_DA(),
	//   B Port
	.I_CLKB(I_CLK_24576M),
	.I_ADDRB(W_OBJ_AB[9:0]),
	.I_DB(8'h00),
	.I_CEB(1'b1),
	.I_WEB(1'b0),
	.O_DB(W_OBJ_DI)
);

//=========== SW Interface ========================================================
wire        W_SACK;
wire   [7:0]W_SW1 = W_SW1_OEn ?  8'h00: ~{1'b1,1'b1,1'b1,I_J1,I_D1,I_U1,I_L1,I_R1};
wire   [7:0]W_SW2 = W_SW2_OEn ?  8'h00: ~{1'b1,1'b1,1'b1,I_J2,I_D2,I_U2,I_L2,I_R2};
wire   [7:0]W_SW3 = W_SW3_OEn ?  8'h00: ~{I_C1,~I_RADARSCP | W_SACK,1'b1,1'b1,I_S2,I_S1,1'b1,1'b1};
wire   [7:0]W_DIP = W_DIP_OEn ?  8'h00:  I_DIP_SW;


assign  W_SW_DO = W_SW1 | W_SW2 | W_SW3 | W_DIP;
//========   Address Decoder  =====================================================
wire   W_VRAMBUSYn;

dkong_adec adec
(
	.I_CLK24M(I_CLK_24576M),
	.I_CLK_EN_P(W_CPU_CLK_EN_P),
	.I_CLK_EN_N(W_CPU_CLK_EN_N),
	.I_RESET_n(W_RESETn),
	.I_DKJR(I_DKJR),
	.I_DK3B(I_DK3B),
	.I_PESTPLCE(I_PESTPLCE),
	.I_AB(W_CPU_A),
	.I_DB(WI_D),
	.I_MREQ_n(W_CPU_MREQn),
	.I_RFSH_n(W_CPU_RFSHn),
	.I_RD_n(W_CPU_RDn),
	.I_WR_n(W_CPU_WRn),
	.I_VRAMBUSY_n(W_VRAMBUSYn),
	.I_VBLK_n(W_V_BLANKn),
	.O_WAIT_n(W_CPU_WAITn),
	.O_NMI_n(W_CPU_NMIn),
	.O_ROM_CS_n(W_ROM_CSn),
	.O_RAM1_CS_n(W_RAM1_CSn),
	.O_RAM2_CS_n(W_RAM2_CSn),
	.O_RAM3_CS_n(W_RAM3_CSn),
	.O_RAMDK3B_CS_n(W_RAMDK3B_CSn),
	.O_DMA_CS_n(/*O_DMA_CSn*/),
	.O_6A_G_n(/*W_6A_Gn*/),
	.O_OBJ_RQ_n(W_OBJ_RQn),
	.O_OBJ_RD_n(W_OBJ_RDn),
	.O_OBJ_WR_n(W_OBJ_WRn),
	.O_VRAM_RD_n(W_VRAM_RDn),
	.O_VRAM_WR_n(W_VRAM_WRn),
	.O_SW1_OE_n(W_SW1_OEn),
	.O_SW2_OE_n(W_SW2_OEn),
	.O_SW3_OE_n(W_SW3_OEn),
	.O_DIP_OE_n(W_DIP_OEn),
	.O_4H_Q(W_4H_Q),
	.O_5H_Q(W_5H_Q),
	.O_6H_Q(W_6H_Q),
	.O_3D_Q(W_3D_Q),
	.O_AREF(W_AREF)
);

wire   W_DISPLAY = W_5H_Q[1]; // radar enable
wire   W_FLIPn = I_PESTPLCE ^ W_5H_Q[2];
wire   W_2PSL  = W_5H_Q[3];
wire   W_DREQ  = W_5H_Q[5]; // DMA Trigger

//===========   VIDEO MODULE ( Donkey Kong )   ===================================
//========  Assign Wire  =========================================================
wire   [7:0]W_VF_CNT;
wire   [5:0]W_OBJ_DAT;
wire   W_FLIP_VRAM;
wire   W_FLIP_HV;
wire   W_L_CMPBLKn;
wire   [3:0]W_VRAM_COL;
wire   [1:0]W_VRAM_VID;

//========   H & V Counter   =====================================================

dkong_hv_count hv
(
	// input
	.I_CLK(W_CLK_24576M),
	.RST_n(W_RESETn),
	.V_FLIP(W_FLIP_HV),
	.H_OFFSET(H_OFFSET),
	.V_OFFSET(V_OFFSET),
	// output
	.O_CLK(W_CLK_12288M),
	.O_CLK_EN(W_CLK_12288M_EN),
	.H_CNT(W_H_CNT),
	.V_CNT(/*W_V_CNT*/),
	.VF_CNT(W_VF_CNT),
	.H_BLANKn(W_H_BLANKn),
	.V_BLANKn(W_V_BLANKn),
	.C_BLANKn(W_C_BLANKn),
	.H_SYNCn(O_VGA_H_SYNCn),
	.V_SYNCn(O_VGA_V_SYNCn)
);

//========    OBJ (VIDEO)    =====================================================

dkong_obj obj
(
	// input
	.CLK_24M(W_CLK_24576M),
	.CLK_12M(WB_CLK_12288M),
	.CLK_12M_EN(W_CLK_12288M_EN),
	.I_PESTPLCE(I_PESTPLCE),
	.I_AB(),
//	.I_DB(/*W_2N_DO*/),
	.I_OBJ_D(W_OBJ_DI),
	.I_OBJ_WRn(1'b1),
	.I_OBJ_RDn(1'b1),
	.I_OBJ_RQn(1'b1),
	.I_2PSL(W_2PSL),
	.I_FLIPn(W_FLIPn),
	.I_H_CNT(W_H_CNT),
	.I_VF_CNT(W_VF_CNT),
	.I_CMPBLKn(W_C_BLANKn),
	// Debug output
	.O_OBJ_DO(W_OBJ_DAT),
	.O_FLIP_VRAM(W_FLIP_VRAM),
	.O_FLIP_HV(W_FLIP_HV),
	.O_L_CMPBLKn(W_L_CMPBLKn),

	.DL_ADDR(DL_ADDR),
	.DL_WR(DL_WR),
	.DL_DATA(DL_DATA),

	.flip_screen(flip_screen)
);

dkong_vram vram
(
	// input
	.CLK_24M(W_CLK_24576M),
	.CLK_EN(W_CLK_12288M),
	.I_AB(W_CPU_A[9:0]),
	.I_DB(WI_D),
	.I_VRAM_WRn(W_VRAM_WRn),
	.I_VRAM_RDn(W_VRAM_RDn),
	.I_FLIP(W_FLIP_VRAM),
	.I_H_CNT(W_H_CNT),
	.I_VF_CNT(W_VF_CNT),
	.I_CMPBLK(W_C_BLANKn),
	.I_4H_Q0(W_4H_Q[0]),
	//  Debug output
	.O_DB(W_VRAM_DB),
	.O_COL(W_VRAM_COL),
	.O_VID(W_VRAM_VID),
	.O_VRAMBUSYn(W_VRAMBUSYn),
	.O_ESBLKn(),

	.DL_ADDR(DL_ADDR),
	.DL_WR(DL_WR),
	.DL_DATA(DL_DATA),

	.hs_address(hs_address),
	.hs_data_in(hs_data_in),
	.hs_data_out(hs_data_out_VRAM),
	.hs_write(hs_cs_VRAM & hs_write)
);

wire W_RADARn;
wire W_STARn;
wire W_NOISE;
wire W_DISPLAY_O;

radarscp_stars rstars
(
	.CLK_24M(W_CLK_24576M),
	.CLK_EN(W_CLK_12288M),
	.RESETn(W_RESETn),
	.O_RADARn(W_RADARn),
	.O_STARn(W_STARn),
	.O_NOISE(W_NOISE),
	.O_DISPLAY(W_DISPLAY_O),
	.I_DISPLAY(W_DISPLAY),
	.I_VBLKn(W_V_BLANKn),
	.I_H_CNT(W_H_CNT),
	.I_FLIPn(W_FLIPn),
	.I_SOU2(W_6H_Q[2]),

	.DL_ADDR(DL_ADDR),
	.DL_WR(DL_WR),
	.DL_DATA(DL_DATA)
);

assign O_PIX = W_H_CNT[0];
wire [3:0] W_RED;
wire [3:0] W_GREEN;
wire [3:0] W_BLUE;
wire [2:0] W_AREF;
wire [2:0] W_GRID = {3{W_L_CMPBLKn & W_DISPLAY_O & ~W_RADARn & I_RADARSCP}} & W_AREF;
wire       W_STAR = W_L_CMPBLKn & W_NOISE & ~W_STARn & I_RADARSCP;
wire [4:0] W_RED_TOTAL = W_RED + {W_GRID[0] | W_STAR, 3'b000};
wire [4:0] W_GREEN_TOTAL = W_GREEN + {W_GRID[1] & ~W_STAR, 3'b000};
wire [4:0] W_BLUE_TOTAL = W_BLUE + {W_GRID[2] & ~W_STAR, I_RADARSCP & W_L_CMPBLKn, I_RADARSCP & W_L_CMPBLKn, 1'b0};
assign O_VGA_R = W_RED_TOTAL[4] ? 4'hF : W_RED_TOTAL[3:0];
assign O_VGA_G = W_GREEN_TOTAL[4] ? 4'hF : W_GREEN_TOTAL[3:0];
assign O_VGA_B = W_BLUE_TOTAL[4] ? 4'hF : W_BLUE_TOTAL[3:0];

dkong_col_pal cpal
(
	// input
	.CLK_24M(W_CLK_24576M),
	.CLK_6M_EN(W_CLK_12288M & !W_H_CNT[0]),
	.I_DK3B(I_DK3B),
	.I_PESTPLCE(I_PESTPLCE),
	.I_VRAM_D({W_VRAM_COL[3:0],W_VRAM_VID[1:0]}),
	.I_OBJ_D(W_OBJ_DAT),
	.I_CMPBLKn(W_L_CMPBLKn),
	.I_5H_Q6(W_5H_Q[6]),
	.I_5H_Q7(W_5H_Q[7]),
	.O_R(W_RED),
	.O_G(W_GREEN),
	.O_B(W_BLUE),

	.DL_ADDR(DL_ADDR),
	.DL_WR(DL_WR),
	.DL_DATA(DL_DATA)
);

dkong_soundboard dkong_soundboard(
	.W_CLK_24576M(W_CLK_24576M & ~paused),
	.W_RESETn(W_RESETn),
	.use_emulated_sfx(use_emulated_sfx),
	.I_DKJR(I_DKJR),
	.O_SOUND_DAT(O_SOUND_DAT),
	.O_SACK(W_SACK),
	.W_6H_Q(W_6H_Q),
	.W_5H_Q0(W_5H_Q[0]),
	.W_4H_Q(W_4H_Q),
	.W_3D_Q(W_3D_Q),
	.ROM_A(SND_ROM_A),
	.ROM_D(SND_ROM_DO),
	.WAV_ROM_A(WAV_ROM_A),
	.WAV_ROM_DO(WAV_ROM_DO)
	);

endmodule
