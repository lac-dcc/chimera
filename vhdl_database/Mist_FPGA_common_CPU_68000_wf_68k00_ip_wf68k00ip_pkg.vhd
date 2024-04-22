----------------------------------------------------------------------
----                                                              ----
---- MC68000 compatible IP Core					                  ----
----                                                              ----
---- This file is part of the SUSKA ATARI clone project.          ----
---- http://www.experiment-s.de                                   ----
----                                                              ----
---- Description:                                                 ----
---- This model provides an opcode and bus timing compatible ip   ----
---- core compared to Motorola's MC68000 microprocessor.          ----
----                                                              ----
---- This file is the package file of the ip core.                ----
----                                                              ----
----                                                              ----
----                                                              ----
----                                                              ----
---- Author(s):                                                   ----
---- - Wolfgang Foerster, wf@experiment-s.de; wf@inventronik.de   ----
----                                                              ----
---- Copyright (C) 2006 - 2008 Wolfgang Foerster                  ----
----                                                              ----
---- This source file is free software; you can redistribute it   ----
---- and/or modify it under the terms of the GNU General Public   ----
---- License as published by the Free Software Foundation; either ----
---- version 2 of the License, or (at your option) any later      ----
---- version.                                                     ----
----                                                              ----
---- This program is distributed in the hope that it will be      ----
---- useful, but WITHOUT ANY WARRANTY; without even the implied   ----
---- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ----
---- PURPOSE.  See the GNU General Public License for more        ----
---- details.                                                     ----
----                                                              ----
---- You should have received a copy of the GNU General Public    ----
---- License along with this program; if not, write to the Free   ----
---- Software Foundation, Inc., 51 Franklin Street, Fifth Floor,  ----
---- Boston, MA 02110-1301, USA.                                  ----
----                                                              ----
----------------------------------------------------------------------
-- 
-- Revision History
-- 
-- Revision 2K6B  2006/12/24 WF
--   Initial Release.
-- Revision 2K7A  2007/05/31 WF
--   Updated all modules.
-- Revision 2K8A  2008/07/14 WF
--   See the 68K00 top level file.
-- 

library ieee;
use ieee.std_logic_1164.all;

package WF68K00IP_PKG is
type EXWORDTYPE	is array(0 to 1) of std_logic_vector(15 downto 0);
type OP_SIZETYPE is (LONG, WORD, BYTE); -- Default is Byte.
type D_SIZETYPE is (LONG, WORD, BYTE); -- Displacement size.
-- The OPCODES AND, NOT, OR, ROR and ROL are defined keywords in VHDL. Therefore the assignment is
-- AND_B, NOT_B, OR_B, ROTR and ROTL.
type OP_68K00 is (ABCD, ADD, ADDA, ADDI, ADDQ, ADDX, AND_B, ANDI, ANDI_TO_CCR, ANDI_TO_SR, ASL, ASR, Bcc, BCHG, BCLR,
                  BRA, BSET, BSR, BTST, CHK, CLR, CMP, CMPA, CMPI, CMPM, DBcc, DIVS, DIVU, EOR, EORI, EORI_TO_CCR,
                  EORI_TO_SR, EXG, EXTW, ILLEGAL, JMP, JSR, LEA, LINK, LSL, LSR, MOVE, MOVEA, MOVE_FROM_CCR, MOVE_TO_CCR,
                  MOVE_FROM_SR, MOVE_TO_SR, MOVE_USP, MOVEM, MOVEP, MOVEQ, MULS, MULU, NBCD, NEG, NEGX, NOP, NOT_B,
                  OR_B, ORI, ORI_TO_CCR, ORI_TO_SR, PEA, RESET, ROTL, ROTR, ROXL, ROXR, RTE, RTR, RTS, SBCD, Scc, STOP,
                  SUB, SUBA, SUBI, SUBQ, SUBX, SWAP, TAS, TRAP, TRAPV, TST, UNLK, RESERVED, UNIMPLEMENTED);

component WF68K00IP_CONTROL
	port (
		CLK				: in bit;
		RESETn			: in bit;
		SR_CCR_IN		: in std_logic_vector(15 downto 0);
		C_CODE			: in bit_vector(3 downto 0);
		REGLISTMASK		: in std_logic_vector(15 downto 0);
		CTRL_EN			: in bit;
		EXEC_ABORT		: in bit;
		DATA_VALID		: in bit;
		BUS_CYC_RDY		: in bit;
		CTRL_RDY		: out bit;
		INIT_STATUS		: in bit;
		PRESET_IRQ_MASK	: in bit;
        IRQ				: in std_logic_vector(2 downto 0);
        IRQ_SAVE        : in bit;
		XNZVC_IN		: in std_logic_vector(4 downto 0);
		STATUS_REG_OUT	: out std_logic_vector(15 downto 0);
		FORCE_BIW2		: in bit;
		FORCE_BIW3		: in bit;
		EXT_CNT			: in integer range 0 to 2;
		DEST_EXT_CNT	: in integer range 0 to 2;
		REGSEL_20		: in std_logic_vector(2 downto 0);
		IW_ADR			: out integer range 0 to 2;
		IW_WR			: out bit;
		SRC_DESTn		: out bit;
		EW_WR			: out bit;
		EW_ADR			: out integer range 0 to 1;
		RD_BUS			: out bit;
		WR_BUS			: out bit;
		RDWR_BUS		: out bit;
		WR_HI			: out bit;
		SEL_A_HI		: out bit;
		SEL_A_MIDHI		: out bit;
		SEL_A_MIDLO		: out bit;
		SEL_A_LO		: out bit;
		SEL_BUFF_A_LO	: out bit;
		SEL_BUFF_A_HI	: out bit;
		SEL_BUFF_B_LO	: out bit;
		SEL_BUFF_B_HI	: out bit;
		FC_OUT			: out std_logic_vector(2 downto 0);
		FC_EN			: out bit;
		PC_INIT			: out bit;
		PC_WR			: out bit;
		PC_INC			: out bit;
		PC_TMP_CLR		: out bit;
		PC_TMP_INC		: out bit;
		PC_ADD_DISPL	: out bit;
		USP_INC			: out bit;
		SSP_INC			: out bit;
		USP_DEC			: out bit;
		SSP_DEC			: out bit;
		USP_CPY			: out bit;
		SP_ADD_DISPL	: out bit;
		ADR_TMP_CLR		: out bit;
		ADR_TMP_INC		: out bit;
		AR_INC			: out bit;
		AR_DEC			: out bit;
		AR_WR			: out bit;
		AR_DR_EXG		: out bit;
		DR_WR			: out bit;
		DR_DEC			: out bit;
		SCAN_TRAPS		: out bit;
		TRAP_PRIV		: in bit;
		TRAP_TRACE		: out bit;
		OP				: in OP_68K00;
		OP_MODE			: in std_logic_vector(2 downto 0);
		OP_SIZE			: in OP_SIZETYPE;
		ADR_MODE		: in std_logic_vector(2 downto 0);
		MOVE_D_AM		: in std_logic_vector(2 downto 0);
		RESET_RDY		: in bit;
		OP_BUSY			: in bit;
		MEM_SHFT		: in bit;
		SHFT_BUSY		: in bit;
		DR	 			: in bit;
		RM				: in bit;
		DIV_MUL_32n64	: in bit;
		EXEC_RESUME 	: in bit;
		DBcc_COND		: in boolean;
		USE_SP_ADR		: out bit;
		OP_START		: out bit;
		TRAP_CHK_EN		: out bit;
		MOVEM_REGSEL	: out std_logic_vector(2 downto 0);
		MOVEM_ADn		: out bit;
		Scc_COND		: out boolean;
		SHIFTER_LOAD	: out bit;
		CHK_PC			: out bit;
		CHK_ADR			: out bit;
		SBIT			: out bit;
		UNLK_SP_An		: out bit;
		RESET_EN		: out bit
		);
end component;

component WF68K00IP_OPCODE_DECODER
	port (
		CLK					: in bit;
		RESETn				: in bit;
		DATA_IN				: in std_logic_vector(15 downto 0);
		SBIT				: in bit;
		OV					: in std_logic;
		IW_ADR				: in integer range 0 to 2;
		IW_WR				: in bit;
		FORCE_BIW2			: out bit;
		FORCE_BIW3			: out bit;
		EXT_CNT				: out integer range 0 to 2;
		DEST_EXT_CNT		: out integer range 0 to 2;
		DR	 				: out bit;
		RM					: out bit;
		IR					: out bit;
		OP					: out OP_68K00;
		OP_SIZE				: out OP_SIZETYPE;
		OP_MODE				: out std_logic_vector(4 downto 0);
		BIW_0				: out std_logic_vector(15 downto 0);
		REGSEL_20			: out std_logic_vector(2 downto 0);
		REGSEL_119			: out std_logic_vector(2 downto 0);
		REGSEL_INDEX		: out std_logic_vector(2 downto 0);
		DATA_IMMEDIATE		: out std_logic_vector(31 downto 0);
		TRAP_VECTOR			: out std_logic_vector(3 downto 0);
		C_CODE				: out bit_vector(3 downto 0);
		MEM_SHFT			: out bit;
		REGLISTMASK			: out std_logic_vector(15 downto 0);
		BITPOS_IM			: out bit;
		BIT_POS				: out std_logic_vector(4 downto 0);
		DIV_MUL_32n64		: out bit;
		REG_Dlq				: out std_logic_vector(2 downto 0);
		REG_Dhr				: out std_logic_vector(2 downto 0);
		SCAN_TRAPS			: in bit;
		TRAP_ILLEGAL		: out bit;
		TRAP_1010			: out bit;
		TRAP_1111			: out bit;
		TRAP_PRIV			: out bit;
		TRAP_OP				: out bit;
		TRAP_V				: out bit;
		EW_WR				: in bit;
		EW_ADR				: in integer range 0 to 1;
		SRC_DESTn			: in bit;
		EXWORD				: out EXWORDTYPE;
		DEST_EXWORD			: out EXWORDTYPE;
		ADR_MODE			: out std_logic_vector(2 downto 0);
		MOVE_D_AM			: out std_logic_vector(2 downto 0);
		EXT_DSIZE			: out D_SIZETYPE;
		SEL_DISPLACE_BIW	: out bit;
		DISPLACE_BIW		: out std_logic_vector(31 downto 0)
	);
end component;

component WF68K00IP_ADDRESS_REGISTERS
	port (
		CLK					: in bit;
		RESETn				: in bit;
		ADATA_IN			: in std_logic_vector(31 downto 0);
		REGSEL_B			: in std_logic_vector(2 downto 0);
		REGSEL_A			: in std_logic_vector(2 downto 0);
		ADR_REG_QB			: out std_logic_vector(31 downto 0);
		ADR_REG_QA			: out std_logic_vector(31 downto 0);
		USP_OUT				: out std_logic_vector(31 downto 0);
		SSP_OUT				: out std_logic_vector(31 downto 0);
		PC_OUT				: out std_logic_vector(31 downto 0);
		EXWORD				: in EXWORDTYPE;
		DEST_EXWORD			: in EXWORDTYPE;
		DR	 				: in bit;
		USP_CPY				: in bit;
		AR_EXG				: in bit;
		AR_WR				: in bit;
		USP_INC				: in bit;
		USP_DEC				: in bit;
		ADR_TMP_CLR			: in bit;
		ADR_TMP_INC			: in bit;
		AR_INC				: in bit;
		AR_DEC				: in bit;
		SSP_INC				: in bit;
		SSP_DEC				: in bit;
		SSP_INIT			: in bit;
		SP_ADD_DISPL		: in bit;
		USE_SP_ADR			: in bit;
		USE_SSP_ADR			: in bit;
		PC_WR				: in bit;
		PC_INC				: in bit;
		PC_TMP_CLR			: in bit;
		PC_TMP_INC			: in bit;
		PC_INIT				: in bit;
		PC_ADD_DISPL		: in bit;
		SRC_DESTn			: in bit;
		SBIT				: in bit;
		OP					: in OP_68K00;
		OP_SIZE				: in OP_SIZETYPE;
		OP_MODE				: in std_logic_vector(4 downto 0);
		OP_START			: in bit;
		ADR_MODE			: in std_logic_vector(2 downto 0);
		MOVE_D_AM			: in std_logic_vector(2 downto 0);
        FORCE_BIW2		: in bit;
        FORCE_BIW3		: in bit;
		EXT_DSIZE			: in D_SIZETYPE;
		SEL_DISPLACE_BIW	: in bit;
		DISPLACE_BIW		: in std_logic_vector(31 downto 0);
		REGSEL_INDEX		: in std_logic_vector(2 downto 0);
		INDEX_D_IN			: in std_logic_vector(31 downto 0);
		CHK_PC				: in bit;
		CHK_ADR				: in bit;
		TRAP_AERR			: out bit;
		ADR_EFF				: out std_logic_vector(31 downto 0)
		);
end component;

component WF68K00IP_DATA_REGISTERS
	port (
		CLK				: in bit;
		RESETn			: in bit;
		DATA_IN_A		: in std_logic_vector(31 downto 0);
		DATA_IN_B		: in std_logic_vector(31 downto 0);
		REGSEL_A		: in std_logic_vector(2 downto 0);
		REGSEL_B		: in std_logic_vector(2 downto 0);
		REGSEL_C		: in std_logic_vector(2 downto 0);
		DIV_MUL_32n64	: in bit;
		DATA_OUT_A		: out std_logic_vector(31 downto 0);
		DATA_OUT_B		: out std_logic_vector(31 downto 0);
		DATA_OUT_C		: out std_logic_vector(31 downto 0);
		DR_EXG			: in bit;
		DR_DEC			: in bit;
		DR_WR			: in bit;
		OP				: in OP_68K00;
		OP_SIZE			: in OP_SIZETYPE;
		OP_MODE			: in std_logic_vector(4 downto 0);
		DBcc_COND		: out boolean
		);
end component;

component WF68K00IP_ALU
	port (
		RESETn			: in bit;
		CLK				: in bit;
		ADR_MODE		: in std_logic_vector(2 downto 0);
		OP_SIZE			: in OP_SIZETYPE;
		OP				: in OP_68K00;
		XNZVC_IN		: in std_logic_vector(4 downto 0);
		XNZVC_OUT		: out std_logic_vector(4 downto 0);
		OP_IN_S			: in std_logic_vector(31 downto 0);
		OP_IN_D_HI		: in std_logic_vector(31 downto 0);
		OP_IN_D_LO		: in std_logic_vector(31 downto 0);
		RESULT_HI		: out std_logic_vector(31 downto 0);
		RESULT_LO		: out std_logic_vector(31 downto 0);
		OP_START		: in bit;
		TRAP_CHK_EN		: in bit;
		DIV_MUL_32n64	: in bit;
		OP_BUSY			: out bit;
		TRAP_CHK		: out bit;
		TRAP_DIVZERO	: out bit
		);
end component;

component WF68K00IP_SHIFTER
	port (
		CLK				: in bit;
		RESETn			: in bit;
		DATA_IN			: in std_logic_vector(31 downto 0);
		DATA_OUT		: out std_logic_vector(31 downto 0);
		OP				: in OP_68K00;
		OP_SIZE			: in OP_SIZETYPE;
		BIT_POS			: in std_logic_vector(4 downto 0);
		CNT_NR			: in std_logic_vector(5 downto 0);
		SHFT_BREAKn		: in bit;
		SHIFTER_LOAD	: in bit;
		SHFT_BUSY		: out bit;
		XNZVC_IN		: in std_logic_vector(4 downto 0);
		XNZVC_OUT		: out std_logic_vector(4 downto 0)
		);
end component;

component WF68K00IP_INTERRUPT_CONTROL
	port (
		CLK					: in bit;
		RESETn				: in bit;
		RESET_CPUn			: in bit;
		BERR				: in bit;
		HALTn				: in std_logic;
		ADR_IN				: in std_logic_vector(31 downto 0);
		USE_SSP_ADR			: out bit;
		ADR_EN_VECTOR		: out bit;
		DATA_IN				: in std_logic_vector(7 downto 0);
		DATA_OUT			: out std_logic_vector(15 downto 0);
		DATA_EN				: out bit;
		RWn					: in bit_vector(0 downto 0);
		RD_BUS				: out bit;
		WR_BUS				: out bit;
		HALT_EN				: out bit;
		FC_IN				: in std_logic_vector(2 downto 0);
		FC_OUT				: out std_logic_vector(2 downto 0);
		FC_EN				: out bit;
		SEL_BUFF_A_LO		: out bit;
		SEL_BUFF_A_HI		: out bit;
		STATUS_REG_IN		: in std_logic_vector(15 downto 0);
		PC					: in std_logic_vector(31 downto 0);
		INIT_STATUS			: out bit;
		PRESET_IRQ_MASK		: out bit;
		SSP_DEC				: out bit;
		SSP_INIT			: out bit;
		PC_INIT				: out bit;
		BIW_0				: in std_logic_vector(15 downto 0);
		BUS_CYC_RDY			: in bit;
		CTRL_RDY			: in bit;
		CTRL_EN				: out bit;
		EXEC_ABORT			: out bit;
		EXEC_RESUME			: out bit;
		IRQ					: in std_logic_vector(2 downto 0);
		AVECn				: in bit;
        IRQ_SAVE            : out bit;
		INT_VECT			: out std_logic_vector(9 downto 0);
		USE_INT_VECT		: out bit;
		TRAP_AERR			: in bit;
		TRAP_OP				: in bit;
		TRAP_VECTOR			: in std_logic_vector(3 downto 0);
		TRAP_V				: in bit;
		TRAP_CHK			: in bit;
		TRAP_DIVZERO		: in bit;
		TRAP_ILLEGAL		: in bit;
		TRAP_1010			: in bit;
		TRAP_1111			: in bit;
		TRAP_TRACE			: in bit;
		TRAP_PRIV			: in bit
		);
end component;

component WF68K00IP_BUS_INTERFACE
	port (
		CLK				: in bit;
		RESETn			: in bit;
		RESET_INn		: in bit;
		RESET_OUT_EN	: out bit;
		RESET_CPUn		: out bit;
		RESET_EN		: in bit;
		RESET_RDY		: out bit;
		DATA_IN			: in std_logic_vector(15 downto 0);
		SEL_A_HI		: in bit;
		SEL_A_MIDHI		: in bit;
		SEL_A_MIDLO		: in bit;
		SEL_A_LO		: in bit;
		SEL_BUFF_A_LO	: in bit;
		SEL_BUFF_A_HI	: in bit;
		SEL_BUFF_B_LO	: in bit;
		SEL_BUFF_B_HI	: in bit;
		SYS_INIT		: in bit;
		OP_SIZE			: in OP_SIZETYPE;
		BUFFER_A		: out std_logic_vector(31 downto 0);
		BUFFER_B		: out std_logic_vector(31 downto 0);
		DATA_CORE_OUT	: out std_logic_vector(15 downto 0);
		RD_BUS			: in bit;
		WR_BUS			: in bit;
		RDWR_BUS		: in bit;
		A0				: in std_logic;
		BYTEn_WORD		: in bit;
		EXEC_ABORT		: in bit;
		BUS_CYC_RDY		: out bit;
		DATA_VALID		: out bit;
		DTACKn			: in bit;
		BERRn			: in bit;
		AVECn			: in bit;
		HALTn			: in std_logic;
		ADR_EN			: out bit;
		WR_HI			: in bit;
		HI_WORD_EN		: out bit;
		HI_BYTE_EN		: out bit;
		LO_BYTE_EN		: out bit;
		FC_EN			: out bit;
		ASn				: out bit;
		AS_EN			: out bit;
		UDSn			: out bit;
		UDS_EN			: out bit;
		LDSn			: out bit;
		LDS_EN			: out bit;
		RWn				: out bit;
		RW_EN			: out bit;
		VPAn			: in bit;
		VMAn			: out bit;
		VMA_EN			: out bit;
		E				: out bit;
		BRn				: in bit;
		BGACKn			: in bit;
		BGn				: out bit
		);
end component;
end WF68K00IP_PKG;
