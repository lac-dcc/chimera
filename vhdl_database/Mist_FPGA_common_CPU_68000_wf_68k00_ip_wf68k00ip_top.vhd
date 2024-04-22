----------------------------------------------------------------------
----                                                              ----
---- MC68000 compatible IP Core					                  ----
----                                                              ----
---- This file is part of the SUSKA ATARI clone project.          ----
---- http://www.experiment-s.de                                   ----
----                                                              ----
---- This file is the top level file of this ip core.             ----
----                                                              ----
----                                                              ----
---- Description:                                                 ----
---- This model provides an opcode and bus timing compatible ip   ----
---- core compared to Motorola's MC68000 microprocessor.          ----
----                                                              ----
---- The following operations are additionally supported by this  ----
---- core:                                                        ----
----   - LINK (long).                                             ----
----   - MOVE FROM CCR.                                           ----
----   - MULS, MULU: all operation modes word and long.           ----
----   - DIVS, DIVU: all operation modes word and long.           ----
----   - DIVSL, DIVUL.                                            ----
----   - Direct addressing mode enhancements for TST etc.         ----
----   - PC relative addressing modes for operations like TST.    ----
----                                                              ----
----                                                              ----
----                                                              ----
----                                                              ----
---- Author(s):                                                   ----
---- - Wolfgang Foerster, wf@experiment-s.de; wf@inventronik.de   ----
----                                                              ----
----------------------------------------------------------------------
----                                                              ----
---- Copyright (C) 2006 Wolfgang Foerster                         ----
----                                                              ----
---- This source file may be used and distributed without         ----
---- restriction provided that this copyright statement is not    ----
---- removed from the file and that any derivative work contains  ----
---- the original copyright notice and the associated disclaimer. ----
----                                                              ----
---- This source file is free software; you can redistribute it   ----
---- and/or modify it under the terms of the GNU Lesser General   ----
---- Public License as published by the Free Software Foundation; ----
---- either version 2.1 of the License, or (at your option) any   ----
---- later version.                                               ----
----                                                              ----
---- This source is distributed in the hope that it will be       ----
---- useful, but WITHOUT ANY WARRANTY; without even the implied   ----
---- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ----
---- PURPOSE. See the GNU Lesser General Public License for more  ----
---- details.                                                     ----
----                                                              ----
---- You should have received a copy of the GNU Lesser General    ----
---- Public License along with this source; if not, download it   ----
---- from http://www.gnu.org/licenses/lgpl.html                   ----
----                                                              ----
----------------------------------------------------------------------
-- 
-- Revision History
-- 
-- Revision 2K6B  2006/12/24 WF
--   Initial Release.
-- Revision 2K7A  2007/05/31 WF
--   Updated all modules.
-- Revision 2K7B  2007/12/24 WF
--   Several bugfixes in the modules.
--   Optimized the core (reduced the core size 10%).
-- 

library work;
use work.wf68k00ip_pkg.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity WF68K00IP_TOP is
	port (
		CLK			: in bit;
		RESET_COREn	: in bit; -- Core reset.
		
		-- Address and data:
		ADR		: out std_logic_vector(23 downto 1);
		DATA	: inout std_logic_vector(15 downto 0);

		-- System control:
		BERRn	: in bit;
		RESETn	: inout std_logic; -- Open drain.
		HALTn	: inout std_logic; -- Open drain.
		
		-- Processor status:
		FC		: out std_logic_vector(2 downto 0);
		
		-- Interrupt control:
		AVECn	: in bit; -- Originally 68Ks use VPAn.
		IPLn	: in std_logic_vector(2 downto 0);
		
		-- Aynchronous bus control:
		DTACKn	: in bit;
		ASn		: out std_logic;
		RWn		: out std_logic;
		UDSn	: out std_logic;
		LDSn	: out std_logic;
		
		-- Synchronous peripheral control:
		E		: out bit;
		VMAn	: out std_logic;
		VPAn	: in bit;
		
		-- Bus arbitration control:
		BRn		: in bit;
		BGn		: out bit;
		BGACKn	: in bit
	);
end entity WF68K00IP_TOP;
	
architecture STRUCTURE of WF68K00IP_TOP is
signal ADR_EFF_I			: std_logic_vector(31 downto 0);
signal ADR_EN_I				: bit;
signal ADR_EN_VECTOR_I		: bit;
signal ADR_I				: std_logic_vector(31 downto 0);
signal ADR_MODE_I			: std_logic_vector(2 downto 0);
signal ADR_TMP_CLR_I		: bit;
signal ADR_TMP_INC_I		: bit;
signal ALU_OP_IN_S			: std_logic_vector(31 downto 0);
signal ALU_OP_IN_D_HI		: std_logic_vector(31 downto 0);
signal ALU_OP_IN_D_LO		: std_logic_vector(31 downto 0);
signal AR_INC_I				: bit;
signal AR_DEC_I				: bit;
signal AR_WR_I				: bit;
signal AR_DR_EXG_I			: bit;
signal AREG_DATA_IN			: std_logic_vector(31 downto 0);
signal AS_EN_I				: bit;
signal AS_In				: bit;
signal AVEC_In				: bit;
signal BERR_In				: bit;
signal BERR_I				: bit;
signal BGACK_In				: bit;
signal BIT_POS_I			: std_logic_vector(4 downto 0);
signal BIT_POS_OP			: std_logic_vector(4 downto 0);
signal BITPOS_IM_I			: bit;
signal BIW_0_I				: std_logic_vector(15 downto 0);
signal BR_In				: bit;
signal BUS_BUFFER_A			: std_logic_vector(31 downto 0);
signal BUS_BUFFER_B			: std_logic_vector(31 downto 0);
signal BUS_CYC_RDY_I		: bit;
signal BYTEn_WORD_I			: bit;
signal C_CODE_I				: bit_vector(3 downto 0);
signal CHK_ADR_I			: bit;
signal CHK_PC_I				: bit;
signal CNT_NR_I				: std_logic_vector(5 downto 0);
signal CTRL_EN_I			: bit;
signal CTRL_RDY_I			: bit;
signal DATA_CORE			: std_logic_vector(15 downto 0);
signal DATA_IMMEDIATE_I		: std_logic_vector(31 downto 0);
signal DATA_OUT_I			: std_logic_vector(31 downto 0);
signal DATA_VALID_I			: bit;
signal DBcc_COND_I			: boolean;
signal DEST_EXWORD_I		: EXWORDTYPE;
signal DEST_EXT_CNT_I		: integer range 0 to 2;
signal DISPLACE_BIW_I		: std_logic_vector(31 downto 0);
signal DIV_MUL_32n64_I		: bit;
signal DR_I					: bit;
signal DR_DEC_I				: bit;
signal DR_WR_I				: bit;
signal DREG_DATA_IN_A		: std_logic_vector(31 downto 0);
signal DREG_DATA_IN_B		: std_logic_vector(31 downto 0);
signal DTACK_In				: bit;
signal EW_WR_I				: bit;
signal EW_ADR_I				: integer range 0 to 1;
signal EXEC_ABORT_I			: bit;
signal EXEC_RESUME_I		: bit;
signal EXT_CNT_I			: integer range 0 to 2;
signal EXT_DSIZE_I			: D_SIZETYPE;
signal EXWORD_I				: EXWORDTYPE;
signal FC_EN_CTRL			: bit;
signal FC_EN_I				: bit;
signal FC_EN_IRQ			: bit;
signal FC_OUT_CTRL			: std_logic_vector(2 downto 0);
signal FC_OUT_I				: std_logic_vector(2 downto 0);
signal FC_OUT_IRQ			: std_logic_vector(2 downto 0);
signal FORCE_BIW2_I			: bit;
signal FORCE_BIW3_I			: bit;
signal HALT_EN_I			: bit;
signal HALT_In				: std_logic;
signal HI_BYTE_EN_I			: bit;
signal HI_WORD_EN_I			: bit;
signal INT_VECT_I			: std_logic_vector(9 downto 0);
signal INIT_STATUS_I		: bit;
signal IPL_In				: std_logic_vector(2 downto 0);
signal IPL_TMPn				: std_logic_vector(2 downto 0);
signal IR_I					: bit;
signal IRQ_DATA_EN			: bit;
signal IRQ_DOUT				: std_logic_vector(15 downto 0);
signal IRQ_SAVE_I           : bit;
signal IW_ADR_I				: integer range 0 to 2;
signal IW_WR_I				: bit;
signal LDS_EN_I				: bit;
signal LDS_In				: bit;
signal LO_BYTE_EN_I			: bit;
signal MOVE_D_AM_I			: std_logic_vector(2 downto 0);
signal MEM_SHFT_I			: bit;
signal MOVEM_ADn_I			: bit;
signal MOVEM_REGSEL_I		: std_logic_vector(2 downto 0);
signal PC_ADD_DISPL_I		: bit;
signal OP_BUSY_I			: bit;
signal OP_I					: OP_68K00;
signal OP_MODE_I			: std_logic_vector(4 downto 0);
signal OP_SIZE_I			: OP_SIZETYPE;
signal OP_START_I			: bit;
signal PC_INC_I				: bit;
signal PC_INIT_I			: bit;
signal PC_INIT_CTRL			: bit;
signal PC_INIT_IRQ			: bit;
signal PC_OUT				: std_logic_vector(31 downto 0);
signal PC_TMP_CLR_I			: bit;
signal PC_TMP_INC_I			: bit;
signal PC_WR_I				: bit;
signal PRESET_IRQ_MASK_I	: bit;
signal Q_AREG_A				: std_logic_vector(31 downto 0);
signal Q_AREG_B				: std_logic_vector(31 downto 0);
signal Q_DREG_A				: std_logic_vector(31 downto 0);
signal Q_DREG_B				: std_logic_vector(31 downto 0);
signal Q_DREG_C				: std_logic_vector(31 downto 0);
signal RD_BUS_CTRL			: bit;
signal RD_BUS_IRQ			: bit;
signal RD_BUS_I				: bit;
signal RDWR_BUS_I			: bit;
signal REGLISTMASK_I		: std_logic_vector(15 downto 0);
signal REGSEL_119_I			: std_logic_vector(2 downto 0);
signal REGSEL_20_I			: std_logic_vector(2 downto 0);
signal REGSEL_ADR_A			: std_logic_vector(2 downto 0);
signal REGSEL_ADR_B			: std_logic_vector(2 downto 0);
signal REGSEL_DATA_A		: std_logic_vector(2 downto 0);
signal REGSEL_DATA_B		: std_logic_vector(2 downto 0);
signal REGSEL_DATA_C		: std_logic_vector(2 downto 0);
signal REGSEL_Dhr			: std_logic_vector(2 downto 0);
signal REGSEL_Dlq			: std_logic_vector(2 downto 0);
signal REGSEL_INDEX			: std_logic_vector(2 downto 0);
signal RESET_CPU_In			: bit;
signal RESET_EN_I			: bit;
signal RESET_IN_In			: bit;
signal RESET_OUT_EN_I		: bit;
signal RESET_RDY_I			: bit;
signal RESULT_ALU_HI		: std_logic_vector(31 downto 0);
signal RESULT_ALU_LO		: std_logic_vector(31 downto 0);
signal RESULT_SHFT			: std_logic_vector(31 downto 0);
signal RM_I					: bit;
signal RW_EN_I				: bit;
signal RWn_I				: bit;
signal SBIT_I				: bit;
signal SCAN_TRAPS_I			: bit;
signal Scc_COND_I			: boolean;
signal SEL_A_LO				: bit;
signal SEL_A_HI				: bit;
signal SEL_A_MIDHI			: bit;
signal SEL_A_MIDLO			: bit;
signal SEL_BUF_A_LO_I		: bit;
signal SEL_BUF_A_HI_I		: bit;
signal SEL_BUF_A_LO_CTRL_I	: bit;
signal SEL_BUF_A_HI_CTRL_I	: bit;
signal SEL_BUF_A_LO_IRQ_I	: bit;
signal SEL_BUF_A_HI_IRQ_I	: bit;
signal SEL_BUF_B_LO_I		: bit;
signal SEL_BUF_B_HI_I		: bit;
signal SEL_DISPLACE_BIW_I	: bit;
signal SHFT_BUSY_I			: bit;
signal SHFT_OP_IN			: std_logic_vector(31 downto 0);
signal SHIFTER_LOAD_I		: bit;
signal SP_ADD_DISPL_I		: bit;
signal SR_CCR_MUX			: std_logic_vector(15 downto 0);
signal SRC_DESTn_I			: bit;
signal SSP_DEC_CTRL			: bit;
signal SSP_DEC_I			: bit;
signal SSP_DEC_IRQ			: bit;
signal SSP_INC_I			: bit;
signal SSP_INIT_I			: bit;
signal SSP_OUT				: std_logic_vector(31 downto 0);
signal STATUS_REG_I			: std_logic_vector(15 downto 0);
signal SYS_INIT_I			: bit;
signal TRAP_1010_I			: bit;
signal TRAP_1111_I			: bit;
signal TRAP_AERR_I			: bit;
signal TRAP_CHK_I			: bit;
signal TRAP_CHK_EN_I		: bit;
signal TRAP_DIVZERO_I		: bit;
signal TRAP_ILLEGAL_I		: bit;
signal TRAP_OP_I			: bit;
signal TRAP_PRIV_I			: bit;
signal TRAP_TRACE_I			: bit;
signal TRAP_V_I				: bit;
signal TRAP_VECTOR_I		: std_logic_vector(3 downto 0);
signal UDS_EN_I				: bit;
signal UDS_In				: bit;
signal UNLK_SP_An_I			: bit;
signal USE_INT_VECT_I		: bit;
signal USE_SP_ADR_I			: bit;
signal USE_SSP_ADR_I		: bit;
signal USP_CPY_I			: bit;
signal USP_DEC_I			: bit;
signal USP_INC_I			: bit;
signal USP_OUT				: std_logic_vector(31 downto 0);
signal VMA_EN_I				: bit;
signal VMA_In				: bit;
signal VPA_In				: bit;
signal WR_BUS_CTRL			: bit;
signal WR_BUS_I				: bit;
signal WR_BUS_IRQ			: bit;
signal WR_HI_I				: bit;
signal XNZVC_ALU			: std_logic_vector(4 downto 0);
signal XNZVC_I				: std_logic_vector(4 downto 0);
signal XNZVC_SHFT			: std_logic_vector(4 downto 0);
begin
	SIGNAL_SAMPLE: process
	-- The bus control signals used in this core are sampled on the negative clock
	-- edge. Thus the signals are valid on the following positive clock edge. In the original
	-- 68K machines, the input synchronisation is realized with three latches (see the 68K
	-- user manual for more information). This concept is not suitable for a FPGA design 
	-- and therefore not used here.
	begin
		wait until CLK = '0' and CLK' event;
		BERR_In <= BERRn;
		HALT_In <= HALTn;
		VPA_In <= VPAn;
		BR_In <= BRn;
		BGACK_In <= BGACKn;
		RESET_IN_In <= To_Bit(RESETn);
		AVEC_In <= AVECn;
	end process SIGNAL_SAMPLE;

	IPL_SAMPLE: process
	-- This process provides a filter for the interrupt priority level. It
	-- is valid, if it is stable for two consecutive falling clock edges.
	begin
		wait until CLK = '0' and CLK' event;
		IPL_TMPn <= IPLn;
		if IPL_TMPn = IPLn then
			IPL_In <= IPLn;
		else
			IPL_In <= "111";
		end if;
	end process IPL_SAMPLE;

	BERR_I <= '1' when BERR_In = '0' and HALT_In = '1' and DTACK_In = '1' else
			  '1' when BERR_In = '0' and HALT_In = '0' and RDWR_BUS_I = '1' else '0'; -- No retry during read modify write cycles.

	-- The following input may not be sampled
	-- due to bus timing constraints.
	DTACK_In <= DTACKn;

	-- Data output multiplexer (tri-state):
	-- During long word access, the higher word is written always 16 bit wide. During word or byte access,
	-- the access of the higher 8 bits or the lower 8 bits depends on the address boundary or on the
 	-- length of the operator defined in the operation (WORD, BYTE). Although the byte portions are doubled
	-- to drive the whole bus low impedant.
	DATA <= IRQ_DOUT 											when IRQ_DATA_EN = '1' 	else
			DATA_OUT_I(31 downto 24) & DATA_OUT_I(31 downto 24) when SEL_A_HI = '1' else -- MOVEP
			DATA_OUT_I(23 downto 16) & DATA_OUT_I(23 downto 16)	when SEL_A_MIDHI = '1' else -- MOVEP
			DATA_OUT_I(15 downto 8) & DATA_OUT_I(15 downto 8)	when SEL_A_MIDLO = '1' else -- MOVEP.
			DATA_OUT_I(7 downto 0) & DATA_OUT_I(7 downto 0)		when SEL_A_LO = '1' else -- MOVEP.
			DATA_OUT_I(31 downto 16)							when HI_WORD_EN_I = '1' else
			DATA_OUT_I(15 downto 0)								when HI_BYTE_EN_I = '1' and LO_BYTE_EN_I = '1' else
			DATA_OUT_I(7 downto 0) & DATA_OUT_I(7 downto 0) 	when HI_BYTE_EN_I = '1' or LO_BYTE_EN_I = '1' else (others => 'Z');

	-- Open drain outputs:
	RESETn	<= 	'0'	when RESET_OUT_EN_I = '1'	else 'Z';
	HALTn	<=	'0' when HALT_EN_I = '1'		else 'Z';

	-- Bus controls:
	ASn		<= 	'1'	when AS_In = '1' and AS_EN_I = '1' 		else
				'0'	when AS_In = '0' and AS_EN_I = '1' 		else 'Z';
	UDSn	<=	'1' when UDS_In	= '1' and UDS_EN_I = '1'	else
				'0' when UDS_In	= '0' and UDS_EN_I = '1'	else 'Z';
	LDSn	<=	'1' when LDS_In	= '1' and LDS_EN_I = '1'	else
				'0' when LDS_In	= '0' and LDS_EN_I = '1'	else 'Z';
	RWn		<=	'1' when RWn_I	= '1' and RW_EN_I = '1'		else
				'0' when RWn_I	= '0' and RW_EN_I = '1'		else 'Z';
	VMAn	<= 	'1' when VMA_In	= '1' and VMA_EN_I = '1'	else
				'0' when VMA_In	= '0' and VMA_EN_I = '1' 	else 'Z';

	-- The function code:
	FC 			<= 	FC_OUT_I 	when FC_EN_I = '1'		else (others => 'Z');
	FC_OUT_I 	<= 	FC_OUT_CTRL when FC_EN_CTRL = '1' 	else
					FC_OUT_IRQ 	when FC_EN_IRQ = '1' 	else (others => '0');

	SYS_INIT_I <= '1' when SEL_BUF_A_HI_IRQ_I = '1' or SEL_BUF_A_LO_IRQ_I = '1' else '0';

	-- Bus access control:
	BYTEn_WORD_I <= '1' when FC_OUT_I = "110" else -- Supervisor program.
					'1' when FC_OUT_I = "010" else -- User program.
					'1' when USE_SP_ADR_I = '1' else -- During stacking.
					'1' when USE_SSP_ADR_I = '1' else -- During stacking.
					'1' when USE_INT_VECT_I = '1' else -- During interrupt handling.
					'0' when OP_SIZE_I = BYTE else 
					'0' when OP_I = MOVEP else '1';

	-- Bus buffer A control:
	SEL_BUF_A_HI_I <= SEL_BUF_A_HI_CTRL_I or SEL_BUF_A_HI_IRQ_I;
	SEL_BUF_A_LO_I <= SEL_BUF_A_LO_CTRL_I or SEL_BUF_A_LO_IRQ_I;

	-- Some of the controls are asserted by the main control state machine or
	-- by the interrupt control state machine but never by both at the same
	-- time. So the related signal can be 'ored'; no malfuntion results.
	SSP_DEC_I <= SSP_DEC_CTRL or SSP_DEC_IRQ;
	RD_BUS_I <= RD_BUS_CTRL or RD_BUS_IRQ;
	WR_BUS_I <= WR_BUS_CTRL or WR_BUS_IRQ;
	PC_INIT_I <= PC_INIT_CTRL or PC_INIT_IRQ;

	-- Count value for the shifter unit. It is valid during the shift operations:
	CNT_NR_I <=	"000001" when MEM_SHFT_I = '1' else -- Memory shifts are 1 bit only.
				"000" & REGSEL_119_I when IR_I = '0' and REGSEL_119_I > "000" else
				"001000" when IR_I = '0' else -- Shift 8 bits for REGSEL_119 = "000".
				Q_DREG_A(5 downto 0); -- Register contents modulo 64.

	-- Bit operation position multiplexer:
	-- Register bit manipulations are modulo 32 whereas memory bit manipulations are modulo 8.
	BIT_POS_I <= BIT_POS_OP when BITPOS_IM_I = '1' and ADR_MODE_I = "000" else 
				 Q_DREG_A(4 downto 0) when ADR_MODE_I = "000" else
				 "00" & BIT_POS_OP(2 downto 0) when BITPOS_IM_I = '1' else "00" & Q_DREG_A(2 downto 0);

	-- The condition codes:
	with OP_I select
		XNZVC_I <=	XNZVC_SHFT when BCHG | BCLR | BSET | BTST,
					XNZVC_SHFT when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR,
					XNZVC_ALU when others;

	-- Address select stuff:
	-- The internal address space is 32 bit long. The 68K00 has 23 addresslines.
	-- The internal address space is therefore limited to 24 bit.
	ADR <= ADR_I(23 downto 1) when ADR_EN_I = '1' else (others => 'Z');
	ADR_I <= x"FFFFFFF" & STATUS_REG_I(10 downto 8)_I & '1' when ADR_EN_VECTOR_I = '1' else -- Interrupt acknowledge cycle.
			 SSP_OUT when USE_SSP_ADR_I = '1' else -- During exceptions stacking.
			 x"00000" & "00" & INT_VECT_I when USE_INT_VECT_I = '1' else -- During access to the exception vectors.
			 SSP_OUT when USE_SP_ADR_I = '1' and SBIT_I = '1' else -- During stack pointer operations.
			 USP_OUT when USE_SP_ADR_I = '1' and SBIT_I = '0' else -- During stack pointer operations.
			 PC_OUT when FC_OUT_CTRL = "010" or FC_OUT_CTRL = "110" else -- Program space.
			 ADR_EFF_I; -- Data space.

	-- Status register multiplexer:
	-- The default is valid for MOVE_TO_CCR from memory, MOVE_TO_SR from memory,
	-- for the RTR and for stack restoring during exception handling.
	SR_CCR_MUX <=	RESULT_ALU_LO(15 downto 0) when OP_I = ANDI_TO_SR or OP_I = EORI_TO_SR or OP_I = ORI_TO_SR else
					RESULT_ALU_LO(15 downto 0) when OP_I = ANDI_TO_CCR or OP_I = EORI_TO_CCR or OP_I = ORI_TO_CCR else
					Q_DREG_B(15 downto 0) when (OP_I = MOVE_TO_CCR or OP_I = MOVE_TO_SR) and ADR_MODE_I = "000" else
					DATA_IMMEDIATE_I(15 downto 0) when OP_I = MOVE_TO_CCR and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					DATA_IMMEDIATE_I(15 downto 0) when OP_I = MOVE_TO_SR and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					DATA_IMMEDIATE_I(15 downto 0) when OP_I = STOP else DATA_CORE;

	-- Note: the address register is never destination during MOVE.
	-- Note: The default is also valid for UNLK during writing to the stack pointer.h
	REGSEL_ADR_A <= REGSEL_20_I when (OP_I = ADDQ or OP_I = SUBQ) and ADR_MODE_I = "001" else
					REGSEL_20_I when (OP_I = LINK or OP_I = MOVE) else
					REGSEL_20_I when OP_I = UNLK and UNLK_SP_An_I = '0' else
					MOVEM_REGSEL_I when OP_I = MOVEM else REGSEL_119_I;
					
	REGSEL_ADR_B <= REGSEL_119_I when SRC_DESTn_I = '0' else REGSEL_20_I;

	REGSEL_DATA_A <= REGSEL_20_I when OP_I = ABCD or OP_I = ADDX or OP_I = SBCD or OP_I = SUBX else
					 REGSEL_20_I when OP_I = ADD or OP_I = SUB else
					 REGSEL_20_I when OP_I = AND_B or OP_I = OR_B else
					 REGSEL_Dlq when (OP_I = MULS or OP_I = MULU) and OP_SIZE_I = LONG else
					 REGSEL_Dlq when (OP_I = DIVS or OP_I = DIVU) and OP_SIZE_I = LONG else REGSEL_119_I;

	REGSEL_DATA_B <= MOVEM_REGSEL_I when OP_I = MOVEM else 
					 REGSEL_119_I when OP_I = ABCD or OP_I = ADDX or OP_I = SBCD or OP_I = SUBX else
 					 REGSEL_119_I when OP_I = ADD or OP_I = SUB else
					 REGSEL_119_I when OP_I = AND_B or OP_I = OR_B else
					 REGSEL_Dhr when (OP_I = DIVS or OP_I = DIVU) and DR_WR_I = '1' else -- Used for write back the result.
					 REGSEL_Dhr when (OP_I = MULS or OP_I = MULU) and DR_WR_I = '1' else -- Used for write back the result.
					 REGSEL_119_I when OP_I = MOVEQ else REGSEL_20_I;

	REGSEL_DATA_C <= REGSEL_Dhr when (OP_I = DIVS or OP_I = DIVU) and OP_START_I = '1' else REGSEL_INDEX;

	DATA_OUT_I <= 	RESULT_ALU_LO when (OP_I = ABCD or OP_I = SBCD) else
					RESULT_ALU_LO when (OP_I = ADDX or OP_I = NEGX or OP_I = SUBX) else 
					RESULT_ALU_LO when (OP_I = ADD or OP_I = SUB) else
					RESULT_ALU_LO when (OP_I = ADDI or OP_I = SUBI) else
					RESULT_ALU_LO when (OP_I = ADDQ or OP_I = SUBQ) else
					RESULT_ALU_LO when (OP_I = AND_B or OP_I = OR_B) else
					RESULT_ALU_LO when (OP_I = ANDI or OP_I = EORI or OP_I = ORI) else
					RESULT_SHFT when (OP_I = ASL or OP_I = ASR) else
					RESULT_SHFT when (OP_I = LSL or OP_I = LSR) else
					RESULT_SHFT when (OP_I = ROTL or OP_I = ROTR) else
					RESULT_SHFT when (OP_I = ROXL or OP_I = ROXR) else
					RESULT_SHFT when (OP_I = BCHG or OP_I = BSET or OP_I = BCLR) else
					x"00000000" when OP_I = CLR else
					Q_DREG_B when OP_I = MOVE and ADR_MODE_I = "000" else
					Q_AREG_A when OP_I = MOVE and ADR_MODE_I = "001" else
					DATA_IMMEDIATE_I when OP_I = MOVE and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					BUS_BUFFER_A when OP_I = MOVE else
					x"000000" & "000" & STATUS_REG_I(4 downto 0) when OP_I = MOVE_FROM_CCR else
					x"0000" & STATUS_REG_I when OP_I = MOVE_FROM_SR else
					Q_DREG_B when OP_I = MOVEM and MOVEM_ADn_I = '0' else
					Q_AREG_A when OP_I = MOVEM and MOVEM_ADn_I = '1' else
					Q_DREG_A when OP_I = MOVEP else
					RESULT_ALU_LO when (OP_I = NBCD or OP_I = NEG or OP_I = NOT_B) else
					ADR_EFF_I when OP_I = PEA else
					x"FFFFFFFF" when OP_I = Scc and Scc_COND_I = true else
					x"00000000" when OP_I = Scc else
					PC_OUT + "10" when (OP_I = JSR or OP_I = BSR) else -- Push the following address to the stack.
					Q_AREG_B when OP_I = LINK else RESULT_ALU_LO; -- The default is valid for the TAS operation.


	-- Data register source: The required sign extensions for the operation
	-- MOVEM and MOVEQ are computed in the data register unit.
	DREG_DATA_IN_B <= 	RESULT_ALU_LO when (OP_I = ABCD or OP_I = SBCD) else
						RESULT_ALU_LO when (OP_I = ADDX or OP_I = NEGX or OP_I = SUBX) else
						RESULT_ALU_LO when (OP_I = ADD or OP_I = SUB) else
						RESULT_ALU_LO when (OP_I = ADDI or OP_I = SUBI) else
						RESULT_ALU_LO when (OP_I = ADDQ or OP_I = SUBQ) else
						RESULT_ALU_LO when (OP_I = AND_B or OP_I = OR_B) else
						RESULT_ALU_LO when (OP_I = ANDI or OP_I = EORI or OP_I = ORI) else
						RESULT_ALU_LO when (OP_I = NBCD or OP_I = NEG or OP_I = NOT_B) else
						RESULT_ALU_HI when (OP_I = DIVS or OP_I = DIVU) else
						RESULT_ALU_HI when (OP_I = MULS or OP_I = MULU) else
						RESULT_SHFT when (OP_I = ASL or OP_I = ASR) else
						RESULT_SHFT when (OP_I = LSL or OP_I = LSR) else
						RESULT_SHFT when (OP_I = ROTL or OP_I = ROTR) else
						RESULT_SHFT when (OP_I = ROXL or OP_I = ROXR) else
						RESULT_SHFT when (OP_I = BCHG or OP_I = BSET or OP_I = BCLR) else
						Q_DREG_B when OP_I = EXG and OP_MODE_I = "01000" else -- Exchange two data registers.
						BUS_BUFFER_A when OP_I = MOVEM else
						DATA_IMMEDIATE_I when OP_I = MOVEQ else
						x"FFFFFFFF" when OP_I = Scc and Scc_COND_I = true else
						x"00000000" when OP_I = Scc else
						x"00000000" when OP_I = CLR else
						x"000000" & "000" & STATUS_REG_I(4 downto 0) when OP_I = MOVE_FROM_CCR else
						x"0000" & STATUS_REG_I when OP_I = MOVE_FROM_SR else RESULT_ALU_LO; -- Default used for EXT, SWAP, TAS.

	DREG_DATA_IN_A <= 	Q_DREG_B when OP_I = MOVE and ADR_MODE_I = "000" else -- Data to data register.
						Q_AREG_B when OP_I = MOVE and ADR_MODE_I = "001" else -- Address to data register.
						Q_DREG_A when OP_I = EXG and OP_MODE_I = "01000" else -- Exchange two data registers.
						Q_AREG_B when OP_I = EXG else -- Exchange data and address registers.
						DATA_IMMEDIATE_I when OP_I = MOVE and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
						BUS_BUFFER_A when (OP_I = MOVE or OP_I = MOVEP) else RESULT_ALU_LO; -- Default for DIVS, MULS and MULU.	
	
	-- Address register source: The required sign extension for the operation
	-- MOVEA and MOVEM are computed in the address register unit.
	-- Note: this logic is priority sensitive!
	AREG_DATA_IN <= BUS_BUFFER_A when CTRL_RDY_I = '1' else -- For interrupt handling (init PC, SSP).
                    RESULT_ALU_LO when (OP_I = ADDA or OP_I = SUBA) else
					RESULT_ALU_LO when (OP_I = ADDQ or OP_I = SUBQ) else
					Q_DREG_B when OP_I = MOVEA and ADR_MODE_I = "000" else
					Q_AREG_B when OP_I = EXG and OP_MODE_I = "01001" else -- Exchange two address registers.
					Q_DREG_A when OP_I = EXG else -- Exchange data and address registers.
					Q_AREG_B when OP_I = MOVEA and ADR_MODE_I = "001" else
					DATA_IMMEDIATE_I when OP_I = MOVEA and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					SSP_OUT when OP_I = LINK and SBIT_I = '1' else
					USP_OUT when OP_I = LINK else
					BUS_BUFFER_A when (OP_I = RTE or OP_I = RTR or OP_I = RTS) else -- Init PC, CCR, SP.
					Q_AREG_B when OP_I = UNLK and UNLK_SP_An_I = '1' else -- An to SP.
					x"0000" & DATA_CORE when FC_OUT_I = "010" or FC_OUT_I = "110" else -- User program space.
					BUS_BUFFER_A;
	
	-- ALU source operand: The required sign extensions for the operations 
	-- ADDA, CMPA and SUBA are computed in the ALU unit.
	ALU_OP_IN_S <= 	Q_DREG_A when (OP_I = ABCD or OP_I = SBCD) and RM_I = '0' else
					BUS_BUFFER_A when (OP_I = ABCD or OP_I = SBCD) else
					Q_DREG_A when (OP_I = ADDX or OP_I = SUBX) and RM_I = '0' else
					BUS_BUFFER_A when (OP_I = ADDX or OP_I = SUBX) else
					Q_DREG_A when (OP_I = ADD or OP_I = SUB) and OP_MODE_I(2) = '0' and ADR_MODE_I = "000" else
					Q_AREG_B when (OP_I = ADD or OP_I = SUB) and OP_MODE_I(2) = '0' and ADR_MODE_I = "001" else
					DATA_IMMEDIATE_I when (OP_I = ADD or OP_I = SUB) and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					BUS_BUFFER_A when (OP_I = ADD or OP_I = SUB) and OP_MODE_I(2) = '0' else
					Q_DREG_B when (OP_I = ADD or OP_I = SUB) and OP_MODE_I(2) = '1' else
					Q_DREG_B when (OP_I = ADDA or OP_I = CMPA or OP_I = SUBA) and ADR_MODE_I = "000" else
					Q_AREG_B when (OP_I = ADDA or OP_I = CMPA or OP_I = SUBA) and ADR_MODE_I = "001" else
					DATA_IMMEDIATE_I when (OP_I = ADDA or OP_I = CMPA or OP_I = SUBA) and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					BUS_BUFFER_A when (OP_I = ADDA or OP_I = CMPA or OP_I = SUBA) else
					DATA_IMMEDIATE_I when (OP_I = ADDI or OP_I = SUBI) else
					DATA_IMMEDIATE_I when (OP_I = ADDQ or OP_I = SUBQ) else
					Q_DREG_A when (OP_I = AND_B or OP_I = OR_B) and OP_MODE_I(2) = '0' and ADR_MODE_I = "000" else
					DATA_IMMEDIATE_I when (OP_I = AND_B or OP_I = OR_B) and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					BUS_BUFFER_A when (OP_I = AND_B or OP_I = OR_B) and OP_MODE_I(2) = '0' else
					Q_DREG_B when (OP_I = AND_B or OP_I = OR_B) and OP_MODE_I(2) = '1' else
					DATA_IMMEDIATE_I when (OP_I = ANDI or OP_I = CMPI or OP_I = EORI or OP_I = ORI) else
					DATA_IMMEDIATE_I when (OP_I = ANDI_TO_CCR or OP_I = ANDI_TO_SR) else
					DATA_IMMEDIATE_I when (OP_I = EORI_TO_CCR or OP_I = EORI_TO_SR) else
					DATA_IMMEDIATE_I when (OP_I = ORI_TO_CCR or OP_I = ORI_TO_SR) else
					Q_DREG_B when (OP_I = CHK) and ADR_MODE_I = "000" else
					DATA_IMMEDIATE_I when (OP_I = CHK) and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					BUS_BUFFER_A when (OP_I = CHK) else
					Q_DREG_B when OP_I = CMP and ADR_MODE_I = "000" else
					Q_AREG_B when OP_I = CMP and ADR_MODE_I = "001" else
					DATA_IMMEDIATE_I when OP_I = CMP and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					BUS_BUFFER_A when OP_I = CMP or OP_I = CMPM else
					Q_DREG_A when OP_I = EOR else
					Q_DREG_B when (OP_I = EXTW or OP_I = SWAP) else
					-- MOVE and MOVEQ are switched here for condition code calculation:
					Q_DREG_B when OP_I = MOVE and ADR_MODE_I = "000" else
					Q_DREG_B when OP_I = MOVE and ADR_MODE_I = "000" else
					Q_AREG_A when OP_I = MOVE and ADR_MODE_I = "001" else
					DATA_IMMEDIATE_I when OP_I = MOVE and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					BUS_BUFFER_A when OP_I = MOVE else
                    DATA_IMMEDIATE_I when OP_I = MOVEQ else
                    --
					Q_DREG_B when (OP_I = DIVS or OP_I = DIVU) and ADR_MODE_I = "000" else
					DATA_IMMEDIATE_I when (OP_I = DIVS or OP_I = DIVU) and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					BUS_BUFFER_A when (OP_I = DIVS or OP_I = DIVU) else
                    x"0000" & Q_DREG_B(15 downto 0) when OP_SIZE_I = WORD and (OP_I = MULS or OP_I = MULU) and ADR_MODE_I = "000" else
					Q_DREG_B when (OP_I = MULS or OP_I = MULU) and ADR_MODE_I = "000" else
                    x"0000" & DATA_IMMEDIATE_I(15 downto 0) when OP_SIZE_I = WORD and (OP_I = MULS or OP_I = MULU) and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					DATA_IMMEDIATE_I when (OP_I = MULS or OP_I = MULU) and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
                    x"0000" & BUS_BUFFER_A(15 downto 0) when OP_SIZE_I = WORD and (OP_I = MULS or OP_I = MULU) else
					BUS_BUFFER_A when (OP_I = MULS or OP_I = MULU) else x"00000000"; -- The default is valid for NBCD, NEG, NEGX.

	ALU_OP_IN_D_LO <=	Q_DREG_B when (OP_I = ABCD or OP_I = SBCD) and RM_I = '0' else
						BUS_BUFFER_B when (OP_I = ABCD or OP_I = SBCD) else
						Q_DREG_B when (OP_I = ADDX or OP_I = SUBX) and RM_I = '0' else
						BUS_BUFFER_B when (OP_I = ADDX or OP_I = SUBX) else
						Q_DREG_B when (OP_I = ADD or OP_I = SUB) and OP_MODE_I(2) = '0' else
						BUS_BUFFER_A when (OP_I = ADD or OP_I = SUB) and OP_MODE_I(2) = '1' else
						Q_AREG_A when (OP_I = ADDA or OP_I = CMPA or OP_I = SUBA) else
						Q_DREG_B when (OP_I = ADDI or OP_I = SUBI) and ADR_MODE_I = "000" else
						BUS_BUFFER_A when (OP_I = ADDI or OP_I = SUBI) else
						Q_DREG_B when (OP_I = ADDQ or OP_I = SUBQ) and ADR_MODE_I = "000" else
						Q_AREG_B when (OP_I = ADDQ or OP_I = SUBQ) and ADR_MODE_I = "001" else
						BUS_BUFFER_A when (OP_I = ADDQ or OP_I = SUBQ) else
						Q_DREG_B when (OP_I = AND_B or OP_I = OR_B) and OP_MODE_I(2) = '0' else
						Q_DREG_B when OP_I = EOR and ADR_MODE_I = "000" else
						BUS_BUFFER_A when (OP_I = AND_B or OP_I = EOR or OP_I = OR_B) and OP_MODE_I(2) = '1' else
						Q_DREG_B when (OP_I = ANDI or OP_I = CMPI or OP_I = EORI or OP_I = ORI) and ADR_MODE_I = "000" else
						BUS_BUFFER_A when (OP_I = ANDI or OP_I = CMPI or OP_I = EORI or OP_I = ORI) else
						x"0000" & STATUS_REG_I when (OP_I = ANDI_TO_CCR or OP_I = ANDI_TO_SR) else
						x"0000" & STATUS_REG_I when (OP_I = EORI_TO_CCR or OP_I = EORI_TO_SR) else
						x"0000" & STATUS_REG_I when (OP_I = ORI_TO_CCR or OP_I = ORI_TO_SR) else
						Q_DREG_A when OP_I = CHK else
						Q_DREG_A when OP_I = CMP and OP_MODE_I(2) = '0' else
						BUS_BUFFER_B when OP_I = CMPM else
						Q_DREG_A when (OP_I = DIVS or OP_I = DIVU) else
                        x"0000" & Q_DREG_A(15 downto 0) when OP_SIZE_I = LONG and (OP_I = MULS or OP_I = MULU) else
						Q_DREG_A when (OP_I = MULS or OP_I = MULU) else
						Q_DREG_B when (OP_I = NBCD or OP_I = NEG or OP_I = NEGX or OP_I = NOT_B) and ADR_MODE_I = "000" else
						BUS_BUFFER_A when (OP_I = NBCD or OP_I = NEG or OP_I = NEGX or OP_I = NOT_B) else
						Q_DREG_B when OP_I = TAS and ADR_MODE_I = "000" else
						BUS_BUFFER_A when OP_I = TAS else
						Q_DREG_B when OP_I = TST and ADR_MODE_I = "000" else
						Q_AREG_B when OP_I = TST and ADR_MODE_I = "001" else
						DATA_IMMEDIATE_I when OP_I = TST and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
						BUS_BUFFER_A; -- Valid for TST.
					
	ALU_OP_IN_D_HI <=	Q_DREG_C; -- Used for DIVUL, DIVSL.

	SHFT_OP_IN <=	Q_DREG_B when (OP_I = ASL or OP_I = ASR) and MEM_SHFT_I = '0' else
					BUS_BUFFER_A when (OP_I = ASL or OP_I = ASR) else
					Q_DREG_B when (OP_I = LSL or OP_I = LSR) and MEM_SHFT_I = '0' else
					BUS_BUFFER_A when (OP_I = LSL or OP_I = LSR) else
					Q_DREG_B when (OP_I = ROTL or OP_I = ROTR) and MEM_SHFT_I = '0' else
					BUS_BUFFER_A when (OP_I = ROTL or OP_I = ROTR) else
					Q_DREG_B when (OP_I = ROXL or OP_I = ROXR) and MEM_SHFT_I = '0' else
					BUS_BUFFER_A when (OP_I = ROXL or OP_I = ROXR) else
					DATA_IMMEDIATE_I when OP_I = BTST and ADR_MODE_I = "111" and REGSEL_20_I = "100" else
					Q_DREG_B when (OP_I = BCHG or OP_I = BCLR or OP_I = BSET or OP_I = BTST) and ADR_MODE_I = "000" else
					BUS_BUFFER_A when (OP_I = BCHG or OP_I = BCLR or OP_I = BSET or OP_I = BTST) else
					(others => '0'); -- Dummy.

	I_CTRL: WF68K00IP_CONTROL
	port map(
		CLK					=> CLK,
		RESETn				=> RESET_COREn,
		C_CODE				=> C_CODE_I,
		Scc_COND			=> Scc_COND_I,
		REGLISTMASK			=> REGLISTMASK_I,
		CTRL_EN				=> CTRL_EN_I,
		EXEC_ABORT			=> EXEC_ABORT_I,
		DATA_VALID			=> DATA_VALID_I,
		BUS_CYC_RDY			=> BUS_CYC_RDY_I,
		CTRL_RDY			=> CTRL_RDY_I,
		INIT_STATUS 		=> INIT_STATUS_I,
		PRESET_IRQ_MASK		=> PRESET_IRQ_MASK_I,
		SR_CCR_IN			=> SR_CCR_MUX,
        IRQ				    => not IPL_In,
        IRQ_SAVE            => IRQ_SAVE_I,
		XNZVC_IN			=> XNZVC_I,
		STATUS_REG_OUT		=> STATUS_REG_I,
		FORCE_BIW2			=> FORCE_BIW2_I,
		FORCE_BIW3			=> FORCE_BIW3_I,
		EXT_CNT				=> EXT_CNT_I,
		DEST_EXT_CNT		=> DEST_EXT_CNT_I,
		REGSEL_20			=> REGSEL_20_I,
		IW_ADR				=> IW_ADR_I,
		IW_WR				=> IW_WR_I,
		SRC_DESTn			=> SRC_DESTn_I,
		EW_WR				=> EW_WR_I,
		EW_ADR				=> EW_ADR_I,
		RD_BUS				=> RD_BUS_CTRL,
		WR_BUS				=> WR_BUS_CTRL,
		RDWR_BUS			=> RDWR_BUS_I,
		WR_HI				=> WR_HI_I,
		SEL_A_HI			=> SEL_A_HI,
		SEL_A_MIDHI			=> SEL_A_MIDHI,
		SEL_A_MIDLO			=> SEL_A_MIDLO,
		SEL_A_LO			=> SEL_A_LO,
		SEL_BUFF_A_LO		=> SEL_BUF_A_LO_CTRL_I,
		SEL_BUFF_A_HI		=> SEL_BUF_A_HI_CTRL_I,
		SEL_BUFF_B_LO		=> SEL_BUF_B_LO_I,
		SEL_BUFF_B_HI		=> SEL_BUF_B_HI_I,
		FC_OUT				=> FC_OUT_CTRL,
		FC_EN				=> FC_EN_CTRL,
		PC_INIT				=> PC_INIT_CTRL,
		PC_WR				=> PC_WR_I,
		PC_INC				=> PC_INC_I,
		PC_TMP_CLR			=> PC_TMP_CLR_I,
		PC_TMP_INC			=> PC_TMP_INC_I,
		SP_ADD_DISPL		=> SP_ADD_DISPL_I,
		USP_INC				=> USP_INC_I,
		SSP_INC				=> SSP_INC_I,
		USP_DEC				=> USP_DEC_I,
		SSP_DEC				=> SSP_DEC_CTRL,
		USP_CPY				=> USP_CPY_I,
		PC_ADD_DISPL		=> PC_ADD_DISPL_I,
		ADR_TMP_CLR			=> ADR_TMP_CLR_I,
		ADR_TMP_INC			=> ADR_TMP_INC_I,
		AR_INC				=> AR_INC_I,
		AR_DEC				=> AR_DEC_I,
		AR_WR				=> AR_WR_I,
		AR_DR_EXG			=> AR_DR_EXG_I,
		DR_WR				=> DR_WR_I,
		DR_DEC				=> DR_DEC_I,
		SCAN_TRAPS			=> SCAN_TRAPS_I,
		TRAP_PRIV			=> TRAP_PRIV_I,
		TRAP_TRACE			=> TRAP_TRACE_I,
		OP					=> OP_I,
		OP_MODE				=> OP_MODE_I(2 downto 0),
		OP_SIZE				=> OP_SIZE_I,
		ADR_MODE			=> ADR_MODE_I,
		MOVE_D_AM			=> MOVE_D_AM_I,
		RESET_RDY			=> RESET_RDY_I,
		OP_BUSY				=> OP_BUSY_I,
		MEM_SHFT			=> MEM_SHFT_I,
		SHFT_BUSY			=> SHFT_BUSY_I,
		DR					=> DR_I,
		RM					=> RM_I,
		DIV_MUL_32n64		=> DIV_MUL_32n64_I,
		EXEC_RESUME			=> EXEC_RESUME_I,
		MOVEM_REGSEL		=> MOVEM_REGSEL_I,
		MOVEM_ADn			=> MOVEM_ADn_I,
		DBcc_COND			=> DBcc_COND_I,
		USE_SP_ADR			=> USE_SP_ADR_I,
		OP_START			=> OP_START_I,
		TRAP_CHK_EN			=> TRAP_CHK_EN_I,
		SHIFTER_LOAD		=> SHIFTER_LOAD_I,
		CHK_PC				=> CHK_PC_I,
		CHK_ADR				=> CHK_ADR_I,
		SBIT				=> SBIT_I,
		UNLK_SP_An			=> UNLK_SP_An_I,
		RESET_EN			=> RESET_EN_I
	);

	I_IRQ_CTRL: WF68K00IP_INTERRUPT_CONTROL
	port map(
		CLK					=> CLK,
		RESETn				=> RESET_COREn,
		RESET_CPUn			=> RESET_CPU_In,
		BERR				=> BERR_I,
		HALTn				=> HALT_In,
		ADR_IN				=> ADR_I,
		USE_SSP_ADR			=> USE_SSP_ADR_I,
		ADR_EN_VECTOR		=> ADR_EN_VECTOR_I,
		DATA_IN				=> DATA_CORE(7 downto 0),
		DATA_OUT			=> IRQ_DOUT,
		DATA_EN				=> IRQ_DATA_EN,
		RWn(0)				=> RWn_I,
		RD_BUS				=> RD_BUS_IRQ,
		WR_BUS				=> WR_BUS_IRQ,
		HALT_EN				=> HALT_EN_I,
		FC_IN				=> FC_OUT_I,
		FC_OUT				=> FC_OUT_IRQ,
		FC_EN				=> FC_EN_IRQ,
		SEL_BUFF_A_LO		=> SEL_BUF_A_LO_IRQ_I,
		SEL_BUFF_A_HI		=> SEL_BUF_A_HI_IRQ_I,
		STATUS_REG_IN		=> STATUS_REG_I,
		PC					=> PC_OUT,
		INIT_STATUS 		=> INIT_STATUS_I,
		PRESET_IRQ_MASK		=> PRESET_IRQ_MASK_I,
		SSP_DEC				=> SSP_DEC_IRQ,
		SSP_INIT			=> SSP_INIT_I,
		PC_INIT				=> PC_INIT_IRQ,
		BIW_0				=> BIW_0_I,
		BUS_CYC_RDY			=> BUS_CYC_RDY_I,
		CTRL_RDY			=> CTRL_RDY_I,
		CTRL_EN				=> CTRL_EN_I,
		EXEC_ABORT			=> EXEC_ABORT_I,
		EXEC_RESUME			=> EXEC_RESUME_I,
		IRQ					=> not IPL_In,
		AVECn				=> AVEC_In, -- Originally 68Ks use VPAn.
        IRQ_SAVE            => IRQ_SAVE_I,
		INT_VECT			=> INT_VECT_I,
		USE_INT_VECT		=> USE_INT_VECT_I,
		TRAP_AERR			=> TRAP_AERR_I,
		TRAP_OP				=> TRAP_OP_I,
		TRAP_VECTOR			=> TRAP_VECTOR_I,
		TRAP_V				=> TRAP_V_I,
		TRAP_CHK			=> TRAP_CHK_I,
		TRAP_DIVZERO		=> TRAP_DIVZERO_I,
		TRAP_ILLEGAL		=> TRAP_ILLEGAL_I,
		TRAP_1010			=> TRAP_1010_I,
		TRAP_1111			=> TRAP_1111_I,
		TRAP_PRIV			=> TRAP_PRIV_I,
		TRAP_TRACE			=> TRAP_TRACE_I
	);

	I_OPCODE: WF68K00IP_OPCODE_DECODER
	port map(
		CLK					=> CLK,
		RESETn				=> RESET_COREn,
		DATA_IN				=> DATA,
		SBIT				=> SBIT_I,
		OV					=> STATUS_REG_I(1),
		IW_ADR				=> IW_ADR_I,
		IW_WR				=> IW_WR_I,
		FORCE_BIW2			=> FORCE_BIW2_I,
		FORCE_BIW3			=> FORCE_BIW3_I,
		EXT_CNT				=> EXT_CNT_I,
		DEST_EXT_CNT		=> DEST_EXT_CNT_I,
		DR					=> DR_I,
		RM					=> RM_I,
		IR					=> IR_I,
		OP					=> OP_I,
		OP_MODE				=> OP_MODE_I,
		OP_SIZE				=> OP_SIZE_I,
		BIW_0				=> BIW_0_I,
		REGSEL_20			=> REGSEL_20_I,
		REGSEL_119			=> REGSEL_119_I,
		REGSEL_INDEX		=> REGSEL_INDEX,
		DATA_IMMEDIATE		=> DATA_IMMEDIATE_I,
		TRAP_VECTOR			=> TRAP_VECTOR_I,
		C_CODE				=> C_CODE_I,
		MEM_SHFT			=> MEM_SHFT_I,
		REGLISTMASK			=> REGLISTMASK_I,
		BITPOS_IM			=> BITPOS_IM_I,
		BIT_POS				=> BIT_POS_OP,
		DIV_MUL_32n64		=> DIV_MUL_32n64_I,
		REG_Dlq				=> REGSEL_Dlq,
		REG_Dhr				=> REGSEL_Dhr,
		SCAN_TRAPS			=> SCAN_TRAPS_I,
		TRAP_ILLEGAL		=> TRAP_ILLEGAL_I,
		TRAP_1010			=> TRAP_1010_I,
		TRAP_1111			=> TRAP_1111_I,
		TRAP_PRIV			=> TRAP_PRIV_I,
		TRAP_OP				=> TRAP_OP_I,
		TRAP_V				=> TRAP_V_I,
		EW_WR				=> EW_WR_I,
		EW_ADR				=> EW_ADR_I,
		SRC_DESTn			=> SRC_DESTn_I,
		EXWORD				=> EXWORD_I,
		DEST_EXWORD			=> DEST_EXWORD_I,
		ADR_MODE			=> ADR_MODE_I,
		MOVE_D_AM			=> MOVE_D_AM_I,
		EXT_DSIZE			=> EXT_DSIZE_I,
		SEL_DISPLACE_BIW	=> SEL_DISPLACE_BIW_I,
		DISPLACE_BIW		=> DISPLACE_BIW_I
	);

	I_ADRREG: WF68K00IP_ADDRESS_REGISTERS
	port map(
		CLK					=> CLK,
		RESETn				=> RESET_COREn,
		ADATA_IN			=> AREG_DATA_IN,
		REGSEL_B			=> REGSEL_ADR_B,
		REGSEL_A			=> REGSEL_ADR_A,
		ADR_REG_QB			=> Q_AREG_B,
		ADR_REG_QA			=> Q_AREG_A,
		USP_OUT				=> USP_OUT,
		SSP_OUT				=> SSP_OUT,
		PC_OUT				=> PC_OUT,
		EXWORD				=> EXWORD_I,
		DEST_EXWORD			=> DEST_EXWORD_I,
		DR					=> DR_I,
		USP_CPY				=> USP_CPY_I,
		AR_EXG				=> AR_DR_EXG_I,
		USP_INC				=> USP_INC_I,
		USP_DEC				=> USP_DEC_I,
		ADR_TMP_CLR			=> ADR_TMP_CLR_I,
		ADR_TMP_INC			=> ADR_TMP_INC_I,
		AR_INC				=> AR_INC_I,
		AR_DEC				=> AR_DEC_I,
		AR_WR				=> AR_WR_I,
		SSP_INC				=> SSP_INC_I,
		SSP_DEC				=> SSP_DEC_I,
		SSP_INIT			=> SSP_INIT_I,
		SP_ADD_DISPL		=> SP_ADD_DISPL_I,
		USE_SP_ADR			=> USE_SP_ADR_I,
		USE_SSP_ADR			=> USE_SSP_ADR_I,
		PC_WR				=> PC_WR_I,
		PC_INC				=> PC_INC_I,
		PC_TMP_CLR			=> PC_TMP_CLR_I,
		PC_TMP_INC			=> PC_TMP_INC_I,
		PC_INIT				=> PC_INIT_I,
		PC_ADD_DISPL		=> PC_ADD_DISPL_I,
		SRC_DESTn			=> SRC_DESTn_I,
		SBIT				=> SBIT_I,
		OP					=> OP_I,
		OP_SIZE				=> OP_SIZE_I,
		OP_MODE				=> OP_MODE_I,
		OP_START			=> OP_START_I,
		ADR_MODE			=> ADR_MODE_I,
		MOVE_D_AM			=> MOVE_D_AM_I,
		EXT_DSIZE			=> EXT_DSIZE_I,
		SEL_DISPLACE_BIW	=> SEL_DISPLACE_BIW_I,
		DISPLACE_BIW		=> DISPLACE_BIW_I,
		REGSEL_INDEX		=> REGSEL_DATA_C,
		INDEX_D_IN			=> Q_DREG_C,
		CHK_PC				=> CHK_PC_I,
		CHK_ADR				=> CHK_ADR_I,
		TRAP_AERR			=> TRAP_AERR_I,
		ADR_EFF				=> ADR_EFF_I
	);

	I_DATAREG: WF68K00IP_DATA_REGISTERS
	port map(
		CLK					=> CLK,
		RESETn				=> RESET_COREn,
		DATA_IN_A			=> DREG_DATA_IN_A,
		DATA_IN_B			=> DREG_DATA_IN_B,
		REGSEL_A			=> REGSEL_DATA_A,
		REGSEL_B			=> REGSEL_DATA_B,
		REGSEL_C			=> REGSEL_DATA_C,
		DIV_MUL_32n64		=> DIV_MUL_32n64_I,
		DATA_OUT_A			=> Q_DREG_A,
		DATA_OUT_B			=> Q_DREG_B,
		DATA_OUT_C			=> Q_DREG_C,
		DR_EXG				=> AR_DR_EXG_I,
		DR_WR				=> DR_WR_I,
		DR_DEC				=> DR_DEC_I,
		OP					=> OP_I,
		OP_SIZE				=> OP_SIZE_I,
		OP_MODE				=> OP_MODE_I,
		DBcc_COND			=> DBcc_COND_I
	);

	I_ALU: WF68K00IP_ALU
	port map(
		CLK					=> CLK,
		RESETn				=> RESET_COREn,
		OP_SIZE				=> OP_SIZE_I,
		OP					=> OP_I,
		XNZVC_IN			=> STATUS_REG_I(4 downto 0),
		XNZVC_OUT			=> XNZVC_ALU,
		OP_IN_S				=> ALU_OP_IN_S,
		OP_IN_D_HI			=> ALU_OP_IN_D_HI,
		OP_IN_D_LO			=> ALU_OP_IN_D_LO,
		RESULT_HI			=> RESULT_ALU_HI,
		RESULT_LO			=> RESULT_ALU_LO,
		OP_START			=> OP_START_I,
		TRAP_CHK_EN			=> TRAP_CHK_EN_I,
		DIV_MUL_32n64		=> DIV_MUL_32n64_I,
		OP_BUSY				=> OP_BUSY_I,
		TRAP_CHK			=> TRAP_CHK_I,
		TRAP_DIVZERO		=> TRAP_DIVZERO_I
	);

	I_SHFT: WF68K00IP_SHIFTER
	port map(
		CLK					=> CLK,
		RESETn				=> RESET_COREn,
		DATA_IN				=> SHFT_OP_IN,
		DATA_OUT			=> RESULT_SHFT,
		OP					=> OP_I,
		OP_SIZE				=> OP_SIZE_I,
		BIT_POS				=> BIT_POS_I,
		CNT_NR				=> CNT_NR_I,
		SHFT_BREAKn			=> not EXEC_ABORT_I,
		SHIFTER_LOAD		=> SHIFTER_LOAD_I,
		SHFT_BUSY			=> SHFT_BUSY_I,
		XNZVC_IN			=> STATUS_REG_I(4 downto 0),
		XNZVC_OUT			=> XNZVC_SHFT
	);

	I_BUS_IF: WF68K00IP_BUS_INTERFACE
	port map(
		CLK					=> CLK,
		RESETn				=> RESET_COREn,
		RESET_INn			=> RESET_IN_In,
		RESET_OUT_EN		=> RESET_OUT_EN_I,
		RESET_CPUn			=> RESET_CPU_In,
		RESET_EN			=> RESET_EN_I,
		RESET_RDY			=> RESET_RDY_I,
		DATA_IN				=> DATA,
		SEL_A_HI			=> SEL_A_HI,
		SEL_A_MIDHI			=> SEL_A_MIDHI,
		SEL_A_MIDLO			=> SEL_A_MIDLO,
		SEL_A_LO			=> SEL_A_LO,
		SEL_BUFF_A_LO		=> SEL_BUF_A_LO_I,
		SEL_BUFF_A_HI		=> SEL_BUF_A_HI_I,
		SEL_BUFF_B_LO		=> SEL_BUF_B_LO_I,
		SEL_BUFF_B_HI		=> SEL_BUF_B_HI_I,
		SYS_INIT			=> SYS_INIT_I,
		OP_SIZE				=> OP_SIZE_I,
		BUFFER_A			=> BUS_BUFFER_A,
		BUFFER_B			=> BUS_BUFFER_B,
		DATA_CORE_OUT		=> DATA_CORE,
		RD_BUS				=> RD_BUS_I,
		WR_BUS				=> WR_BUS_I,
		RDWR_BUS			=> RDWR_BUS_I,
		A0					=> ADR_I(0),
		BYTEn_WORD			=> BYTEn_WORD_I,
		EXEC_ABORT			=> EXEC_ABORT_I,
		BUS_CYC_RDY			=> BUS_CYC_RDY_I,
		DATA_VALID			=> DATA_VALID_I,
		DTACKn				=> DTACK_In,
		BERRn				=> BERR_In,
		AVECn				=> AVEC_In,
		HALTn				=> HALT_In,
		ADR_EN				=> ADR_EN_I,
		WR_HI				=> WR_HI_I,
		HI_WORD_EN			=> HI_WORD_EN_I,
		HI_BYTE_EN			=> HI_BYTE_EN_I,
		LO_BYTE_EN			=> LO_BYTE_EN_I,
		FC_EN				=> FC_EN_I,
		ASn					=> AS_In,
		AS_EN				=> AS_EN_I,
		UDSn				=> UDS_In,
		UDS_EN				=> UDS_EN_I,
		LDSn				=> LDS_In,
		LDS_EN				=> LDS_EN_I,
		RWn					=> RWn_I,
		RW_EN				=> RW_EN_I,
		VPAn				=> VPA_In,
		VMAn				=> VMA_In,
		VMA_EN				=> VMA_EN_I,
		E					=> E,
		BRn					=> BR_In,
		BGACKn				=> BGACK_In,
		BGn					=> BGn
	);
end STRUCTURE;
