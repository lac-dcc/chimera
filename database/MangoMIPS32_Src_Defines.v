/********************MangoMIPS32*******************
Filename:   Defines.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/

/*--------------------Constant--------------------*/
// Width constant
`define         ALUOp_W              6
`define         Exc_W               18
`define         ExcT_W               4
`define         CacheOp_W            4
`define         TLB_Idx_W            5
`define         TLB_N               32
`define         TLB_N1              31

// Global constant
`define         true                 1'b1
`define         false                1'b0
`define         One                  1'b1
`define         Zero                 1'b0
`define         ZeroReg              5'h0
`define         ZeroByte             8'h0
`define         ZeroWord            32'h0
`define         ZeroDWord           64'h0
`define         WrDisable            4'h0
`define         WrAllEn              4'hF
`define         GPR_ra               5'd31

// Pipeline stage identifier
`define         IF                   0
`define         ID                   1
`define         EX                   2
`define         MEM                  3
`define         WB                   4

// Coprocessor identifier
`define         CP0                  2'd0
`define         CP1                  2'd1
`define         CP2                  2'd2
`define         CP3                  2'd3

// Save/Load Width
`define         ASize_Byte              2'b00
`define         ASize_Half              2'b01
`define         ASize_Word              2'b10

// Entrance address
`define         Reset_Entrance          32'hBFC00000

`define         Bootstrap_Base          32'hBFC00200
`define         Normal_Base             32'h80000000
`define         Bootstrap_GenExc        32'hBFC00380
`define         Normal_GenExc           32'h80000180
`define         Bootstrap_SpIntr        32'hBFC00400
`define         Normal_SpIntr           32'h80000200

/*--------------------Vector--------------------*/
// Bus Width
`define         DWord               63: 0
`define         Word                31: 0
`define         AddrBus             31: 0
`define         DataBus             31: 0
`define         CP0Addr              7: 0
`define         HardInt              5: 0
`define         RegAddr              4: 0
`define         Stages               4: 0
`define         ByteWEn              3: 0
`define         CPNum                1: 0
`define         AXISize              1: 0
`define         ALUOp                 `ALUOp_W-1:0
`define         CacheOp             `CacheOp_W-1:0
`define         ExcBus                  `Exc_W-1:0
`define         ExcType                `ExcT_W-1:0
`define         TLB_Idx             `TLB_Idx_W-1:0
`define         TLB_Sel                 `TLB_N-1:0
`define         TLB_Itm             97: 0
`define         PageNum             19: 0
`define         CacheAt              2: 0
`define         TLBOp                2: 0

// Partial Select
`define         Hi                  63:32
`define         Lo                  31: 0
`define         Byte0                7: 0
`define         Byte1               15: 8
`define         Byte2               23:16
`define         Byte3               31:24
`define         Seg                 31:29

/*--------------------Encoding--------------------*/
// Opcode
`define         OP_SPECIAL          6'b000000
`define         OP_REGIMM           6'b000001
`define         OP_J                6'b000010
`define         OP_JAL              6'b000011
`define         OP_BEQ              6'b000100
`define         OP_BNE              6'b000101
`define         OP_BLEZ             6'b000110
`define         OP_BGTZ             6'b000111
`define         OP_ADDI             6'b001000
`define         OP_ADDIU            6'b001001
`define         OP_SLTI             6'b001010
`define         OP_SLTIU            6'b001011
`define         OP_ANDI             6'b001100
`define         OP_ORI              6'b001101
`define         OP_XORI             6'b001110
`define         OP_LUI              6'b001111
`define         OP_COP0             6'b010000
`define         OP_COP1             6'b010001
`define         OP_COP2             6'b010010
`define         OP_COP3             6'b010011
`define         OP_BEQL             6'b010100
`define         OP_BNEL             6'b010101
`define         OP_BLEZL            6'b010110
`define         OP_BGTZL            6'b010111
`define         OP_SPECIAL2         6'b011100
`define         OP_LB               6'b100000
`define         OP_LH               6'b100001
`define         OP_LWL              6'b100010
`define         OP_LW               6'b100011
`define         OP_LBU              6'b100100
`define         OP_LHU              6'b100101
`define         OP_LWR              6'b100110
`define         OP_SB               6'b101000
`define         OP_SH               6'b101001
`define         OP_SWL              6'b101010
`define         OP_SW               6'b101011
`define         OP_SWR              6'b101110
`define         OP_CACHE            6'b101111
`define         OP_LL               6'b110000
`define         OP_LWC1             6'b110001
`define         OP_LWC2             6'b110010
`define         OP_PREF             6'b110011
`define         OP_LDC1             6'b110101
`define         OP_LDC2             6'b110110
`define         OP_SC               6'b111000
`define         OP_SWC1             6'b111001
`define         OP_SWC2             6'b111010
`define         OP_SDC1             6'b111101
`define         OP_SDC2             6'b111110

// Function : Opcode = Special
`define         SP_SLL              6'b000000
`define         SP_MOVCI            6'b000001
`define         SP_SRL              6'b000010
`define         SP_SRA              6'b000011
`define         SP_SLLV             6'b000100
`define         SP_SRLV             6'b000110
`define         SP_SRAV             6'b000111
`define         SP_JR               6'b001000
`define         SP_JALR             6'b001001
`define         SP_MOVZ             6'b001010
`define         SP_MOVN             6'b001011
`define         SP_SYSCALL          6'b001100
`define         SP_BREAK            6'b001101
`define         SP_SYNC             6'b001111
`define         SP_MFHI             6'b010000
`define         SP_MTHI             6'b010001
`define         SP_MFLO             6'b010010
`define         SP_MTLO             6'b010011
`define         SP_MULT             6'b011000
`define         SP_MULTU            6'b011001
`define         SP_DIV              6'b011010
`define         SP_DIVU             6'b011011
`define         SP_ADD              6'b100000
`define         SP_ADDU             6'b100001
`define         SP_SUB              6'b100010
`define         SP_SUBU             6'b100011
`define         SP_AND              6'b100100
`define         SP_OR               6'b100101
`define         SP_XOR              6'b100110
`define         SP_NOR              6'b100111
`define         SP_SLT              6'b101010
`define         SP_SLTU             6'b101011
`define         SP_TGE              6'b110000
`define         SP_TGEU             6'b110001
`define         SP_TLT              6'b110010
`define         SP_TLTU             6'b110011
`define         SP_TEQ              6'b110100
`define         SP_TNE              6'b110110

// Rt : Opcode = RegImm
`define         RI_BLTZ             5'b00000
`define         RI_BGEZ             5'b00001
`define         RI_BLTZL            5'b00010
`define         RI_BGEZL            5'b00011
`define         RI_TGEI             5'b01000
`define         RI_TGEIU            5'b01001
`define         RI_TLTI             5'b01010
`define         RI_TLTIU            5'b01011
`define         RI_TEQI             5'b01100
`define         RI_TNEI             5'b01110
`define         RI_BLTZAL           5'b10000
`define         RI_BGEZAL           5'b10001
`define         RI_BLTZALL          5'b10010
`define         RI_BGEZALL          5'b10011

// Function : Opcode = Special2
`define         SP2_MADD            6'b000000
`define         SP2_MADDU           6'b000001
`define         SP2_MUL             6'b000010
`define         SP2_MSUB            6'b000100
`define         SP2_MSUBU           6'b000101
`define         SP2_CLZ             6'b100000
`define         SP2_CLO             6'b100001

// Rs : Opcode = COP0
`define         C0_MFC0             5'b00000
`define         C0_MTC0             5'b00100
`define         C0_CO               5'b10000

// Function : Opcode = COP0 and Rs = CO
`define         C0F_TLBR            6'b000001
`define         C0F_TLBWI           6'b000010
`define         C0F_TLBWR           6'b000110
`define         C0F_TLBP            6'b001000
`define         C0F_ERET            6'b011000
`define         C0F_WAIT            6'b100000

// Rt: Opcode = CACHE
`define         CA_III              5'b00000
`define         CA_DIWI             5'b00001
`define         CA_IIST             5'b01000
`define         CA_DIST             5'b01001
`define         CA_IHI              5'b10000
`define         CA_DHI              5'b10001
`define         CA_DHWI             5'b10101

/*--------------------ALU Op--------------------*/
`define         ALU_NOP             `ALUOp_W'h00
`define         ALU_AND             `ALUOp_W'h01
`define         ALU_OR              `ALUOp_W'h02
`define         ALU_XOR             `ALUOp_W'h03
`define         ALU_NOR             `ALUOp_W'h04
`define         ALU_SLL             `ALUOp_W'h05
`define         ALU_SRL             `ALUOp_W'h06
`define         ALU_SRA             `ALUOp_W'h07
`define         ALU_SLT             `ALUOp_W'h08
`define         ALU_SLTU            `ALUOp_W'h09
`define         ALU_ADD             `ALUOp_W'h0A
`define         ALU_ADDU            `ALUOp_W'h0B
`define         ALU_SUB             `ALUOp_W'h0C
`define         ALU_SUBU            `ALUOp_W'h0D
`define         ALU_CLZ             `ALUOp_W'h0E
`define         ALU_CLO             `ALUOp_W'h0F

`define         ALU_MOV             `ALUOp_W'h10
`define         ALU_MFHI            `ALUOp_W'h11
`define         ALU_MTHI            `ALUOp_W'h12
`define         ALU_MFLO            `ALUOp_W'h13
`define         ALU_MTLO            `ALUOp_W'h14
`define         ALU_MULT            `ALUOp_W'h15
`define         ALU_MULTU           `ALUOp_W'h16
`define         ALU_MUL             `ALUOp_W'h17
`define         ALU_MADD            `ALUOp_W'h18
`define         ALU_MADDU           `ALUOp_W'h19
`define         ALU_MSUB            `ALUOp_W'h1A
`define         ALU_MSUBU           `ALUOp_W'h1B
`define         ALU_DIV             `ALUOp_W'h1C
`define         ALU_DIVU            `ALUOp_W'h1D
`define         ALU_BAL             `ALUOp_W'h1E

`define         ALU_LB              `ALUOp_W'h20
`define         ALU_LBU             `ALUOp_W'h21
`define         ALU_LH              `ALUOp_W'h22
`define         ALU_LHU             `ALUOp_W'h23
`define         ALU_LW              `ALUOp_W'h24
`define         ALU_LWL             `ALUOp_W'h25
`define         ALU_LWR             `ALUOp_W'h26
`define         ALU_SB              `ALUOp_W'h27
`define         ALU_SH              `ALUOp_W'h28
`define         ALU_SW              `ALUOp_W'h29
`define         ALU_SWL             `ALUOp_W'h2A
`define         ALU_SWR             `ALUOp_W'h2B
`define         ALU_LL              `ALUOp_W'h2C
`define         ALU_SC              `ALUOp_W'h2D
`define         ALU_CACHE           `ALUOp_W'h2E

`define         ALU_MFC0            `ALUOp_W'h30
`define         ALU_MTC0            `ALUOp_W'h31
`define         ALU_TGE             `ALUOp_W'h32
`define         ALU_TGEU            `ALUOp_W'h33
`define         ALU_TLT             `ALUOp_W'h34
`define         ALU_TLTU            `ALUOp_W'h35
`define         ALU_TEQ             `ALUOp_W'h36
`define         ALU_TNE             `ALUOp_W'h37
`define         ALU_TLBR            `ALUOp_W'h38
`define         ALU_TLBWI           `ALUOp_W'h39
`define         ALU_TLBWR           `ALUOp_W'h3A
`define         ALU_TLBP            `ALUOp_W'h3B
`define         ALU_ERET            `ALUOp_W'h3C
`define         ALU_WAIT            `ALUOp_W'h3D

/*--------------------Cache--------------------*/
// Inst Cache
`define         I_N                 `ICache_N
`define         I_lineN             2 ** (5 + `I_N)
`define         I_lnNum             `I_lineN - 1 : 0
`define         I_addr_ptag         31 : (11 + `I_N)
`define         I_addr_idx          (10 + `I_N) : 6
`define         I_addr_ramad        (10 + `I_N) : 2
`define         I_ptag              (20 - `I_N) : 0
`define         I_idx               ( 4 + `I_N) : 0
`define         I_ramad             ( 8 + `I_N) : 0

// Data Cache
`define         D_N                 `DCache_N
`define         D_lineN             2 ** (5 + `D_N)
`define         D_lnNum             `D_lineN - 1 : 0
`define         D_addr_ptag         31 : (11 + `D_N)
`define         D_addr_idx          (10 + `D_N) : 6
`define         D_addr_ramad        (10 + `D_N) : 2
`define         D_ptag              (20 - `D_N) : 0
`define         D_idx               ( 4 + `D_N) : 0
`define         D_ramad             ( 8 + `D_N) : 0

// Cache Op
`define         COP_NOP             `CacheOp_W'b0000

//CacheOp[0] = 1 : ICache
`define         COP_III             `CacheOp_W'b0011
`define         COP_IIST            `CacheOp_W'b0101
`define         COP_IHI             `CacheOp_W'b0111

//CacheOp[0] = 0 : DCache
`define         COP_DIWI            `CacheOp_W'b0010
`define         COP_DIST            `CacheOp_W'b0100
`define         COP_DHI             `CacheOp_W'b0110
`define         COP_DHWI            `CacheOp_W'b1000

/*--------------------Coprocessor 0--------------------*/
// CP0 Registers
`define         CP0_ZeroReg          8'd00
`define         CP0_Index           {5'd00, 3'd0}
`define         CP0_Random          {5'd01, 3'd0}
`define         CP0_EntryLo0        {5'd02, 3'd0}
`define         CP0_EntryLo1        {5'd03, 3'd0}
`define         CP0_Context         {5'd04, 3'd0}
`define         CP0_PageMask        {5'd05, 3'd0}
`define         CP0_Wired           {5'd06, 3'd0}
`define         CP0_BadVAddr        {5'd08, 3'd0}
`define         CP0_Count           {5'd09, 3'd0}
`define         CP0_EntryHi         {5'd10, 3'd0}
`define         CP0_Compare         {5'd11, 3'd0}
`define         CP0_Status          {5'd12, 3'd0}
`define         CP0_Cause           {5'd13, 3'd0}
`define         CP0_EPC             {5'd14, 3'd0}
`define         CP0_PrId            {5'd15, 3'd0}
`define         CP0_EBase           {5'd15, 3'd1}
`define         CP0_Config          {5'd16, 3'd0}
`define         CP0_Config1         {5'd16, 3'd1}
`define         CP0_TagLo           {5'd28, 3'd0}
`define         CP0_TagHi           {5'd29, 3'd0}
`define         CP0_ErrorEPC        {5'd30, 3'd0}

// Fields of Status Register
`define         CU3                 31
`define         CU2                 30
`define         CU1                 29
`define         CU0                 28
`define         BEV                 22
`define         IM                  15:8
`define         UM                   4
`define         ERL                  2
`define         EXL                  1
`define         IE                   0

// Fields of Cause Register
`define         BD                  31
`define         CE                  29:28
`define         IV                  23
`define         IPH                 15:10
`define         IPS                  9: 8
`define         IP                  15: 8
`define         ExcCode              6: 2

// Fields of Config Registers
`define         K23                 30:28
`define         KU                  27:25
`define         K0                   2: 0

// Fields of CP0 TLB Registers
// EntryLo
`define         PFN                 25: 6
`define         CAt                  5: 3
`define         Drt                  2
`define         Vld                  1
`define         Glb                  0

// EntryHi
`define         VPN2                31:13
`define         ASID                 7: 0

// Context
`define         PTEBase             31:23
`define         BadVPN2             22: 4

// PageMask
`define         Mask                28:13
`define         VMask               31:13
`define         PMask               31:12

// Zero Fields
`define         Index_0             30:`TLB_Idx_W
`define         Random_0            31:`TLB_Idx_W
`define         Wired_0             31:`TLB_Idx_W
`define         Random_Rst          `TLB_Idx_W'd`TLB_N1

// Fields of CP0 cache tag registers
`define         ITag_Tag            `I_addr_ptag
`define         ITag_0              (10 + `I_N) : 1
`define         ITag_Vld            0

`define         DTag_Tag            `D_addr_ptag
`define         DTag_0              (10 + `D_N) : 2
`define         DTag_Drt            1
`define         DTag_Vld            0

/*--------------------MMU--------------------*/
// Virtual Address Segments
`define         kuseg               3'b0??
`define         kseg0               3'b100
`define         kseg1               3'b101
`define         kseg2               3'b110
`define         kseg3               3'b111

// TLB Item Fields
`define         TLB_VPN2            97:79
`define         TLB_ASID            78:71
`define         TLB_PMask           70:51
`define         TLB_VMask           70:52
`define         TLB_Mask            67:52
`define         TLB_G               50
`define         TLB_PFN0            49:30
`define         TLB_V0              29
`define         TLB_D0              28
`define         TLB_C0              27:25
`define         TLB_PFN1            24: 5
`define         TLB_V1               4
`define         TLB_D1               3
`define         TLB_C1               2: 0

// TLB operation
`define         TOP_NOP              3'd0
`define         TOP_TLBR             3'd1
`define         TOP_TLBWI            3'd2
`define         TOP_TLBWR            3'd3
`define         TOP_TLBP             3'd4

/*--------------------Exceptions--------------------*/
// No exception
`define         Exc_NoExc           `Exc_W'b0
`define         ExcT_NoExc          `ExcT_W'b0

// Index of exception vector
`define         Exc_NMI             0
`define         Exc_Intr            1
`define         Exc_I_AdE           2
`define         Exc_I_TLBR          3
`define         Exc_I_TLBI          4
`define         Exc_I_BusE          5
`define         Exc_CpU             6
`define         Exc_RI              7
`define         Exc_Ov              8
`define         Exc_Trap            9
`define         Exc_SysC            10
`define         Exc_Bp              11
`define         Exc_D_AdE           12
`define         Exc_D_TLBR          13
`define         Exc_D_TLBI          14
`define         Exc_D_TLBM          15
`define         Exc_D_BusE          16
`define         Exc_ERET            17

// Exception Types
`define         ExcT_Intr           `ExcT_W'h01
`define         ExcT_CpU            `ExcT_W'h02
`define         ExcT_RI             `ExcT_W'h03
`define         ExcT_Ov             `ExcT_W'h04
`define         ExcT_Trap           `ExcT_W'h05
`define         ExcT_SysC           `ExcT_W'h06
`define         ExcT_Bp             `ExcT_W'h07
`define         ExcT_AdE            `ExcT_W'h08
`define         ExcT_TLBR           `ExcT_W'h09
`define         ExcT_TLBI           `ExcT_W'h0A
`define         ExcT_TLBM           `ExcT_W'h0B
`define         ExcT_IBE            `ExcT_W'h0C
`define         ExcT_DBE            `ExcT_W'h0D
`define         ExcT_ERET           `ExcT_W'h0E

// Cause.ExcCode
`define         ExcC_Intr           5'h00
`define         ExcC_Mod            5'h01
`define         ExcC_TLBL           5'h02
`define         ExcC_TLBS           5'h03
`define         ExcC_AdEL           5'h04
`define         ExcC_AdES           5'h05
`define         ExcC_IBE            5'h06
`define         ExcC_DBE            5'h07
`define         ExcC_SysC           5'h08
`define         ExcC_Bp             5'h09
`define         ExcC_RI             5'h0A
`define         ExcC_CpU            5'h0B
`define         ExcC_Ov             5'h0C
`define         ExcC_Tr             5'h0D

/*--------------------End of Defines--------------------*/