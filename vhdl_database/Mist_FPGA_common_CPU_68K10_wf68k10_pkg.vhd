------------------------------------------------------------------------
----                                                                ----
---- WF68K10 IP Core: this is the package file containing the data  ----
---- types and the component declarations.                          ----
----                                                                ----
---- Author(s):                                                     ----
----   Wolfgang Foerster, wf@experiment-s.de; wf@inventronik.de     ----
----                                                                ----
------------------------------------------------------------------------
----                                                                ----
---- Copyright © 2014-2019  Wolfgang Foerster Inventronik GmbH.     ----
----                                                                ----
---- This documentation describes Open Hardware and is licensed     ----
---- under the CERN OHL v. 1.2. You may redistribute and modify     ----
---- this documentation under the terms of the CERN OHL v.1.2.      ----
---- (http://ohwr.org/cernohl). This documentation is distributed   ----
---- WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF          ----
---- MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A        ----
---- PARTICULAR PURPOSE. Please see the CERN OHL v.1.2 for          ----
---- applicable conditions                                          ----
----                                                                ----
------------------------------------------------------------------------
-- 
-- Revision History
-- 
-- Revision 2K14B 20141201 WF
--   Initial Release.
-- Later revisions
--   Modifications according to changes of the entity in other modules.
-- 

library ieee;
use ieee.std_logic_1164.all;

package WF68K10_PKG is
type OP_SIZETYPE is (LONG, WORD, BYTE);
-- The OPCODES AND, NOT, OR, ROR and ROL are defined keywords in VHDL. Therefore the assignment is
-- AND_B, NOT_B, OR_B, ROTR and ROTL.
type OP_68K is (ABCD, ADD, ADDA, ADDI, ADDQ, ADDX, AND_B, ANDI, ANDI_TO_CCR, ANDI_TO_SR, ASL, ASR, Bcc, BCHG, BCLR, 
                BKPT, BRA, BSET, BSR, BTST, CHK, CLR, CMP, CMPA, CMPI, CMPM, DBcc, DIVS, DIVU, EOR, EORI, EORI_TO_CCR, 
                EORI_TO_SR, EXG, EXT, ILLEGAL, JMP, JSR, LEA, LINK, LSL, LSR, MOVE, MOVE_FROM_CCR, MOVE_TO_CCR, 
                MOVE_FROM_SR, MOVE_TO_SR, MOVE_USP, MOVEA, MOVEC, MOVEM, MOVEP, MOVEQ, MOVES, MULS, MULU, NBCD, NEG, 
                NEGX, NOP, NOT_B, OR_B, ORI, ORI_TO_CCR, ORI_TO_SR, PEA, RESET, ROTL, ROTR, ROXL, ROXR, RTD, 
                RTE, RTR, RTS, SBCD, Scc, STOP, SUB, SUBA, SUBI, SUBQ, SUBX, SWAP, TAS, TRAP, TRAPV, TST, 
                UNLK, UNIMPLEMENTED);

type TRAPTYPE_OPC is(NONE, T_1010, T_1111, T_ILLEGAL, T_TRAP, T_PRIV, T_RTE); -- None is the first entry and default.

component WF68K10_ADDRESS_REGISTERS
    port (
        CLK                 : in std_logic;
        RESET               : in bit;
        AR_IN_1             : in std_logic_vector(31 downto 0);
        AR_IN_2             : in std_logic_vector(31 downto 0);
        AR_OUT_1            : out std_logic_vector(31 downto 0);
        AR_OUT_2            : out std_logic_vector(31 downto 0);
        INDEX_IN            : in std_logic_vector(31 downto 0);
        PC                  : out std_logic_vector(31 downto 0);
        PC_EW_OFFSET        : in std_logic_vector(3 downto 0);
        STORE_ADR_FORMAT    : in bit;
        STORE_ABS_HI        : in bit;
        STORE_ABS_LO        : in bit;
        STORE_D16           : in bit;
        STORE_DISPL         : in bit;
        STORE_AEFF          : in bit;
        OP_SIZE             : in OP_SIZETYPE;
        ADR_OFFSET          : in std_logic_vector(31 downto 0);
        ADR_MARK_USED       : in bit;
        ADR_IN_USE          : out bit;
        ADR_MODE            : in std_logic_vector(2 downto 0);
        AMODE_SEL           : in std_logic_vector(2 downto 0);
        ADR_EFF             : out std_logic_vector(31 downto 0);
        ADR_EFF_WB          : out std_logic_vector(31 downto 0);
        DFC                 : out std_logic_vector(2 downto 0);
        DFC_WR              : in bit;
        SFC                 : out std_logic_vector(2 downto 0);
        SFC_WR              : in bit;
        ISP_DEC             : in bit;
        ISP_WR              : in bit;
        USP_RD              : in bit;
        USP_WR              : in bit;
        AR_MARK_USED        : in bit;
        USE_APAIR           : in boolean;
        AR_IN_USE           : out bit;
        AR_SEL_RD_1         : in std_logic_vector(2 downto 0);
        AR_SEL_RD_2         : in std_logic_vector(2 downto 0);
        AR_SEL_WR_1         : in std_logic_vector(2 downto 0);
        AR_SEL_WR_2         : in std_logic_vector(2 downto 0);
        AR_DEC              : in bit;
        AR_INC              : in bit;
        AR_WR_1             : in bit;
        AR_WR_2             : in bit;
        UNMARK              : in bit;
        EXT_WORD            : in std_logic_vector(15 downto 0);
        SBIT                : in std_logic;
        SP_ADD_DISPL        : in bit;
        RESTORE_ISP_PC      : in bit;
        DISPLACEMENT        : in std_logic_vector(31 downto 0);
        PC_ADD_DISPL        : in bit;
        PC_INC              : in bit;
        PC_LOAD             : in bit;
        PC_RESTORE          : in bit;
        PC_OFFSET           : in std_logic_vector(7 downto 0)
    );
end component;

component WF68K10_ALU
    port (
        CLK                 : in std_logic;
        RESET               : in bit;
        LOAD_OP1            : in bit;
        LOAD_OP2            : in bit;
        LOAD_OP3            : in bit;
        OP1_IN              : in std_logic_vector(31 downto 0);
        OP2_IN              : in std_logic_vector(31 downto 0);
        OP3_IN              : in std_logic_vector(31 downto 0);
        BITPOS_IN           : in Std_Logic_Vector(4 downto 0);
        RESULT              : out std_logic_vector(63 downto 0);
        ADR_MODE_IN         : in std_logic_vector(2 downto 0);
        OP_SIZE_IN          : in OP_SIZETYPE;
        OP_IN               : in OP_68K;
        OP_WB               : in OP_68K;
        BIW_0_IN            : in std_logic_vector(11 downto 0);
        BIW_1_IN            : in std_logic_vector(15 downto 0);
        SR_WR               : in bit;
        SR_INIT             : in bit;
        CC_UPDT             : in bit;
        STATUS_REG_OUT	    : out std_logic_vector(15 downto 0);
        ALU_COND            : out boolean;
        ALU_INIT            : in bit;
        ALU_BSY             : out bit;
        ALU_REQ             : out bit;
        ALU_ACK             : in bit;
        IRQ_PEND            : in std_logic_vector(2 downto 0);
        TRAP_CHK            : out bit;
        TRAP_DIVZERO        : out bit
    );
end component;

component WF68K10_BUS_INTERFACE
    port (
        CLK                 : in std_logic;
        ADR_IN_P            : in std_logic_vector(31 downto 0);
        ADR_OUT_P           : out std_logic_vector(31 downto 0);
        FC_IN               : in std_logic_vector(2 downto 0);
        FC_OUT              : out std_logic_vector(2 downto 0);
        DATA_PORT_IN        : in std_logic_vector(15 downto 0); 
        DATA_PORT_OUT       : out std_logic_vector(15 downto 0);
        DATA_FROM_CORE      : in std_logic_vector(31 downto 0);
        DATA_TO_CORE        : out std_logic_vector(31 downto 0);
        OPCODE_TO_CORE      : out std_logic_vector(15 downto 0);
        DATA_PORT_EN        : out std_logic;
        BUS_EN              : out std_logic;
        OP_SIZE             : in OP_SIZETYPE;
        RD_REQ              : in bit;
        WR_REQ              : in bit;
        DATA_RDY            : out bit;
        DATA_VALID          : out std_logic;
        OPCODE_REQ          : in bit;
        OPCODE_RDY          : out bit;
        OPCODE_VALID        : out std_logic;
        RMC                 : in bit;
        BUSY_EXH            : in bit;
        INBUFFER            : out std_logic_vector(31 downto 0);
        OUTBUFFER           : out std_logic_vector(31 downto 0);
        SSW                 : out std_logic_vector(15 downto 0);
        DTACKn              : in std_logic;
        ASn                 : out std_logic;
        UDSn                : out std_logic;
        LDSn                : out std_logic;
        RWn                 : out std_logic;
        RMCn                : out std_logic;
        DBENn               : out std_logic;
        E                   : out std_logic;
        VMAn                : out std_logic;
        VMA_EN              : out std_logic;
        VPAn                : in std_logic;
        BRn                 : in std_logic;
        BGACKn              : in std_logic;
        BGn                 : out std_logic;
        RESET_STRB          : in bit;
        RESET_IN            : in std_logic;
        RESET_OUT           : out std_logic;
        RESET_CPU           : out bit;
        AVECn               : in std_logic;
        HALTn               : in std_logic;
        BERRn               : in std_logic;
        AERR                : out bit;
        BUS_BSY             : out bit
    );
end component;

component WF68K10_CONTROL
    generic(NO_PIPELINE     : boolean := false); -- If true the controller work in scalar mode.
    port(
        CLK                 : in std_logic;
        RESET_CPU           : in bit;
        BUSY                : out bit;
        BUSY_EXH            : in bit;
        EXH_REQ             : in bit;
        INT_TRIG            : out bit;
        OW_REQ              : out bit;
        OW_VALID            : in std_logic;
        EW_REQ              : out bit;
        EW_ACK              : in bit;
        OPD_ACK             : in bit;
        ADR_MARK_USED       : out bit;
        ADR_IN_USE          : in bit;
        ADR_OFFSET          : out std_logic_vector(5 downto 0);
        DATA_RD             : out bit;
        DATA_WR             : out bit;
        DATA_RDY            : in bit;
        DATA_VALID          : in std_logic;
        RMC                 : out bit;
        LOAD_OP2            : out bit;
        LOAD_OP3            : out bit;
        LOAD_OP1            : out bit;
        STORE_ADR_FORMAT    : out bit;
        STORE_D16           : out bit;
        STORE_DISPL         : out bit;
        STORE_ABS_HI        : out bit;
        STORE_ABS_LO        : out bit;
        STORE_AEFF          : out bit;
        STORE_IDATA_B2      : out bit;
        STORE_IDATA_B1      : out bit;
        OP                  : in OP_68K;
        OP_SIZE             : out OP_SIZETYPE;
        BIW_0               : in std_logic_vector(13 downto 0);
        BIW_1               : in std_logic_vector(15 downto 0);
        EXT_WORD            : in std_logic_vector(15 downto 0);
        ADR_MODE            : out std_logic_vector(2 downto 0);
        AMODE_SEL           : out std_logic_vector(2 downto 0);
        OP_WB               : out OP_68K;
        OP_SIZE_WB          : out OP_SIZETYPE;
        BIW_0_WB_73         : out std_logic_vector(7 downto 3);
        AR_MARK_USED        : out bit;
        USE_APAIR           : out boolean;
        AR_IN_USE           : in bit;
        AR_SEL_RD_1         : out std_logic_vector(2 downto 0);
        AR_SEL_RD_2         : out std_logic_vector(2 downto 0);
        AR_SEL_WR_1         : out std_logic_vector(2 downto 0);
        AR_SEL_WR_2         : out std_logic_vector(2 downto 0);
        AR_INC              : out bit;
        AR_DEC              : out bit;
        AR_WR_1             : out bit;
        AR_WR_2             : out bit;
        DR_MARK_USED        : out bit;
        USE_DPAIR           : out boolean;
        DR_IN_USE           : in bit;
        DR_SEL_RD_1         : out std_logic_vector(2 downto 0);
        DR_SEL_RD_2         : out std_logic_vector(2 downto 0);
        DR_SEL_WR_1         : out std_logic_vector(2 downto 0);
        DR_SEL_WR_2         : out std_logic_vector(2 downto 0);
        DR_WR_1             : out bit;
        DR_WR_2             : out bit;
        UNMARK              : out bit;
        DISPLACEMENT        : out std_logic_vector(31 downto 0);
        PC_ADD_DISPL        : out bit;
        PC_LOAD             : out bit;
        PC_INC_EXH          : in bit;
        SP_ADD_DISPL        : out bit;
        DFC_WR              : out bit;
        DFC_RD              : out bit;
        SFC_WR              : out bit;
        SFC_RD              : out bit;
        VBR_WR              : out bit;
        VBR_RD              : out bit;
        USP_RD              : out bit;
        USP_WR              : out bit;
        IPIPE_FLUSH         : out bit;
        ALU_INIT            : out bit;
        ALU_BSY             : in bit;
        ALU_REQ             : in bit;
        ALU_ACK             : out bit;
        BKPT_CYCLE          : out bit;
        BKPT_INSERT         : out bit;
        LOOP_BSY            : in bit;
        LOOP_SPLIT          : out boolean;
        LOOP_EXIT           : out bit;
        SR_WR               : out bit;
        MOVEM_ADn           : out bit;
        MOVEP_PNTR          : out integer range 0 to 3;
        CC_UPDT             : out bit;
        TRACE_EN            : in std_logic;
        ALU_COND            : in boolean;
        DBcc_COND           : in boolean;
        BRANCH_ATN          : in bit;
        RESET_STRB          : out bit;
        BERR                : out bit;
        EX_TRACE            : out bit;
        TRAP_ILLEGAL        : out bit;
        TRAP_V              : out bit
    );
end component;

component WF68K10_DATA_REGISTERS
    port (
        CLK                 : in std_logic;
        RESET               : in bit;
        DR_IN_1             : in std_logic_vector(31 downto 0);
        DR_IN_2             : in std_logic_vector(31 downto 0);
        DR_OUT_1            : out std_logic_vector(31 downto 0);
        DR_OUT_2            : out std_logic_vector(31 downto 0);
        DR_SEL_WR_1         : in std_logic_vector(2 downto 0);
        DR_SEL_WR_2         : in std_logic_vector(2 downto 0);
        DR_SEL_RD_1         : in std_logic_vector(2 downto 0);
        DR_SEL_RD_2         : in std_logic_vector(2 downto 0);
        DR_WR_1             : in bit;
        DR_WR_2             : in bit;
        DR_MARK_USED        : in bit;
        USE_DPAIR           : in boolean;
        DR_IN_USE           : out bit;
        UNMARK              : in bit;
        OP_SIZE             : in OP_SIZETYPE
    );
end component;

component WF68K10_EXCEPTION_HANDLER
    generic(VERSION         : std_logic_vector(31 downto 0));
    port (
        CLK                 : in std_logic;
        RESET               : in bit;
        K6800n              : in std_logic;
        BUSY_MAIN           : in bit;
        BUSY_OPD            : in bit;
        EXH_REQ             : out bit;
        BUSY_EXH            : out bit;
        ADR_IN              : in std_logic_vector(31 downto 0);
        ADR_OFFSET          : out std_logic_vector(31 downto 0);
        CPU_SPACE           : out bit;
        DATA_0              : in std_logic;
        DATA_RD             : out bit;
        DATA_WR             : out bit;
        DATA_IN             : in std_logic_vector(31 downto 0);
        OP_SIZE             : out OP_SIZETYPE;
        DATA_RDY            : in bit;
        DATA_VALID          : in std_logic;
        OPCODE_RDY          : in bit;
        STATUS_REG_IN       : in std_logic_vector(15 downto 0);
        SR_CPY              : out std_logic_vector(15 downto 0);
        SR_INIT             : out bit;
        SR_WR               : out bit;
        ISP_DEC             : out bit;
        ISP_LOAD            : out bit;
        PC_INC              : out bit;
        PC_LOAD             : out bit;
        PC_RESTORE          : out bit;
        STACK_FORMAT        : out std_logic_vector(3 downto 0);
        STACK_POS           : out integer range 0 to 31;
        SP_ADD_DISPL        : out bit;
        DISPLACEMENT        : out std_logic_vector(7 downto 0);
        IPIPE_FILL          : out bit;
        IPIPE_FLUSH         : out bit;
        RESTORE_ISP_PC      : out bit;
        HALT_OUTn           : out std_logic;
        INT_TRIG            : in bit;
        IRQ_IN              : in std_logic_vector(2 downto 0);
        IRQ_PEND            : out std_logic_vector(2 downto 0);
        AVECn               : in std_logic;
        IVECT_OFFS          : out std_logic_vector(9 downto 0);
        TRAP_AERR           : in bit;
        TRAP_BERR           : in bit;
        TRAP_CHK            : in bit;
        TRAP_DIVZERO        : in bit;
        TRAP_ILLEGAL        : in bit;
        TRAP_CODE_OPC       : in TRAPTYPE_OPC;
        TRAP_VECTOR         : in std_logic_vector(3 downto 0);
        TRAP_V              : in bit;
        EX_TRACE_IN         : in bit;
        VBR_WR              : in bit;
        VBR                 : out std_logic_vector(31 downto 0)     
    );
end component;

component WF68K10_OPCODE_DECODER
    generic(NO_LOOP         : boolean := false); -- If true the DBcc loop mechanism is disabled.
    port (
        CLK                 : in std_logic;
        K6800n              : in std_logic;
        OW_REQ_MAIN         : in bit;
        EW_REQ_MAIN         : in bit;
        EXH_REQ             : in bit;
        BUSY_EXH            : in bit;
        BUSY_MAIN           : in bit;
        BUSY_OPD            : out bit;
        BKPT_INSERT         : in bit;
        BKPT_DATA           : in std_logic_vector(15 downto 0);
        LOOP_EXIT           : in bit;
        LOOP_BSY            : out bit;
        OPD_ACK_MAIN        : out bit;
        EW_ACK              : out bit;
        PC_EW_OFFSET        : out std_logic_vector(3 downto 0);
        PC_INC              : out bit;
        PC_INC_EXH          : in bit;
        PC_ADR_OFFSET       : out std_logic_vector(7 downto 0);
        PC_OFFSET           : out std_logic_vector(7 downto 0);
        OPCODE_RD           : out bit;
        OPCODE_RDY          : in bit;
        OPCODE_VALID        : in std_logic;
        OPCODE_DATA         : in std_logic_vector(15 downto 0);
        IPIPE_FILL          : in bit;
        IPIPE_FLUSH         : in bit;
        OW_VALID            : out std_logic;
        SBIT                : in std_logic;
        TRAP_CODE           : out TRAPTYPE_OPC;
        OP                  : out OP_68K;
        BIW_0               : out std_logic_vector(15 downto 0);
        BIW_1               : out std_logic_vector(15 downto 0);
        BIW_2               : out std_logic_vector(15 downto 0);
        EXT_WORD            : out std_logic_vector(15 downto 0)
    );
end component;
end WF68K10_PKG;
