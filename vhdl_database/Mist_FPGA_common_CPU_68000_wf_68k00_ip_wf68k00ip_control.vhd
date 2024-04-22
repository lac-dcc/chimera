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
---- This file contains the system control unit.                  ----
----                                                              ----
----                                                              ----
---- Description:                                                 ----
---- Performs the core synchronization and data flow control.     ----
---- This module manages execution of all instructions. It con-   ----
---- tains the status register which consists of two portions     ----
---- supervisor byte and user byte and its related logic.         ----
----                                                              ----
----                                                              ----
---- Author(s):                                                   ----
---- - Wolfgang Foerster, wf@experiment-s.de; wf@inventronik.de   ----
----                                                              ----
----------------------------------------------------------------------
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
-- Revision 2K7B  2007/12/24 WF
--   See the 68K00 top level file.
-- Revision 2K8A  2008/07/14 WF
--   See the 68K00 top level file.
-- 

use work.wf68k00ip_pkg.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity WF68K00IP_CONTROL is
	port (
		CLK				: in bit; -- System clock.
		RESETn			: in bit; -- Core reset.

		-- Several data:
		C_CODE			: in bit_vector(3 downto 0); -- Conditional code.
		REGLISTMASK		: in std_logic_vector(15 downto 0); -- Used in MOVEM.

		-- Main control machine signals:
		CTRL_EN			: in bit; -- Enable main controller.
		EXEC_ABORT		: in bit; -- Abort the current execution.
		DATA_VALID		: in bit; -- Indicates sample time for the bus data.
		BUS_CYC_RDY		: in bit; -- Indicates that the bus access has finished.
		CTRL_RDY		: out bit; -- Main controller finished an execution.

		-- Status register and controls:
		INIT_STATUS		: in bit;
		PRESET_IRQ_MASK	: in bit;
		SR_CCR_IN		: in std_logic_vector(15 downto 0); -- Status and condition code register input.
        IRQ			    : in std_logic_vector(2 downto 0);
        IRQ_SAVE        : in bit;
		XNZVC_IN		: in std_logic_vector(4 downto 0); -- Conditional flags.
		STATUS_REG_OUT	: out std_logic_vector(15 downto 0);

		-- Load controls (besides the first instruction word):
		FORCE_BIW2		: in bit;
		FORCE_BIW3		: in bit;
		EXT_CNT			: in integer range 0 to 2;
		DEST_EXT_CNT	: in integer range 0 to 2;
		REGSEL_20		: in std_logic_vector(2 downto 0);

		-- Instruction word controls:
		IW_ADR			: out integer range 0 to 2; -- Instruction word address.
		IW_WR			: out bit; -- Instruction word write control.

		-- Extension word controls:
		SRC_DESTn		: out bit; -- '1' for read operand from source, '0' store result to destination (MOVE).
		EW_WR			: out bit; -- Write control.
		EW_ADR			: out integer range 0 to 1; -- Source extension word address.

		-- Bus controls:
		RD_BUS			: out bit; -- Read bus request.
		WR_BUS			: out bit; -- Wriyte request.
		RDWR_BUS		: out bit; -- Read modify write request.
		WR_HI			: out bit; -- Write the high word to the external bus.
		SEL_A_HI		: out bit; -- Select data A buffer high byte.
		SEL_A_MIDHI		: out bit; -- Select data A buffer midhigh byte.
		SEL_A_MIDLO		: out bit; -- Select data A buffer midlow byte.
		SEL_A_LO		: out bit; -- Select data A buffer low byte.
		SEL_BUFF_A_LO	: out bit; -- Select data A buffer low word.
		SEL_BUFF_A_HI	: out bit; -- Select data A buffer high word.
		SEL_BUFF_B_LO	: out bit; -- Select data B buffer low word.
		SEL_BUFF_B_HI	: out bit; -- Select data B buffer high word.
		FC_OUT			: out std_logic_vector(2 downto 0);
		FC_EN			: out bit;

		-- Program counter controls:
		PC_INIT			: out bit; -- Write the hi PC portion.
		PC_WR			: out bit; -- Write program counter (PC).
		PC_INC			: out bit; -- Increment PC.
		PC_TMP_CLR		: out bit; -- Clear temporary PC.
		PC_TMP_INC		: out bit; -- Increment temporary PC.
		PC_ADD_DISPL	: out bit; -- Forces the adding of the sign extended displacement to the PC.

		-- Stack pointer controls:
		USP_INC			: out bit; -- User stack pointer increment by 2.
		SSP_INC			: out bit; -- Supervisor stack pointer increment by 2.
		USP_DEC			: out bit; -- User stack pointer decrement by 2.
		SSP_DEC			: out bit; -- Supervisor stack pointer decrement by 2.
		USP_CPY			: out bit; -- Copy user stack to or from address registers.
		SP_ADD_DISPL	: out bit; -- Forces the adding of the sign extended displacement to the SP.

		-- Address register controls:
		ADR_TMP_CLR		: out bit; -- Temporary address offset clear.
		ADR_TMP_INC		: out bit; -- Address register increment temporarily.
		AR_INC			: out bit; -- Address register increment.
		AR_DEC			: out bit; -- Address register decrement.
		AR_WR			: out bit; -- Address register write.
		AR_DR_EXG		: out bit; -- Exchange data or address registers.

		-- Data register controls:
		DR_WR			: out bit; -- Write the data register.
		DR_DEC			: out bit; -- Decrement data register by 1.

		-- Traps:
		SCAN_TRAPS		: out bit; -- Scan the traps in the end of FETCH_BIW_1.
		TRAP_PRIV		: in bit; -- Trap by violation of the priviledge.
		TRAP_TRACE		: out bit; -- Trap due to the trace mode.

		-- Miscellaneous flags:
		OP				: in OP_68K00; -- Type of operation.
		OP_MODE			: in std_logic_vector(2 downto 0); -- Operation mode.
		OP_SIZE			: in OP_SIZETYPE; -- Operation size.
		ADR_MODE		: in std_logic_vector(2 downto 0); -- Address mode indicator.
		MOVE_D_AM		: in std_logic_vector(2 downto 0); -- Move statement destination address mode.
		RESET_RDY		: in bit; -- Progress control for the RESET operation.
		OP_BUSY			: in bit; -- Progress control for MUL and DIV.
		MEM_SHFT		: in bit; -- Shift operations in registers ('0') or in memory ('1').
		SHFT_BUSY		: in bit; -- Progress control for the shift operations.
		DR	 			: in bit; -- Direction control.
		RM				: in bit; -- Register or memory control.
		DIV_MUL_32n64	: in bit; -- Format of the DIV and MUL.
		EXEC_RESUME 	: in bit; -- Resume after STOP.
		DBcc_COND		: in boolean; -- DBcc control, see data registers.

		-- Miscellaneous controls:
		USE_SP_ADR		: out bit;
		OP_START		: out bit; -- 1 CLK cycle, start condition for DIV and MUL.
		TRAP_CHK_EN		: out bit; -- Enabes the CHK command result.
		MOVEM_REGSEL	: out std_logic_vector(2 downto 0); -- Register number selection.
		MOVEM_ADn		: out bit; -- Address or data register select ('1' = address).
		Scc_COND		: out boolean; -- For the Scc command.
		SHIFTER_LOAD	: out bit; -- Strobe of 1 clock pulse, start condition for the shifter.
		CHK_PC			: out bit; -- Check program counter for TRAP_AERR.
		CHK_ADR			: out bit; -- Check effective address for TRAP_AERR.
		SBIT			: out bit; -- Superuser flag.
		UNLK_SP_An		: out bit; -- Multiplexer switch for the UNLK.
		RESET_EN		: out bit -- Control for the reset logic in the bus interface.
		);
end entity WF68K00IP_CONTROL;
	
architecture BEHAVIOR of WF68K00IP_CONTROL is
type EXEC_STATES is (IDLE, FETCH_BIW_1, FETCH_BIW_2, FETCH_BIW_3, FETCH_EXT, FETCH_DEST_EXT, 
                     RD_SRC_1, RD_SRC_1_LO, RD_SRC_1_HI, RD_SRC_2, RD_SRC_2_LO, RD_SRC_2_HI, WR_DEST_1, 
					 WR_DEST_1_LO, WR_DEST_1_HI, WR_DEST_2_LO, WR_DEST_2_HI, RD_SP_HI, RD_SP, RD_SP_LO,
					 WR_SP_HI, WR_SP_LO, WAIT_OPERATION, MOVEM_TST);
signal EXEC_STATE		: EXEC_STATES;
signal NEXT_EXEC_STATE	: EXEC_STATES;
signal STATUS_REG		: std_logic_vector(15 downto 0);
signal SR_WR			: bit;
signal CCR_WR			: bit;
signal CC_UPDT			: bit;
signal GOT_EXT			: boolean;
signal GOT_DEST_EXT		: boolean;
signal MOVEM_EN			: bit;
signal MOVEM_CPY		: std_logic;
signal MOVEM_ADn_I		: bit;
signal MOVEM_PI_CORR	: bit;
signal COND				: boolean; -- Used for conditional tests.
signal OP_END_I			: bit;
signal RD_BUS_I			: bit;
signal WR_BUS_I			: bit;
signal RDWR_BUS_I		: bit;
signal AR_INC_I			: bit;
signal AR_DEC_I			: bit;
signal UPDT_CC          : bit;
signal SBIT_I           : bit;
signal TRAPLOCK         : boolean;
begin
	-- OP_START indicates the start condition of the MULS, MULU, DIVS or DIVU computation.
    OP_START <=	'1' when OP = MOVEM and EXEC_STATE = FETCH_BIW_1 and BUS_CYC_RDY = '1' else
                '1' when OP /= STOP and EXEC_STATE /= WAIT_OPERATION and NEXT_EXEC_STATE = WAIT_OPERATION else '0';

	-- The end of an operation is indicated by the NEXT_EXEC_STATE for one clock cycle.
	OP_END_I <= '1' when EXEC_STATE /= IDLE and EXEC_STATE /= FETCH_BIW_1 and NEXT_EXEC_STATE = FETCH_BIW_1 else
			  	'1' when EXEC_STATE = FETCH_BIW_1 and NEXT_EXEC_STATE = FETCH_BIW_1 and BUS_CYC_RDY = '1' else '0';

	CTRL_RDY <= '1' when EXEC_STATE = IDLE else '0';

	-- Signal to switch the stack pointer addresses to the address bus.
	USE_SP_ADR <= 	'1' when EXEC_STATE = RD_SP else
					'1' when EXEC_STATE = RD_SP_HI else
					'1' when EXEC_STATE = RD_SP_LO else
					'1' when EXEC_STATE = WR_SP_HI else
					'1' when EXEC_STATE = WR_SP_LO else '0';

	SHIFTER_LOAD <= '1' when (OP = ASL or OP = ASR) and EXEC_STATE /= WAIT_OPERATION and NEXT_EXEC_STATE = WAIT_OPERATION else
					'1' when (OP = LSL or OP = LSR) and EXEC_STATE /= WAIT_OPERATION and NEXT_EXEC_STATE = WAIT_OPERATION else
					'1' when (OP = ROTL or OP = ROTR) and EXEC_STATE /= WAIT_OPERATION and NEXT_EXEC_STATE = WAIT_OPERATION else
					'1' when (OP = ROXL or OP = ROXR) and EXEC_STATE /= WAIT_OPERATION and NEXT_EXEC_STATE = WAIT_OPERATION else '0';

	TRAP_TRACE <= '1' when OP_END_I = '1' and STATUS_REG(15) = '1' else '0';

	CHK_ADR_STRB: process(RESETn, CLK)
	-- This process provides strobe controls for checking the adress error in the address register
	-- section of this core. The strobes occurs every time a bus cycle starts (read, write or read
	-- modify write). If the bus cycle is finished, the strobe locking is released. If there is an
	-- address error during a bus cycle, the unlocking is done during the IDLE state.
	variable LOCK : boolean;
	begin
		if RESETn = '0' then
			CHK_PC <= '0';
			CHK_ADR <= '0';
			LOCK := false;
		elsif CLK = '1' and CLK' event then
			CHK_PC <= '0';
			CHK_ADR <= '0';
			if CTRL_EN = '0' then
				null; -- Do nothing during exception handling.
            elsif (EXEC_STATE = FETCH_BIW_1 or EXEC_STATE = FETCH_BIW_2 or EXEC_STATE = FETCH_BIW_3) and LOCK = false then
				LOCK := true;
				CHK_PC <= '1';
			elsif (EXEC_STATE = FETCH_EXT or EXEC_STATE = FETCH_DEST_EXT) and LOCK = false then
				LOCK := true;
				CHK_PC <= '1';
			elsif (RD_BUS_I = '1' or WR_BUS_I = '1') and LOCK = false then -- No RDWR_BUS due to TAS is byte wide.
				LOCK := true;
				CHK_ADR <= '1';
			elsif BUS_CYC_RDY = '1' or EXEC_STATE = IDLE then
				LOCK := false;
				CHK_ADR <= '0';
                CHK_PC <= '0';
			end if;
		end if;
	end process CHK_ADR_STRB;

	-- These signals controls the high word and low word bus access to the 32 bit wide registers.
	SEL_A_HI <= '1' when OP = MOVEP and EXEC_STATE = RD_SRC_1_HI else -- LONG.
				 '1' when OP = MOVEP and EXEC_STATE = WR_DEST_1_HI else '0'; -- LONG.
	SEL_A_MIDHI <= '1' when OP = MOVEP and EXEC_STATE = RD_SRC_1_LO else -- LONG.
				 '1' when OP = MOVEP and EXEC_STATE = WR_DEST_1_LO else '0'; -- LONG.
	SEL_A_MIDLO <= '1' when OP = MOVEP and EXEC_STATE = RD_SRC_2_HI else -- LONG or WORD.
				 '1' when OP = MOVEP and EXEC_STATE = WR_DEST_2_HI else '0'; -- LONG or WORD.
	SEL_A_LO <= '1' when OP = MOVEP and EXEC_STATE = RD_SRC_2_LO else -- LONG or WORD.
				 '1' when OP = MOVEP and EXEC_STATE = WR_DEST_2_LO else '0'; -- LONG or WORD.
	SEL_BUFF_A_LO <= '1' when EXEC_STATE = RD_SRC_1 else
					 '1' when EXEC_STATE = RD_SRC_1_LO else
					 '1' when EXEC_STATE = RD_SP_LO else '0';
	SEL_BUFF_A_HI <= '1' when EXEC_STATE = RD_SRC_1_HI else
					 '1' when EXEC_STATE = RD_SP_HI else '0';
	SEL_BUFF_B_LO <= '1' when EXEC_STATE = RD_SRC_2 else
					 '1' when EXEC_STATE = RD_SRC_2_LO else '0';
	SEL_BUFF_B_HI <= '1' when EXEC_STATE = RD_SRC_2_HI else '0';

	SCAN_TRAPS <= '1' when EXEC_STATE = FETCH_BIW_1 and BUS_CYC_RDY = '1' else '0';

    SBIT <= SBIT_I;
    SBIT_I <= '1' when STATUS_REG(13) = '1' else '0';

	-- The function codes are as follows:
	-- 001: User data, 010: User program, 101: Supervisor data, 110: Supervisor program.
	-- The default "000" is for example valid during the RESET operation or the busy ALU.
	-- This implementation does not affect any drawback because the bus is not driven during
	-- these states.
	FC_EN <= '1' when (RD_BUS_I = '1' or WR_BUS_I = '1' or RDWR_BUS_I = '1') else '0';
	FC_OUT <= "010" when SBIT_I = '0' and (EXEC_STATE = FETCH_BIW_1 or EXEC_STATE = FETCH_BIW_2 or 
					EXEC_STATE = FETCH_BIW_3 or EXEC_STATE = FETCH_EXT or EXEC_STATE = FETCH_DEST_EXT) else
			  "110" when SBIT_I = '1' and (EXEC_STATE = FETCH_BIW_1 or EXEC_STATE = FETCH_BIW_2 or 
					EXEC_STATE = FETCH_BIW_3 or EXEC_STATE = FETCH_EXT or EXEC_STATE = FETCH_DEST_EXT) else
			  "001" when (RD_BUS_I = '1' or WR_BUS_I = '1' or RDWR_BUS_I = '1') and SBIT_I = '0' else
			  "101" when (RD_BUS_I = '1' or WR_BUS_I = '1' or RDWR_BUS_I = '1') and SBIT_I = '1' else "000";

	-- Status register conditions: (STATUS_REG(4) = X, STATUS_REG(3) = N, STATUS_REG(2) = Z,
	--                              STATUS_REG(1) = V, STATUS_REG(0) = C.)
	COND <= 	true when C_CODE = x"0" else -- True.
				true when C_CODE = x"2" and (STATUS_REG(2) nor STATUS_REG(0)) = '1' else -- High.
				true when C_CODE = x"3" and (STATUS_REG(2) or STATUS_REG(0)) = '1' else -- Low or same.
				true when C_CODE = x"4" and STATUS_REG(0) = '0' else -- Carry clear.
				true when C_CODE = x"5" and STATUS_REG(0) = '1' else -- Carry set.
				true when C_CODE = x"6" and STATUS_REG(2) = '0' else -- Not Equal.
				true when C_CODE = x"7" and STATUS_REG(2) = '1' else -- Equal.
				true when C_CODE = x"8" and STATUS_REG(1) = '0' else -- Overflow clear.
				true when C_CODE = x"9" and STATUS_REG(1) = '1' else -- Overflow set.
				true when C_CODE = x"A" and STATUS_REG(3) = '0' else -- Plus.
				true when C_CODE = x"B" and STATUS_REG(3) = '1' else -- Minus.
				true when C_CODE = x"C" and (STATUS_REG(3) xnor STATUS_REG(1)) = '1' else -- Greater or Equal.
				true when C_CODE = x"D" and (STATUS_REG(3) xor STATUS_REG(1)) = '1' else -- Less than.
				true when C_CODE = x"E" and STATUS_REG(3 downto 1) = "101" else -- Greater than.
				true when C_CODE = x"E" and STATUS_REG(3 downto 1) = "000" else -- Greater than.
				true when C_CODE = x"F" and STATUS_REG(2) = '1' else -- Less or equal.
				true when C_CODE = x"F" and (STATUS_REG(3) xor STATUS_REG(1)) = '1' else false; -- Less or equal.

	Scc_COND <= COND; -- Copy the conditional test result to the output.

	EW_WR <= '1' when EXEC_STATE = FETCH_EXT and DATA_VALID = '1' else
			 '1' when EXEC_STATE = FETCH_DEST_EXT and DATA_VALID = '1' else '0';

	IW_ADR <= 2 when EXEC_STATE = FETCH_BIW_3 else
			  1 when EXEC_STATE = FETCH_BIW_2 else 0; -- Default during FETCH_BIW_1.

	IW_WR <= '1' when EXEC_STATE = FETCH_BIW_1 and DATA_VALID = '1' else
			 '1' when EXEC_STATE = FETCH_BIW_2 and DATA_VALID = '1' else
			 '1' when EXEC_STATE = FETCH_BIW_3 and DATA_VALID = '1' else '0';

	-- Select stack pointer or address data:
	-- '1' means: write address register to stack pointer.
	UNLK_SP_An <= '1' when OP = UNLK and EXEC_STATE = FETCH_BIW_1 else '0';

	-- Source or destination control for the ABCD, ADDX, CMPM, MOVE, SBCD and SUBX operations:
	SRC_DESTn <= '0' when OP = MOVE and EXEC_STATE = FETCH_DEST_EXT else
                 '0' when (OP = ABCD or OP = ADDX or OP = CMPM or OP = SBCD or OP = SUBX) and EXEC_STATE = RD_SRC_2 else
                 '0' when (OP = ADDX or OP = CMPM or OP = SUBX) and EXEC_STATE = RD_SRC_2_HI else
                 '0' when (OP = ADDX or OP = CMPM or OP = SUBX) and EXEC_STATE = RD_SRC_2_LO else
				 '0' when (OP = ADDX or OP = SUBX or OP = MOVE) and EXEC_STATE = WR_DEST_1_HI else
				 '0' when (OP = ADDX or OP = SUBX or OP = MOVE) and EXEC_STATE = WR_DEST_1_LO else
				 '0' when (OP = ABCD or OP = ADDX or OP = MOVE or OP = SBCD or OP = SUBX) and EXEC_STATE = WR_DEST_1 else '1';

	AR_DR_EXG <= '1' when OP = EXG and OP_END_I = '1' else '0';

	DR_DEC	<= '1' when OP = DBcc and NEXT_EXEC_STATE = WAIT_OPERATION else '0';

	DR_WR <= 	'1' when (OP = ABCD or OP = SBCD) and RM = '0' and OP_END_I = '1' else
				'1' when (OP = ADD or OP = SUB or OP = AND_B or OP = OR_B) and OP_MODE = "000" and OP_END_I = '1' else
				'1' when (OP = ADD or OP = SUB or OP = AND_B or OP = OR_B) and OP_MODE = "001" and OP_END_I = '1' else
				'1' when (OP = ADD or OP = SUB or OP = AND_B or OP = OR_B) and OP_MODE = "010" and OP_END_I = '1' else
				'1' when (OP = ADDI or OP = ADDQ) and ADR_MODE = "000" and OP_END_I = '1' else
				'1' when (OP = ANDI or OP = ORI) and ADR_MODE = "000" and OP_END_I = '1' else
				'1' when (OP = ADDX or OP = SUBX) and RM = '0' and OP_END_I = '1' else
				'1' when (OP = EXTW or OP = SWAP) and OP_END_I = '1' else
				'1' when (OP = EOR or OP = EORI) and ADR_MODE = "000" and OP_END_I = '1' else
				'1' when (OP = SUBI or OP = SUBQ) and ADR_MODE = "000" and OP_END_I = '1' else
				'1' when (OP = NEG or OP = NEGX) and ADR_MODE = "000" and OP_END_I = '1' else				
				'1' when (OP = NBCD or OP = NOT_B) and ADR_MODE = "000" and OP_END_I = '1' else				
				'1' when (OP = ASL or OP = ASR) and MEM_SHFT = '0' and OP_END_I = '1' else
				'1' when (OP = LSL or OP = LSR) and MEM_SHFT = '0' and OP_END_I = '1' else
				'1' when (OP = ROTL or OP = ROTR) and MEM_SHFT = '0' and OP_END_I = '1' else
				'1' when (OP = ROXL or OP = ROXR) and MEM_SHFT = '0' and OP_END_I = '1' else
				'1' when (OP = BCHG or OP = BCLR or OP = BSET or OP = CLR) and ADR_MODE = "000" and OP_END_I = '1' else
				'1' when (OP = DIVS or OP = DIVU) and EXEC_STATE = WAIT_OPERATION and OP_BUSY = '0' else
				'1' when OP = MOVE and MOVE_D_AM = "000" and OP_END_I = '1' else
				'1' when (OP = MOVE_FROM_CCR or OP = MOVE_FROM_SR) and ADR_MODE = "000" and OP_END_I = '1' else
				'1' when OP = MOVEQ and OP_END_I = '1' else
				'1' when OP = MOVEP and (OP_MODE = "101" or OP_MODE = "100") and OP_END_I = '1' else
				'1' when OP = MOVEM and NEXT_EXEC_STATE = MOVEM_TST and MOVEM_CPY = '1' and DR = '1' and MOVEM_ADn_I = '0' else
				'1' when (OP = MULS or OP = MULU) and EXEC_STATE = WAIT_OPERATION and OP_BUSY = '0' else
				'1' when OP = Scc and ADR_MODE = "000" and OP_END_I = '1' else 
				'1' when OP = TAS and ADR_MODE = "000" and OP_END_I = '1' else '0';

	AR_WR <= 	'1' when (OP = ADDA or OP = SUBA or OP = LEA) and OP_END_I = '1' else
				'1' when OP = MOVEA and OP_END_I = '1' else
				'1' when (OP = ADDQ or OP = SUBQ) and ADR_MODE = "001" and OP_END_I = '1' else
				'1' when OP = LINK and OP_END_I = '1' else
				'1' when OP = UNLK and EXEC_STATE = FETCH_BIW_1 and BUS_CYC_RDY = '1' else
				'1' when OP = UNLK and OP_END_I = '1' else
				'1' when OP = MOVEM and NEXT_EXEC_STATE = MOVEM_TST and MOVEM_CPY = '1' and DR = '1' and MOVEM_ADn_I = '1' else '0';

	-- Postincrement mode:
	-- The immediate operations and the read modify write operations require only one increment 
	-- per read write pair in the end of the operation.
	AR_INC <= AR_INC_I;
	AR_INC_I <= '1' when (OP = ADD or OP = ADDA or OP = ADDI or OP = ADDQ) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = AND_B or OP = ANDI) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = ASL or OP = ASR) and MEM_SHFT = '1' and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = BCHG or OP = BCLR or OP = BSET or OP = BTST) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = CHK or OP = CLR ) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = CMP or OP = CMPA or OP = CMPI) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when OP = CMPM and EXEC_STATE = RD_SRC_1 and BUS_CYC_RDY = '1' else -- Byte.
				'1' when OP = CMPM and EXEC_STATE = RD_SRC_1_LO and BUS_CYC_RDY = '1' else -- Word and long.
				'1' when OP = CMPM and OP_END_I = '1' else -- Increment the destination address register.
				'1' when (OP = DIVS or OP = DIVU) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = EOR or OP = EORI) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = LSL or OP = LSR) and MEM_SHFT = '1' and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when OP = MOVE and EXEC_STATE = RD_SRC_1 and ADR_MODE = "011" and BUS_CYC_RDY = '1' else
			  	'1' when OP = MOVE and EXEC_STATE = RD_SRC_1_LO and ADR_MODE = "011" and BUS_CYC_RDY = '1' else
				'1' when OP = MOVE and EXEC_STATE = WR_DEST_1 and MOVE_D_AM = "011" and BUS_CYC_RDY = '1' else
			  	'1' when OP = MOVE and EXEC_STATE = WR_DEST_1_LO and MOVE_D_AM = "011" and BUS_CYC_RDY = '1' else
				'1' when (OP = MOVEA or OP = MOVE_FROM_CCR or OP = MOVE_FROM_SR) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = MOVE_TO_CCR or OP = MOVE_TO_SR) and ADR_MODE = "011" and OP_END_I = '1' else
                '1' when OP = MOVEM and ADR_MODE = "011" and EXEC_STATE = RD_SRC_1 and BUS_CYC_RDY = '1' else
                '1' when OP = MOVEM and ADR_MODE = "011" and EXEC_STATE = RD_SRC_1_LO and BUS_CYC_RDY = '1' else
                '1' when OP = MOVEM and MOVEM_PI_CORR = '1' else -- MOVEM postincrement correction
				'1' when (OP = MULS or OP = MULU) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = NBCD or OP = NEG or OP = NEGX) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = NOT_B or OP = OR_B or OP = ORI) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = ROTL or OP = ROTR) and MEM_SHFT = '1' and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = ROXL or OP = ROXR) and MEM_SHFT = '1' and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = SUB or OP = SUBA or OP = SUBI or OP = SUBQ) and ADR_MODE = "011" and OP_END_I = '1' else
				'1' when (OP = Scc or OP = TAS or OP = TST) and ADR_MODE = "011" and OP_END_I = '1' else '0';

	PREDEC_CTRL: process(RESETn, CLK, AR_DEC_I)
	-- Predecrement mode: the address register is decremented right in the beginning of
	-- the respective execution states. The AR_DEC control is modelled by an edge detector.
	-- This is necessary because predecrementing before entering the states is not possible
	-- due to the multiplexing of the destination data set by SRC_DESTn which occurs exactly
	-- during these execution states.
	-- Note: the immediate operations and the read modify write operations require only one
	-- increment per read write arrangement at the beginning of the operation.
	-- Note: This process uses a complex interaction between the modelling with the variable
	-- LOCK and the prioritization of the 'if - elsif - end if' construction. Provide changes
	-- with care!
	variable LOCK: boolean;
	begin
		if RESETn = '0' then
			LOCK := false;
			AR_DEC_I <= '0';
		elsif CLK = '1' and CLK' event then
			AR_DEC_I <= '0'; -- Default.
			--
			if (OP = ABCD or OP = SBCD) and (EXEC_STATE = RD_SRC_1 or EXEC_STATE = RD_SRC_1_HI) and BUS_CYC_RDY = '1' then
				LOCK := false;
			elsif (OP = ADDX or OP = SUBX) and (EXEC_STATE = RD_SRC_1 or EXEC_STATE = RD_SRC_1_HI) and BUS_CYC_RDY = '1' then
				LOCK := false;
			elsif (OP = MOVE or OP = MOVEM) and BUS_CYC_RDY = '1' then
				LOCK := false;
			elsif OP_END_I = '1' then
				LOCK := false;
			--
			-- All predecrement except the MOVE:
			elsif (EXEC_STATE = RD_SRC_1 or EXEC_STATE = RD_SRC_1_HI or
			                            EXEC_STATE = WR_DEST_1 or EXEC_STATE = WR_DEST_1_HI) and LOCK = false then
				case OP is
					-- Read modify write operations (in some configurations):
					when ADD | ADDI | ADDQ | AND_B | ANDI | ASL | ASR | BCHG | BCLR | BSET | BTST | EOR | EORI | LSL | LSR |
                               NEG | NEGX | NOT_B | NBCD | OR_B | ORI | ROTL | ROTR | ROXL | ROXR | SUB | SUBI | SUBQ | TAS =>
						if ADR_MODE = "100" then
							AR_DEC_I <= '1';
							LOCK := true;
						end if;
					-- Write only operations:
					when CLR | MOVE_FROM_CCR | MOVE_FROM_SR | Scc =>
						if ADR_MODE = "100" then
							AR_DEC_I <= '1';
							LOCK := true;
						end if;
					-- Read only operations:
					when ADDA | CHK | CMP | CMPA | CMPI | DIVS | DIVU | MOVE_TO_CCR | MOVE_TO_SR | MOVEA | MOVEM | MULS |
                                                                                                       MULU | SUBA | TST =>
						if ADR_MODE = "100" then
							AR_DEC_I <= '1';
							LOCK := true;
						end if;
					-- Special operations:
					when ABCD | ADDX | SBCD | SUBX =>
						if ADR_MODE = "100" then
							AR_DEC_I <= '1';
							LOCK := true;
						end if;
					-- MOVE operation:
					when MOVE =>
						if (EXEC_STATE = RD_SRC_1 or EXEC_STATE = RD_SRC_1_HI) and ADR_MODE = "100" then -- Read from source.
							AR_DEC_I <= '1';
							LOCK := true;
						elsif (EXEC_STATE = WR_DEST_1 or EXEC_STATE = WR_DEST_1_HI) and MOVE_D_AM = "100" then -- Write to destination.
							AR_DEC_I <= '1';
							LOCK := true;
						end if;
					when others => null;
				end case;		
			elsif (EXEC_STATE = RD_SRC_2 or EXEC_STATE = RD_SRC_2_HI) and LOCK = false then
				case OP is
					when ABCD | ADDX | SBCD | SUBX =>
						AR_DEC_I <= '1';
						LOCK := true;
					when others => null;
				end case;
			end if;
		end if;
		--
		AR_DEC <= AR_DEC_I;
	end process PREDEC_CTRL;

	-- The conditions for clearing the temporary address offset are as follows:
	-- Opereation ends (after a write process).
	-- Post increment or pre decrement addressing mode (during increments / decrements).
	-- After the end of the respective read periods (take care of the MOVEM).
	-- The OP /= MOVEM ... is important for the MOVEM in the non predecrement / postincrement 
	-- address modes see also ADR_TMP_INC.
	ADR_TMP_CLR <= 	'1' when OP_END_I = '1' or AR_INC_I = '1' or AR_DEC_I = '1' else
                    '1' when OP /= MOVEM and EXEC_STATE = RD_SRC_1 and BUS_CYC_RDY = '1' else
					'1' when EXEC_STATE = RD_SRC_2 and BUS_CYC_RDY = '1' else -- For ABCD, ADDX, SBCD, SUBX.
                    '1' when OP /= MOVEM and EXEC_STATE = RD_SRC_1_LO and BUS_CYC_RDY = '1' else
					'1' when EXEC_STATE = RD_SRC_2_LO and BUS_CYC_RDY = '1' else '0'; -- ADDX, SUBX.

    ADR_TMP_INC <= 	'1' when OP = MOVEM and EXEC_STATE = RD_SRC_1 and BUS_CYC_RDY = '1' else
					'1' when EXEC_STATE = RD_SRC_1_HI and BUS_CYC_RDY = '1' else
				  	'1' when EXEC_STATE = RD_SRC_1_LO and BUS_CYC_RDY = '1' else
			  		'1' when EXEC_STATE = RD_SRC_2_HI and BUS_CYC_RDY = '1' else
                    '1' when OP = MOVEM and EXEC_STATE = WR_DEST_1 and BUS_CYC_RDY = '1' else
			  		'1' when EXEC_STATE = WR_DEST_1_HI and BUS_CYC_RDY = '1' else
			  		'1' when EXEC_STATE = WR_DEST_1_LO and BUS_CYC_RDY = '1' else
			  		'1' when EXEC_STATE = WR_DEST_2_HI and BUS_CYC_RDY = '1' else '0';

	USP_CPY <= 	'1' when OP = MOVE_USP and OP_END_I = '1' else '0';

	SP_ADD_DISPL <= '1' when OP = LINK and OP_END_I = '1' else '0';

	USP_INC <= 	'1' when EXEC_STATE = RD_SP and BUS_CYC_RDY = '1' and SBIT_I = '0' else
				'1' when EXEC_STATE = RD_SP_HI and BUS_CYC_RDY = '1' and SBIT_I = '0' else
				'1' when EXEC_STATE = RD_SP_LO and BUS_CYC_RDY = '1' and SBIT_I = '0' else '0'; 

	-- Decrement before use:
	USP_DEC <= 	'1' when EXEC_STATE /= WR_SP_HI and NEXT_EXEC_STATE = WR_SP_HI and SBIT_I = '0' else
				'1' when EXEC_STATE /= WR_SP_LO and NEXT_EXEC_STATE = WR_SP_LO and SBIT_I = '0' else '0';

	SSP_INC <= 	'1' when EXEC_STATE = RD_SP and BUS_CYC_RDY = '1' and SBIT_I = '1' else
				'1' when EXEC_STATE = RD_SP_HI and BUS_CYC_RDY = '1' and SBIT_I = '1' else
				'1' when EXEC_STATE = RD_SP_LO and BUS_CYC_RDY = '1' and SBIT_I = '1' else '0';

	-- Decrement before use:
    SSP_DEC <= '1' when EXEC_STATE /= WR_SP_HI and NEXT_EXEC_STATE = WR_SP_HI and SBIT_I = '1' else
               '1' when EXEC_STATE /= WR_SP_LO and NEXT_EXEC_STATE = WR_SP_LO and SBIT_I = '1' else '0';

	PC_ADD_DISPL <= '1' when (OP = BRA or OP = BSR) and OP_END_I = '1' else
					'1' when OP = Bcc and COND = true and OP_END_I = '1' else
					'1' when OP = DBcc and OP_END_I = '1' and COND = false and DBcc_COND = false else '0';

	-- The PC_INC takes place in the end of an operation. In case of the ILLEGAL, STOP, TRAP and TRAPV the
	-- inrement is produced 'artificially' by generating the OP_END signal although the state machine register
	-- changes to IDLE. See the respective state machine decoding for more details. For the UNIMPLEMENTED,
	-- the priviledge trap and the reserved patterns, the PC may not be incremented.
	PC_INC <= '1' when OP_END_I = '1' else '0';

	PC_TMP_CLR <= '1' when EXEC_STATE = IDLE else '0'; -- Clear the temporary PC during exceptions.
	
	-- The PC_TMP may increment during the fetch phase but must not increment in the last step of the fetch phase.
	PC_TMP_INC <= 	'1' when EXEC_STATE = FETCH_BIW_1 and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_BIW_2 else
					'1' when EXEC_STATE = FETCH_BIW_1 and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_EXT else
					'1' when EXEC_STATE = FETCH_BIW_1 and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_DEST_EXT else
					'1' when EXEC_STATE = FETCH_BIW_2 and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_BIW_3 else
					'1' when EXEC_STATE = FETCH_BIW_2 and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_EXT else
					'1' when EXEC_STATE = FETCH_BIW_3 and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_EXT else
					'1' when EXEC_STATE = FETCH_EXT and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_EXT else
					'1' when EXEC_STATE = FETCH_EXT and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_DEST_EXT else
					'1' when EXEC_STATE = FETCH_DEST_EXT and BUS_CYC_RDY = '1' and NEXT_EXEC_STATE = FETCH_DEST_EXT else '0';

	PC_INIT <= 	'1' when OP = RTE and EXEC_STATE = RD_SP_LO and BUS_CYC_RDY = '1' else
				'1' when OP = RTR and EXEC_STATE = RD_SP_LO and BUS_CYC_RDY = '1' else
				'1' when OP = RTS and EXEC_STATE = RD_SP_LO and BUS_CYC_RDY = '1' else '0';

	PC_WR <= '1' when (OP = JMP or OP = JSR) and OP_END_I = '1' else '0';

    SR_WR <= 	'1' when (OP = ANDI_TO_SR or OP = EORI_TO_SR or OP = ORI_TO_SR) and OP_END_I = '1' else
                '1' when (OP = MOVE_TO_SR or OP = RTE) and OP_END_I = '1' else
				'1' when OP = STOP and EXEC_STATE = FETCH_BIW_2 and BUS_CYC_RDY = '1' else '0';

	CCR_WR <= 	'1' when (OP = ANDI_TO_CCR or OP = EORI_TO_CCR or OP = ORI_TO_CCR) and OP_END_I = '1' else
				'1' when OP = MOVE_TO_CCR and OP_END_I = '1' else
				'1' when OP = RTR and EXEC_STATE = RD_SP and BUS_CYC_RDY = '1' else '0';
			
	-- Test at the end of the CHK operation:
	TRAP_CHK_EN <= OP_END_I when OP = CHK else '0';

	-- Enables the reset counter in the bus interface.
	RESET_EN <= '1' when OP = RESET and EXEC_STATE = WAIT_OPERATION else '0';

    UPDT_CC <= OP_END_I when ADR_MODE /= "001" else '0'; -- Valid for ADDQ and SUBQ.

	with OP select
	CC_UPDT <= UPDT_CC  when ADDQ | SUBQ, -- Do not update when destination is an address register.
               OP_END_I when ABCD | ADD | ADDI | ADDX | AND_B | ANDI | ASL | ASR | BCHG | BCLR |
							 BSET | BTST | CHK | CLR | CMP | CMPA | CMPI | CMPM | DIVS | DIVU |
							 EOR | EORI | EXTW | LSL | LSR | MOVE | MOVEQ | MULS | MULU | NBCD |
							 NEG | NEGX | NOT_B | OR_B | ORI | ROTL | ROTR | ROXL | ROXR | SBCD |
							 SUB | SUBI | SUBX | SWAP | TAS | TST, '0' when others;

	-- The 16 bit bus must be written in two portions: hi word and low word. 
	-- This control is not valid for MOVEP.
	WR_HI <= '1' when (EXEC_STATE = WR_DEST_1_HI or EXEC_STATE = WR_DEST_2_HI) else
			 '1' when EXEC_STATE = WR_SP_HI else '0';
			 
	WR_BUS <= WR_BUS_I;
	WR_BUS_I <=	'1' when EXEC_STATE = WR_DEST_1 and OP /= TAS else
				'1' when EXEC_STATE = WR_DEST_1_HI else
				'1' when EXEC_STATE = WR_DEST_1_LO else
				'1' when EXEC_STATE = WR_DEST_2_HI else
				'1' when EXEC_STATE = WR_DEST_2_LO else
				'1' when EXEC_STATE = WR_SP_HI else
				'1' when EXEC_STATE = WR_SP_LO else '0';

	RDWR_BUS <= RDWR_BUS_I;
	RDWR_BUS_I <= '1' when OP = TAS and EXEC_STATE = RD_SRC_1 else '0';

	RD_BUS <= RD_BUS_I;
    RD_BUS_I <=	'1' when EXEC_STATE = FETCH_BIW_1 and (CTRL_EN = '1' or TRAPLOCK = true) else
                -- The previous condition disables the bus cycle if the controller
                -- is disabled by the exception handler. This condtion occurs, when
                -- an exception is detected during the last clock cycle of an 
                -- instruction. In this case, the EXEC_STATE changes to FETCH_BIW_1
                -- and simultaneously, the EX_STATE machine changes from it's IDLE.
				'1' when EXEC_STATE = FETCH_BIW_2 else
				'1' when EXEC_STATE = FETCH_BIW_3 else
				'1' when EXEC_STATE = FETCH_EXT else
				'1' when EXEC_STATE = FETCH_DEST_EXT else
				'1' when EXEC_STATE = RD_SRC_1 and OP /= TAS else
				'1' when EXEC_STATE = RD_SRC_1_HI else
				'1' when EXEC_STATE = RD_SRC_1_LO else
				'1' when EXEC_STATE = RD_SRC_2 else 
				'1' when EXEC_STATE = RD_SRC_2_HI else
				'1' when EXEC_STATE = RD_SRC_2_LO else 
				'1' when EXEC_STATE = RD_SP else
				'1' when EXEC_STATE = RD_SP_HI else
				'1' when EXEC_STATE = RD_SP_LO else '0';

    P_STATUS_REG: process(RESETn, CLK, STATUS_REG)
	-- This process is the status register with
	-- it's related logic.
	variable SREG_MEM : std_logic_vector(9 downto 0);
	variable SREG_MEM_TMP : std_logic_vector(9 downto 0);
	begin
		if RESETn = '0' then
			SREG_MEM := "0000000000";
			SREG_MEM_TMP := "0000000000";
		elsif CLK = '1' and CLK' event then
            -- *. Store a temporary copy of the status register and restore it
            -- in the end of the RTE instruction. This is important to
            -- handle the correct stacks when the supervisor bit is modified
            -- in the trap handler routine.
            if OP = RTE and EXEC_STATE = RD_SP and BUS_CYC_RDY = '1' then
                SREG_MEM_TMP := SR_CCR_IN(15) & SR_CCR_IN(13) & SR_CCR_IN(10 downto 8) & SR_CCR_IN(4 downto 0);
            end if;
            --
			if INIT_STATUS = '1' then
				SREG_MEM(9 downto 8) := "01";
			end if;
			--
			if PRESET_IRQ_MASK = '1' then
				SREG_MEM(7 downto 5) := "111";
			end if;
			--
			if IRQ_SAVE = '1' then
				SREG_MEM(7 downto 5) := IRQ;
			end if;
			--
            if CC_UPDT = '1' then
				SREG_MEM(4 downto 0) := XNZVC_IN;
			end if;
			--
            if SR_WR = '1' and OP = RTE then -- *.
                SREG_MEM := SREG_MEM_TMP;
            elsif SR_WR = '1' then -- For ANDI_TO_SR, EORI_TO_SR, ORI_TO_SR, MOVE_TO_SR, STOP.
				SREG_MEM := SR_CCR_IN(15) & SR_CCR_IN(13) & SR_CCR_IN(10 downto 8) & SR_CCR_IN(4 downto 0);
			elsif CCR_WR = '1' then
				SREG_MEM(4 downto 0) := SR_CCR_IN(4 downto 0);
			end if;
		end if;
        --
        STATUS_REG <= SREG_MEM(9) & '0' & SREG_MEM(8) & "00" & SREG_MEM(7 downto 5) & "000" & SREG_MEM(4 downto 0);
		STATUS_REG_OUT <= STATUS_REG;
	end process P_STATUS_REG;

	EXWORD_COUNTER: process(RESETn, CLK, EXT_CNT, DEST_EXT_CNT, EXEC_STATE)
	-- This process provides the temporary counting of the already read extension words.
	-- The process is moddeled in a way, that the counters are incremented before the
	-- bus cycle is ready. This kind of realization gives the correct number of counted
	-- extension words, every time, when the BUS_CYC_RDY signal appears in the two states
	-- FETCH_EXT and FETCH_DEST_EXT.
	variable SRC_TMP	: integer range 0 to 2;
	variable DEST_TMP	: integer range 0 to 2;
	variable LOCK		: boolean;
	begin
		if RESETn = '0' then
			SRC_TMP := 0;
			DEST_TMP := 0;
			LOCK := false;
		elsif CLK = '1' and CLK' event then
			if EXEC_STATE = FETCH_BIW_1 then
				SRC_TMP := 0;
				DEST_TMP := 0;
				LOCK := false;
			-- For the extensions:
			elsif EXEC_STATE = FETCH_EXT and BUS_CYC_RDY = '0' and LOCK = false then
				SRC_TMP := SRC_TMP + 1;
				LOCK := true;
			elsif EXEC_STATE = FETCH_EXT and BUS_CYC_RDY = '1' then
				LOCK := false;
			-- And for the destination extensions:
			elsif EXEC_STATE = FETCH_DEST_EXT and BUS_CYC_RDY = '0' and LOCK = false then
				DEST_TMP := DEST_TMP + 1;
				LOCK := true;
			elsif EXEC_STATE = FETCH_DEST_EXT and BUS_CYC_RDY = '1' then
				LOCK := false;
			end if;			
			-- The extension word address:
			if EXEC_STATE = FETCH_EXT and SRC_TMP > 0 then
				EW_ADR <= SRC_TMP - 1;
			elsif EXEC_STATE = FETCH_DEST_EXT and DEST_TMP > 0 then
				EW_ADR <= DEST_TMP - 1;
			else
				EW_ADR <= 0;
			end if;
		end if;
		--
		if SRC_TMP = EXT_CNT then
			GOT_EXT <= true;
		else
			GOT_EXT <= false;
		end if;
		--
		if DEST_TMP = DEST_EXT_CNT then
			GOT_DEST_EXT <= true;
		else
			GOT_DEST_EXT <= false;
		end if;
		--
	end process EXWORD_COUNTER;

	MOVEM_CTRL: process(RESETn, CLK, ADR_MODE, REGSEL_20, MOVEM_ADn_I, DR, REGLISTMASK)
	-- The MOVEM command takes the REGLISTMASK flags to control, which registers
	-- have to be written or not. The behavior of the reading or writing depends
	-- on the MOVEM operation mode and is controlled in this process.
	variable BIT_PNT	: integer range 0 to 16; -- Bit pointer.
	variable REGSEL_TMP	: std_logic_vector(2 downto 0);
	begin
		if RESETn = '0' then
			BIT_PNT 	:= 0;
			REGSEL_TMP	:= "000";
			MOVEM_PI_CORR <= '0';
		elsif CLK = '1' and CLK' event then
			-- Be aware, that the bit pointer starts always at a value of zero. It points 
			-- to the register list mask, which's entries depend on the MOVEM addressing mode.
			if EXEC_STATE = FETCH_BIW_1 then
				BIT_PNT := 0; -- Clear at operation start.
				case ADR_MODE is
					when "100" => REGSEL_TMP := "111"; -- Predecrement mode.
					when others => REGSEL_TMP := "000";
				end case;
			-- In the following two conditions, the bit 
			-- pointer is modified befor the MOVEM_TST state!
			elsif NEXT_EXEC_STATE = MOVEM_TST then
				BIT_PNT := BIT_PNT + 1;
				case ADR_MODE is
					when "100" => REGSEL_TMP := REGSEL_TMP - '1'; -- Predecrement mode.
					when others => REGSEL_TMP := REGSEL_TMP + '1';
				end case;
			end if;
			--
			case BIT_PNT is
				when 16 => MOVEM_EN <= '0';
				when others => MOVEM_EN <= '1';
			end case;
			--
			if BIT_PNT <= 7 and ADR_MODE = "100" then 
				MOVEM_ADn_I <= '1'; -- Predecrement address mode.
			elsif BIT_PNT > 7 and ADR_MODE /= "100" then
				MOVEM_ADn_I <= '1'; -- Other addressing modes.
			else
				MOVEM_ADn_I <= '0'; -- Select data registers.
			end if;
			--
            if ADR_MODE = "011" and REGSEL_TMP = REGSEL_20 and BIT_PNT > 7 and REGLISTMASK(BIT_PNT) = '1' then
			-- Special case: in the postincrement mode, the addressing register is written with the postincremented 
			-- effective address: suppress the respective memory access.
				MOVEM_PI_CORR <= '1';
			else
				MOVEM_PI_CORR <= '0';
			end if;
			--
			MOVEM_ADn <= MOVEM_ADn_I;
			MOVEM_REGSEL <= REGSEL_TMP;
		end if;
		--
		-- The MOVEM_CPY must be asserted asynchronous due to the latency of the REGLISTMASK
		-- in the FETCH_BIW_2 control state:
        if ADR_MODE = "011" and REGSEL_TMP = REGSEL_20 and MOVEM_ADn_I = '1' and DR = '1' then
			MOVEM_CPY <= '0'; -- Do not overwrite the addressing register with the value from the stack.
		else 
			MOVEM_CPY <= REGLISTMASK(BIT_PNT);
		end if;
	end process MOVEM_CTRL;

    TRAP_LOCK: process
	-- This flag enables the recognition of exceptions in the first
	-- clock cycle of the main state FETCH_BIW_1. During all other
	-- clock cycles, the recognition is disabled to avoid breaks of
	-- started bus cycles.
	begin
		wait until CLK = '1' and CLK' event;
        if EXEC_STATE /= FETCH_BIW_1 then
			TRAPLOCK <= false;
        elsif EXEC_STATE = FETCH_BIW_1 and BUS_CYC_RDY = '1' then
            TRAPLOCK <= false;
        elsif EXEC_STATE = FETCH_BIW_1 then
            TRAPLOCK <= true;
		end if;
	end process TRAP_LOCK;

	EXEC_REG: process(RESETn, CLK)
	begin
		if RESETn = '0' then
			EXEC_STATE <= IDLE;
		elsif CLK = '1' and CLK' event then
			if EXEC_ABORT = '1' then
				EXEC_STATE <= IDLE; -- Abort current execution.
			else
				EXEC_STATE <= NEXT_EXEC_STATE;
			end if;
		end if;
	end process EXEC_REG;
	
	EXEC_DEC: process(EXEC_STATE, CTRL_EN, TRAPLOCK, BUS_CYC_RDY, FORCE_BIW2, FORCE_BIW3, GOT_EXT, GOT_DEST_EXT, SHFT_BUSY, OP,
					  RM, RESET_RDY, OP_MODE, OP_SIZE, COND, EXEC_RESUME, ADR_MODE, DIV_MUL_32n64, OP_BUSY, STATUS_REG,
					  MOVE_D_AM, MOVEM_EN, MOVEM_CPY, DR, MEM_SHFT, DEST_EXT_CNT, REGLISTMASK, REGSEL_20, TRAP_PRIV)
	begin
		case EXEC_STATE is
			when IDLE =>
				if CTRL_EN = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				else
					NEXT_EXEC_STATE <= IDLE;
				end if;
			--------------------------- Fetch operation and extension words -----------------------------
			-- The FETCH phase is used to simultaneously start several operations. The ADR_MODE and the
			-- OP_SIZE etc. is not required because this information is included implicitely in the
			-- FORCE_BIWx and the FETCH_x_EXT signals.
			when FETCH_BIW_1 =>
                if CTRL_EN = '0' and TRAPLOCK = false then
                    NEXT_EXEC_STATE <= IDLE; -- Break due to exceptions.
                elsif BUS_CYC_RDY = '1' and TRAP_PRIV = '1' then
					NEXT_EXEC_STATE <= IDLE; -- Exception without modifying any registers.
				elsif BUS_CYC_RDY = '1' and FORCE_BIW2 = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_2;
				elsif BUS_CYC_RDY = '1' and GOT_EXT = false then
					NEXT_EXEC_STATE <= FETCH_EXT; -- Source extension required.
				elsif BUS_CYC_RDY = '1' and GOT_DEST_EXT = false then
					NEXT_EXEC_STATE <= FETCH_DEST_EXT; -- Destination extension required.
				elsif BUS_CYC_RDY = '1' then
					case OP is
						when RESET =>
							NEXT_EXEC_STATE <= WAIT_OPERATION;
						when ILLEGAL | UNIMPLEMENTED | RESERVED =>
							NEXT_EXEC_STATE <= IDLE;
                        when TRAP | TRAPV =>
                            NEXT_EXEC_STATE <= FETCH_BIW_1;
						when ABCD | SBCD | ADDX | SUBX =>
							if RM = '0' then -- Register direct.
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							elsif OP_SIZE = LONG then -- Memory to memory, long.
								NEXT_EXEC_STATE <= RD_SRC_1_HI;
							else -- Memory to memory, word or byte (Byte for ABCD, SBCD).
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when ADD | AND_B | EOR | SUB | OR_B =>
							if ADR_MODE = "000" or ADR_MODE = "001" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							elsif (OP_MODE = "010" or OP_MODE = "110") then
								NEXT_EXEC_STATE <= RD_SRC_1_HI;
							else
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when ADDA | CMPA | SUBA =>
							if ADR_MODE = "000" or ADR_MODE = "001" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							elsif OP_MODE = "111" then -- LONG.
								NEXT_EXEC_STATE <= RD_SRC_1_HI;
							else
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
							if MEM_SHFT = '0' then -- Register shift.
								NEXT_EXEC_STATE <= WAIT_OPERATION;
							else -- Restricted to WORD.
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when Bcc | BRA | EXG | EXTW | JMP | LEA | MOVEQ | MOVE_USP | NOP | SWAP =>
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						when BCHG | BCLR | BSET | BTST =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else -- Byte wide memory access.
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when BSR | JSR | PEA =>
							NEXT_EXEC_STATE <= WR_SP_LO;
						when CHK | NEG | NEGX | NOT_B =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							elsif OP_SIZE = LONG then
								NEXT_EXEC_STATE <= RD_SRC_1_HI;
							else
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when CLR =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							elsif OP_SIZE = LONG then
								NEXT_EXEC_STATE <= WR_DEST_1_HI;
							else
								NEXT_EXEC_STATE <= WR_DEST_1;
							end if;
						when CMP =>
							if ADR_MODE = "000" or ADR_MODE = "001" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							elsif OP_MODE = "010" then
								NEXT_EXEC_STATE <= RD_SRC_1_HI;
							else
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when CMPM =>
							if OP_SIZE = LONG then
								NEXT_EXEC_STATE <= RD_SRC_1_HI;
							else
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when DIVS | DIVU | MULS | MULU =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= WAIT_OPERATION;
							else
								-- In this state only OP_SIZE
								-- = WORD is valid.
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when MOVE =>
							if (ADR_MODE = "000" or ADR_MODE = "001") and MOVE_D_AM = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							elsif ADR_MODE = "001" or ADR_MODE = "000" then
								if OP_SIZE = LONG then
									NEXT_EXEC_STATE <= WR_DEST_1_HI;
								else
									NEXT_EXEC_STATE <= WR_DEST_1;
								end if;
							else
								if OP_SIZE = LONG then
									NEXT_EXEC_STATE <= RD_SRC_1_HI;
								else
									NEXT_EXEC_STATE <= RD_SRC_1;
								end if;
							end if;
						when MOVEA =>
							if ADR_MODE = "000" or ADR_MODE = "001" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								case OP_SIZE is
									when LONG => NEXT_EXEC_STATE <= RD_SRC_1_HI;
									when others => NEXT_EXEC_STATE <= RD_SRC_1;
								end case;
							end if;
						when MOVE_FROM_CCR | MOVE_FROM_SR | Scc =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								NEXT_EXEC_STATE <= WR_DEST_1;
							end if;
						when NBCD | MOVE_TO_CCR | MOVE_TO_SR | TAS =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when RTE | RTR =>
							NEXT_EXEC_STATE <= RD_SP;
						when RTS =>
							NEXT_EXEC_STATE <= RD_SP_HI;
						when ADDQ | SUBQ | TST =>
							if ADR_MODE = "000" or ADR_MODE = "001" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								if OP_SIZE = LONG then
									NEXT_EXEC_STATE <= RD_SRC_1_HI;
								else
									NEXT_EXEC_STATE <= RD_SRC_1;
								end if;
							end if;
						when UNLK =>
							NEXT_EXEC_STATE <= RD_SP_HI;
						when others =>
							NEXT_EXEC_STATE <= FETCH_BIW_1;
					end case;
				else
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				end if;
			when FETCH_BIW_2 =>
				if BUS_CYC_RDY = '1' and FORCE_BIW3 = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_3;
				elsif BUS_CYC_RDY = '1' and GOT_EXT = false then
					NEXT_EXEC_STATE <= FETCH_EXT;
				elsif BUS_CYC_RDY = '1' then
					case OP is
						when ADDI | ANDI | CMPI | EORI | ORI | SUBI =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								case OP_SIZE is
									when LONG => NEXT_EXEC_STATE <= RD_SRC_1_HI;
									when others => NEXT_EXEC_STATE <= RD_SRC_1;
								end case;
							end if;
						when Bcc | BRA =>
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						when ANDI_TO_SR | ANDI_TO_CCR | EORI_TO_SR | EORI_TO_CCR | ORI_TO_CCR | ORI_TO_SR =>
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						when BCHG | BCLR | BSET | BTST =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else -- Byte wide access.
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when BSR | LINK =>
							NEXT_EXEC_STATE <= WR_SP_LO;
						when DBcc => 
							if COND = true then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								NEXT_EXEC_STATE <= WAIT_OPERATION;
							end if;
						when DIVS | DIVU | MULS | MULU =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= WAIT_OPERATION;
							else
								-- In this state only OP_SIZE
								-- = LONG is valid.
								NEXT_EXEC_STATE <= RD_SRC_1_HI;
							end if;
						when MOVEM =>
							if REGLISTMASK = x"0000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1; -- Do nothing.
							elsif MOVEM_CPY = '1' and OP_SIZE = LONG and DR = '1' then
								NEXT_EXEC_STATE <= RD_SRC_1_HI; -- Memory to register LONG.
							elsif MOVEM_CPY = '1' and OP_SIZE = LONG then
								NEXT_EXEC_STATE <= WR_DEST_1_HI; -- Register to memory LONG.
							elsif MOVEM_CPY = '1' and DR = '1' then
								NEXT_EXEC_STATE <= RD_SRC_1; -- Memory to register WORD.
							elsif MOVEM_CPY = '1' then
								NEXT_EXEC_STATE <= WR_DEST_1; -- Register to memory WORD.
							else -- CPY = '0', modify the bit pointer in the MOVEM control logic.
								NEXT_EXEC_STATE <= MOVEM_TST; -- No transfer.
							end if;
						when MOVEP =>
							if OP_MODE = "101" then
								NEXT_EXEC_STATE <= RD_SRC_1_HI; -- Memory to register, long.
							elsif OP_MODE = "100" then
								NEXT_EXEC_STATE <= RD_SRC_2_HI; -- Memory to register, word.
							elsif OP_MODE = "111" then
								NEXT_EXEC_STATE <= WR_DEST_1_HI; -- Register to memory, long.
							else -- OP_MODE = "110"
								NEXT_EXEC_STATE <= WR_DEST_2_HI; -- Register to memory, word.
							end if;
						when STOP =>
							if STATUS_REG(15) = '1' then -- Trace condition.
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								NEXT_EXEC_STATE <= WAIT_OPERATION;
							end if;
						when others =>
							NEXT_EXEC_STATE <= FETCH_BIW_1; -- Should never appear.
					end case;
				else
					NEXT_EXEC_STATE <= FETCH_BIW_2;
				end if;
			when FETCH_BIW_3 =>
				if BUS_CYC_RDY = '1' and GOT_EXT = false then
					NEXT_EXEC_STATE <= FETCH_EXT;
				elsif BUS_CYC_RDY = '1' then
					case OP is
						when ADDI | ANDI | CMPI | EORI | ORI | SUBI =>
							if ADR_MODE = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								case OP_SIZE is
									when LONG => NEXT_EXEC_STATE <= RD_SRC_1_HI;
									when others => NEXT_EXEC_STATE <= RD_SRC_1;
								end case;
							end if;
						when Bcc | BRA =>
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						when BSR | LINK =>
							NEXT_EXEC_STATE <= WR_SP_LO;
						when others =>
							NEXT_EXEC_STATE <= FETCH_BIW_1; -- Should never appear.
					end case;
				else
					NEXT_EXEC_STATE <= FETCH_BIW_3;
				end if;
			when FETCH_EXT =>
				if BUS_CYC_RDY = '1' and GOT_EXT = true and GOT_DEST_EXT = false then
					NEXT_EXEC_STATE <= FETCH_DEST_EXT; -- This is for the MOVE operation.
				elsif BUS_CYC_RDY = '1' and GOT_EXT = true then
					case OP is
						when ADD | AND_B | SUB | OR_B =>
							if ADR_MODE = "111" and REGSEL_20 = "100" then
								NEXT_EXEC_STATE <= FETCH_BIW_1; -- Immediate data.
							else
								if (OP_MODE = "010" or OP_MODE = "110") then
									NEXT_EXEC_STATE <= RD_SRC_1_HI;
								else
									NEXT_EXEC_STATE <= RD_SRC_1;
								end if;
							end if;
						when EOR =>
							if (OP_MODE = "010" or OP_MODE = "110") then
								NEXT_EXEC_STATE <= RD_SRC_1_HI;
							else
								NEXT_EXEC_STATE <= RD_SRC_1;
							end if;
						when ADDA | CMPA | SUBA =>
							if ADR_MODE = "111" and REGSEL_20 = "100" then
								NEXT_EXEC_STATE <= FETCH_BIW_1; -- Immediate data.
							else
								if OP_MODE = "111" then -- LONG.
									NEXT_EXEC_STATE <= RD_SRC_1_HI;
								else
									NEXT_EXEC_STATE <= RD_SRC_1;
								end if;
							end if;
						when ADDI | ADDQ | ANDI | CMPI | EORI | NEG | NEGX | NOT_B | ORI | SUBI | SUBQ =>
							case OP_SIZE is
								when LONG => NEXT_EXEC_STATE <= RD_SRC_1_HI;
								when others => NEXT_EXEC_STATE <= RD_SRC_1;
							end case;
						when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
							NEXT_EXEC_STATE <= RD_SRC_1;
						when BTST | MOVE_TO_CCR | MOVE_TO_SR =>
							if ADR_MODE = "111" and REGSEL_20 = "100" then
								NEXT_EXEC_STATE <= FETCH_BIW_1; -- Immediate data.
							else
								NEXT_EXEC_STATE <= RD_SRC_1; -- A memory access is always BYTE wide.
							end if;
						when BCHG | BCLR | BSET =>
							NEXT_EXEC_STATE <= RD_SRC_1; -- A memory access is always BYTE wide.
						when CHK | MOVEA | TST =>
							if ADR_MODE = "111" and REGSEL_20 = "100" then
								NEXT_EXEC_STATE <= FETCH_BIW_1; -- Immediate data.
							else
								case OP_SIZE is
									when LONG => NEXT_EXEC_STATE <= RD_SRC_1_HI;
									when others => NEXT_EXEC_STATE <= RD_SRC_1;
								end case;
							end if;
						when DIVS | DIVU | MULS | MULU =>
							if ADR_MODE = "111" and REGSEL_20 = "100" then
								NEXT_EXEC_STATE <= WAIT_OPERATION; -- Immediate data.
							else
								case OP_SIZE is
									-- For DIVS, DIVU, MULS, MULU the OP_SIZE is
									-- always LONG in this state.
									when LONG => NEXT_EXEC_STATE <= RD_SRC_1_HI;
									when others => NEXT_EXEC_STATE <= RD_SRC_1;
								end case;
							end if;
						when CLR =>
							if OP_SIZE = LONG then
								NEXT_EXEC_STATE <= WR_DEST_1_HI;
							else
								NEXT_EXEC_STATE <= WR_DEST_1;
							end if;
						when CMP =>
							if ADR_MODE = "111" and REGSEL_20 = "100" then
								NEXT_EXEC_STATE <= FETCH_BIW_1; -- Immediate data.
							else
								if OP_MODE = "010" then
									NEXT_EXEC_STATE <= RD_SRC_1_HI;
								else
									NEXT_EXEC_STATE <= RD_SRC_1;
								end if;
							end if;
						when MOVE =>
							if ADR_MODE = "111" and REGSEL_20 = "100" and MOVE_D_AM = "000" then
									NEXT_EXEC_STATE <= FETCH_BIW_1; -- Immediate data to data registers.
							elsif ADR_MODE = "111" and REGSEL_20 = "100" then
								case OP_SIZE is
									when LONG => NEXT_EXEC_STATE <= WR_DEST_1_HI; -- Immediate long to memory.
									when others => NEXT_EXEC_STATE <= WR_DEST_1; -- Immediate word to memory.
								end case;
							else
								case OP_SIZE is
									when LONG => NEXT_EXEC_STATE <= RD_SRC_1_HI;
									when others => NEXT_EXEC_STATE <= RD_SRC_1;
								end case;
							end if;
						when MOVEM =>
							if REGLISTMASK = x"0000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1; -- Do nothing.
							elsif MOVEM_CPY = '1' and OP_SIZE = LONG and DR = '1' then
								NEXT_EXEC_STATE <= RD_SRC_1_HI; -- Memory to register LONG.
							elsif MOVEM_CPY = '1' and OP_SIZE = LONG then
								NEXT_EXEC_STATE <= WR_DEST_1_HI; -- Register to memory LONG.
							elsif MOVEM_CPY = '1' and DR = '1' then
								NEXT_EXEC_STATE <= RD_SRC_1; -- Memory to register WORD.
							elsif MOVEM_CPY = '1' then
								NEXT_EXEC_STATE <= WR_DEST_1; -- Register to memory WORD.
							else -- CPY = '0', modify the bit pointer in the MOVEM control logic.
								NEXT_EXEC_STATE <= MOVEM_TST; -- No transfer.
							end if;
						when MOVE_FROM_CCR | MOVE_FROM_SR | Scc =>
							NEXT_EXEC_STATE <= WR_DEST_1;
						when NBCD | TAS =>
							NEXT_EXEC_STATE <= RD_SRC_1; -- WORD or BYTE for NBCD, BYTE for TAS.
						when JMP | LEA =>
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						when JSR | PEA =>
							NEXT_EXEC_STATE <= WR_SP_LO;
						when others =>
							NEXT_EXEC_STATE <= FETCH_BIW_1; -- Should never appear.
					end case;
				else
					NEXT_EXEC_STATE <= FETCH_EXT;
				end if;
			when FETCH_DEST_EXT => -- This state is exclusively used by the MOVE operation.
				if BUS_CYC_RDY = '1' and GOT_DEST_EXT = true then
					if ADR_MODE = "000" or ADR_MODE = "001" or (ADR_MODE = "111" and REGSEL_20 = "100") then -- No external source required.
						if OP_SIZE = LONG then
							NEXT_EXEC_STATE <= WR_DEST_1_HI;
						else
							NEXT_EXEC_STATE <= WR_DEST_1;
						end if;
					else
						if OP_SIZE = LONG then
							NEXT_EXEC_STATE <= RD_SRC_1_HI;
						else
							NEXT_EXEC_STATE <= RD_SRC_1;
						end if;
					end if;
				else
					NEXT_EXEC_STATE <= FETCH_DEST_EXT;
				end if;
			------------------------- End fetch operation and extension words ---------------------------
			when RD_SRC_1 =>
				if BUS_CYC_RDY = '1' then
					case OP is
						when ABCD | SBCD | ADDX | SUBX | CMPM =>
							NEXT_EXEC_STATE <= RD_SRC_2;
						when ADD | AND_B | SUB | OR_B =>
							if (OP_MODE = "100" or OP_MODE = "101") then
								NEXT_EXEC_STATE <= WR_DEST_1;
							else
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							end if;
						when MOVE =>
							if MOVE_D_AM = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								NEXT_EXEC_STATE <= WR_DEST_1;
							end if;
						when ADDI | ADDQ | ANDI | EOR | EORI | NEG | NEGX | NOT_B | ORI | SUBI | SUBQ =>
							NEXT_EXEC_STATE <= WR_DEST_1;
						when ADDA | SUBA | BTST | CHK | CMP | CMPA | CMPI | MOVEA | MOVE_TO_CCR | MOVE_TO_SR | TAS | TST =>
							-- The TAS performs a read modify write cycle in this state.
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
							NEXT_EXEC_STATE <= WAIT_OPERATION;
						when BCHG | BCLR | BSET | NBCD =>
							NEXT_EXEC_STATE <= WR_DEST_1;
						when DIVS | DIVU | MULS | MULU =>
							NEXT_EXEC_STATE <= WAIT_OPERATION;
						when MOVEM =>
                            NEXT_EXEC_STATE <= MOVEM_TST;
						when others =>
							NEXT_EXEC_STATE <= FETCH_BIW_1; -- Should never appear.
					end case;
				else
					NEXT_EXEC_STATE <= RD_SRC_1;
				end if;
			when RD_SRC_1_HI =>
				if BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= RD_SRC_1_LO;
				else
					NEXT_EXEC_STATE <= RD_SRC_1_HI;
				end if;
			when RD_SRC_1_LO =>
				if BUS_CYC_RDY = '1' then
					case OP is
						when ADDI | ADDQ | ANDI | EOR | EORI | NEG | NEGX | NOT_B | SUBI | SUBQ | ORI =>
							NEXT_EXEC_STATE <= WR_DEST_1_HI;
						when ADD | AND_B | SUB | OR_B =>
							if OP_MODE = "110" then
								NEXT_EXEC_STATE <= WR_DEST_1_HI;
							else
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							end if;
						when MOVE =>
							if MOVE_D_AM = "000" then
								NEXT_EXEC_STATE <= FETCH_BIW_1;
							else
								NEXT_EXEC_STATE <= WR_DEST_1_HI;
							end if;
						when ADDA | CHK | CMP | CMPA | CMPI | MOVEA | SUBA | TST =>
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						when ADDX | SUBX | CMPM | MOVEP =>
							NEXT_EXEC_STATE <= RD_SRC_2_HI;
						when DIVS | DIVU | MULS | MULU =>
							NEXT_EXEC_STATE <= WAIT_OPERATION;
						when MOVEM =>
							NEXT_EXEC_STATE <= MOVEM_TST;
					when others =>
						NEXT_EXEC_STATE <= FETCH_BIW_1; -- Should never appear.
					end case;
				else
					NEXT_EXEC_STATE <= RD_SRC_1_LO;
				end if;
			when RD_SRC_2 =>
				if OP = CMPM and BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				elsif BUS_CYC_RDY = '1' then -- Used by ABCD, ADDX, SBCD, SUBX.
					NEXT_EXEC_STATE <= WR_DEST_1;
				else
					NEXT_EXEC_STATE <= RD_SRC_2;
				end if;
			when RD_SRC_2_HI =>
				if BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= RD_SRC_2_LO;
				else
					NEXT_EXEC_STATE <= RD_SRC_2_HI;
				end if;
			when RD_SRC_2_LO =>
				if (OP = ADDX or OP = SUBX) and BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= WR_DEST_1_HI;
				elsif (OP = CMPM or OP = MOVEP) and BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				else
					NEXT_EXEC_STATE <= RD_SRC_2_LO;
				end if;
			when WR_DEST_1 =>
				if OP = MOVEM and BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= MOVEM_TST;
				-- The default state is used by the following commands:
				-- ABCD, ADD, ADDI, ADDQ, ADDX, AND_B, ANDI, ASL, ASR, 
				-- BCHG, BCLR, BSET, EOR, EORI, LSL, LSR, MOVE_FROM_CCR,
				-- MOVE_FROM_SR, MOVE, NBCD, NEG, NEGX, NOT_B,OR_B, 
				-- ORI, ROTL, ROTR, ROXL, ROXR, SBCD, SScc, SUB, SUBI,
				-- SUBQ, SUBX.
				elsif BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				else
					NEXT_EXEC_STATE <= WR_DEST_1;
				end if;
			when WR_DEST_1_HI =>
				-- This state is used by the following commands:
				-- ADD, ADDI, ADDQ, ADDX, AND_B, ANDI, CLR, EOR,
				-- EORI, MOVE MOVEP, NEG, NEGX, NOT_B, OR_B,
				-- OR_B, ORI, SUB, SUBI, SUBQ, SUBX.
				if BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= WR_DEST_1_LO;
				else
					NEXT_EXEC_STATE <= WR_DEST_1_HI;
				end if;
			when WR_DEST_1_LO =>
				-- The last condition (Others) is used by the following operations:
				-- ADD, AND_B, CLR, EOR, SUB, OR_B, ADDI, ADDQ, ADDX, SUBI, SUBQ, SUBX, 
				-- ANDI, EORI, ORI, CLR, MOVE, NEG, NEGX, NOT_B.
				if OP = MOVEP and BUS_CYC_RDY = '1' then -- Long transfer.
					NEXT_EXEC_STATE <= WR_DEST_2_HI;
				elsif OP = MOVEM and BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= MOVEM_TST;
				elsif BUS_CYC_RDY = '1' then -- Others.
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				else
					NEXT_EXEC_STATE <= WR_DEST_1_LO;
				end if;
			when WR_DEST_2_HI =>
				-- Used by MOVEP.
				if BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= WR_DEST_2_LO;
				else
					NEXT_EXEC_STATE <= WR_DEST_2_HI;
				end if;
			when WR_DEST_2_LO =>
				-- Used by MOVEP.
				if BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				else
					NEXT_EXEC_STATE <= WR_DEST_2_LO;
				end if;
			---------------------------------- Special states  -------------------------------------
			when RD_SP =>
				-- In this state, the 16 bit SR or the 8 bit CCR are affected.
				if BUS_CYC_RDY = '1' then -- Used by RTE, RTR.
					NEXT_EXEC_STATE <= RD_SP_HI;
				else
					NEXT_EXEC_STATE <= RD_SP;
				end if;
			when RD_SP_HI =>
				if BUS_CYC_RDY = '1' then -- Used by RTE, RTR, RTS, UNLK.
					NEXT_EXEC_STATE <= RD_SP_LO;
				else
					NEXT_EXEC_STATE <= RD_SP_HI;
				end if;
			when RD_SP_LO => -- Used by RTE, RTR, RTS, UNLK.
				if BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				else
					NEXT_EXEC_STATE <= RD_SP_LO;
				end if;
			when WR_SP_LO => -- Used by BSR, JSR, LINK, PEA.
				if BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= WR_SP_HI;
				else
					NEXT_EXEC_STATE <= WR_SP_LO;
				end if;
			when WR_SP_HI => -- Used by BSR, JSR, LINK, PEA.
				if OP = JSR and BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= RD_SRC_1_HI;
				elsif BUS_CYC_RDY = '1' then
					NEXT_EXEC_STATE <= FETCH_BIW_1;
				else
					NEXT_EXEC_STATE <= WR_SP_HI;
				end if;
			when WAIT_OPERATION =>
				case OP is
					when RESET =>
						if RESET_RDY = '1' then
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						else
							NEXT_EXEC_STATE <= WAIT_OPERATION;
						end if;
					when STOP => 
						-- This state is valid until an interrupt, a trace exception or a
						-- reset occurs.
						if EXEC_RESUME = '1' then
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						else
							NEXT_EXEC_STATE <= WAIT_OPERATION;
						end if;
					when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
						if SHFT_BUSY = '1' then
							NEXT_EXEC_STATE <= WAIT_OPERATION;
						elsif MEM_SHFT = '0' then
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						else
							NEXT_EXEC_STATE <= WR_DEST_1;
						end if;
					when DIVS | DIVU | MULS | MULU =>
						if OP_BUSY = '1' then
							NEXT_EXEC_STATE <= WAIT_OPERATION;
						else
							NEXT_EXEC_STATE <= FETCH_BIW_1;
						end if;
					when DBcc =>
						NEXT_EXEC_STATE <= FETCH_BIW_1;
					when others =>
						NEXT_EXEC_STATE <= FETCH_BIW_1; -- Should never appear.
				end case;
			when MOVEM_TST =>
				if MOVEM_EN = '0' then -- BSY = '0'.
					NEXT_EXEC_STATE <= FETCH_BIW_1; -- Operation finished.
				elsif MOVEM_CPY = '1' and OP_SIZE = LONG and DR = '1' then
					NEXT_EXEC_STATE <= RD_SRC_1_HI; -- Memory to register LONG.
				elsif MOVEM_CPY = '1' and OP_SIZE = LONG then
					NEXT_EXEC_STATE <= WR_DEST_1_HI; -- Register to memory LONG.
				elsif MOVEM_CPY = '1' and DR = '1' then
					NEXT_EXEC_STATE <= RD_SRC_1; -- Memory to register WORD.
				elsif MOVEM_CPY = '1' then
					NEXT_EXEC_STATE <= WR_DEST_1; -- Register to memory WORD.
				else -- CPY = '0', modify the bit pointer in the MOVEM control logic.
					NEXT_EXEC_STATE <= MOVEM_TST; -- No transfer.
				end if;
		end case;
	end process EXEC_DEC;
end BEHAVIOR;