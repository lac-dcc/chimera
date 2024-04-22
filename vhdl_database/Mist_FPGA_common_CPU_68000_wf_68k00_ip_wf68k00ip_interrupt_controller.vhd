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
---- This file contains the interrupt control unit.               ----
----                                                              ----
----                                                              ----
---- Description:                                                 ----
---- The interrupt control module is responsible for the inter-   ----
---- rupt management of the external and internal interrupts and  ----
---- for EXCEPTIONs processing. It manages auto-vectored inter-   ----
---- rupt cycles, priority resolving and correct vector numbers   ----
---- creation.                                                    ----
---- There are different kinds of interrupt sources which require ----
---- some special treatment: the RESET_CPU is released by exter-  ----
---- nal logic. The exception state machine therefore has to      ----
---- wait, once released, until this interrupt is released again. ----
---- Interrupts, allowing the operation processing to finish the  ----
---- current operation, have to wait for the CTRL_RDY signal.     ----
---- The bus error exception starts the exception handler state   ----
---- machine. In this case, there is no need to wait for the  bus ----
---- error to withdrawn. It is assumed, that the bus error is     ----
---- released by the bus interface logic during the exception     ----
---- processing takes place. Double bus errors / address errors   ----
---- cause the processor to enter the 'HALT' state.               ----
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity WF68K00IP_INTERRUPT_CONTROL is
	port (
		CLK					: in bit;
		RESETn				: in bit; -- Core reset.

		RESET_CPUn			: in bit; -- Internal reset used for CPU initialization.
		BERR				: in bit; -- Bus error detection.
		HALTn				: in std_logic;

		-- Data and address bus:
		ADR_IN				: in std_logic_vector(31 downto 0);
		USE_SSP_ADR			: out bit;
		ADR_EN_VECTOR		: out bit;
		DATA_IN				: in std_logic_vector(7 downto 0);
		DATA_OUT			: out std_logic_vector(15 downto 0);
		DATA_EN				: out bit;

		-- Bus interface controls:
		RWn					: in bit_vector(0 downto 0);
		RD_BUS				: out bit;
		WR_BUS				: out bit;
		HALT_EN				: out bit;
		FC_IN				: in std_logic_vector(2 downto 0);
		FC_OUT				: out std_logic_vector(2 downto 0);
		FC_EN				: out bit;
		SEL_BUFF_A_LO		: out bit; -- Select data A buffer low word.
		SEL_BUFF_A_HI		: out bit; -- Select data A buffer high word.

		-- Address register controls 
		-- (Address reisters, status register and program counter):
		STATUS_REG_IN		: in std_logic_vector(15 downto 0);
		PC					: in std_logic_vector(31 downto 0);
		INIT_STATUS			: out bit;
		PRESET_IRQ_MASK		: out bit;
		SSP_DEC				: out bit;
		SSP_INIT			: out bit;
		PC_INIT				: out bit;

		-- Operation decoder stuff:
		BIW_0				: in std_logic_vector(15 downto 0); -- First instruction word.

		-- Control state machine signals:
		BUS_CYC_RDY			: in bit;
		CTRL_RDY			: in bit; -- Main controller finished an execution.
		CTRL_EN				: out bit; -- Enable main controller.
		EXEC_ABORT			: out bit; -- Abort the current execution.
		EXEC_RESUME			: out bit; -- Resume operation processing (STOP).

		-- Interrupt controls:
		IRQ				: in std_logic_vector(2 downto 0);
		AVECn			: in bit; -- Originally 68Ks use VPAn.
        IRQ_SAVE        : out bit;
		INT_VECT		: out std_logic_vector(9 downto 0); -- Interrupt vector number.
		USE_INT_VECT	: out bit;

		-- Trap signals:
		TRAP_AERR		: in bit; -- Address error indication.
		TRAP_OP			: in bit; -- TRAP instruction.
		TRAP_VECTOR		: in std_logic_vector(3 downto 0); -- Vector of the TRAP instruction.
		TRAP_V			: in bit; -- TRAPV instruction.
		TRAP_CHK		: in bit;
		TRAP_DIVZERO	: in bit;
		TRAP_ILLEGAL	: in bit;
		TRAP_1010		: in bit; -- Unimplemented instructions.
		TRAP_1111		: in bit; -- Unimplemented instructions.
		TRAP_TRACE		: in bit;
		TRAP_PRIV		: in bit
		);
end entity WF68K00IP_INTERRUPT_CONTROL;
	
architecture BEHAVIOR of WF68K00IP_INTERRUPT_CONTROL is
type EX_STATES is (IDLE, WAIT_CTRL_RDY, INIT, VECT_NR, GET_VECTOR, STACK_MISC, STACK_ACCESS_ADR_HI,
				   STACK_ACCESS_ADR_LO, STACK_INSTRUCTION, STACK_STATUS, STACK_PC_HI, STACK_PC_LO, 
				   UPDATE_SSP_HI, UPDATE_SSP_LO, UPDATE_PC_HI, UPDATE_PC_LO, HALT);
type EXCEPTIONS is (EX_RESET, EX_BUS_ERR, EX_ADR_ERR, EX_ILLEGAL, EX_DIVZERO, EX_CHK, EX_TRAPV, 
					EX_PRIV, EX_TRACE, EX_1010, EX_1111, EX_TRAP, EX_INT, EX_NONE);
signal EX_STATE			: EX_STATES;
signal NEXT_EX_STATE	: EX_STATES;
signal EXCEPTION_Q		: EXCEPTIONS; -- Currently executed exception.
signal TMP_CPY			: bit;
signal STATUS_REG_TMP	: std_logic_vector(15 downto 0);
signal RWn_TMP			: std_logic_vector(0 downto 0);
signal FC_TMP			: std_logic_vector(2 downto 0);
signal INSTRn			: std_logic;
signal ADR_TMP			: std_logic_vector(31 downto 0);
signal INC_TMP_VECTOR	: bit;
signal EX_P_RESET		: bit; -- ..._P are the pending exceptions.
signal EX_P_ADR_ERR		: bit;
signal EX_P_BUS_ERR		: bit;
signal EX_P_TRACE		: bit;
signal EX_P_INT			: bit;
signal EX_P_ILLEGAL		: bit;
signal EX_P_1010		: bit;
signal EX_P_1111		: bit;
signal EX_P_PRIV		: bit;
signal EX_P_TRAP		: bit;
signal EX_P_TRAPV		: bit;
signal EX_P_CHK			: bit;
signal EX_P_DIVZERO		: bit;
signal FORCE_HALT		: boolean;
begin
	-- The processor gets halted, if a bus error occurs in the stacking or updating states during
	-- the exception processing of a bus error, an address error or a reset.
	HALT_EN <= '1' when EX_STATE = HALT else '0';
    FORCE_HALT <= true when EX_STATE /= IDLE and (BERR = '1' or TRAP_AERR = '1') and 
							(EXCEPTION_Q = EX_RESET or EXCEPTION_Q = EX_ADR_ERR or EXCEPTION_Q = EX_BUS_ERR) else false;

	-- This is the flag which enables the main execution processing state machine. It is enabled, if there
	-- is no pending interrupt and if the interrupt exception handler state machine is inactive.
    CTRL_EN <= '1' when EX_STATE = IDLE and
                        EX_P_RESET = '0' and EX_P_ADR_ERR = '0' and EX_P_BUS_ERR = '0' and
                        EX_P_TRACE = '0' and EX_P_INT = '0' and EX_P_ILLEGAL = '0' and EX_P_1010 = '0' and 
                        EX_P_1111 = '0' and EX_P_PRIV = '0' and EX_P_TRAP = '0' and EX_P_TRAPV = '0' and
                        EX_P_CHK = '0' and EX_P_DIVZERO = '0' else '0';          

	-- Flag, if the processor is executing an instruction or a type 0 or 1 exception.
	-- 0: instruction, 1: exception.
	with EXCEPTION_Q select
		INSTRn <=	'1' when EX_RESET | EX_ADR_ERR | EX_BUS_ERR,
					'0' when others;

	-- IACK cycle resides in the CPU space, the RESET resides in the supervisor 
	-- program space and all others reside in the supervisor data space.
	FC_OUT <=	"111" when EX_STATE = GET_VECTOR else -- IACK space cycle.
				"110" when EX_STATE = UPDATE_SSP_HI or EX_STATE = UPDATE_SSP_LO else
				"110" when EX_STATE = UPDATE_PC_HI or EX_STATE = UPDATE_PC_LO else
				"101";

	FC_EN <= '0' when EX_STATE = IDLE else
			 '0' when EX_STATE = WAIT_CTRL_RDY else
			 '0' when EX_STATE = INIT else
			 '0' when EX_STATE = VECT_NR else '1';

	USE_SSP_ADR <= 	'1' when EX_STATE = STACK_MISC else
					'1' when EX_STATE = STACK_ACCESS_ADR_HI else
					'1' when EX_STATE = STACK_ACCESS_ADR_LO else
					'1' when EX_STATE = STACK_INSTRUCTION else
					'1' when EX_STATE = STACK_STATUS else
					'1' when EX_STATE = STACK_PC_HI else
					'1' when EX_STATE = STACK_PC_LO else '0';

	SEL_BUFF_A_LO <= '1' when EX_STATE = UPDATE_SSP_LO else
					 '1' when EX_STATE = UPDATE_PC_LO else '0';
	SEL_BUFF_A_HI <= '1' when EX_STATE = UPDATE_SSP_HI else
					 '1' when EX_STATE = UPDATE_PC_HI else '0';

	ADR_EN_VECTOR <= '1' when EX_STATE = GET_VECTOR else '0'; -- IACK space cycle.

	with EX_STATE select
		RD_BUS <= 	'1' when GET_VECTOR | UPDATE_SSP_HI | UPDATE_SSP_LO | UPDATE_PC_HI | UPDATE_PC_LO, '0' when others;

	with EX_STATE select
		WR_BUS <= 	'1' when STACK_MISC | STACK_ACCESS_ADR_HI | STACK_ACCESS_ADR_LO | STACK_INSTRUCTION,
					'1' when STACK_STATUS | STACK_PC_HI | STACK_PC_LO, '0' when others;

	DATA_OUT <= "00000000000" & RWn_TMP & INSTRn & FC_TMP when EX_STATE = STACK_MISC else
				ADR_TMP(31 downto 16) when EX_STATE = STACK_ACCESS_ADR_HI else
				ADR_TMP(15 downto 0) when EX_STATE = STACK_ACCESS_ADR_LO else
				BIW_0 when EX_STATE = STACK_INSTRUCTION else
				STATUS_REG_TMP when EX_STATE = STACK_STATUS else
				PC(31 downto 16) when EX_STATE = STACK_PC_HI else
				PC(15 downto 0) when EX_STATE = STACK_PC_LO else (others => '-'); -- Dummy, don't care.
				
	DATA_EN <= 	'1' when EX_STATE = STACK_MISC else
				'1' when EX_STATE = STACK_ACCESS_ADR_HI else
				'1' when EX_STATE = STACK_ACCESS_ADR_LO else
				'1' when EX_STATE = STACK_INSTRUCTION else
				'1' when EX_STATE = STACK_STATUS else
				'1' when EX_STATE = STACK_PC_HI else
				'1' when EX_STATE = STACK_PC_LO else '0';

    -- Resume the STOP operation, when an external interrupt is going 
    -- to be processed.
    EXEC_RESUME <= '1' when EX_P_INT = '1' else '0';

	PENDING: process(RESETn, CLK)
	-- The exceptions which occurs are stored in this pending register until the
	-- interrupt handler handled the respective exception.
	-- The TRAP_PRIV, TRAP_1010, TRAP_1111, TRAP_ILLEGAL, TRAP_OP and TRAP_V may be a strobe
	-- of 1 clock period. All others must be strobes of 1 clock period.
	begin
		if RESETn = '0' then
			EX_P_RESET   <= '0';
			EX_P_ADR_ERR <= '0';
			EX_P_BUS_ERR <= '0';
			EX_P_TRACE   <= '0';
			EX_P_INT     <= '0';
			EX_P_ILLEGAL <= '0';
			EX_P_1010    <= '0';
			EX_P_1111    <= '0';
			EX_P_PRIV    <= '0';
			EX_P_TRAP    <= '0';
			EX_P_TRAPV   <= '0';
			EX_P_CHK     <= '0';
			EX_P_DIVZERO <= '0';
		elsif CLK = '1' and CLK' event then
			if RESET_CPUn = '0' then
				EX_P_RESET <= '1';
            elsif EX_STATE = UPDATE_PC_HI and BUS_CYC_RDY = '1' and EXCEPTION_Q = EX_RESET then
				EX_P_RESET <= '0';
			end if;
			--
			if TRAP_AERR = '1' then
				EX_P_ADR_ERR <= '1';
            elsif EX_STATE = UPDATE_PC_HI and BUS_CYC_RDY = '1' and EXCEPTION_Q = EX_ADR_ERR then
				EX_P_ADR_ERR <= '0';
			elsif RESET_CPUn = '0' then
				EX_P_ADR_ERR <= '0';
			end if;
			--
			if BERR = '1' and HALTn = '1' and EX_STATE /= GET_VECTOR then
				-- Do not store the bus error during the interrupt acknowledge
				-- cycle (GET_VECTOR).
				EX_P_BUS_ERR <= '1';
            elsif EX_STATE = UPDATE_PC_HI and BUS_CYC_RDY = '1' and EXCEPTION_Q = EX_BUS_ERR then
				EX_P_BUS_ERR <= '0';
			elsif RESET_CPUn = '0' then
				EX_P_BUS_ERR <= '0';
			end if;
			--
			if TRAP_TRACE = '1' then
				EX_P_TRACE <= '1';
            elsif EX_STATE = UPDATE_PC_HI and BUS_CYC_RDY = '1' and EXCEPTION_Q = EX_TRACE then
				EX_P_TRACE <= '0';
			elsif RESET_CPUn = '0' then
				EX_P_TRACE <= '0';
			end if;
			--
            if IRQ = "111" then -- Level 7 is nonmaskable ...
                EX_P_INT <= '1';
            elsif STATUS_REG_IN(10 downto 8) < IRQ then
                EX_P_INT <= '1';
            elsif EX_STATE = GET_VECTOR then
				EX_P_INT <= '0';
			elsif RESET_CPUn = '0' then
				EX_P_INT <= '0';
            end if;
            --
			-- The following six traps never appear at the same time:
			if TRAP_1010 = '1' then
				EX_P_1010 <= '1';
			elsif TRAP_1111 = '1' then
				EX_P_1111 <= '1';
			elsif TRAP_ILLEGAL = '1' then
				EX_P_ILLEGAL <= '1';
			elsif TRAP_PRIV = '1' then
				EX_P_PRIV <= '1';
			elsif TRAP_OP = '1' then
				EX_P_TRAP <= '1';
			elsif TRAP_V = '1' then
				EX_P_TRAPV <= '1';
            elsif (EX_STATE = UPDATE_PC_HI and BUS_CYC_RDY = '1') or RESET_CPUn = '0' then
				case EXCEPTION_Q is
					when EX_PRIV | EX_1010 | EX_1111 | EX_ILLEGAL | EX_TRAP | EX_TRAPV =>
						EX_P_PRIV <= '0';
						EX_P_1010 <= '0';
						EX_P_1111 <= '0';
						EX_P_ILLEGAL <= '0';
						EX_P_TRAP <= '0';
						EX_P_TRAPV <= '0';
					when others =>
						null;
				end case;
			end if;
			--
			if TRAP_CHK = '1' then
				EX_P_CHK <= '1';
            elsif EX_STATE = UPDATE_PC_HI and BUS_CYC_RDY = '1' and EXCEPTION_Q = EX_CHK then
				EX_P_CHK <= '0';
			elsif RESET_CPUn = '0' then
				EX_P_CHK <= '0';
			end if;
			--
			if TRAP_DIVZERO = '1' then
				EX_P_DIVZERO <= '1';
            elsif EX_STATE = UPDATE_PC_HI and BUS_CYC_RDY = '1' and EXCEPTION_Q = EX_DIVZERO then
				EX_P_DIVZERO <= '0';
			elsif RESET_CPUn = '0' then
				EX_P_DIVZERO <= '0';
			end if;
		end if;
	end process PENDING;

	STORE_CURRENT_EXCEPTION: process(RESETn, CLK)
	-- The exceptions which occurs are stored in the following flags until the
	-- interrupt handler handled the respective exception.
	-- This process also stores the current processed exception for further use. 
	-- The update takes place in the IDLE EX_STATE.
	begin
		if RESETn = '0' then
			EXCEPTION_Q <= EX_NONE;
		elsif CLK = '1' and CLK' event then
            if EX_STATE = IDLE and EX_P_RESET = '1' then
                EXCEPTION_Q <= EX_RESET;
            elsif EX_STATE = IDLE and EX_P_ADR_ERR = '1' then
                EXCEPTION_Q <= EX_ADR_ERR;
            elsif EX_STATE = IDLE and EX_P_BUS_ERR = '1' and BERR = '1' then
                EXCEPTION_Q <= EX_NONE; -- Wait until BERR is negated.
            elsif EX_STATE = IDLE and EX_P_BUS_ERR = '1' then
                EXCEPTION_Q <= EX_BUS_ERR;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_ILLEGAL = '1' then
                EXCEPTION_Q <= EX_ILLEGAL;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_1010 = '1' then
                EXCEPTION_Q <= EX_1010;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_1111 = '1' then
                EXCEPTION_Q <= EX_1111;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_PRIV = '1' then
                EXCEPTION_Q <= EX_PRIV;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_TRAP = '1' then
                EXCEPTION_Q <= EX_TRAP;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_TRAPV = '1' then
                EXCEPTION_Q <= EX_TRAPV;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_CHK = '1' then
                EXCEPTION_Q <=EX_CHK;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_DIVZERO = '1' then
                EXCEPTION_Q <= EX_DIVZERO;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_TRACE = '1' then
                EXCEPTION_Q <= EX_TRACE;
            elsif EX_STATE = WAIT_CTRL_RDY and CTRL_RDY = '1' and EX_P_INT = '1' then
                EXCEPTION_Q <= EX_INT;
            elsif NEXT_EX_STATE = IDLE then
                EXCEPTION_Q <= EX_NONE;
            end if;
		end if;
	end process STORE_CURRENT_EXCEPTION;

	P_TMP_CPY: process (CLK)
	-- For the most interrupts, a status register copy is necessary.
	-- This is the register for a temporary copy of the status register
	-- made in the first step of the exception processing. This copy is
	-- in the third step written to the stack pointer, together with the
	-- other information.
	-- In the same manner the read write, the function code and the 
	-- address information is saved.
	-- The temporary copies are necessary to give the bus controller in
	-- case of a bus error enough time to terminate the current bus cycle, 
	-- means, no other bus access like status register stacking should 
	-- appear immediately after the bus error occurs.
	variable SR_MEM: std_logic_vector(9 downto 0);
	begin
		if CLK = '1' and CLK' event then
			if TMP_CPY = '1' then
				SR_MEM := STATUS_REG_IN(15) & STATUS_REG_IN(13) & STATUS_REG_IN(10 downto 8) & STATUS_REG_IN(4 downto 0);
				RWn_TMP <= To_StdLogicVector(RWn);
				FC_TMP <= FC_IN;
				ADR_TMP <= ADR_IN;
			end if;
		end if;
		STATUS_REG_TMP <= SR_MEM(9) & '0' & SR_MEM(8) & "00" & SR_MEM(7 downto 5) & "000" & SR_MEM(4 downto 0);
	end process P_TMP_CPY;

	INT_VECTOR: process(RESETn, CLK)
	variable VECTOR_No : std_logic_vector(7 downto 0);
	variable VECT_TMP : std_logic_vector(1 downto 0);
	-- This process provides the interrupt vector number INT_VECT, which
	-- is determined during interrupt processing.
	begin
		if RESETn = '0' then
			VECTOR_No := (others => '0'); -- Dummy assignement.
		elsif CLK = '1' and CLK' event then
            if EX_STATE = VECT_NR or EX_STATE = GET_VECTOR then
				case EXCEPTION_Q is
					when EX_RESET 	=> VECTOR_No := x"00";
					when EX_BUS_ERR => VECTOR_No := x"02";
					when EX_ADR_ERR => VECTOR_No := x"03";
					when EX_ILLEGAL => VECTOR_No := x"04";
					when EX_DIVZERO => VECTOR_No := x"05";
					when EX_CHK 	=> VECTOR_No := x"06";
					when EX_TRAPV 	=> VECTOR_No := x"07";
					when EX_PRIV 	=> VECTOR_No := x"08";
					when EX_TRACE 	=> VECTOR_No := x"09";
					when EX_1010 	=> VECTOR_No := x"0A";
					when EX_1111 	=> VECTOR_No := x"0B";
					-- The uninitialized interrupt vector number x"0F"
					-- is provided by the peripheral interrupt source
					-- during the auto vector bus cycle.
					when EX_INT =>
						if BUS_CYC_RDY = '1' and BERR = '1' then
							VECTOR_No := x"18"; -- Spurious interrupt.
						elsif BUS_CYC_RDY = '1' and AVECn = '0' then
                            VECTOR_No := x"18" + STATUS_REG_IN(10 downto 8); -- Autovector.
                        elsif BUS_CYC_RDY = '1' then
							-- This is the vector number provided by the device.
							-- If the returned Vector Number is x"0F" then it is the
							-- uninitialized interrupt vector due to non initia-
							-- lized vector register of the peripheral device.
							VECTOR_No := DATA_IN; -- Non autovector.
						end if;
					when EX_TRAP => VECTOR_No := x"2" & TRAP_VECTOR;
					when others	=> VECTOR_No := (others => '-'); -- Don't care.
				end case;
				VECT_TMP := "00";
			elsif INC_TMP_VECTOR = '1' then
				 -- Offset for the next two initial bytes during system initialisation.
				VECT_TMP := VECT_TMP + '1'; -- Increment.
			end if;
		end if;
		--
		INT_VECT <= (VECTOR_No & "00") + (VECT_TMP & '0');
	end process INT_VECTOR;

	EXCEPTION_HANDLER_REG: process(RESETn, CLK)
	-- This is the register portion of the exception control state machine.
	begin
		if RESETn = '0' then
			EX_STATE <= IDLE;
  		elsif CLK = '1' and CLK' event then
			if RESET_CPUn = '0' then
				EX_STATE <= IDLE;
			elsif FORCE_HALT = true then
				EX_STATE <= HALT;
			else
				EX_STATE <= NEXT_EX_STATE;
			end if;
		end if;
	end process EXCEPTION_HANDLER_REG;

    EXCEPTION_HANDLER_DEC: process(EX_STATE, EX_P_RESET, EX_P_ADR_ERR, EX_P_BUS_ERR, EX_P_TRACE, EX_P_INT, EX_P_ILLEGAL, 
                                   EX_P_1010, EX_P_1111, EX_P_PRIV, EX_P_TRAP, EX_P_TRAPV, EX_P_CHK, EX_P_DIVZERO, EXCEPTION_Q, 
                                   BUS_CYC_RDY, CTRL_RDY, BERR)
	-- This is the decoder portion of the exception control state machine.
	begin
		-- Default assignements:
		EXEC_ABORT 		<= '0';
		TMP_CPY 		<= '0';
		IRQ_SAVE 		<= '0';
		INIT_STATUS		<= '0';
		PRESET_IRQ_MASK <= '0';
		SSP_INIT	 	<= '0';
		PC_INIT 		<= '0';
		SSP_DEC 		<= '0';
		USE_INT_VECT 	<= '0';
		INC_TMP_VECTOR	<= '0';
		case EX_STATE is
			when IDLE =>
				-- The priority of the exception execution is given by the
				-- following construct. Although type 3 commands do not require
				-- a prioritization, there is no drawback using these conditions.
				-- The spurious interrupt and uninitialized interrupt never appear
				-- as basic interrupts and therefore are not an interrupt source.
				-- During IDLE, when an interrupt occurs, the status register copy
				-- control is asserted and the current interrupt controll is given
				-- to the STORE_EXCEPTION process. During bus or address errors,
				-- the status register must be copied immediately to recognize
				-- the current status for RWn etc. (before the faulty bus cycle is
				-- finished).
				if EX_P_RESET = '1' then
					EXEC_ABORT <= '1';
					NEXT_EX_STATE <= INIT;
				elsif EX_P_ADR_ERR = '1' then
					EXEC_ABORT <= '1';
					TMP_CPY <= '1'; -- Immediate copy of the status register.
					NEXT_EX_STATE <= INIT;
				elsif EX_P_BUS_ERR = '1' and BERR = '1' then -- Wait until BERR is negated.
					NEXT_EX_STATE <= IDLE;
				elsif EX_P_BUS_ERR = '1' then -- Enter after BERR is negated.
					EXEC_ABORT <= '1';
					TMP_CPY <= '1'; -- Immediate copy of the status register.
					NEXT_EX_STATE <= INIT;
                elsif EX_P_TRAP = '1' or EX_P_TRAPV = '1' or EX_P_CHK = '1' or EX_P_DIVZERO = '1' or EX_P_TRACE = '1' then
                    NEXT_EX_STATE <= WAIT_CTRL_RDY;
                elsif EX_P_INT = '1' or EX_P_ILLEGAL = '1' or EX_P_1010 = '1' or EX_P_1111 = '1'  or EX_P_PRIV = '1' then
                    NEXT_EX_STATE <= WAIT_CTRL_RDY;
				else -- No exception.
					NEXT_EX_STATE <= IDLE;
				end if;
			when WAIT_CTRL_RDY =>
				-- In this state, the interrupt machine waits until the current 
				-- operation execution has finished. The copy of the status register
				-- is made after the excecution has finished.
				if CTRL_RDY = '1' then
					TMP_CPY <= '1'; -- Copy the status register.
					NEXT_EX_STATE <= INIT;
				else
					NEXT_EX_STATE <= WAIT_CTRL_RDY;
				end if;
			when INIT =>
				-- In this state, the supervisor mode is switched on (the S bit is set)
				-- and the trace mode is switched off (the T bit is cleared).
				INIT_STATUS <= '1';
				case EXCEPTION_Q is
					when EX_RESET =>
						PRESET_IRQ_MASK <= '1';
						NEXT_EX_STATE <= VECT_NR;
					when EX_INT => 
                        IRQ_SAVE <= '1';					
                        NEXT_EX_STATE <= GET_VECTOR;
					when others => NEXT_EX_STATE <= VECT_NR;
				end case;
			when VECT_NR =>
				-- This state is introduced to control the generation of the vector number
				-- for all exceptions except the external interrupts.
				case EXCEPTION_Q is
					when EX_RESET => 
						NEXT_EX_STATE <= UPDATE_SSP_HI; -- Do not stack anything but update the SSP and PC.
					when others => 
						SSP_DEC <= '1';
						NEXT_EX_STATE <= STACK_PC_LO;
				end case;
			when GET_VECTOR =>
				-- This state is intended to determine the vector number for the current process.
				-- See also the process EX_VECTOR for the handling of the vector determination.
				if BUS_CYC_RDY = '1' then
					SSP_DEC <= '1';
					NEXT_EX_STATE <= STACK_PC_LO;
				else
					NEXT_EX_STATE <= GET_VECTOR;
				end if;
			-- The following states provide writing to the stack pointer or reading
			-- the exception vector address from the memory. If there is a bus error
			-- or an address error during the read or write cycles, the processor
			-- proceeds in two different ways:
			-- If the errors occur during a reset, bus error or address error
			-- exception processing, there is the case of a double bus fault. In
			-- consequence, the processor halts due to catastrophic system failure.
			-- If the errors occur during other exception processings, the current
			-- processing is aborted and this exception handler state machine will
			-- immediately begin with the bus error exception handling.
			when STACK_PC_LO =>
				if BUS_CYC_RDY = '1' then
					SSP_DEC <= '1';
					NEXT_EX_STATE <= STACK_PC_HI;
				else
					NEXT_EX_STATE <= STACK_PC_LO;
				end if;
			when STACK_PC_HI =>
				if BUS_CYC_RDY = '1' then
					SSP_DEC <= '1';
					NEXT_EX_STATE <= STACK_STATUS;
				else
					NEXT_EX_STATE <= STACK_PC_HI;
				end if;
			when STACK_STATUS =>
				if BUS_CYC_RDY = '1' then
					case EXCEPTION_Q is
						when EX_BUS_ERR | EX_ADR_ERR =>
							SSP_DEC <= '1';
							NEXT_EX_STATE <= STACK_INSTRUCTION;
						when others =>
							NEXT_EX_STATE <= UPDATE_PC_HI;
					end case;
				else
					NEXT_EX_STATE <= STACK_STATUS;
				end if;
			when STACK_INSTRUCTION =>
				if BUS_CYC_RDY = '1' then
					SSP_DEC <= '1';
					NEXT_EX_STATE <= STACK_ACCESS_ADR_LO;
				else
					NEXT_EX_STATE <= STACK_INSTRUCTION;
				end if;
			when STACK_ACCESS_ADR_LO =>
				if BUS_CYC_RDY = '1' then
					SSP_DEC <= '1';
					NEXT_EX_STATE <= STACK_ACCESS_ADR_HI;
				else
					NEXT_EX_STATE <= STACK_ACCESS_ADR_LO;
				end if;
			when STACK_ACCESS_ADR_HI =>
				if BUS_CYC_RDY = '1' then
					SSP_DEC <= '1';
					NEXT_EX_STATE <= STACK_MISC;
				else
					NEXT_EX_STATE <= STACK_ACCESS_ADR_HI;
				end if;
			when STACK_MISC =>
				if BUS_CYC_RDY = '1' then
					NEXT_EX_STATE <= UPDATE_PC_HI;
				else
					NEXT_EX_STATE <= STACK_MISC;
				end if;
			when UPDATE_SSP_HI =>
				if BUS_CYC_RDY = '1' then
					INC_TMP_VECTOR <= '1';
					NEXT_EX_STATE <= UPDATE_SSP_LO;
				else
					NEXT_EX_STATE <= UPDATE_SSP_HI;
				end if;
				USE_INT_VECT <= '1';
			when UPDATE_SSP_LO =>
				if BUS_CYC_RDY = '1' then
					INC_TMP_VECTOR <= '1';
					SSP_INIT <= '1';
					NEXT_EX_STATE <= UPDATE_PC_HI;
				else
					NEXT_EX_STATE <= UPDATE_SSP_LO;
				end if;
				USE_INT_VECT <= '1';
			when UPDATE_PC_HI =>
				if BUS_CYC_RDY = '1' then
					INC_TMP_VECTOR <= '1';
					NEXT_EX_STATE <= UPDATE_PC_LO;
				else
					NEXT_EX_STATE <= UPDATE_PC_HI;
				end if;
				USE_INT_VECT <= '1';
			when UPDATE_PC_LO =>
                if BUS_CYC_RDY = '1' then
					PC_INIT <= '1';
                    NEXT_EX_STATE <= IDLE;
				else
					NEXT_EX_STATE <= UPDATE_PC_LO;
				end if;
				USE_INT_VECT <= '1';
			when HALT =>
				-- Processor halted, Double bus error!
				NEXT_EX_STATE <= HALT;
		end case;
	end process EXCEPTION_HANDLER_DEC;
end BEHAVIOR;
