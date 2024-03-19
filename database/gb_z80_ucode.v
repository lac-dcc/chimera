module z80_ucode(u, clock, resetn, ucode);

input [15:0] u;
input clock;
input resetn;
output reg [42:0] ucode;

parameter D_0       = 5'h00;
parameter D_PC      = 5'h01;
parameter D_UC      = 5'h02;
parameter D_A       = 5'h03;
parameter D_B       = 5'h04;
parameter D_C       = 5'h05;
parameter D_D       = 5'h06;
parameter D_E       = 5'h07;
parameter D_H       = 5'h08;
parameter D_L       = 5'h09;
parameter D_AF      = 5'h0a;
parameter D_BC      = 5'h0b;
parameter D_DE      = 5'h0c;
parameter D_HL      = 5'h0d;
parameter D_SP      = 5'h0e;
parameter D_IE      = 5'h0f;
parameter D_IACK    = 5'h10;
parameter D_TEMP    = 5'h11;
parameter D_DATA    = 5'h12;

parameter OR        = 5'h00;
parameter AND       = 5'h01;
parameter XOR       = 5'h02;
parameter CPL       = 5'h03;
parameter ADD2      = 5'h04;
parameter ADD       = 5'h05;
parameter ADC       = 5'h06;
parameter SUB       = 5'h07;
parameter SBC       = 5'h08;
parameter RLC       = 5'h09;
parameter RL        = 5'h0a;
parameter RRC       = 5'h0b;
parameter RR        = 5'h0c;
parameter SLA       = 5'h0d;
parameter SRA       = 5'h0e;
parameter SRL       = 5'h0f;
parameter SWAP      = 5'h10;
parameter SWAP2     = 5'h11;
parameter DAA       = 5'h12;

parameter A_0       = 5'h00;
parameter A_1       = 5'h01;
parameter A_8       = 5'h02;
parameter A_10      = 5'h03;
parameter A_18      = 5'h04;
parameter A_20      = 5'h05;
parameter A_28      = 5'h06;
parameter A_30      = 5'h07;
parameter A_38      = 5'h08;
parameter A_PC      = 5'h09;
parameter A_UC      = 5'h0a;
parameter A_D16     = 5'h0b;
parameter A_D8      = 5'h0c;
parameter A_A       = 5'h0d;
parameter A_B       = 5'h0e;
parameter A_C       = 5'h0f;
parameter A_D       = 5'h10;
parameter A_E       = 5'h11;
parameter A_H       = 5'h12;
parameter A_L       = 5'h13;
parameter A_AF      = 5'h14;
parameter A_BC      = 5'h15;
parameter A_DE      = 5'h16;
parameter A_HL      = 5'h17;
parameter A_SP      = 5'h18;
parameter A_IADDR   = 5'h19;
parameter A_TEMP    = 5'h1a;
parameter A_MASK    = 5'h1b;

parameter B_0       = 5'h00;
parameter B_1       = 5'h01;
parameter B_2       = 5'h02;
parameter B_4       = 5'h03;
parameter B_8       = 5'h04;
parameter B_10      = 5'h05;
parameter B_20      = 5'h06;
parameter B_40      = 5'h07;
parameter B_80      = 5'h08;
parameter B_fe      = 5'h09;
parameter B_fd      = 5'h0a;
parameter B_fb      = 5'h0b;
parameter B_f7      = 5'h0c;
parameter B_ef      = 5'h0d;
parameter B_df      = 5'h0e;
parameter B_bf      = 5'h0f;
parameter B_7f      = 5'h10;
parameter B_D8      = 5'h11;
parameter B_A       = 5'h12;
parameter B_F       = 5'h13;
parameter B_B       = 5'h14;
parameter B_C       = 5'h15;
parameter B_D       = 5'h16;
parameter B_E       = 5'h17;
parameter B_H       = 5'h18;
parameter B_L       = 5'h19;
parameter B_BC      = 5'h1a;
parameter B_DE      = 5'h1b;
parameter B_HL      = 5'h1c;
parameter B_SP      = 5'h1d;
parameter B_IE      = 5'h1e;

parameter CC_xxxx   = 5'h00;
parameter CC_Z0Hx   = 5'h01;
parameter CC_Z1Hx   = 5'h02;
parameter CC_000C   = 5'h03;
parameter CC_x0HC   = 5'h04;
parameter CC_Zx0C   = 5'h05;
parameter CC_x11x   = 5'h06;
parameter CC_x001   = 5'h07;
parameter CC_Z0HC   = 5'h08;
parameter CC_x00x   = 5'h09;
parameter CC_Z1HC   = 5'h0a;
parameter CC_Z010   = 5'h0b;
parameter CC_Z000   = 5'h0c;
parameter CC_00HC   = 5'h0d;
parameter CC_ZNHC   = 5'h0e;
parameter CC_Z00C   = 5'h0f;
parameter CC_Z01x   = 5'h10;


always @(posedge clock or negedge resetn) begin
    if (!resetn) begin
        ucode <= {16'h0041, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    end else begin 
    casex (u)
    // Fetch
    16'h0000: ucode <= {16'h0001, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
    16'h0001: ucode <= {16'h0002, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    16'h0002: ucode <= {16'h0010, D_UC, OR, A_UC, B_D8, 2'b00, CC_xxxx};
    // CB Extensions
    16'hcb10: ucode <= {16'hcb11, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    16'hcb11: ucode <= {16'hcb12, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
    16'hcb12: ucode <= {16'hcb13, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    16'hcb13: ucode <= {16'h0020, D_UC, OR, A_UC, B_D8, 2'b00, CC_xxxx};
    // Halt
    16'h7610: ucode <= {16'h0070, D_UC, OR, A_UC, B_IE, 2'b00, CC_xxxx};
    16'h0070: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    16'h0170: ucode <= {16'h0170, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    // Interrupt Handling
    16'h0050: ucode <= {16'h0051, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
    16'h0051: ucode <= {16'h0052, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
    16'h0052: ucode <= {16'h0053, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
    16'h0053: ucode <= {16'h0054, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    16'h0054: ucode <= {16'h0055, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
    16'h0055: ucode <= {16'h0056, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
    16'h0056: ucode <= {16'h0057, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    
    16'h0057: ucode <= {16'h0058, D_PC, OR, A_IADDR, B_0, 2'b00, CC_xxxx};
    16'h0058: ucode <= {16'h0059, D_IE, OR, A_0, B_0, 2'b00, CC_xxxx};
    16'h0059: ucode <= {16'h0000, D_IACK, OR, A_1, B_0, 2'b00, CC_xxxx};
    
    
    
    ////// BEGIN GENERATED INSTRUCTIONS ///////
    	// NOP
	16'h0010: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// LD BC,d16
	16'h0110: ucode <= {16'h0111, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h0111: ucode <= {16'h0112, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0112: ucode <= {16'h0113, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'h0113: ucode <= {16'h0114, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h0114: ucode <= {16'h0115, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0115: ucode <= {16'h0043, D_BC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// LD (BC),A
	16'h0210: ucode <= {16'h0211, D_DATA, OR, A_A, B_0, 2'b00, CC_xxxx};
	16'h0211: ucode <= {16'h0212, D_0, OR, A_BC, B_0, 2'b01, CC_xxxx};
	16'h0212: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// INC BC
	16'h0310: ucode <= {16'h0044, D_BC, ADD, A_BC, B_1, 2'b00, CC_xxxx};
	// INC B
	16'h0410: ucode <= {16'h0000, D_B, ADD, A_B, B_1, 2'b00, CC_Z0Hx};
	// DEC B
	16'h0510: ucode <= {16'h0000, D_B, SUB, A_B, B_1, 2'b00, CC_Z1Hx};
	// LD B,d8
	16'h0610: ucode <= {16'h0611, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h0611: ucode <= {16'h0612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0612: ucode <= {16'h0042, D_B, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// RLCA
	16'h0710: ucode <= {16'h0000, D_A, RLC, A_A, B_0, 2'b00, CC_000C};
	// LD (a16),SP
	16'h0810: ucode <= {16'h0811, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h0811: ucode <= {16'h0812, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0812: ucode <= {16'h0813, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'h0813: ucode <= {16'h0814, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h0814: ucode <= {16'h0815, D_DATA, OR, A_SP, B_0, 2'b00, CC_xxxx};
	16'h0815: ucode <= {16'h0816, D_TEMP, ADD, A_D16, B_1, 2'b01, CC_xxxx};
	16'h0816: ucode <= {16'h0817, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0817: ucode <= {16'h0818, D_DATA, SWAP2, A_SP, B_0, 2'b00, CC_xxxx};
	16'h0818: ucode <= {16'h0819, D_0, OR, A_TEMP, B_0, 2'b01, CC_xxxx};
	16'h0819: ucode <= {16'h0047, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// ADD HL,BC
	16'h0910: ucode <= {16'h0044, D_HL, ADD2, A_HL, B_BC, 2'b00, CC_x0HC};
	// LD A,(BC)
	16'h0a10: ucode <= {16'h0a11, D_0, OR, A_BC, B_0, 2'b10, CC_xxxx};
	16'h0a11: ucode <= {16'h0a12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0a12: ucode <= {16'h0042, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// DEC BC
	16'h0b10: ucode <= {16'h0044, D_BC, SUB, A_BC, B_1, 2'b00, CC_xxxx};
	// INC C
	16'h0c10: ucode <= {16'h0000, D_C, ADD, A_C, B_1, 2'b00, CC_Z0Hx};
	// DEC C
	16'h0d10: ucode <= {16'h0000, D_C, SUB, A_C, B_1, 2'b00, CC_Z1Hx};
	// LD C,d8
	16'h0e10: ucode <= {16'h0e11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h0e11: ucode <= {16'h0e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0e12: ucode <= {16'h0042, D_C, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// RRCA
	16'h0f10: ucode <= {16'h0000, D_A, RRC, A_A, B_0, 2'b00, CC_000C};
	// STOP 0
	16'h1010: ucode <= {16'h0000, D_PC, SUB, A_PC, B_1, 2'b00, CC_xxxx};
	// LD DE,d16
	16'h1110: ucode <= {16'h1111, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h1111: ucode <= {16'h1112, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h1112: ucode <= {16'h1113, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'h1113: ucode <= {16'h1114, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h1114: ucode <= {16'h1115, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h1115: ucode <= {16'h0043, D_DE, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// LD (DE),A
	16'h1210: ucode <= {16'h1211, D_DATA, OR, A_A, B_0, 2'b00, CC_xxxx};
	16'h1211: ucode <= {16'h1212, D_0, OR, A_DE, B_0, 2'b01, CC_xxxx};
	16'h1212: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// INC DE
	16'h1310: ucode <= {16'h0044, D_DE, ADD, A_DE, B_1, 2'b00, CC_xxxx};
	// INC D
	16'h1410: ucode <= {16'h0000, D_D, ADD, A_D, B_1, 2'b00, CC_Z0Hx};
	// DEC D
	16'h1510: ucode <= {16'h0000, D_D, SUB, A_D, B_1, 2'b00, CC_Z1Hx};
	// LD D,d8
	16'h1610: ucode <= {16'h1611, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h1611: ucode <= {16'h1612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h1612: ucode <= {16'h0042, D_D, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// RLA
	16'h1710: ucode <= {16'h0000, D_A, RL, A_A, B_0, 2'b00, CC_000C};
	// JR r8
	16'h1810: ucode <= {16'h1811, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h1811: ucode <= {16'h1812, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h1812: ucode <= {16'h0046, D_PC, ADD, A_PC, B_D8, 2'b00, CC_xxxx};
	// ADD HL,DE
	16'h1910: ucode <= {16'h0044, D_HL, ADD2, A_HL, B_DE, 2'b00, CC_x0HC};
	// LD A,(DE)
	16'h1a10: ucode <= {16'h1a11, D_0, OR, A_DE, B_0, 2'b10, CC_xxxx};
	16'h1a11: ucode <= {16'h1a12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h1a12: ucode <= {16'h0042, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// DEC DE
	16'h1b10: ucode <= {16'h0044, D_DE, SUB, A_DE, B_1, 2'b00, CC_xxxx};
	// INC E
	16'h1c10: ucode <= {16'h0000, D_E, ADD, A_E, B_1, 2'b00, CC_Z0Hx};
	// DEC E
	16'h1d10: ucode <= {16'h0000, D_E, SUB, A_E, B_1, 2'b00, CC_Z1Hx};
	// LD E,d8
	16'h1e10: ucode <= {16'h1e11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h1e11: ucode <= {16'h1e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h1e12: ucode <= {16'h0042, D_E, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// RRA
	16'h1f10: ucode <= {16'h0000, D_A, RR, A_A, B_0, 2'b00, CC_000C};
	// JR NZ,r8
	16'h2010: ucode <= {16'h0030, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'b0xxx, 12'h30}: ucode <= {16'h2012, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'b1xxx, 12'h30}: ucode <= {16'h0043, D_PC, ADD, A_PC, B_1, 2'b00, CC_xxxx};
	16'h2012: ucode <= {16'h2013, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h2013: ucode <= {16'h2014, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2014: ucode <= {16'h0044, D_PC, ADD, A_PC, B_D8, 2'b00, CC_xxxx};
	// LD HL,d16
	16'h2110: ucode <= {16'h2111, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h2111: ucode <= {16'h2112, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2112: ucode <= {16'h2113, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'h2113: ucode <= {16'h2114, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h2114: ucode <= {16'h2115, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2115: ucode <= {16'h0043, D_HL, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// LD (HL+),A
	16'h2210: ucode <= {16'h2211, D_DATA, OR, A_A, B_0, 2'b00, CC_xxxx};
	16'h2211: ucode <= {16'h2212, D_HL, ADD, A_HL, B_1, 2'b01, CC_xxxx};
	16'h2212: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// INC HL
	16'h2310: ucode <= {16'h0044, D_HL, ADD, A_HL, B_1, 2'b00, CC_xxxx};
	// INC H
	16'h2410: ucode <= {16'h0000, D_H, ADD, A_H, B_1, 2'b00, CC_Z0Hx};
	// DEC H
	16'h2510: ucode <= {16'h0000, D_H, SUB, A_H, B_1, 2'b00, CC_Z1Hx};
	// LD H,d8
	16'h2610: ucode <= {16'h2611, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h2611: ucode <= {16'h2612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2612: ucode <= {16'h0042, D_H, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// DAA
	16'h2710: ucode <= {16'h0000, D_A, DAA, A_A, B_0, 2'b00, CC_Zx0C};
	// JR Z,r8
	16'h2810: ucode <= {16'h0031, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'b1xxx, 12'h31}: ucode <= {16'h2812, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'b0xxx, 12'h31}: ucode <= {16'h0043, D_PC, ADD, A_PC, B_1, 2'b00, CC_xxxx};
	16'h2812: ucode <= {16'h2813, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h2813: ucode <= {16'h2814, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2814: ucode <= {16'h0044, D_PC, ADD, A_PC, B_D8, 2'b00, CC_xxxx};
	// ADD HL,HL
	16'h2910: ucode <= {16'h0044, D_HL, ADD2, A_HL, B_HL, 2'b00, CC_x0HC};
	// LD A,(HL+)
	16'h2a10: ucode <= {16'h2a11, D_HL, ADD, A_HL, B_1, 2'b10, CC_xxxx};
	16'h2a11: ucode <= {16'h2a12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2a12: ucode <= {16'h0042, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// DEC HL
	16'h2b10: ucode <= {16'h0044, D_HL, SUB, A_HL, B_1, 2'b00, CC_xxxx};
	// INC L
	16'h2c10: ucode <= {16'h0000, D_L, ADD, A_L, B_1, 2'b00, CC_Z0Hx};
	// DEC L
	16'h2d10: ucode <= {16'h0000, D_L, SUB, A_L, B_1, 2'b00, CC_Z1Hx};
	// LD L,d8
	16'h2e10: ucode <= {16'h2e11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h2e11: ucode <= {16'h2e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2e12: ucode <= {16'h0042, D_L, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// CPL
	16'h2f10: ucode <= {16'h0000, D_A, CPL, A_A, B_0, 2'b00, CC_x11x};
	// JR NC,r8
	16'h3010: ucode <= {16'h0032, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'bxxx0, 12'h32}: ucode <= {16'h3012, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'bxxx1, 12'h32}: ucode <= {16'h0043, D_PC, ADD, A_PC, B_1, 2'b00, CC_xxxx};
	16'h3012: ucode <= {16'h3013, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h3013: ucode <= {16'h3014, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3014: ucode <= {16'h0044, D_PC, ADD, A_PC, B_D8, 2'b00, CC_xxxx};
	// LD SP,d16
	16'h3110: ucode <= {16'h3111, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h3111: ucode <= {16'h3112, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3112: ucode <= {16'h3113, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'h3113: ucode <= {16'h3114, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h3114: ucode <= {16'h3115, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3115: ucode <= {16'h0043, D_SP, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// LD (HL-),A
	16'h3210: ucode <= {16'h3211, D_DATA, OR, A_A, B_0, 2'b00, CC_xxxx};
	16'h3211: ucode <= {16'h3212, D_HL, SUB, A_HL, B_1, 2'b01, CC_xxxx};
	16'h3212: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// INC SP
	16'h3310: ucode <= {16'h0044, D_SP, ADD, A_SP, B_1, 2'b00, CC_xxxx};
	// INC (HL)
	16'h3410: ucode <= {16'h3411, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h3411: ucode <= {16'h3412, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3412: ucode <= {16'h3413, D_DATA, ADD, A_D8, B_1, 2'b00, CC_Z0Hx};
	16'h3413: ucode <= {16'h3414, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h3414: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// DEC (HL)
	16'h3510: ucode <= {16'h3511, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h3511: ucode <= {16'h3512, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3512: ucode <= {16'h3513, D_DATA, SUB, A_D8, B_1, 2'b00, CC_Z1Hx};
	16'h3513: ucode <= {16'h3514, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h3514: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// LD (HL),d8
	16'h3610: ucode <= {16'h3611, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h3611: ucode <= {16'h3612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3612: ucode <= {16'h3613, D_DATA, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'h3613: ucode <= {16'h3614, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h3614: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SCF
	16'h3710: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_x001};
	// JR C,r8
	16'h3810: ucode <= {16'h0033, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'bxxx1, 12'h33}: ucode <= {16'h3812, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'bxxx0, 12'h33}: ucode <= {16'h0043, D_PC, ADD, A_PC, B_1, 2'b00, CC_xxxx};
	16'h3812: ucode <= {16'h3813, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h3813: ucode <= {16'h3814, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3814: ucode <= {16'h0044, D_PC, ADD, A_PC, B_D8, 2'b00, CC_xxxx};
	// ADD HL,SP
	16'h3910: ucode <= {16'h0044, D_HL, ADD2, A_HL, B_SP, 2'b00, CC_x0HC};
	// LD A,(HL-)
	16'h3a10: ucode <= {16'h3a11, D_HL, SUB, A_HL, B_1, 2'b10, CC_xxxx};
	16'h3a11: ucode <= {16'h3a12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3a12: ucode <= {16'h0042, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// DEC SP
	16'h3b10: ucode <= {16'h0044, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	// INC A
	16'h3c10: ucode <= {16'h0000, D_A, ADD, A_A, B_1, 2'b00, CC_Z0Hx};
	// DEC A
	16'h3d10: ucode <= {16'h0000, D_A, SUB, A_A, B_1, 2'b00, CC_Z1Hx};
	// LD A,d8
	16'h3e10: ucode <= {16'h3e11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'h3e11: ucode <= {16'h3e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3e12: ucode <= {16'h0042, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// CCF
	16'h3f10: ucode <= {16'h0000, D_AF, XOR, A_AF, B_10, 2'b00, CC_x00x};
	// LD B,B
	16'h4010: ucode <= {16'h0000, D_B, OR, A_B, B_0, 2'b00, CC_xxxx};
	// LD B,C
	16'h4110: ucode <= {16'h0000, D_B, OR, A_C, B_0, 2'b00, CC_xxxx};
	// LD B,D
	16'h4210: ucode <= {16'h0000, D_B, OR, A_D, B_0, 2'b00, CC_xxxx};
	// LD B,E
	16'h4310: ucode <= {16'h0000, D_B, OR, A_E, B_0, 2'b00, CC_xxxx};
	// LD B,H
	16'h4410: ucode <= {16'h0000, D_B, OR, A_H, B_0, 2'b00, CC_xxxx};
	// LD B,L
	16'h4510: ucode <= {16'h0000, D_B, OR, A_L, B_0, 2'b00, CC_xxxx};
	// LD B,(HL)
	16'h4610: ucode <= {16'h4611, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h4611: ucode <= {16'h4612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h4612: ucode <= {16'h0042, D_B, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// LD B,A
	16'h4710: ucode <= {16'h0000, D_B, OR, A_A, B_0, 2'b00, CC_xxxx};
	// LD C,B
	16'h4810: ucode <= {16'h0000, D_C, OR, A_B, B_0, 2'b00, CC_xxxx};
	// LD C,C
	16'h4910: ucode <= {16'h0000, D_C, OR, A_C, B_0, 2'b00, CC_xxxx};
	// LD C,D
	16'h4a10: ucode <= {16'h0000, D_C, OR, A_D, B_0, 2'b00, CC_xxxx};
	// LD C,E
	16'h4b10: ucode <= {16'h0000, D_C, OR, A_E, B_0, 2'b00, CC_xxxx};
	// LD C,H
	16'h4c10: ucode <= {16'h0000, D_C, OR, A_H, B_0, 2'b00, CC_xxxx};
	// LD C,L
	16'h4d10: ucode <= {16'h0000, D_C, OR, A_L, B_0, 2'b00, CC_xxxx};
	// LD C,(HL)
	16'h4e10: ucode <= {16'h4e11, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h4e11: ucode <= {16'h4e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h4e12: ucode <= {16'h0042, D_C, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// LD C,A
	16'h4f10: ucode <= {16'h0000, D_C, OR, A_A, B_0, 2'b00, CC_xxxx};
	// LD D,B
	16'h5010: ucode <= {16'h0000, D_D, OR, A_B, B_0, 2'b00, CC_xxxx};
	// LD D,C
	16'h5110: ucode <= {16'h0000, D_D, OR, A_C, B_0, 2'b00, CC_xxxx};
	// LD D,D
	16'h5210: ucode <= {16'h0000, D_D, OR, A_D, B_0, 2'b00, CC_xxxx};
	// LD D,E
	16'h5310: ucode <= {16'h0000, D_D, OR, A_E, B_0, 2'b00, CC_xxxx};
	// LD D,H
	16'h5410: ucode <= {16'h0000, D_D, OR, A_H, B_0, 2'b00, CC_xxxx};
	// LD D,L
	16'h5510: ucode <= {16'h0000, D_D, OR, A_L, B_0, 2'b00, CC_xxxx};
	// LD D,(HL)
	16'h5610: ucode <= {16'h5611, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h5611: ucode <= {16'h5612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h5612: ucode <= {16'h0042, D_D, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// LD D,A
	16'h5710: ucode <= {16'h0000, D_D, OR, A_A, B_0, 2'b00, CC_xxxx};
	// LD E,B
	16'h5810: ucode <= {16'h0000, D_E, OR, A_B, B_0, 2'b00, CC_xxxx};
	// LD E,C
	16'h5910: ucode <= {16'h0000, D_E, OR, A_C, B_0, 2'b00, CC_xxxx};
	// LD E,D
	16'h5a10: ucode <= {16'h0000, D_E, OR, A_D, B_0, 2'b00, CC_xxxx};
	// LD E,E
	16'h5b10: ucode <= {16'h0000, D_E, OR, A_E, B_0, 2'b00, CC_xxxx};
	// LD E,H
	16'h5c10: ucode <= {16'h0000, D_E, OR, A_H, B_0, 2'b00, CC_xxxx};
	// LD E,L
	16'h5d10: ucode <= {16'h0000, D_E, OR, A_L, B_0, 2'b00, CC_xxxx};
	// LD E,(HL)
	16'h5e10: ucode <= {16'h5e11, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h5e11: ucode <= {16'h5e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h5e12: ucode <= {16'h0042, D_E, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// LD E,A
	16'h5f10: ucode <= {16'h0000, D_E, OR, A_A, B_0, 2'b00, CC_xxxx};
	// LD H,B
	16'h6010: ucode <= {16'h0000, D_H, OR, A_B, B_0, 2'b00, CC_xxxx};
	// LD H,C
	16'h6110: ucode <= {16'h0000, D_H, OR, A_C, B_0, 2'b00, CC_xxxx};
	// LD H,D
	16'h6210: ucode <= {16'h0000, D_H, OR, A_D, B_0, 2'b00, CC_xxxx};
	// LD H,E
	16'h6310: ucode <= {16'h0000, D_H, OR, A_E, B_0, 2'b00, CC_xxxx};
	// LD H,H
	16'h6410: ucode <= {16'h0000, D_H, OR, A_H, B_0, 2'b00, CC_xxxx};
	// LD H,L
	16'h6510: ucode <= {16'h0000, D_H, OR, A_L, B_0, 2'b00, CC_xxxx};
	// LD H,(HL)
	16'h6610: ucode <= {16'h6611, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h6611: ucode <= {16'h6612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h6612: ucode <= {16'h0042, D_H, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// LD H,A
	16'h6710: ucode <= {16'h0000, D_H, OR, A_A, B_0, 2'b00, CC_xxxx};
	// LD L,B
	16'h6810: ucode <= {16'h0000, D_L, OR, A_B, B_0, 2'b00, CC_xxxx};
	// LD L,C
	16'h6910: ucode <= {16'h0000, D_L, OR, A_C, B_0, 2'b00, CC_xxxx};
	// LD L,D
	16'h6a10: ucode <= {16'h0000, D_L, OR, A_D, B_0, 2'b00, CC_xxxx};
	// LD L,E
	16'h6b10: ucode <= {16'h0000, D_L, OR, A_E, B_0, 2'b00, CC_xxxx};
	// LD L,H
	16'h6c10: ucode <= {16'h0000, D_L, OR, A_H, B_0, 2'b00, CC_xxxx};
	// LD L,L
	16'h6d10: ucode <= {16'h0000, D_L, OR, A_L, B_0, 2'b00, CC_xxxx};
	// LD L,(HL)
	16'h6e10: ucode <= {16'h6e11, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h6e11: ucode <= {16'h6e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h6e12: ucode <= {16'h0042, D_L, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// LD L,A
	16'h6f10: ucode <= {16'h0000, D_L, OR, A_A, B_0, 2'b00, CC_xxxx};
	// LD (HL),B
	16'h7010: ucode <= {16'h7011, D_DATA, OR, A_B, B_0, 2'b00, CC_xxxx};
	16'h7011: ucode <= {16'h7012, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h7012: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// LD (HL),C
	16'h7110: ucode <= {16'h7111, D_DATA, OR, A_C, B_0, 2'b00, CC_xxxx};
	16'h7111: ucode <= {16'h7112, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h7112: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// LD (HL),D
	16'h7210: ucode <= {16'h7211, D_DATA, OR, A_D, B_0, 2'b00, CC_xxxx};
	16'h7211: ucode <= {16'h7212, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h7212: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// LD (HL),E
	16'h7310: ucode <= {16'h7311, D_DATA, OR, A_E, B_0, 2'b00, CC_xxxx};
	16'h7311: ucode <= {16'h7312, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h7312: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// LD (HL),H
	16'h7410: ucode <= {16'h7411, D_DATA, OR, A_H, B_0, 2'b00, CC_xxxx};
	16'h7411: ucode <= {16'h7412, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h7412: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// LD (HL),L
	16'h7510: ucode <= {16'h7511, D_DATA, OR, A_L, B_0, 2'b00, CC_xxxx};
	16'h7511: ucode <= {16'h7512, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h7512: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// HALT
	// LD (HL),A
	16'h7710: ucode <= {16'h7711, D_DATA, OR, A_A, B_0, 2'b00, CC_xxxx};
	16'h7711: ucode <= {16'h7712, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h7712: ucode <= {16'h0042, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// LD A,B
	16'h7810: ucode <= {16'h0000, D_A, OR, A_B, B_0, 2'b00, CC_xxxx};
	// LD A,C
	16'h7910: ucode <= {16'h0000, D_A, OR, A_C, B_0, 2'b00, CC_xxxx};
	// LD A,D
	16'h7a10: ucode <= {16'h0000, D_A, OR, A_D, B_0, 2'b00, CC_xxxx};
	// LD A,E
	16'h7b10: ucode <= {16'h0000, D_A, OR, A_E, B_0, 2'b00, CC_xxxx};
	// LD A,H
	16'h7c10: ucode <= {16'h0000, D_A, OR, A_H, B_0, 2'b00, CC_xxxx};
	// LD A,L
	16'h7d10: ucode <= {16'h0000, D_A, OR, A_L, B_0, 2'b00, CC_xxxx};
	// LD A,(HL)
	16'h7e10: ucode <= {16'h7e11, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h7e11: ucode <= {16'h7e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h7e12: ucode <= {16'h0042, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// LD A,A
	16'h7f10: ucode <= {16'h0000, D_A, OR, A_A, B_0, 2'b00, CC_xxxx};
	// ADD A,B
	16'h8010: ucode <= {16'h0000, D_A, ADD, A_A, B_B, 2'b00, CC_Z0HC};
	// ADD A,C
	16'h8110: ucode <= {16'h0000, D_A, ADD, A_A, B_C, 2'b00, CC_Z0HC};
	// ADD A,D
	16'h8210: ucode <= {16'h0000, D_A, ADD, A_A, B_D, 2'b00, CC_Z0HC};
	// ADD A,E
	16'h8310: ucode <= {16'h0000, D_A, ADD, A_A, B_E, 2'b00, CC_Z0HC};
	// ADD A,H
	16'h8410: ucode <= {16'h0000, D_A, ADD, A_A, B_H, 2'b00, CC_Z0HC};
	// ADD A,L
	16'h8510: ucode <= {16'h0000, D_A, ADD, A_A, B_L, 2'b00, CC_Z0HC};
	// ADD A,(HL)
	16'h8610: ucode <= {16'h8611, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h8611: ucode <= {16'h8612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h8612: ucode <= {16'h0042, D_A, ADD, A_A, B_D8, 2'b00, CC_Z0HC};
	// ADD A,A
	16'h8710: ucode <= {16'h0000, D_A, ADD, A_A, B_A, 2'b00, CC_Z0HC};
	// ADC A,B
	16'h8810: ucode <= {16'h0000, D_A, ADC, A_A, B_B, 2'b00, CC_Z0HC};
	// ADC A,C
	16'h8910: ucode <= {16'h0000, D_A, ADC, A_A, B_C, 2'b00, CC_Z0HC};
	// ADC A,D
	16'h8a10: ucode <= {16'h0000, D_A, ADC, A_A, B_D, 2'b00, CC_Z0HC};
	// ADC A,E
	16'h8b10: ucode <= {16'h0000, D_A, ADC, A_A, B_E, 2'b00, CC_Z0HC};
	// ADC A,H
	16'h8c10: ucode <= {16'h0000, D_A, ADC, A_A, B_H, 2'b00, CC_Z0HC};
	// ADC A,L
	16'h8d10: ucode <= {16'h0000, D_A, ADC, A_A, B_L, 2'b00, CC_Z0HC};
	// ADC A,(HL)
	16'h8e10: ucode <= {16'h8e11, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h8e11: ucode <= {16'h8e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h8e12: ucode <= {16'h0042, D_A, ADC, A_A, B_D8, 2'b00, CC_Z0HC};
	// ADC A,A
	16'h8f10: ucode <= {16'h0000, D_A, ADC, A_A, B_A, 2'b00, CC_Z0HC};
	// SUB B
	16'h9010: ucode <= {16'h0000, D_A, SUB, A_A, B_B, 2'b00, CC_Z1HC};
	// SUB C
	16'h9110: ucode <= {16'h0000, D_A, SUB, A_A, B_C, 2'b00, CC_Z1HC};
	// SUB D
	16'h9210: ucode <= {16'h0000, D_A, SUB, A_A, B_D, 2'b00, CC_Z1HC};
	// SUB E
	16'h9310: ucode <= {16'h0000, D_A, SUB, A_A, B_E, 2'b00, CC_Z1HC};
	// SUB H
	16'h9410: ucode <= {16'h0000, D_A, SUB, A_A, B_H, 2'b00, CC_Z1HC};
	// SUB L
	16'h9510: ucode <= {16'h0000, D_A, SUB, A_A, B_L, 2'b00, CC_Z1HC};
	// SUB (HL)
	16'h9610: ucode <= {16'h9611, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h9611: ucode <= {16'h9612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h9612: ucode <= {16'h0042, D_A, SUB, A_A, B_D8, 2'b00, CC_Z1HC};
	// SUB A
	16'h9710: ucode <= {16'h0000, D_A, SUB, A_A, B_A, 2'b00, CC_Z1HC};
	// SBC A,B
	16'h9810: ucode <= {16'h0000, D_A, SBC, A_A, B_B, 2'b00, CC_Z1HC};
	// SBC A,C
	16'h9910: ucode <= {16'h0000, D_A, SBC, A_A, B_C, 2'b00, CC_Z1HC};
	// SBC A,D
	16'h9a10: ucode <= {16'h0000, D_A, SBC, A_A, B_D, 2'b00, CC_Z1HC};
	// SBC A,E
	16'h9b10: ucode <= {16'h0000, D_A, SBC, A_A, B_E, 2'b00, CC_Z1HC};
	// SBC A,H
	16'h9c10: ucode <= {16'h0000, D_A, SBC, A_A, B_H, 2'b00, CC_Z1HC};
	// SBC A,L
	16'h9d10: ucode <= {16'h0000, D_A, SBC, A_A, B_L, 2'b00, CC_Z1HC};
	// SBC A,(HL)
	16'h9e10: ucode <= {16'h9e11, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h9e11: ucode <= {16'h9e12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h9e12: ucode <= {16'h0042, D_A, SBC, A_A, B_D8, 2'b00, CC_Z1HC};
	// SBC A,A
	16'h9f10: ucode <= {16'h0000, D_A, SBC, A_A, B_A, 2'b00, CC_Z1HC};
	// AND B
	16'ha010: ucode <= {16'h0000, D_A, AND, A_A, B_B, 2'b00, CC_Z010};
	// AND C
	16'ha110: ucode <= {16'h0000, D_A, AND, A_A, B_C, 2'b00, CC_Z010};
	// AND D
	16'ha210: ucode <= {16'h0000, D_A, AND, A_A, B_D, 2'b00, CC_Z010};
	// AND E
	16'ha310: ucode <= {16'h0000, D_A, AND, A_A, B_E, 2'b00, CC_Z010};
	// AND H
	16'ha410: ucode <= {16'h0000, D_A, AND, A_A, B_H, 2'b00, CC_Z010};
	// AND L
	16'ha510: ucode <= {16'h0000, D_A, AND, A_A, B_L, 2'b00, CC_Z010};
	// AND (HL)
	16'ha610: ucode <= {16'ha611, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'ha611: ucode <= {16'ha612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'ha612: ucode <= {16'h0042, D_A, AND, A_A, B_D8, 2'b00, CC_Z010};
	// AND A
	16'ha710: ucode <= {16'h0000, D_A, AND, A_A, B_A, 2'b00, CC_Z010};
	// XOR B
	16'ha810: ucode <= {16'h0000, D_A, XOR, A_A, B_B, 2'b00, CC_Z000};
	// XOR C
	16'ha910: ucode <= {16'h0000, D_A, XOR, A_A, B_C, 2'b00, CC_Z000};
	// XOR D
	16'haa10: ucode <= {16'h0000, D_A, XOR, A_A, B_D, 2'b00, CC_Z000};
	// XOR E
	16'hab10: ucode <= {16'h0000, D_A, XOR, A_A, B_E, 2'b00, CC_Z000};
	// XOR H
	16'hac10: ucode <= {16'h0000, D_A, XOR, A_A, B_H, 2'b00, CC_Z000};
	// XOR L
	16'had10: ucode <= {16'h0000, D_A, XOR, A_A, B_L, 2'b00, CC_Z000};
	// XOR (HL)
	16'hae10: ucode <= {16'hae11, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hae11: ucode <= {16'hae12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hae12: ucode <= {16'h0042, D_A, XOR, A_A, B_D8, 2'b00, CC_Z000};
	// XOR A
	16'haf10: ucode <= {16'h0000, D_A, XOR, A_A, B_A, 2'b00, CC_Z000};
	// OR B
	16'hb010: ucode <= {16'h0000, D_A, OR, A_A, B_B, 2'b00, CC_Z000};
	// OR C
	16'hb110: ucode <= {16'h0000, D_A, OR, A_A, B_C, 2'b00, CC_Z000};
	// OR D
	16'hb210: ucode <= {16'h0000, D_A, OR, A_A, B_D, 2'b00, CC_Z000};
	// OR E
	16'hb310: ucode <= {16'h0000, D_A, OR, A_A, B_E, 2'b00, CC_Z000};
	// OR H
	16'hb410: ucode <= {16'h0000, D_A, OR, A_A, B_H, 2'b00, CC_Z000};
	// OR L
	16'hb510: ucode <= {16'h0000, D_A, OR, A_A, B_L, 2'b00, CC_Z000};
	// OR (HL)
	16'hb610: ucode <= {16'hb611, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hb611: ucode <= {16'hb612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hb612: ucode <= {16'h0042, D_A, OR, A_A, B_D8, 2'b00, CC_Z000};
	// OR A
	16'hb710: ucode <= {16'h0000, D_A, OR, A_A, B_A, 2'b00, CC_Z000};
	// CP B
	16'hb810: ucode <= {16'h0000, D_0, SUB, A_A, B_B, 2'b00, CC_Z1HC};
	// CP C
	16'hb910: ucode <= {16'h0000, D_0, SUB, A_A, B_C, 2'b00, CC_Z1HC};
	// CP D
	16'hba10: ucode <= {16'h0000, D_0, SUB, A_A, B_D, 2'b00, CC_Z1HC};
	// CP E
	16'hbb10: ucode <= {16'h0000, D_0, SUB, A_A, B_E, 2'b00, CC_Z1HC};
	// CP H
	16'hbc10: ucode <= {16'h0000, D_0, SUB, A_A, B_H, 2'b00, CC_Z1HC};
	// CP L
	16'hbd10: ucode <= {16'h0000, D_0, SUB, A_A, B_L, 2'b00, CC_Z1HC};
	// CP (HL)
	16'hbe10: ucode <= {16'hbe11, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hbe11: ucode <= {16'hbe12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hbe12: ucode <= {16'h0042, D_0, SUB, A_A, B_D8, 2'b00, CC_Z1HC};
	// CP A
	16'hbf10: ucode <= {16'h0000, D_0, SUB, A_A, B_A, 2'b00, CC_Z1HC};
	// RET NZ
	16'hc010: ucode <= {16'h0034, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'b0xxx, 12'h34}: ucode <= {16'hc012, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'b1xxx, 12'h34}: ucode <= {16'h0043, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc012: ucode <= {16'hc013, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hc013: ucode <= {16'hc014, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc014: ucode <= {16'hc015, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hc015: ucode <= {16'hc016, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hc016: ucode <= {16'hc017, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc017: ucode <= {16'h0049, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// POP BC
	16'hc110: ucode <= {16'hc111, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hc111: ucode <= {16'hc112, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc112: ucode <= {16'hc113, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hc113: ucode <= {16'hc114, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hc114: ucode <= {16'hc115, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc115: ucode <= {16'h0043, D_BC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// JP NZ,a16
	16'hc210: ucode <= {16'h0035, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'b0xxx, 12'h35}: ucode <= {16'hc212, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'b1xxx, 12'h35}: ucode <= {16'h0047, D_PC, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hc212: ucode <= {16'hc213, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hc213: ucode <= {16'hc214, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc214: ucode <= {16'hc215, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hc215: ucode <= {16'hc216, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hc216: ucode <= {16'hc217, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc217: ucode <= {16'h0045, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// JP a16
	16'hc310: ucode <= {16'hc311, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hc311: ucode <= {16'hc312, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc312: ucode <= {16'hc313, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hc313: ucode <= {16'hc314, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hc314: ucode <= {16'hc315, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc315: ucode <= {16'h0047, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// CALL NZ,a16
	16'hc410: ucode <= {16'h0036, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'b0xxx, 12'h36}: ucode <= {16'hc412, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'b1xxx, 12'h36}: ucode <= {16'h0047, D_PC, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hc412: ucode <= {16'hc413, D_TEMP, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hc413: ucode <= {16'hc414, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hc414: ucode <= {16'hc415, D_DATA, SWAP2, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hc415: ucode <= {16'hc416, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hc416: ucode <= {16'hc417, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc417: ucode <= {16'hc418, D_DATA, OR, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hc418: ucode <= {16'hc419, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hc419: ucode <= {16'hc41a, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc41a: ucode <= {16'hc41b, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hc41b: ucode <= {16'hc41c, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc41c: ucode <= {16'hc41d, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hc41d: ucode <= {16'hc41e, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hc41e: ucode <= {16'hc41f, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc41f: ucode <= {16'h0045, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// PUSH BC
	16'hc510: ucode <= {16'hc511, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hc511: ucode <= {16'hc512, D_DATA, SWAP2, A_BC, B_0, 2'b00, CC_xxxx};
	16'hc512: ucode <= {16'hc513, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hc513: ucode <= {16'hc514, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc514: ucode <= {16'hc515, D_DATA, OR, A_BC, B_0, 2'b00, CC_xxxx};
	16'hc515: ucode <= {16'hc516, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hc516: ucode <= {16'h0046, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// ADD A,d8
	16'hc610: ucode <= {16'hc611, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hc611: ucode <= {16'hc612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc612: ucode <= {16'h0042, D_A, ADD, A_A, B_D8, 2'b00, CC_Z0HC};
	// RST 00H
	16'hc710: ucode <= {16'hc711, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hc711: ucode <= {16'hc712, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
	16'hc712: ucode <= {16'hc713, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hc713: ucode <= {16'hc714, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc714: ucode <= {16'hc715, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
	16'hc715: ucode <= {16'hc716, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hc716: ucode <= {16'hc717, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc717: ucode <= {16'h0045, D_PC, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RET Z
	16'hc810: ucode <= {16'h0037, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'b1xxx, 12'h37}: ucode <= {16'hc812, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'b0xxx, 12'h37}: ucode <= {16'h0043, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc812: ucode <= {16'hc813, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hc813: ucode <= {16'hc814, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc814: ucode <= {16'hc815, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hc815: ucode <= {16'hc816, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hc816: ucode <= {16'hc817, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc817: ucode <= {16'h0049, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// RET
	16'hc910: ucode <= {16'hc911, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hc911: ucode <= {16'hc912, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc912: ucode <= {16'hc913, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hc913: ucode <= {16'hc914, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hc914: ucode <= {16'hc915, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc915: ucode <= {16'h0047, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// JP Z,a16
	16'hca10: ucode <= {16'h0038, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'b1xxx, 12'h38}: ucode <= {16'hca12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'b0xxx, 12'h38}: ucode <= {16'h0047, D_PC, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hca12: ucode <= {16'hca13, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hca13: ucode <= {16'hca14, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hca14: ucode <= {16'hca15, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hca15: ucode <= {16'hca16, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hca16: ucode <= {16'hca17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hca17: ucode <= {16'h0045, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// PREFIX CB
	// CALL Z,a16
	16'hcc10: ucode <= {16'h0039, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'b1xxx, 12'h39}: ucode <= {16'hcc12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'b0xxx, 12'h39}: ucode <= {16'h0047, D_PC, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hcc12: ucode <= {16'hcc13, D_TEMP, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hcc13: ucode <= {16'hcc14, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hcc14: ucode <= {16'hcc15, D_DATA, SWAP2, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hcc15: ucode <= {16'hcc16, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hcc16: ucode <= {16'hcc17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcc17: ucode <= {16'hcc18, D_DATA, OR, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hcc18: ucode <= {16'hcc19, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hcc19: ucode <= {16'hcc1a, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcc1a: ucode <= {16'hcc1b, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hcc1b: ucode <= {16'hcc1c, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcc1c: ucode <= {16'hcc1d, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hcc1d: ucode <= {16'hcc1e, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hcc1e: ucode <= {16'hcc1f, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcc1f: ucode <= {16'h0045, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// CALL a16
	16'hcd10: ucode <= {16'hcd11, D_TEMP, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hcd11: ucode <= {16'hcd12, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hcd12: ucode <= {16'hcd13, D_DATA, SWAP2, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hcd13: ucode <= {16'hcd14, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hcd14: ucode <= {16'hcd15, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcd15: ucode <= {16'hcd16, D_DATA, OR, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hcd16: ucode <= {16'hcd17, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hcd17: ucode <= {16'hcd18, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcd18: ucode <= {16'hcd19, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hcd19: ucode <= {16'hcd1a, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcd1a: ucode <= {16'hcd1b, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hcd1b: ucode <= {16'hcd1c, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hcd1c: ucode <= {16'hcd1d, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcd1d: ucode <= {16'h0047, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// ADC A,d8
	16'hce10: ucode <= {16'hce11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hce11: ucode <= {16'hce12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hce12: ucode <= {16'h0042, D_A, ADC, A_A, B_D8, 2'b00, CC_Z0HC};
	// RST 08H
	16'hcf10: ucode <= {16'hcf11, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hcf11: ucode <= {16'hcf12, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
	16'hcf12: ucode <= {16'hcf13, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hcf13: ucode <= {16'hcf14, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcf14: ucode <= {16'hcf15, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
	16'hcf15: ucode <= {16'hcf16, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hcf16: ucode <= {16'hcf17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hcf17: ucode <= {16'h0045, D_PC, OR, A_8, B_0, 2'b00, CC_xxxx};
	// RET NC
	16'hd010: ucode <= {16'h003a, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'bxxx0, 12'h3a}: ucode <= {16'hd012, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'bxxx1, 12'h3a}: ucode <= {16'h0043, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd012: ucode <= {16'hd013, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hd013: ucode <= {16'hd014, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd014: ucode <= {16'hd015, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hd015: ucode <= {16'hd016, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hd016: ucode <= {16'hd017, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd017: ucode <= {16'h0049, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// POP DE
	16'hd110: ucode <= {16'hd111, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hd111: ucode <= {16'hd112, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd112: ucode <= {16'hd113, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hd113: ucode <= {16'hd114, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hd114: ucode <= {16'hd115, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd115: ucode <= {16'h0043, D_DE, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// JP NC,a16
	16'hd210: ucode <= {16'h003b, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'bxxx0, 12'h3b}: ucode <= {16'hd212, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'bxxx1, 12'h3b}: ucode <= {16'h0047, D_PC, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hd212: ucode <= {16'hd213, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hd213: ucode <= {16'hd214, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd214: ucode <= {16'hd215, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hd215: ucode <= {16'hd216, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hd216: ucode <= {16'hd217, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd217: ucode <= {16'h0045, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// NOP
	16'hd310: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// CALL NC,a16
	16'hd410: ucode <= {16'h003c, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'bxxx0, 12'h3c}: ucode <= {16'hd412, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'bxxx1, 12'h3c}: ucode <= {16'h0047, D_PC, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hd412: ucode <= {16'hd413, D_TEMP, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hd413: ucode <= {16'hd414, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hd414: ucode <= {16'hd415, D_DATA, SWAP2, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hd415: ucode <= {16'hd416, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hd416: ucode <= {16'hd417, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd417: ucode <= {16'hd418, D_DATA, OR, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hd418: ucode <= {16'hd419, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hd419: ucode <= {16'hd41a, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd41a: ucode <= {16'hd41b, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hd41b: ucode <= {16'hd41c, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd41c: ucode <= {16'hd41d, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hd41d: ucode <= {16'hd41e, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hd41e: ucode <= {16'hd41f, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd41f: ucode <= {16'h0045, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// PUSH DE
	16'hd510: ucode <= {16'hd511, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hd511: ucode <= {16'hd512, D_DATA, SWAP2, A_DE, B_0, 2'b00, CC_xxxx};
	16'hd512: ucode <= {16'hd513, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hd513: ucode <= {16'hd514, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd514: ucode <= {16'hd515, D_DATA, OR, A_DE, B_0, 2'b00, CC_xxxx};
	16'hd515: ucode <= {16'hd516, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hd516: ucode <= {16'h0046, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SUB d8
	16'hd610: ucode <= {16'hd611, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hd611: ucode <= {16'hd612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd612: ucode <= {16'h0042, D_A, SUB, A_A, B_D8, 2'b00, CC_Z1HC};
	// RST 10H
	16'hd710: ucode <= {16'hd711, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hd711: ucode <= {16'hd712, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
	16'hd712: ucode <= {16'hd713, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hd713: ucode <= {16'hd714, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd714: ucode <= {16'hd715, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
	16'hd715: ucode <= {16'hd716, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hd716: ucode <= {16'hd717, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd717: ucode <= {16'h0045, D_PC, OR, A_10, B_0, 2'b00, CC_xxxx};
	// RET C
	16'hd810: ucode <= {16'h003d, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'bxxx1, 12'h3d}: ucode <= {16'hd812, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'bxxx0, 12'h3d}: ucode <= {16'h0043, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd812: ucode <= {16'hd813, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hd813: ucode <= {16'hd814, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd814: ucode <= {16'hd815, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hd815: ucode <= {16'hd816, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hd816: ucode <= {16'hd817, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd817: ucode <= {16'h0049, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// RETI
	16'hd910: ucode <= {16'hd911, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hd911: ucode <= {16'hd912, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd912: ucode <= {16'hd913, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hd913: ucode <= {16'hd914, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hd914: ucode <= {16'hd915, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd915: ucode <= {16'hd916, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	16'hd916: ucode <= {16'h0046, D_IE, OR, A_1, B_0, 2'b00, CC_xxxx};
	// JP C,a16
	16'hda10: ucode <= {16'h003e, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'bxxx1, 12'h3e}: ucode <= {16'hda12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'bxxx0, 12'h3e}: ucode <= {16'h0047, D_PC, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hda12: ucode <= {16'hda13, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hda13: ucode <= {16'hda14, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hda14: ucode <= {16'hda15, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hda15: ucode <= {16'hda16, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hda16: ucode <= {16'hda17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hda17: ucode <= {16'h0045, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// NOP
	16'hdb10: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// CALL C,a16
	16'hdc10: ucode <= {16'h003f, D_UC, OR, A_UC, B_F, 2'b00, CC_xxxx};
	{4'bxxx1, 12'h3f}: ucode <= {16'hdc12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	{4'bxxx0, 12'h3f}: ucode <= {16'h0047, D_PC, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hdc12: ucode <= {16'hdc13, D_TEMP, ADD, A_PC, B_2, 2'b00, CC_xxxx};
	16'hdc13: ucode <= {16'hdc14, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hdc14: ucode <= {16'hdc15, D_DATA, SWAP2, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hdc15: ucode <= {16'hdc16, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hdc16: ucode <= {16'hdc17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hdc17: ucode <= {16'hdc18, D_DATA, OR, A_TEMP, B_0, 2'b00, CC_xxxx};
	16'hdc18: ucode <= {16'hdc19, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hdc19: ucode <= {16'hdc1a, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hdc1a: ucode <= {16'hdc1b, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hdc1b: ucode <= {16'hdc1c, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hdc1c: ucode <= {16'hdc1d, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hdc1d: ucode <= {16'hdc1e, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hdc1e: ucode <= {16'hdc1f, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hdc1f: ucode <= {16'h0045, D_PC, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// NOP
	16'hdd10: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SBC A,d8
	16'hde10: ucode <= {16'hde11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hde11: ucode <= {16'hde12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hde12: ucode <= {16'h0042, D_A, SBC, A_A, B_D8, 2'b00, CC_Z1HC};
	// RST 18H
	16'hdf10: ucode <= {16'hdf11, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hdf11: ucode <= {16'hdf12, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
	16'hdf12: ucode <= {16'hdf13, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hdf13: ucode <= {16'hdf14, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hdf14: ucode <= {16'hdf15, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
	16'hdf15: ucode <= {16'hdf16, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hdf16: ucode <= {16'hdf17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hdf17: ucode <= {16'h0045, D_PC, OR, A_18, B_0, 2'b00, CC_xxxx};
	// LDH (a8),A
	16'he010: ucode <= {16'he011, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'he011: ucode <= {16'he012, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he012: ucode <= {16'he013, D_TEMP, OR, A_MASK, B_D8, 2'b00, CC_xxxx};
	16'he013: ucode <= {16'he014, D_DATA, OR, A_A, B_0, 2'b00, CC_xxxx};
	16'he014: ucode <= {16'he015, D_0, OR, A_TEMP, B_0, 2'b01, CC_xxxx};
	16'he015: ucode <= {16'h0043, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// POP HL
	16'he110: ucode <= {16'he111, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'he111: ucode <= {16'he112, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he112: ucode <= {16'he113, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'he113: ucode <= {16'he114, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'he114: ucode <= {16'he115, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he115: ucode <= {16'h0043, D_HL, OR, A_D16, B_0, 2'b00, CC_xxxx};
	// LD (C),A
	16'he210: ucode <= {16'he211, D_TEMP, OR, A_MASK, B_C, 2'b00, CC_xxxx};
	16'he211: ucode <= {16'he212, D_DATA, OR, A_A, B_0, 2'b00, CC_xxxx};
	16'he212: ucode <= {16'he213, D_0, OR, A_TEMP, B_0, 2'b01, CC_xxxx};
	16'he213: ucode <= {16'h0041, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// NOP
	16'he310: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// NOP
	16'he410: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// PUSH HL
	16'he510: ucode <= {16'he511, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'he511: ucode <= {16'he512, D_DATA, SWAP2, A_HL, B_0, 2'b00, CC_xxxx};
	16'he512: ucode <= {16'he513, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'he513: ucode <= {16'he514, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he514: ucode <= {16'he515, D_DATA, OR, A_HL, B_0, 2'b00, CC_xxxx};
	16'he515: ucode <= {16'he516, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'he516: ucode <= {16'h0046, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// AND d8
	16'he610: ucode <= {16'he611, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'he611: ucode <= {16'he612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he612: ucode <= {16'h0042, D_A, AND, A_A, B_D8, 2'b00, CC_Z010};
	// RST 20H
	16'he710: ucode <= {16'he711, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'he711: ucode <= {16'he712, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
	16'he712: ucode <= {16'he713, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'he713: ucode <= {16'he714, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he714: ucode <= {16'he715, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
	16'he715: ucode <= {16'he716, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'he716: ucode <= {16'he717, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he717: ucode <= {16'h0045, D_PC, OR, A_20, B_0, 2'b00, CC_xxxx};
	// ADD SP,r8
	16'he810: ucode <= {16'he811, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'he811: ucode <= {16'he812, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he812: ucode <= {16'h004a, D_SP, ADD2, A_SP, B_D8, 2'b00, CC_00HC};
	// JP (HL)
	16'he910: ucode <= {16'h0000, D_PC, OR, A_HL, B_0, 2'b00, CC_xxxx};
	// LD (a16),A
	16'hea10: ucode <= {16'hea11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hea11: ucode <= {16'hea12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hea12: ucode <= {16'hea13, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hea13: ucode <= {16'hea14, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hea14: ucode <= {16'hea15, D_DATA, OR, A_A, B_0, 2'b00, CC_xxxx};
	16'hea15: ucode <= {16'hea16, D_0, OR, A_D16, B_0, 2'b01, CC_xxxx};
	16'hea16: ucode <= {16'h0046, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// NOP
	16'heb10: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// NOP
	16'hec10: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// NOP
	16'hed10: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// XOR d8
	16'hee10: ucode <= {16'hee11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hee11: ucode <= {16'hee12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hee12: ucode <= {16'h0042, D_A, XOR, A_A, B_D8, 2'b00, CC_Z000};
	// RST 28H
	16'hef10: ucode <= {16'hef11, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hef11: ucode <= {16'hef12, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
	16'hef12: ucode <= {16'hef13, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hef13: ucode <= {16'hef14, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hef14: ucode <= {16'hef15, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
	16'hef15: ucode <= {16'hef16, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hef16: ucode <= {16'hef17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hef17: ucode <= {16'h0045, D_PC, OR, A_28, B_0, 2'b00, CC_xxxx};
	// LDH A,(a8)
	16'hf010: ucode <= {16'hf011, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hf011: ucode <= {16'hf012, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf012: ucode <= {16'hf013, D_TEMP, OR, A_MASK, B_D8, 2'b00, CC_xxxx};
	16'hf013: ucode <= {16'hf014, D_0, OR, A_TEMP, B_0, 2'b10, CC_xxxx};
	16'hf014: ucode <= {16'hf015, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf015: ucode <= {16'h0043, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// POP AF
	16'hf110: ucode <= {16'hf111, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hf111: ucode <= {16'hf112, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf112: ucode <= {16'hf113, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hf113: ucode <= {16'hf114, D_SP, ADD, A_SP, B_1, 2'b10, CC_xxxx};
	16'hf114: ucode <= {16'hf115, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf115: ucode <= {16'h0043, D_AF, OR, A_D16, B_0, 2'b00, CC_ZNHC};
	// LD A,(C)
	16'hf210: ucode <= {16'hf211, D_TEMP, OR, A_MASK, B_C, 2'b00, CC_xxxx};
	16'hf211: ucode <= {16'hf212, D_0, OR, A_TEMP, B_0, 2'b10, CC_xxxx};
	16'hf212: ucode <= {16'hf213, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf213: ucode <= {16'h0041, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// DI
	16'hf310: ucode <= {16'h0000, D_IE, OR, A_0, B_0, 2'b00, CC_xxxx};
	// NOP
	16'hf410: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// PUSH AF
	16'hf510: ucode <= {16'hf511, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hf511: ucode <= {16'hf512, D_DATA, SWAP2, A_AF, B_0, 2'b00, CC_xxxx};
	16'hf512: ucode <= {16'hf513, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hf513: ucode <= {16'hf514, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf514: ucode <= {16'hf515, D_DATA, OR, A_AF, B_0, 2'b00, CC_xxxx};
	16'hf515: ucode <= {16'hf516, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hf516: ucode <= {16'h0046, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// OR d8
	16'hf610: ucode <= {16'hf611, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hf611: ucode <= {16'hf612, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf612: ucode <= {16'h0042, D_A, OR, A_A, B_D8, 2'b00, CC_Z000};
	// RST 30H
	16'hf710: ucode <= {16'hf711, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hf711: ucode <= {16'hf712, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
	16'hf712: ucode <= {16'hf713, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hf713: ucode <= {16'hf714, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf714: ucode <= {16'hf715, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
	16'hf715: ucode <= {16'hf716, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hf716: ucode <= {16'hf717, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf717: ucode <= {16'h0045, D_PC, OR, A_30, B_0, 2'b00, CC_xxxx};
	// LD HL,SP+r8
	16'hf810: ucode <= {16'hf811, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hf811: ucode <= {16'hf812, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf812: ucode <= {16'h0046, D_HL, ADD2, A_SP, B_D8, 2'b00, CC_00HC};
	// LD SP,HL
	16'hf910: ucode <= {16'h0044, D_SP, OR, A_HL, B_0, 2'b00, CC_xxxx};
	// LD A,(a16)
	16'hfa10: ucode <= {16'hfa11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hfa11: ucode <= {16'hfa12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hfa12: ucode <= {16'hfa13, D_TEMP, OR, A_D8, B_0, 2'b00, CC_xxxx};
	16'hfa13: ucode <= {16'hfa14, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hfa14: ucode <= {16'hfa15, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hfa15: ucode <= {16'hfa16, D_0, OR, A_D16, B_0, 2'b10, CC_xxxx};
	16'hfa16: ucode <= {16'hfa17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hfa17: ucode <= {16'h0045, D_A, OR, A_D8, B_0, 2'b00, CC_xxxx};
	// EI
	16'hfb10: ucode <= {16'h0000, D_IE, OR, A_1, B_0, 2'b00, CC_xxxx};
	// NOP
	16'hfc10: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// NOP
	16'hfd10: ucode <= {16'h0000, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// CP d8
	16'hfe10: ucode <= {16'hfe11, D_PC, ADD, A_PC, B_1, 2'b10, CC_xxxx};
	16'hfe11: ucode <= {16'hfe12, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hfe12: ucode <= {16'h0042, D_0, SUB, A_A, B_D8, 2'b00, CC_Z1HC};
	// RST 38H
	16'hff10: ucode <= {16'hff11, D_SP, SUB, A_SP, B_1, 2'b00, CC_xxxx};
	16'hff11: ucode <= {16'hff12, D_DATA, SWAP2, A_PC, B_0, 2'b00, CC_xxxx};
	16'hff12: ucode <= {16'hff13, D_SP, SUB, A_SP, B_1, 2'b01, CC_xxxx};
	16'hff13: ucode <= {16'hff14, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hff14: ucode <= {16'hff15, D_DATA, OR, A_PC, B_0, 2'b00, CC_xxxx};
	16'hff15: ucode <= {16'hff16, D_0, OR, A_SP, B_0, 2'b01, CC_xxxx};
	16'hff16: ucode <= {16'hff17, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hff17: ucode <= {16'h0045, D_PC, OR, A_38, B_0, 2'b00, CC_xxxx};



    ////// BEGIN GENERATED EXTENSIONS //////
	// RLC B
	16'h0020: ucode <= {16'h0000, D_B, RLC, A_B, B_0, 2'b00, CC_Z00C};
	// RLC C
	16'h0120: ucode <= {16'h0000, D_C, RLC, A_C, B_0, 2'b00, CC_Z00C};
	// RLC D
	16'h0220: ucode <= {16'h0000, D_D, RLC, A_D, B_0, 2'b00, CC_Z00C};
	// RLC E
	16'h0320: ucode <= {16'h0000, D_E, RLC, A_E, B_0, 2'b00, CC_Z00C};
	// RLC H
	16'h0420: ucode <= {16'h0000, D_H, RLC, A_H, B_0, 2'b00, CC_Z00C};
	// RLC L
	16'h0520: ucode <= {16'h0000, D_L, RLC, A_L, B_0, 2'b00, CC_Z00C};
	// RLC (HL)
	16'h0620: ucode <= {16'h0621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h0621: ucode <= {16'h0622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0622: ucode <= {16'h0623, D_DATA, RLC, A_D8, B_0, 2'b00, CC_Z00C};
	16'h0623: ucode <= {16'h0624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h0624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RLC A
	16'h0720: ucode <= {16'h0000, D_A, RLC, A_A, B_0, 2'b00, CC_Z00C};
	// RRC B
	16'h0820: ucode <= {16'h0000, D_B, RRC, A_B, B_0, 2'b00, CC_Z00C};
	// RRC C
	16'h0920: ucode <= {16'h0000, D_C, RRC, A_C, B_0, 2'b00, CC_Z00C};
	// RRC D
	16'h0a20: ucode <= {16'h0000, D_D, RRC, A_D, B_0, 2'b00, CC_Z00C};
	// RRC E
	16'h0b20: ucode <= {16'h0000, D_E, RRC, A_E, B_0, 2'b00, CC_Z00C};
	// RRC H
	16'h0c20: ucode <= {16'h0000, D_H, RRC, A_H, B_0, 2'b00, CC_Z00C};
	// RRC L
	16'h0d20: ucode <= {16'h0000, D_L, RRC, A_L, B_0, 2'b00, CC_Z00C};
	// RRC (HL)
	16'h0e20: ucode <= {16'h0e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h0e21: ucode <= {16'h0e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h0e22: ucode <= {16'h0e23, D_DATA, RRC, A_D8, B_0, 2'b00, CC_Z00C};
	16'h0e23: ucode <= {16'h0e24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h0e24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RRC A
	16'h0f20: ucode <= {16'h0000, D_A, RRC, A_A, B_0, 2'b00, CC_Z00C};
	// RL B
	16'h1020: ucode <= {16'h0000, D_B, RL, A_B, B_0, 2'b00, CC_Z00C};
	// RL C
	16'h1120: ucode <= {16'h0000, D_C, RL, A_C, B_0, 2'b00, CC_Z00C};
	// RL D
	16'h1220: ucode <= {16'h0000, D_D, RL, A_D, B_0, 2'b00, CC_Z00C};
	// RL E
	16'h1320: ucode <= {16'h0000, D_E, RL, A_E, B_0, 2'b00, CC_Z00C};
	// RL H
	16'h1420: ucode <= {16'h0000, D_H, RL, A_H, B_0, 2'b00, CC_Z00C};
	// RL L
	16'h1520: ucode <= {16'h0000, D_L, RL, A_L, B_0, 2'b00, CC_Z00C};
	// RL (HL)
	16'h1620: ucode <= {16'h1621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h1621: ucode <= {16'h1622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h1622: ucode <= {16'h1623, D_DATA, RL, A_D8, B_0, 2'b00, CC_Z00C};
	16'h1623: ucode <= {16'h1624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h1624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RL A
	16'h1720: ucode <= {16'h0000, D_A, RL, A_A, B_0, 2'b00, CC_Z00C};
	// RR B
	16'h1820: ucode <= {16'h0000, D_B, RR, A_B, B_0, 2'b00, CC_Z00C};
	// RR C
	16'h1920: ucode <= {16'h0000, D_C, RR, A_C, B_0, 2'b00, CC_Z00C};
	// RR D
	16'h1a20: ucode <= {16'h0000, D_D, RR, A_D, B_0, 2'b00, CC_Z00C};
	// RR E
	16'h1b20: ucode <= {16'h0000, D_E, RR, A_E, B_0, 2'b00, CC_Z00C};
	// RR H
	16'h1c20: ucode <= {16'h0000, D_H, RR, A_H, B_0, 2'b00, CC_Z00C};
	// RR L
	16'h1d20: ucode <= {16'h0000, D_L, RR, A_L, B_0, 2'b00, CC_Z00C};
	// RR (HL)
	16'h1e20: ucode <= {16'h1e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h1e21: ucode <= {16'h1e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h1e22: ucode <= {16'h1e23, D_DATA, RR, A_D8, B_0, 2'b00, CC_Z00C};
	16'h1e23: ucode <= {16'h1e24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h1e24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RR A
	16'h1f20: ucode <= {16'h0000, D_A, RR, A_A, B_0, 2'b00, CC_Z00C};
	// SLA B
	16'h2020: ucode <= {16'h0000, D_B, SLA, A_B, B_0, 2'b00, CC_Z00C};
	// SLA C
	16'h2120: ucode <= {16'h0000, D_C, SLA, A_C, B_0, 2'b00, CC_Z00C};
	// SLA D
	16'h2220: ucode <= {16'h0000, D_D, SLA, A_D, B_0, 2'b00, CC_Z00C};
	// SLA E
	16'h2320: ucode <= {16'h0000, D_E, SLA, A_E, B_0, 2'b00, CC_Z00C};
	// SLA H
	16'h2420: ucode <= {16'h0000, D_H, SLA, A_H, B_0, 2'b00, CC_Z00C};
	// SLA L
	16'h2520: ucode <= {16'h0000, D_L, SLA, A_L, B_0, 2'b00, CC_Z00C};
	// SLA (HL)
	16'h2620: ucode <= {16'h2621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h2621: ucode <= {16'h2622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2622: ucode <= {16'h2623, D_DATA, SLA, A_D8, B_0, 2'b00, CC_Z00C};
	16'h2623: ucode <= {16'h2624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h2624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SLA A
	16'h2720: ucode <= {16'h0000, D_A, SLA, A_A, B_0, 2'b00, CC_Z00C};
	// SRA B
	16'h2820: ucode <= {16'h0000, D_B, SRA, A_B, B_0, 2'b00, CC_Z00C};
	// SRA C
	16'h2920: ucode <= {16'h0000, D_C, SRA, A_C, B_0, 2'b00, CC_Z00C};
	// SRA D
	16'h2a20: ucode <= {16'h0000, D_D, SRA, A_D, B_0, 2'b00, CC_Z00C};
	// SRA E
	16'h2b20: ucode <= {16'h0000, D_E, SRA, A_E, B_0, 2'b00, CC_Z00C};
	// SRA H
	16'h2c20: ucode <= {16'h0000, D_H, SRA, A_H, B_0, 2'b00, CC_Z00C};
	// SRA L
	16'h2d20: ucode <= {16'h0000, D_L, SRA, A_L, B_0, 2'b00, CC_Z00C};
	// SRA (HL)
	16'h2e20: ucode <= {16'h2e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h2e21: ucode <= {16'h2e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h2e22: ucode <= {16'h2e23, D_DATA, SRA, A_D8, B_0, 2'b00, CC_Z00C};
	16'h2e23: ucode <= {16'h2e24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h2e24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SRA A
	16'h2f20: ucode <= {16'h0000, D_A, SRA, A_A, B_0, 2'b00, CC_Z00C};
	// SWAP B
	16'h3020: ucode <= {16'h0000, D_B, SWAP, A_B, B_0, 2'b00, CC_Z000};
	// SWAP C
	16'h3120: ucode <= {16'h0000, D_C, SWAP, A_C, B_0, 2'b00, CC_Z000};
	// SWAP D
	16'h3220: ucode <= {16'h0000, D_D, SWAP, A_D, B_0, 2'b00, CC_Z000};
	// SWAP E
	16'h3320: ucode <= {16'h0000, D_E, SWAP, A_E, B_0, 2'b00, CC_Z000};
	// SWAP H
	16'h3420: ucode <= {16'h0000, D_H, SWAP, A_H, B_0, 2'b00, CC_Z000};
	// SWAP L
	16'h3520: ucode <= {16'h0000, D_L, SWAP, A_L, B_0, 2'b00, CC_Z000};
	// SWAP (HL)
	16'h3620: ucode <= {16'h3621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h3621: ucode <= {16'h3622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3622: ucode <= {16'h3623, D_DATA, SWAP, A_D8, B_0, 2'b00, CC_Z000};
	16'h3623: ucode <= {16'h3624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h3624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SWAP A
	16'h3720: ucode <= {16'h0000, D_A, SWAP, A_A, B_0, 2'b00, CC_Z000};
	// SRL B
	16'h3820: ucode <= {16'h0000, D_B, SRL, A_B, B_0, 2'b00, CC_Z00C};
	// SRL C
	16'h3920: ucode <= {16'h0000, D_C, SRL, A_C, B_0, 2'b00, CC_Z00C};
	// SRL D
	16'h3a20: ucode <= {16'h0000, D_D, SRL, A_D, B_0, 2'b00, CC_Z00C};
	// SRL E
	16'h3b20: ucode <= {16'h0000, D_E, SRL, A_E, B_0, 2'b00, CC_Z00C};
	// SRL H
	16'h3c20: ucode <= {16'h0000, D_H, SRL, A_H, B_0, 2'b00, CC_Z00C};
	// SRL L
	16'h3d20: ucode <= {16'h0000, D_L, SRL, A_L, B_0, 2'b00, CC_Z00C};
	// SRL (HL)
	16'h3e20: ucode <= {16'h3e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h3e21: ucode <= {16'h3e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h3e22: ucode <= {16'h3e23, D_DATA, SRL, A_D8, B_0, 2'b00, CC_Z00C};
	16'h3e23: ucode <= {16'h3e24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h3e24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SRL A
	16'h3f20: ucode <= {16'h0000, D_A, SRL, A_A, B_0, 2'b00, CC_Z00C};
	// BIT 0,B
	16'h4020: ucode <= {16'h0000, D_0, AND, A_B, B_1, 2'b00, CC_Z01x};
	// BIT 0,C
	16'h4120: ucode <= {16'h0000, D_0, AND, A_C, B_1, 2'b00, CC_Z01x};
	// BIT 0,D
	16'h4220: ucode <= {16'h0000, D_0, AND, A_D, B_1, 2'b00, CC_Z01x};
	// BIT 0,E
	16'h4320: ucode <= {16'h0000, D_0, AND, A_E, B_1, 2'b00, CC_Z01x};
	// BIT 0,H
	16'h4420: ucode <= {16'h0000, D_0, AND, A_H, B_1, 2'b00, CC_Z01x};
	// BIT 0,L
	16'h4520: ucode <= {16'h0000, D_0, AND, A_L, B_1, 2'b00, CC_Z01x};
	// BIT 0,(HL)
	16'h4620: ucode <= {16'h4621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h4621: ucode <= {16'h4622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h4622: ucode <= {16'h0046, D_0, AND, A_D8, B_1, 2'b00, CC_Z01x};
	// BIT 0,A
	16'h4720: ucode <= {16'h0000, D_0, AND, A_A, B_1, 2'b00, CC_Z01x};
	// BIT 1,B
	16'h4820: ucode <= {16'h0000, D_0, AND, A_B, B_2, 2'b00, CC_Z01x};
	// BIT 1,C
	16'h4920: ucode <= {16'h0000, D_0, AND, A_C, B_2, 2'b00, CC_Z01x};
	// BIT 1,D
	16'h4a20: ucode <= {16'h0000, D_0, AND, A_D, B_2, 2'b00, CC_Z01x};
	// BIT 1,E
	16'h4b20: ucode <= {16'h0000, D_0, AND, A_E, B_2, 2'b00, CC_Z01x};
	// BIT 1,H
	16'h4c20: ucode <= {16'h0000, D_0, AND, A_H, B_2, 2'b00, CC_Z01x};
	// BIT 1,L
	16'h4d20: ucode <= {16'h0000, D_0, AND, A_L, B_2, 2'b00, CC_Z01x};
	// BIT 1,(HL)
	16'h4e20: ucode <= {16'h4e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h4e21: ucode <= {16'h4e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h4e22: ucode <= {16'h0046, D_0, AND, A_D8, B_2, 2'b00, CC_Z01x};
	// BIT 1,A
	16'h4f20: ucode <= {16'h0000, D_0, AND, A_A, B_2, 2'b00, CC_Z01x};
	// BIT 2,B
	16'h5020: ucode <= {16'h0000, D_0, AND, A_B, B_4, 2'b00, CC_Z01x};
	// BIT 2,C
	16'h5120: ucode <= {16'h0000, D_0, AND, A_C, B_4, 2'b00, CC_Z01x};
	// BIT 2,D
	16'h5220: ucode <= {16'h0000, D_0, AND, A_D, B_4, 2'b00, CC_Z01x};
	// BIT 2,E
	16'h5320: ucode <= {16'h0000, D_0, AND, A_E, B_4, 2'b00, CC_Z01x};
	// BIT 2,H
	16'h5420: ucode <= {16'h0000, D_0, AND, A_H, B_4, 2'b00, CC_Z01x};
	// BIT 2,L
	16'h5520: ucode <= {16'h0000, D_0, AND, A_L, B_4, 2'b00, CC_Z01x};
	// BIT 2,(HL)
	16'h5620: ucode <= {16'h5621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h5621: ucode <= {16'h5622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h5622: ucode <= {16'h0046, D_0, AND, A_D8, B_4, 2'b00, CC_Z01x};
	// BIT 2,A
	16'h5720: ucode <= {16'h0000, D_0, AND, A_A, B_4, 2'b00, CC_Z01x};
	// BIT 3,B
	16'h5820: ucode <= {16'h0000, D_0, AND, A_B, B_8, 2'b00, CC_Z01x};
	// BIT 3,C
	16'h5920: ucode <= {16'h0000, D_0, AND, A_C, B_8, 2'b00, CC_Z01x};
	// BIT 3,D
	16'h5a20: ucode <= {16'h0000, D_0, AND, A_D, B_8, 2'b00, CC_Z01x};
	// BIT 3,E
	16'h5b20: ucode <= {16'h0000, D_0, AND, A_E, B_8, 2'b00, CC_Z01x};
	// BIT 3,H
	16'h5c20: ucode <= {16'h0000, D_0, AND, A_H, B_8, 2'b00, CC_Z01x};
	// BIT 3,L
	16'h5d20: ucode <= {16'h0000, D_0, AND, A_L, B_8, 2'b00, CC_Z01x};
	// BIT 3,(HL)
	16'h5e20: ucode <= {16'h5e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h5e21: ucode <= {16'h5e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h5e22: ucode <= {16'h0046, D_0, AND, A_D8, B_8, 2'b00, CC_Z01x};
	// BIT 3,A
	16'h5f20: ucode <= {16'h0000, D_0, AND, A_A, B_8, 2'b00, CC_Z01x};
	// BIT 4,B
	16'h6020: ucode <= {16'h0000, D_0, AND, A_B, B_10, 2'b00, CC_Z01x};
	// BIT 4,C
	16'h6120: ucode <= {16'h0000, D_0, AND, A_C, B_10, 2'b00, CC_Z01x};
	// BIT 4,D
	16'h6220: ucode <= {16'h0000, D_0, AND, A_D, B_10, 2'b00, CC_Z01x};
	// BIT 4,E
	16'h6320: ucode <= {16'h0000, D_0, AND, A_E, B_10, 2'b00, CC_Z01x};
	// BIT 4,H
	16'h6420: ucode <= {16'h0000, D_0, AND, A_H, B_10, 2'b00, CC_Z01x};
	// BIT 4,L
	16'h6520: ucode <= {16'h0000, D_0, AND, A_L, B_10, 2'b00, CC_Z01x};
	// BIT 4,(HL)
	16'h6620: ucode <= {16'h6621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h6621: ucode <= {16'h6622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h6622: ucode <= {16'h0046, D_0, AND, A_D8, B_10, 2'b00, CC_Z01x};
	// BIT 4,A
	16'h6720: ucode <= {16'h0000, D_0, AND, A_A, B_10, 2'b00, CC_Z01x};
	// BIT 5,B
	16'h6820: ucode <= {16'h0000, D_0, AND, A_B, B_20, 2'b00, CC_Z01x};
	// BIT 5,C
	16'h6920: ucode <= {16'h0000, D_0, AND, A_C, B_20, 2'b00, CC_Z01x};
	// BIT 5,D
	16'h6a20: ucode <= {16'h0000, D_0, AND, A_D, B_20, 2'b00, CC_Z01x};
	// BIT 5,E
	16'h6b20: ucode <= {16'h0000, D_0, AND, A_E, B_20, 2'b00, CC_Z01x};
	// BIT 5,H
	16'h6c20: ucode <= {16'h0000, D_0, AND, A_H, B_20, 2'b00, CC_Z01x};
	// BIT 5,L
	16'h6d20: ucode <= {16'h0000, D_0, AND, A_L, B_20, 2'b00, CC_Z01x};
	// BIT 5,(HL)
	16'h6e20: ucode <= {16'h6e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h6e21: ucode <= {16'h6e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h6e22: ucode <= {16'h0046, D_0, AND, A_D8, B_20, 2'b00, CC_Z01x};
	// BIT 5,A
	16'h6f20: ucode <= {16'h0000, D_0, AND, A_A, B_20, 2'b00, CC_Z01x};
	// BIT 6,B
	16'h7020: ucode <= {16'h0000, D_0, AND, A_B, B_40, 2'b00, CC_Z01x};
	// BIT 6,C
	16'h7120: ucode <= {16'h0000, D_0, AND, A_C, B_40, 2'b00, CC_Z01x};
	// BIT 6,D
	16'h7220: ucode <= {16'h0000, D_0, AND, A_D, B_40, 2'b00, CC_Z01x};
	// BIT 6,E
	16'h7320: ucode <= {16'h0000, D_0, AND, A_E, B_40, 2'b00, CC_Z01x};
	// BIT 6,H
	16'h7420: ucode <= {16'h0000, D_0, AND, A_H, B_40, 2'b00, CC_Z01x};
	// BIT 6,L
	16'h7520: ucode <= {16'h0000, D_0, AND, A_L, B_40, 2'b00, CC_Z01x};
	// BIT 6,(HL)
	16'h7620: ucode <= {16'h7621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h7621: ucode <= {16'h7622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h7622: ucode <= {16'h0046, D_0, AND, A_D8, B_40, 2'b00, CC_Z01x};
	// BIT 6,A
	16'h7720: ucode <= {16'h0000, D_0, AND, A_A, B_40, 2'b00, CC_Z01x};
	// BIT 7,B
	16'h7820: ucode <= {16'h0000, D_0, AND, A_B, B_80, 2'b00, CC_Z01x};
	// BIT 7,C
	16'h7920: ucode <= {16'h0000, D_0, AND, A_C, B_80, 2'b00, CC_Z01x};
	// BIT 7,D
	16'h7a20: ucode <= {16'h0000, D_0, AND, A_D, B_80, 2'b00, CC_Z01x};
	// BIT 7,E
	16'h7b20: ucode <= {16'h0000, D_0, AND, A_E, B_80, 2'b00, CC_Z01x};
	// BIT 7,H
	16'h7c20: ucode <= {16'h0000, D_0, AND, A_H, B_80, 2'b00, CC_Z01x};
	// BIT 7,L
	16'h7d20: ucode <= {16'h0000, D_0, AND, A_L, B_80, 2'b00, CC_Z01x};
	// BIT 7,(HL)
	16'h7e20: ucode <= {16'h7e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h7e21: ucode <= {16'h7e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h7e22: ucode <= {16'h0046, D_0, AND, A_D8, B_80, 2'b00, CC_Z01x};
	// BIT 7,A
	16'h7f20: ucode <= {16'h0000, D_0, AND, A_A, B_80, 2'b00, CC_Z01x};
	// RES 0,B
	16'h8020: ucode <= {16'h0000, D_B, AND, A_B, B_fe, 2'b00, CC_xxxx};
	// RES 0,C
	16'h8120: ucode <= {16'h0000, D_C, AND, A_C, B_fe, 2'b00, CC_xxxx};
	// RES 0,D
	16'h8220: ucode <= {16'h0000, D_D, AND, A_D, B_fe, 2'b00, CC_xxxx};
	// RES 0,E
	16'h8320: ucode <= {16'h0000, D_E, AND, A_E, B_fe, 2'b00, CC_xxxx};
	// RES 0,H
	16'h8420: ucode <= {16'h0000, D_H, AND, A_H, B_fe, 2'b00, CC_xxxx};
	// RES 0,L
	16'h8520: ucode <= {16'h0000, D_L, AND, A_L, B_fe, 2'b00, CC_xxxx};
	// RES 0,(HL)
	16'h8620: ucode <= {16'h8621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h8621: ucode <= {16'h8622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h8622: ucode <= {16'h8623, D_DATA, AND, A_D8, B_fe, 2'b00, CC_xxxx};
	16'h8623: ucode <= {16'h8624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h8624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RES 0,A
	16'h8720: ucode <= {16'h0000, D_A, AND, A_A, B_fe, 2'b00, CC_xxxx};
	// RES 1,B
	16'h8820: ucode <= {16'h0000, D_B, AND, A_B, B_fd, 2'b00, CC_xxxx};
	// RES 1,C
	16'h8920: ucode <= {16'h0000, D_C, AND, A_C, B_fd, 2'b00, CC_xxxx};
	// RES 1,D
	16'h8a20: ucode <= {16'h0000, D_D, AND, A_D, B_fd, 2'b00, CC_xxxx};
	// RES 1,E
	16'h8b20: ucode <= {16'h0000, D_E, AND, A_E, B_fd, 2'b00, CC_xxxx};
	// RES 1,H
	16'h8c20: ucode <= {16'h0000, D_H, AND, A_H, B_fd, 2'b00, CC_xxxx};
	// RES 1,L
	16'h8d20: ucode <= {16'h0000, D_L, AND, A_L, B_fd, 2'b00, CC_xxxx};
	// RES 1,(HL)
	16'h8e20: ucode <= {16'h8e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h8e21: ucode <= {16'h8e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h8e22: ucode <= {16'h8e23, D_DATA, AND, A_D8, B_fd, 2'b00, CC_xxxx};
	16'h8e23: ucode <= {16'h8e24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h8e24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RES 1,A
	16'h8f20: ucode <= {16'h0000, D_A, AND, A_A, B_fd, 2'b00, CC_xxxx};
	// RES 2,B
	16'h9020: ucode <= {16'h0000, D_B, AND, A_B, B_fb, 2'b00, CC_xxxx};
	// RES 2,C
	16'h9120: ucode <= {16'h0000, D_C, AND, A_C, B_fb, 2'b00, CC_xxxx};
	// RES 2,D
	16'h9220: ucode <= {16'h0000, D_D, AND, A_D, B_fb, 2'b00, CC_xxxx};
	// RES 2,E
	16'h9320: ucode <= {16'h0000, D_E, AND, A_E, B_fb, 2'b00, CC_xxxx};
	// RES 2,H
	16'h9420: ucode <= {16'h0000, D_H, AND, A_H, B_fb, 2'b00, CC_xxxx};
	// RES 2,L
	16'h9520: ucode <= {16'h0000, D_L, AND, A_L, B_fb, 2'b00, CC_xxxx};
	// RES 2,(HL)
	16'h9620: ucode <= {16'h9621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h9621: ucode <= {16'h9622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h9622: ucode <= {16'h9623, D_DATA, AND, A_D8, B_fb, 2'b00, CC_xxxx};
	16'h9623: ucode <= {16'h9624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h9624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RES 2,A
	16'h9720: ucode <= {16'h0000, D_A, AND, A_A, B_fb, 2'b00, CC_xxxx};
	// RES 3,B
	16'h9820: ucode <= {16'h0000, D_B, AND, A_B, B_f7, 2'b00, CC_xxxx};
	// RES 3,C
	16'h9920: ucode <= {16'h0000, D_C, AND, A_C, B_f7, 2'b00, CC_xxxx};
	// RES 3,D
	16'h9a20: ucode <= {16'h0000, D_D, AND, A_D, B_f7, 2'b00, CC_xxxx};
	// RES 3,E
	16'h9b20: ucode <= {16'h0000, D_E, AND, A_E, B_f7, 2'b00, CC_xxxx};
	// RES 3,H
	16'h9c20: ucode <= {16'h0000, D_H, AND, A_H, B_f7, 2'b00, CC_xxxx};
	// RES 3,L
	16'h9d20: ucode <= {16'h0000, D_L, AND, A_L, B_f7, 2'b00, CC_xxxx};
	// RES 3,(HL)
	16'h9e20: ucode <= {16'h9e21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'h9e21: ucode <= {16'h9e22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'h9e22: ucode <= {16'h9e23, D_DATA, AND, A_D8, B_f7, 2'b00, CC_xxxx};
	16'h9e23: ucode <= {16'h9e24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'h9e24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RES 3,A
	16'h9f20: ucode <= {16'h0000, D_A, AND, A_A, B_f7, 2'b00, CC_xxxx};
	// RES 4,B
	16'ha020: ucode <= {16'h0000, D_B, AND, A_B, B_ef, 2'b00, CC_xxxx};
	// RES 4,C
	16'ha120: ucode <= {16'h0000, D_C, AND, A_C, B_ef, 2'b00, CC_xxxx};
	// RES 4,D
	16'ha220: ucode <= {16'h0000, D_D, AND, A_D, B_ef, 2'b00, CC_xxxx};
	// RES 4,E
	16'ha320: ucode <= {16'h0000, D_E, AND, A_E, B_ef, 2'b00, CC_xxxx};
	// RES 4,H
	16'ha420: ucode <= {16'h0000, D_H, AND, A_H, B_ef, 2'b00, CC_xxxx};
	// RES 4,L
	16'ha520: ucode <= {16'h0000, D_L, AND, A_L, B_ef, 2'b00, CC_xxxx};
	// RES 4,(HL)
	16'ha620: ucode <= {16'ha621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'ha621: ucode <= {16'ha622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'ha622: ucode <= {16'ha623, D_DATA, AND, A_D8, B_ef, 2'b00, CC_xxxx};
	16'ha623: ucode <= {16'ha624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'ha624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RES 4,A
	16'ha720: ucode <= {16'h0000, D_A, AND, A_A, B_ef, 2'b00, CC_xxxx};
	// RES 5,B
	16'ha820: ucode <= {16'h0000, D_B, AND, A_B, B_df, 2'b00, CC_xxxx};
	// RES 5,C
	16'ha920: ucode <= {16'h0000, D_C, AND, A_C, B_df, 2'b00, CC_xxxx};
	// RES 5,D
	16'haa20: ucode <= {16'h0000, D_D, AND, A_D, B_df, 2'b00, CC_xxxx};
	// RES 5,E
	16'hab20: ucode <= {16'h0000, D_E, AND, A_E, B_df, 2'b00, CC_xxxx};
	// RES 5,H
	16'hac20: ucode <= {16'h0000, D_H, AND, A_H, B_df, 2'b00, CC_xxxx};
	// RES 5,L
	16'had20: ucode <= {16'h0000, D_L, AND, A_L, B_df, 2'b00, CC_xxxx};
	// RES 5,(HL)
	16'hae20: ucode <= {16'hae21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hae21: ucode <= {16'hae22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hae22: ucode <= {16'hae23, D_DATA, AND, A_D8, B_df, 2'b00, CC_xxxx};
	16'hae23: ucode <= {16'hae24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hae24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RES 5,A
	16'haf20: ucode <= {16'h0000, D_A, AND, A_A, B_df, 2'b00, CC_xxxx};
	// RES 6,B
	16'hb020: ucode <= {16'h0000, D_B, AND, A_B, B_bf, 2'b00, CC_xxxx};
	// RES 6,C
	16'hb120: ucode <= {16'h0000, D_C, AND, A_C, B_bf, 2'b00, CC_xxxx};
	// RES 6,D
	16'hb220: ucode <= {16'h0000, D_D, AND, A_D, B_bf, 2'b00, CC_xxxx};
	// RES 6,E
	16'hb320: ucode <= {16'h0000, D_E, AND, A_E, B_bf, 2'b00, CC_xxxx};
	// RES 6,H
	16'hb420: ucode <= {16'h0000, D_H, AND, A_H, B_bf, 2'b00, CC_xxxx};
	// RES 6,L
	16'hb520: ucode <= {16'h0000, D_L, AND, A_L, B_bf, 2'b00, CC_xxxx};
	// RES 6,(HL)
	16'hb620: ucode <= {16'hb621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hb621: ucode <= {16'hb622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hb622: ucode <= {16'hb623, D_DATA, AND, A_D8, B_bf, 2'b00, CC_xxxx};
	16'hb623: ucode <= {16'hb624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hb624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RES 6,A
	16'hb720: ucode <= {16'h0000, D_A, AND, A_A, B_bf, 2'b00, CC_xxxx};
	// RES 7,B
	16'hb820: ucode <= {16'h0000, D_B, AND, A_B, B_7f, 2'b00, CC_xxxx};
	// RES 7,C
	16'hb920: ucode <= {16'h0000, D_C, AND, A_C, B_7f, 2'b00, CC_xxxx};
	// RES 7,D
	16'hba20: ucode <= {16'h0000, D_D, AND, A_D, B_7f, 2'b00, CC_xxxx};
	// RES 7,E
	16'hbb20: ucode <= {16'h0000, D_E, AND, A_E, B_7f, 2'b00, CC_xxxx};
	// RES 7,H
	16'hbc20: ucode <= {16'h0000, D_H, AND, A_H, B_7f, 2'b00, CC_xxxx};
	// RES 7,L
	16'hbd20: ucode <= {16'h0000, D_L, AND, A_L, B_7f, 2'b00, CC_xxxx};
	// RES 7,(HL)
	16'hbe20: ucode <= {16'hbe21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hbe21: ucode <= {16'hbe22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hbe22: ucode <= {16'hbe23, D_DATA, AND, A_D8, B_7f, 2'b00, CC_xxxx};
	16'hbe23: ucode <= {16'hbe24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hbe24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// RES 7,A
	16'hbf20: ucode <= {16'h0000, D_A, AND, A_A, B_7f, 2'b00, CC_xxxx};
	// SET 0,B
	16'hc020: ucode <= {16'h0000, D_B, OR, A_B, B_1, 2'b00, CC_xxxx};
	// SET 0,C
	16'hc120: ucode <= {16'h0000, D_C, OR, A_C, B_1, 2'b00, CC_xxxx};
	// SET 0,D
	16'hc220: ucode <= {16'h0000, D_D, OR, A_D, B_1, 2'b00, CC_xxxx};
	// SET 0,E
	16'hc320: ucode <= {16'h0000, D_E, OR, A_E, B_1, 2'b00, CC_xxxx};
	// SET 0,H
	16'hc420: ucode <= {16'h0000, D_H, OR, A_H, B_1, 2'b00, CC_xxxx};
	// SET 0,L
	16'hc520: ucode <= {16'h0000, D_L, OR, A_L, B_1, 2'b00, CC_xxxx};
	// SET 0,(HL)
	16'hc620: ucode <= {16'hc621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hc621: ucode <= {16'hc622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hc622: ucode <= {16'hc623, D_DATA, OR, A_D8, B_1, 2'b00, CC_xxxx};
	16'hc623: ucode <= {16'hc624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hc624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SET 0,A
	16'hc720: ucode <= {16'h0000, D_A, OR, A_A, B_1, 2'b00, CC_xxxx};
	// SET 1,B
	16'hc820: ucode <= {16'h0000, D_B, OR, A_B, B_2, 2'b00, CC_xxxx};
	// SET 1,C
	16'hc920: ucode <= {16'h0000, D_C, OR, A_C, B_2, 2'b00, CC_xxxx};
	// SET 1,D
	16'hca20: ucode <= {16'h0000, D_D, OR, A_D, B_2, 2'b00, CC_xxxx};
	// SET 1,E
	16'hcb20: ucode <= {16'h0000, D_E, OR, A_E, B_2, 2'b00, CC_xxxx};
	// SET 1,H
	16'hcc20: ucode <= {16'h0000, D_H, OR, A_H, B_2, 2'b00, CC_xxxx};
	// SET 1,L
	16'hcd20: ucode <= {16'h0000, D_L, OR, A_L, B_2, 2'b00, CC_xxxx};
	// SET 1,(HL)
	16'hce20: ucode <= {16'hce21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hce21: ucode <= {16'hce22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hce22: ucode <= {16'hce23, D_DATA, OR, A_D8, B_2, 2'b00, CC_xxxx};
	16'hce23: ucode <= {16'hce24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hce24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SET 1,A
	16'hcf20: ucode <= {16'h0000, D_A, OR, A_A, B_2, 2'b00, CC_xxxx};
	// SET 2,B
	16'hd020: ucode <= {16'h0000, D_B, OR, A_B, B_4, 2'b00, CC_xxxx};
	// SET 2,C
	16'hd120: ucode <= {16'h0000, D_C, OR, A_C, B_4, 2'b00, CC_xxxx};
	// SET 2,D
	16'hd220: ucode <= {16'h0000, D_D, OR, A_D, B_4, 2'b00, CC_xxxx};
	// SET 2,E
	16'hd320: ucode <= {16'h0000, D_E, OR, A_E, B_4, 2'b00, CC_xxxx};
	// SET 2,H
	16'hd420: ucode <= {16'h0000, D_H, OR, A_H, B_4, 2'b00, CC_xxxx};
	// SET 2,L
	16'hd520: ucode <= {16'h0000, D_L, OR, A_L, B_4, 2'b00, CC_xxxx};
	// SET 2,(HL)
	16'hd620: ucode <= {16'hd621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hd621: ucode <= {16'hd622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hd622: ucode <= {16'hd623, D_DATA, OR, A_D8, B_4, 2'b00, CC_xxxx};
	16'hd623: ucode <= {16'hd624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hd624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SET 2,A
	16'hd720: ucode <= {16'h0000, D_A, OR, A_A, B_4, 2'b00, CC_xxxx};
	// SET 3,B
	16'hd820: ucode <= {16'h0000, D_B, OR, A_B, B_8, 2'b00, CC_xxxx};
	// SET 3,C
	16'hd920: ucode <= {16'h0000, D_C, OR, A_C, B_8, 2'b00, CC_xxxx};
	// SET 3,D
	16'hda20: ucode <= {16'h0000, D_D, OR, A_D, B_8, 2'b00, CC_xxxx};
	// SET 3,E
	16'hdb20: ucode <= {16'h0000, D_E, OR, A_E, B_8, 2'b00, CC_xxxx};
	// SET 3,H
	16'hdc20: ucode <= {16'h0000, D_H, OR, A_H, B_8, 2'b00, CC_xxxx};
	// SET 3,L
	16'hdd20: ucode <= {16'h0000, D_L, OR, A_L, B_8, 2'b00, CC_xxxx};
	// SET 3,(HL)
	16'hde20: ucode <= {16'hde21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hde21: ucode <= {16'hde22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hde22: ucode <= {16'hde23, D_DATA, OR, A_D8, B_8, 2'b00, CC_xxxx};
	16'hde23: ucode <= {16'hde24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hde24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SET 3,A
	16'hdf20: ucode <= {16'h0000, D_A, OR, A_A, B_8, 2'b00, CC_xxxx};
	// SET 4,B
	16'he020: ucode <= {16'h0000, D_B, OR, A_B, B_10, 2'b00, CC_xxxx};
	// SET 4,C
	16'he120: ucode <= {16'h0000, D_C, OR, A_C, B_10, 2'b00, CC_xxxx};
	// SET 4,D
	16'he220: ucode <= {16'h0000, D_D, OR, A_D, B_10, 2'b00, CC_xxxx};
	// SET 4,E
	16'he320: ucode <= {16'h0000, D_E, OR, A_E, B_10, 2'b00, CC_xxxx};
	// SET 4,H
	16'he420: ucode <= {16'h0000, D_H, OR, A_H, B_10, 2'b00, CC_xxxx};
	// SET 4,L
	16'he520: ucode <= {16'h0000, D_L, OR, A_L, B_10, 2'b00, CC_xxxx};
	// SET 4,(HL)
	16'he620: ucode <= {16'he621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'he621: ucode <= {16'he622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'he622: ucode <= {16'he623, D_DATA, OR, A_D8, B_10, 2'b00, CC_xxxx};
	16'he623: ucode <= {16'he624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'he624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SET 4,A
	16'he720: ucode <= {16'h0000, D_A, OR, A_A, B_10, 2'b00, CC_xxxx};
	// SET 5,B
	16'he820: ucode <= {16'h0000, D_B, OR, A_B, B_20, 2'b00, CC_xxxx};
	// SET 5,C
	16'he920: ucode <= {16'h0000, D_C, OR, A_C, B_20, 2'b00, CC_xxxx};
	// SET 5,D
	16'hea20: ucode <= {16'h0000, D_D, OR, A_D, B_20, 2'b00, CC_xxxx};
	// SET 5,E
	16'heb20: ucode <= {16'h0000, D_E, OR, A_E, B_20, 2'b00, CC_xxxx};
	// SET 5,H
	16'hec20: ucode <= {16'h0000, D_H, OR, A_H, B_20, 2'b00, CC_xxxx};
	// SET 5,L
	16'hed20: ucode <= {16'h0000, D_L, OR, A_L, B_20, 2'b00, CC_xxxx};
	// SET 5,(HL)
	16'hee20: ucode <= {16'hee21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hee21: ucode <= {16'hee22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hee22: ucode <= {16'hee23, D_DATA, OR, A_D8, B_20, 2'b00, CC_xxxx};
	16'hee23: ucode <= {16'hee24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hee24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SET 5,A
	16'hef20: ucode <= {16'h0000, D_A, OR, A_A, B_20, 2'b00, CC_xxxx};
	// SET 6,B
	16'hf020: ucode <= {16'h0000, D_B, OR, A_B, B_40, 2'b00, CC_xxxx};
	// SET 6,C
	16'hf120: ucode <= {16'h0000, D_C, OR, A_C, B_40, 2'b00, CC_xxxx};
	// SET 6,D
	16'hf220: ucode <= {16'h0000, D_D, OR, A_D, B_40, 2'b00, CC_xxxx};
	// SET 6,E
	16'hf320: ucode <= {16'h0000, D_E, OR, A_E, B_40, 2'b00, CC_xxxx};
	// SET 6,H
	16'hf420: ucode <= {16'h0000, D_H, OR, A_H, B_40, 2'b00, CC_xxxx};
	// SET 6,L
	16'hf520: ucode <= {16'h0000, D_L, OR, A_L, B_40, 2'b00, CC_xxxx};
	// SET 6,(HL)
	16'hf620: ucode <= {16'hf621, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hf621: ucode <= {16'hf622, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hf622: ucode <= {16'hf623, D_DATA, OR, A_D8, B_40, 2'b00, CC_xxxx};
	16'hf623: ucode <= {16'hf624, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hf624: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SET 6,A
	16'hf720: ucode <= {16'h0000, D_A, OR, A_A, B_40, 2'b00, CC_xxxx};
	// SET 7,B
	16'hf820: ucode <= {16'h0000, D_B, OR, A_B, B_80, 2'b00, CC_xxxx};
	// SET 7,C
	16'hf920: ucode <= {16'h0000, D_C, OR, A_C, B_80, 2'b00, CC_xxxx};
	// SET 7,D
	16'hfa20: ucode <= {16'h0000, D_D, OR, A_D, B_80, 2'b00, CC_xxxx};
	// SET 7,E
	16'hfb20: ucode <= {16'h0000, D_E, OR, A_E, B_80, 2'b00, CC_xxxx};
	// SET 7,H
	16'hfc20: ucode <= {16'h0000, D_H, OR, A_H, B_80, 2'b00, CC_xxxx};
	// SET 7,L
	16'hfd20: ucode <= {16'h0000, D_L, OR, A_L, B_80, 2'b00, CC_xxxx};
	// SET 7,(HL)
	16'hfe20: ucode <= {16'hfe21, D_0, OR, A_HL, B_0, 2'b10, CC_xxxx};
	16'hfe21: ucode <= {16'hfe22, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	16'hfe22: ucode <= {16'hfe23, D_DATA, OR, A_D8, B_80, 2'b00, CC_xxxx};
	16'hfe23: ucode <= {16'hfe24, D_0, OR, A_HL, B_0, 2'b01, CC_xxxx};
	16'hfe24: ucode <= {16'h0044, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
	// SET 7,A
	16'hff20: ucode <= {16'h0000, D_A, OR, A_A, B_80, 2'b00, CC_xxxx};

    
    // Delays
    16'h004x: ucode <= {u == 16'h0041 ? 16'h0000 : {u[15:4], u[3:0] - 4'h1}, 
                        D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    // Default to STOP
    default:  ucode <= {u, D_0, OR, A_0, B_0, 2'b00, CC_xxxx};
    endcase
    end
end

endmodule
