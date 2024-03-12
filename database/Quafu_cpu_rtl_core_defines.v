//全局
`define RstEnable 1'b1
`define RstDisable 1'b0
`define ZeroWord 32'h00000000
`define WriteEnable 1'b1
`define WriteDisable 1'b0
`define ReadEnable 1'b1
`define ReadDisable 1'b0
`define AluOpBus 7:0    //
`define AluSelBus 2:0   //
`define Stop 1'b1
`define NoStop 1'b0
`define Branch 1'b1
`define NotBranch 1'b0
`define InstValid 1'b0
`define InstInvalid 1'b1
`define True_v 1'b1
`define False_v 1'b0
`define ChipEnable 1'b1
`define ChipDisable 1'b0


//指令
`define EXE_ORI  3'b110   //I
`define EXE_AND_REMU  3'b111		//R		
`define EXE_OR_REM   3'b110		//R		
`define EXE_XOR_DIV 3'b100		//R		
`define EXE_ANDI 3'b111   //I
`define EXE_XORI 3'b100   //I
`define EXE_LUI 7'b0110111		//U
`define EXE_ADD_SUB_MUL 3'b000	//R
`define EXE_ADDI 3'b000 //I
`define EXE_SLTI 3'b010	//I
`define EXE_SLTIU 3'b011	//I
`define EXE_SLT_MULHSU 3'b010		//R
`define EXE_SLTU_MULHU 3'b011		//R
`define EXE_BEQ 3'b000		//B
`define EXE_BNE 3'b001		//B
`define EXE_BLT 3'b100		//B
`define EXE_BLTU 3'b110		//B
`define EXE_BGE 3'b101		//B
`define EXE_BGEU 3'b111		//B


`define EXE_SLL_MULH  3'b001		//R		
`define EXE_SLLI  3'b001   //I
`define EXE_SRL_SRA_DIVU  3'b101		//R		
`define EXE_SRLI_SRAI  3'b101   //I	
`define EXE_JAL 7'b1101111	//J
`define EXE_JALR 7'B1100111	//I

`define EXE_LB 3'b000		//I
`define EXE_LH 3'b001		//I
`define EXE_LBU 3'b100		//I
`define EXE_LHU 3'b101		//I
`define EXE_LW 3'b010		//I
`define EXE_LWU 3'b110		//I
`define EXE_LD 3'b011		//I

`define EXE_SB 3'b000		//S
`define EXE_SH 3'b001		//S
`define EXE_SW 3'b010		//S
`define EXE_SD	3'b011		//S

`define EXE_CSRRW	3'b001		//I
`define EXE_CSRRWI	3'b101		//I
`define EXE_CSRRS	3'b010		//I
`define EXE_CSRRSI	3'b110		//I
`define EXE_CSRRC	3'b011		//I
`define EXE_CSRRCI	3'b111		//I

`define EXE_ECALL_EBREAK_MRET 3'b000

`define EXE_R_INST 7'b0110011
`define EXE_I_INST 7'b0010011
`define EXE_B_INST 7'b1100011
`define EXE_L_INST 7'b0000011
`define EXE_S_INST 7'b0100011
`define EXE_CSR_ENV_INST 7'b1110011
`define EXE_AUIPC_INST 7'b0010111

`define EXE_NOP 7'b0000000


//AluOp
`define EXE_AND_OP   8'b00100100
`define EXE_OR_OP    8'b00100101
`define EXE_XOR_OP  8'b00100110
`define EXE_XORI_OP  8'b01011011
`define EXE_LUI_OP  8'b01011100  
 

`define EXE_SLL_OP  8'b01111100
`define EXE_SRL_OP  8'b00000010
`define EXE_SRA_OP  8'b00000011

`define EXE_ADD_OP  8'b00100000
`define EXE_ADDI_OP  8'b01010101
`define EXE_SLT_OP  8'b00101010
`define EXE_SLTU_OP  8'b00101011
`define EXE_MUL_OP  8'b10101001
`define EXE_MULH_OP  8'b00011000
`define EXE_MULHU_OP  8'b00011001
`define EXE_MULHSU_OP 8'b00011111   //

`define EXE_NOP_OP    8'b00000000
`define EXE_ADDI_OP  8'b01010101
`define EXE_SUB_OP  8'b00100010

`define EXE_DIV_OP  8'b00011010
`define EXE_DIVU_OP  8'b00011011
`define EXE_REMU_OP	8'b00111011		//
`define EXE_REM_OP 8'b00111111		//

`define EXE_JAL_OP  8'b01010000
`define EXE_JALR_OP  8'b00001001

`define EXE_BEQ_OP  8'b01001011
`define EXE_BNE_OP  8'b01010100
`define EXE_BLT_OP  8'b01010011
`define EXE_BLTU_OP  8'b01000000
`define EXE_BGE_OP  8'b01001010
`define EXE_BGEU_OP  8'b01010010

`define EXE_LB_OP  8'b11100000
`define EXE_LBU_OP  8'b11100100
`define EXE_LH_OP  8'b11100001
`define EXE_LHU_OP  8'b11100101
`define EXE_LW_OP  8'b11100011
`define EXE_LWU_OP  8'b11100010
`define EXE_LD_OP  8'b11100110

`define EXE_SB_OP  8'b11101000
`define EXE_SH_OP  8'b11101001
`define EXE_SW_OP  8'b11101011
`define EXE_SD_OP  8'b10101011	//

`define EXE_CSRRC_OP 8'b01001000		//
`define EXE_CSRRS_OP 8'b11000000		//
`define EXE_CSRRW_OP 8'b11110000		//

`define EXE_MRET_OP 8'b10101010	//
`define EXE_ECALL_OP 8'b11101010	//

//AluSel
`define EXE_RES_LOGIC 3'b001
`define EXE_RES_SHIFT 3'b010
`define EXE_RES_ARITHMETIC 3'b100	
`define EXE_RES_MUL 3'b101
`define EXE_RES_DIV 3'b011		//
`define EXE_RES_JUMP_BRANCH 3'b110
`define EXE_RES_LOAD_STORE 3'b111

`define EXE_RES_NOP 3'b000


//指令存储器inst_rom
`define InstAddrBus 31:0
`define InstBus 31:0
`define InstMemNum 1024
`define InstMemNumLog2 10


//通用寄存器regfile
`define RegAddrBus 4:0
`define RegBus 31:0
`define RegWidth 32
`define DoubleRegWidth 64
`define DoubleRegBus 63:0
`define RegNum 32
`define RegNumLog2 5
`define NOPRegAddr 5'b00000

//除法div
`define DivFree 2'b00
`define DivByZero 2'b01
`define DivOn 2'b10
`define DivEnd 2'b11
`define DivResultReady 1'b1
`define DivResultNotReady 1'b0
`define DivStart 1'b1
`define DivStop 1'b0

//数据存储器data_ram
`define DataAddrBus 31:0
`define DataBus 31:0
`define DataMemNum 131071
`define DataMemNumLog2 17
`define ByteWidth 7:0


`define CSR_REG_FFLAGS 12'h001
`define CSR_REG_FRM 12'h002
`define CSR_REG_FCSR 12'h003
`define CSR_REG_MSTATUS 12'h300
`define CSR_REG_MISA 12'h301
`define CSR_REG_MIE 12'h304
`define CSR_REG_MTVEC 12'h305
`define CSR_REG_MSCRATCH 12'h340
`define CSR_REG_MEPC 12'h 341
`define CSR_REG_MCAUSE 12'h342
`define CSR_REG_MTVAL 12'h343
`define CSR_REG_MIP 12'h344
`define CSR_REG_MCYCLE 12'hB00
`define CSR_REG_MCYCLEH 12'hB80
`define CSR_REG_MINSTRET 12'hB02
`define CSR_REG_MINSTRETH 12'hB82
`define CSR_REG_MVENDORID 12'hF11
`define CSR_REG_MARCHID 12'hF12
`define CSR_REG_MIMPID 12'hF13
`define CSR_REG_MHARTID 12'hF14
`define CSR_REG_MTINME 12'h000
`define CSR_REG_MTIMECMP 12'h000
`define CSR_REG_MSIP 12'h000

`define InterruptAssert 1'b1
`define InterruptNotAssert 1'b0
`define TrapAssert 1'b1
`define TrapNotAssert 1'b0
`define True_v 1'b1
`define False_v 1'b0

//wishbone总线的状态机
`define WB_IDLE 2'b00
`define WB_BUSY 2'b01
`define WB_WAIT_FOR_FLUSHING 2'b10
`define WB_WAIT_FOR_STALL 2'b11

`define PLIC_BASE 32'h30000000
`define CLINT_BASE 32'h40000000

`define u_mode 2'b00
`define m_mode 2'b11