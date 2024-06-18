// This program was cloned from: https://github.com/neogeodev/NeoChips
// License: GNU General Public License v2.0

// SNK NEO-D0 logic definition
// 2020 Sean 'furrtek' Gonsalves - See LICENSE file
// TESTED: Clocks, Z80 subsystem signals
// UNTESTED: BNK and controller OUT outputs

module neo_d0(
	input [5:0] M68K_DATA,
	output [2:0] P1_OUT,
	output [2:0] P2_OUT,
	output nSDZ80R, nSDZ80W, nSDZ80CLR,
	output nSDROM, nSDMRD, nSDMWR,
	output nZRAMCS,
	input [15:11] SDA_H,
	input XIN,
	output XOUT,
	input nRESET,
	input nRESETP,
	output CLK_24M,
	output CLK_12M,
	output reg CLK_68KCLK,
	output CLK_68KCLKB,
	output CLK_6MB,
	output reg CLK_1MB,
	input [4:2] SDA_L,
	output reg nZ80NMI,
	input nSDW,
	input nSDRD, nSDWR, nMREQ, nIORQ,
	output nSDRD0, nSDRD1,
	output n2610CS, n2610RD, n2610WR,
	output [2:0] BNK,
	input nBITWD0,
	input M68K_ADDR_A4
);

	assign XOUT = ~XIN;
	assign CLK_24M = XOUT;
	
	reg [2:0] REG_BNK;
	reg [5:0] REG_OUT;
	
	assign {P2_OUT, P1_OUT} = nRESETP ? REG_OUT : 6'b000000;
	assign BNK = nRESETP ? REG_BNK : 3'b000;

	always @(negedge nBITWD0) begin
		if (M68K_ADDR_A4)
			REG_BNK <= M68K_DATA[2:0];
		else
			REG_OUT <= M68K_DATA[5:0];
	end
	

	reg nNMI_EN;
	wire nIORD, nIOWR;
	wire nNMI_SET, nNMI_RESET;
	
	// $0000~$F7FF: ROM
	// $F800~$FFFF: RAM
	assign nSDROM = &{SDA_H};
	assign nZRAMCS = ~nSDROM;

	assign nSDMRD = nMREQ | nSDRD;	// RAM read
	assign nSDMWR = nMREQ | nSDWR;	// RAM write
	
	assign nIORD = nIORQ | nSDRD;	// Port read
	assign nIOWR = nIORQ | nSDWR;	// Port write

	// Port $x0, $x1, $x2, $x3 read
	assign nSDZ80R = (nIORD | SDA_L[3] | SDA_L[2]);
	// Port $x0, $x1, $x2, $x3 write
	assign nSDZ80CLR = (nIOWR | SDA_L[3] | SDA_L[2]);
	
	// Port $x4, $x5, $x6, $x7 read
	assign n2610RD = (nIORD | SDA_L[3] | ~SDA_L[2]);
	// Port $x4, $x5, $x6, $x7 write
	assign n2610WR = (nIOWR | SDA_L[3] | ~SDA_L[2]);
	assign n2610CS = n2610RD & n2610WR;
	
	// Port $x8, $x9, $xA, $xB read
	assign nSDRD0 = (nIORD | ~SDA_L[3] | SDA_L[2]);
	// Port $x8, $x9, $xA, $xB write
	assign nNMI_SET = (nIOWR | ~SDA_L[3] | SDA_L[2]);
	
	// Port $xC, $xD, $xE, $xF read
	assign nSDRD1 = (nIORD | ~SDA_L[3] | ~SDA_L[2]);
	// Port $xC, $xD, $xE, $xF write
	assign nSDZ80W = (nIOWR | ~SDA_L[3] | ~SDA_L[2]);

	assign nNMI_RESET = nSDZ80R & nRESET;
	
	// NMI enable DFF
	always @(posedge nNMI_SET or negedge nRESET) begin
		if (!nRESET)
			nNMI_EN <= 1'b1;
		else
			nNMI_EN <= SDA_L[4];
	end
	
	// NMI trig DFF
	always @(posedge nSDW or negedge nNMI_RESET) begin
		if (!nNMI_RESET)
			nZ80NMI <= 1'b1;
		else
			nZ80NMI <= nNMI_EN;
	end

	reg [2:0] CLK_DIV;
	wire CLK_3M;
	
	// MV4 C4:A
	always @(posedge CLK_24M)
		CLK_68KCLK <= ~CLK_68KCLK;
	
	assign CLK_68KCLKB = ~CLK_68KCLK;
	
	always @(negedge CLK_24M or negedge nRESETP) begin
		if (!nRESETP)
			CLK_DIV <= 3'b100;
		else
			CLK_DIV <= CLK_DIV + 1'b1;
	end
	
	assign CLK_12M = CLK_DIV[0];
	assign CLK_6MB = ~CLK_DIV[1];
	assign CLK_3M = CLK_DIV[2];
		
	// MV4 C4:B
	always @(posedge CLK_12M)
		CLK_1MB <= ~CLK_3M;
	
endmodule

