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
---- This file contains the 68Ks address registers.               ----
----                                                              ----
----                                                              ----
---- Description:                                                 ----
---- This file contains the 68K series data and address           ----
---- registers, the user stack pointer (USP), the supervisor      ----
---- stack pointer (SSP) and the 32-bit program counter (PC).     ----
---- The required sign extensions for the INDEX and the DISPLACE- ----
---- ment are provided by this model.                             ----
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

entity WF68K00IP_ADDRESS_REGISTERS is
	port (
		CLK				: in bit;
		RESETn			: in bit;

		-- Address and data:
		DATA_IN			: in std_logic_vector(15 downto 0); -- Extension word input.
		ADATA_IN		: in std_logic_vector(31 downto 0); -- Address register and USP, SSP and PC input.
		REGSEL_B		: in std_logic_vector(2 downto 0); -- Register number.
		REGSEL_A		: in std_logic_vector(2 downto 0); -- Register number.
		ADR_REG_QB		: out std_logic_vector(31 downto 0); -- Register selected by REGSEL_B.
		ADR_REG_QA		: out std_logic_vector(31 downto 0); -- Register selected by REGSEL_A.
		USP_OUT			: out std_logic_vector(31 downto 0); -- User stack pointer.
		SSP_OUT			: out std_logic_vector(31 downto 0); -- Supervisor stack pointer.
		PC_OUT			: out std_logic_vector(31 downto 0); -- Program counter.
		
		-- Extension words:
		EXWORD			: in EXWORDTYPE;
		DEST_EXWORD		: in EXWORDTYPE;

		-- Registers controls:
		DR	 			: in bit; -- Direction control.
		USP_CPY			: in bit; -- Copy among address registers.
		AR_EXG			: in bit; -- Exchange address register contents.
		AR_WR			: in bit; -- Address register write.
		USP_INC			: in bit; -- User stack pointer increment by 2.
		USP_DEC			: in bit; -- User stack pointer decrement by 2.
		ADR_TMP_CLR		: in bit; -- Temporary address offset clear.
		ADR_TMP_INC		: in bit; -- Address register increment temporarily.
		AR_INC			: in bit; -- Address register increment.
		AR_DEC			: in bit; -- Address register decrement.
		SSP_INC			: in bit; -- Supervisor stack pointer increment by 2.
		SSP_DEC			: in bit; -- Supervisor stack pointer decrement by 2.
		SSP_INIT		: in bit; -- Initialize SSP.
		SP_ADD_DISPL	: in bit; -- Forces the adding of the sign extended displacement to the SP.
		USE_SP_ADR		: in bit; -- Indicates the use of the stack (suer or supervisor).
		USE_SSP_ADR		: in bit; -- Indicates the use of the supervisor stack.
		PC_WR			: in bit; -- Program counter write.
		PC_INC			: in bit; -- Program counter increment.
		PC_TMP_CLR		: in bit; -- Clear temporary PC.
		PC_TMP_INC		: in bit; -- Increment temporary PC.
		PC_INIT			: in bit; -- Initialize the program counter.
		PC_ADD_DISPL	: in bit; -- Forces the adding of the sign extended displacement to the SP.

		-- Misc controls:
		SRC_DESTn		: in bit; -- '1' for read operand from source, '0' store result to destination (MOVE).
		SBIT			: in bit; -- Superuser flag.
		OP				: in OP_68K00; -- the operations.
		OP_SIZE			: in OP_SIZETYPE; -- BYTE, WORD or LONG.
		OP_MODE			: in std_logic_vector(4 downto 0);
		OP_START		: in bit; -- Used for the MOVEM.
		ADR_MODE		: in std_logic_vector(2 downto 0); -- Address mode indicator.
		MOVE_D_AM		: in std_logic_vector(2 downto 0); -- Destination address mode for MOVE.
        FORCE_BIW2		: in bit;
        FORCE_BIW3		: in bit;

		-- Displacement stuff:
		EXT_DSIZE			: in D_SIZETYPE;
		SEL_DISPLACE_BIW	: in bit;
		DISPLACE_BIW		: in std_logic_vector(31 downto 0); -- Displacement (8 or 16 bit).

		-- Index and data register stuff:
		REGSEL_INDEX	: in std_logic_vector(2 downto 0); -- Index register address select.
		INDEX_D_IN		: in std_logic_vector(31 downto 0); -- Index from a data register.
		
		-- Traps:
		CHK_PC			: in bit; -- Check program counter for TRAP_AERR.
		CHK_ADR			: in bit; -- Check effective address for TRAP_AERR.
		TRAP_AERR		: out bit; -- Address error indication.

		-- Effective address (result of the address logic):
		ADR_EFF			: out std_logic_vector(31 downto 0) -- This is the effective address.
		);
end entity WF68K00IP_ADDRESS_REGISTERS;
	
architecture BEHAVIOR of WF68K00IP_ADDRESS_REGISTERS is
type AR_TYPE is array(0 to 6) of std_logic_vector(31 downto 0);
signal AR				: AR_TYPE; -- Address registers A0 to A6.
signal DATA_SIGNED		: std_logic_vector(31 downto 0); -- Sign extended data.
signal USP				: std_logic_vector(31 downto 0); -- User stack pointer (refers to A7 in the user mode.).
signal SSP				: std_logic_vector(31 downto 0); -- Supervisor stack pointer (refers to A7' in the supervisor mode).
signal PC				: std_logic_vector(31 downto 0); -- Program counter.
signal AREG_TMP			: std_logic_vector(31 downto 0); -- Temporary address holding register.
signal ADR_MODE_I		: std_logic_vector(2 downto 0);
signal DISPLACE			: std_logic_vector(31 downto 0);
signal DISPL_EXT 		: std_logic_vector(31 downto 0);
signal I_D_A			: bit;
signal I_W_L			: bit;
signal I_SCALE			: bit_vector(1 downto 0); -- Scale information for the index.
signal INDEX_SIGN		: bit; -- Sign of the index.
signal INDEX_SCALED		: std_logic_vector(31 downto 0);
signal ABS_ADDRESS		: std_logic_vector(31 downto 0);
signal AR_NR_A			: integer range 0 to 7;
signal AR_NR_B			: integer range 0 to 7;
signal AR_NR_I			: integer range 0 to 7;
signal ADR_EFF_I		: std_logic_vector(31 downto 0);
signal ADR_TMP			: std_logic_vector(5 downto 0);
signal PC_TMP			: std_logic_vector(4 downto 0);
signal PC_OFFSET		: std_logic_vector(3 downto 0); -- Used for PC relative addressing modes.
signal AR_STEP			: std_logic_vector(2 downto 0);
begin
	-- Address mode selector switch:
	-- The default assignment is valid for source and destination access
	-- regardless of the value of SRC_DESTn (e.g. ADD, ADDX).
	ADR_MODE_I <= MOVE_D_AM when SRC_DESTn = '0' and OP = MOVE else ADR_MODE;
	
	-- Address pointers:
	AR_NR_A <= conv_integer(REGSEL_A);
	AR_NR_B <= conv_integer(REGSEL_B);
	AR_NR_I <= conv_integer(REGSEL_INDEX);

	-- TRAP_AERR: 
	-- 1. If an operation is read from an odd adress.
	-- 2. If the respective stack pointers in use are at an odd address.
	-- 2. If there is a WORD oder LONG bus access at an odd address.
	-- Note: Do not change the priority of these conditions!
	TRAP_AERR <= '1' when CHK_PC = '1' and PC(0) = '1' else -- OP-Code at an odd address.
				 '1' when CHK_ADR = '1' and USE_SSP_ADR = '1' and SSP(0) = '1' else
				 '1' when CHK_ADR = '1' and USE_SP_ADR = '1' and SBIT = '1' and SSP(0) = '1' else
				 '1' when CHK_ADR = '1' and USE_SP_ADR = '1' and USP(0) = '1' else
				 '0' when CHK_ADR = '1' and (USE_SSP_ADR = '1' or USE_SP_ADR = '1') else  -- Stack is correct.
                 -- MOVEP size is long or word but the acces is at byte boarders:
				 '1' when CHK_ADR = '1' and OP /= MOVEP and OP_SIZE = LONG and ADR_EFF_I(0) = '1' else -- LONG at an odd address.
				 '1' when CHK_ADR = '1' and OP /= MOVEP and OP_SIZE = WORD and ADR_EFF_I(0) = '1' else '0'; -- WORD at an odd address.
			
	-- The address register increment and decrement values:
	AR_STEP <= 	"100" when OP_SIZE = LONG else
				"010" when OP_SIZE = WORD else
				"010" when OP_SIZE = BYTE and AR_NR_B = 7 else "001";

	-- Data outputs:
	USP_OUT 	 <= USP;
	SSP_OUT 	 <= SSP;
	PC_OUT 		 <= PC + PC_TMP; -- Plus offset.

    ADR_REG_QA <= AREG_TMP when OP = MOVEM and ADR_MODE_I = "100" and REGSEL_A = REGSEL_B else -- See P_AREG_TMP, case A.
				  SSP when AR_NR_A = 7 and SBIT= '1' else -- Supervisor stack pointer.
				  USP when AR_NR_A = 7 and SBIT= '0' else -- User stack pointer.
				  AR(AR_NR_A);

	ADR_REG_QB <= SSP when AR_NR_B = 7 and SBIT= '1' else -- Supervisor stack pointer.
				  USP when AR_NR_B = 7 and SBIT= '0' else -- User stack pointer.
				  AR(AR_NR_B);

    P_AREG_TMP: process(RESETn, CLK)
    -- This register holds a temporary copy of the desired address register
    -- for the MOVEM operation. There are two special cases:
    -- Case A: if the addressing register in the predecrement mode is
    -- written to memory, the initial value (not decremented) is written out.
    -- Case B: If the addressing register in the non postincrement 
    -- addressing mode is loaded from memory, the AREG_TMP holds the 
    -- old addressing register value until the end of the MOVEM.
	begin
		if RESETn = '0' then
			AREG_TMP <= x"00000000";
        elsif CLK = '1' and CLK' event then
            if OP = MOVEM and OP_START = '1' then
				case AR_NR_B is
					when 7 =>
						if SBIT= '1' then
							AREG_TMP <= SSP;
						else
							AREG_TMP <= USP;
						end if;
					when others => AREG_TMP <= AR(AR_NR_B);
				end case;
			end if;
		end if;
	end process P_AREG_TMP;

	SRC_SIGNEXT: process(OP, OP_SIZE, ADATA_IN, ADR_EFF_I)
	-- The MOVEA and MOVEM require a sign extended source data
	-- which is provided by this logic. The BYTE size is not
	-- allowed for these operations and not taken into account.
	begin
		if (OP = MOVEA or OP = MOVEM) and OP_SIZE = WORD then
			for i in 31 downto 16 loop
				DATA_SIGNED(i) <= ADATA_IN(15);
			end loop;
			DATA_SIGNED(15 downto 0) <= ADATA_IN(15 downto 0);
		elsif OP = JMP or OP = JSR or OP = LEA then
			DATA_SIGNED <= ADR_EFF_I;
		else
			DATA_SIGNED <= ADATA_IN;
		end if;
	end process SRC_SIGNEXT;

	I_D_A <= '1' when EXWORD(0)(15) = '1' and SRC_DESTn = '1' else 
			 '1' when DEST_EXWORD(0)(15) = '1' and SRC_DESTn = '0' else '0';
	I_W_L <= '1' when EXWORD(0)(11) = '1' and SRC_DESTn = '1' else
			 '1' when DEST_EXWORD(0)(11) = '1' and SRC_DESTn = '0' else '0';

	-- The SCALE is not implemented in the original 68000. Nevertheless, the SCALE
	-- is foreseen in this core because the OPCODE compatibility is given.
	I_SCALE <= To_BitVector(EXWORD(0)(10 downto 9)) when SRC_DESTn = '1' else 
               To_BitVector(DEST_EXWORD(0)(10 downto 9));

	-- The absolute address is valid for the absolute address modes 'WORD' and 'LONG'.
	-- The sign extension is provided in the address mode process.
	ABS_ADDRESS	<= 	x"0000" & EXWORD(0) when ADR_MODE_I = "111" and REGSEL_B = "000" and SRC_DESTn = '1' else
					x"0000" & DEST_EXWORD(0) when ADR_MODE_I = "111" and REGSEL_B = "000" and SRC_DESTn = '0' else
					EXWORD(0) & EXWORD(1) when SRC_DESTn = '1' else DEST_EXWORD(0) & DEST_EXWORD(1);

	EXTEND_INDEX: process(AR_NR_I, I_D_A, I_W_L, AR, INDEX_D_IN, I_SCALE)
	-- This process selects the INDEX from one of the data
	-- registers or from one of the address registers. Further-
	-- more the index needs to be sign extended from 8 bit to 32
	-- bit or from 16 bit to 32 bit dependent on the address mode.
	-- In case of a long word operation, no extension is required.
	-- The index is multiplied by 1, 2, 4 or 8. The ADR_EFF is the
	-- scaled index for the address calculation.
	variable INDEX			: std_logic_vector(31 downto 0);
	variable INDEX_EXT		: std_logic_vector(31 downto 0);
	begin
		if I_D_A = '1' then
			INDEX := AR(AR_NR_I);
		else
			INDEX := INDEX_D_IN;
		end if;

		case I_W_L is
			when '0' => -- Sign extended word.
				for i in 31 downto 16 loop
					INDEX_EXT(i) := INDEX(15);
				end loop;
				INDEX_EXT(15 downto 0) := INDEX(15 downto 0);
			when '1' => -- Long word.
				INDEX_EXT := INDEX;
		end case;

		case I_SCALE is
			when "00" => INDEX_SCALED <= INDEX_EXT; -- Multiple by 1.
			when "01" => INDEX_SCALED <= INDEX_EXT(31 downto 1) & '0'; -- Multiple by 2.
			when "10" => INDEX_SCALED <= INDEX_EXT(31 downto 2) & "00"; -- Multiple by 4.
			when "11" => INDEX_SCALED <= INDEX_EXT(31 downto 3) & "000"; -- Multiple by 8.
		end case;
	end process EXTEND_INDEX;

	-- Displacement multiplexer:
	DISPLACE <= DISPLACE_BIW when SEL_DISPLACE_BIW = '1' else
				x"0000" & EXWORD(0) when EXT_DSIZE = WORD and SRC_DESTn = '1' else
				x"000000" & EXWORD(0)(7 downto 0) when EXT_DSIZE = BYTE and SRC_DESTn = '1' else
				x"0000" & DEST_EXWORD(0) when EXT_DSIZE = WORD else
				x"000000" & DEST_EXWORD(0)(7 downto 0);

	EXTEND_DISPLACEMENT: process(DISPLACE, EXT_DSIZE)
	-- The displacement needs to be sign extended from 8 bit to 32, from 16 bit to 32 bit or 
	-- not extended dependent on the address mode.
	begin
		case EXT_DSIZE is
			when BYTE => -- 8 bit wide displacement.
				for i in 31 downto 8 loop
					DISPL_EXT(i) <= DISPLACE(7);
				end loop;
				DISPL_EXT(7 downto 0) <= DISPLACE(7 downto 0);		
			when WORD => -- 16 bit wide displacement.
				for i in 31 downto 16 loop
					DISPL_EXT(i) <= DISPLACE(15);
				end loop;
				DISPL_EXT(15 downto 0) <= DISPLACE(15 downto 0);
			when LONG =>
				DISPL_EXT <= DISPLACE;
		end case;
	end process EXTEND_DISPLACEMENT;
	
	P_ADR_TMP: process(RESETn, CLK)
	-- This process provides a temporary address offset during
	-- bus access over several bytes. The 6 bits are used for 
    -- the MOVEM command in the non postincrement /predecrement mode.
    -- Other commands requires a maximum of
	-- 3 bits.
	begin
		if RESETn = '0' then
			ADR_TMP <= "000000";
		elsif CLK = '1' and CLK' event then
			if ADR_TMP_CLR = '1' then
				ADR_TMP <= "000000";
			elsif ADR_TMP_INC = '1' and OP_SIZE = BYTE then
				ADR_TMP <= ADR_TMP + "01";
			elsif ADR_TMP_INC = '1' then
				ADR_TMP <= ADR_TMP + "10";
			end if;
		end if;
	end process P_ADR_TMP;

	P_PC_TMP: process(RESETn, CLK)
	-- This process provides a temporary program counter offset
	-- during the 'fetch phase'.
	variable PC_TMPVAR : std_logic_vector(3 downto 0);
	begin
		if RESETn = '0' then
			PC_TMPVAR := x"0";
		elsif CLK = '1' and CLK' event then
			if PC_INC = '1' or PC_TMP_CLR = '1' then
				PC_TMPVAR := x"0";
			elsif PC_TMP_INC = '1' then
				PC_TMPVAR := PC_TMPVAR + '1';
			end if;
		end if;
		PC_TMP <= PC_TMPVAR & "0"; -- Increment always by two.
	end process P_PC_TMP;

    PC_OFFSET <= x"6" when FORCE_BIW3 = '1' and FORCE_BIW2 = '1' else
                 x"4" when FORCE_BIW2 = '1' else x"2";

	ADDRESS_MODES: process(ADR_MODE_I, REGSEL_B, AR, AR_NR_B, SBIT, USP, SSP, DISPL_EXT, AREG_TMP,
                           ADR_TMP, OP, INDEX_SCALED, ABS_ADDRESS, PC, PC_OFFSET, ADR_EFF_I, DR)
	-- The effective address calculation takes place in this process depending on the 
	-- chosen addressing mode.
	variable ADR_EFF_TMP 	: std_logic_vector(31 downto 0);
	variable AREG			: std_logic_vector(31 downto 0);
	begin
        if OP = MOVEM and (ADR_MODE_I = "010" or ADR_MODE_I = "101" or ADR_MODE_I = "110") and DR = '1' then
            AREG := AREG_TMP; -- See P_AREG_TMP, case B.
        else
            case AR_NR_B is
                when 7 =>
                    if SBIT= '1' then
                        AREG := SSP;
                    else
                        AREG := USP;
                    end if;
                when others => AREG := AR(AR_NR_B);
            end case;
        end if;
		--
		case ADR_MODE_I is
			-- when "000" | "001" => Direct address modes: no effective address required.
			when "010" | "011" | "100" =>
				-- x"2": Address register indirect mode. Assembler syntax: (An).
				-- x"3": Address register indirect with postincrement mode. Assembler syntax: (An)+.
				-- x"4": Address register indirect with predecrement mode. Assembler syntax: -(An).
				-- x"2": The ADR_EFF is the pointer to the operand.
				-- x"3": The ADR_EFF is the pointer to the operand.
				-- x"4": The ADR_EFF is the pointer to the operand.
				ADR_EFF_TMP := AREG;
			when "101" => -- Address register indirect with offset. Assembler syntax: (d16,An).
				ADR_EFF_TMP := AREG + DISPL_EXT;
			when "110" =>
				-- The ADR_EFF is the pointer to the operand.
				-- Assembler syntax: (d8,An,Xn.SIZE*SCALE).
				ADR_EFF_TMP := AREG + DISPL_EXT + INDEX_SCALED;
			when "111" =>
				case REGSEL_B is
					when "000" => -- Absolute short addressing mode.
						-- Assembler syntax: (xxx).W
						-- The ADR_EFF is the pointer to the operand.
						for i in 31 downto 16 loop
							ADR_EFF_TMP(i) := ABS_ADDRESS(15); -- Sign extension.
						end loop;
						ADR_EFF_TMP(15 downto 0) := ABS_ADDRESS(15 downto 0);
					when "001" => -- Absolute long addressing mode.
						-- Assembler syntax: (xxx).L
						-- The ADR_EFF is the pointer to the operand.
						ADR_EFF_TMP := ABS_ADDRESS;
					when "010" => -- Program counter relative with offset.
						-- Assembler syntax: (d16,PC).
						-- The effective address during PC relative addressing
						-- contains the PC offset plus two.
                        ADR_EFF_TMP := PC + PC_OFFSET + DISPL_EXT;
					when "011" => -- Program counter relative with index and offset.
						-- Assembler syntax: (d8,PC,Xn.SIZE*SCALE).
						-- The effective address during PC relative addressing
						-- contains the PC offset plus two.
                        ADR_EFF_TMP := PC + PC_OFFSET + DISPL_EXT + INDEX_SCALED;
					when others =>
						ADR_EFF_TMP := (others => '-'); -- Don't care, not used dummy.
				end case;
			when others =>
				ADR_EFF_TMP := (others => '-'); -- Result not required.
		end case;
		ADR_EFF_I <= ADR_EFF_TMP;
		 -- Copy of the effective address plus offsets:
		ADR_EFF <= ADR_EFF_I + ADR_TMP;
	end process ADDRESS_MODES;

	REG_WR_MODIFY: process(RESETn, CLK, OP, AR_NR_A, AR_NR_B)
	-- This process provides data transfer to the respective registers (write).
	-- Affected are the address registers (AR), the supervisor stack pointer (SSP), 
	-- the user stack pointer (USP) and the program counter (PC).
	begin
		-- 
		if RESETn = '0' then
			for i in 0 to 6 loop
				AR(i) <= (others => '0');
			end loop;
			USP <= (others => '0');
			SSP <= (others => '0');
			PC <= (others => '0');
		elsif CLK = '1' and CLK' event then
			-- Write operations are always long:
			if AR_WR = '1' then
				if AR_NR_A < 7 then
					AR(AR_NR_A) <= DATA_SIGNED; -- Load AREG.
				elsif SBIT = '1' then
					SSP <= DATA_SIGNED; -- Load SSP.
				else
					USP <= DATA_SIGNED; -- Load USP.
				end if;
			end if;

			-- Predecrement and postincrement:
			if AR_INC = '1' and AR_NR_B < 7 then
				AR(AR_NR_B) <= AR(AR_NR_B) + AR_STEP;
			elsif AR_INC = '1' and SBIT= '1' then
				SSP <= SSP + AR_STEP;
			elsif AR_INC = '1' then
				USP <= USP + AR_STEP;
			elsif AR_DEC = '1' and AR_NR_B < 7 then
				AR(AR_NR_B) <= AR(AR_NR_B) - AR_STEP;
			elsif AR_DEC = '1' and SBIT= '1' then
				SSP <= SSP - AR_STEP;
			elsif AR_DEC = '1' then
				USP <= USP - AR_STEP;
			end if;

			-- Increment / decrement the stack:
			if USP_INC = '1' then
				USP <= USP + "10"; -- Increment 2 bytes.
			elsif USP_DEC = '1' then
				USP <= USP - "10"; -- Decrement 2 bytes.
			elsif SSP_INIT = '1' then
				SSP <= ADATA_IN;
			elsif SSP_INC = '1' then
				SSP <= SSP + "10"; -- Increment 2 bytes.
			elsif SSP_DEC = '1' then
				SSP <= SSP - "10"; -- Decrement 2 bytes.
			end if;

			-- Displacement operations (concurrent to AR_WR..., see LINK).
			if SP_ADD_DISPL = '1' and SBIT = '1' then
				SSP <= SSP + DISPL_EXT; -- Used for LINK.
			elsif SP_ADD_DISPL = '1' then
				USP <= USP + DISPL_EXT; -- Used for LINK.
			end if;

			-- Exchange the content of address registers:
			if AR_EXG = '1' and OP_MODE = "01001" then -- Exchange two address registers.
				AR(AR_NR_B) <= AR(AR_NR_A); -- Internal wired because there is no second data input.
				AR(AR_NR_A) <= ADATA_IN;
			elsif AR_EXG = '1' and OP_MODE = "10001" then -- Exchange a data and an address register.
				AR(AR_NR_B) <= ADATA_IN;
			end if;

			-- Address Register copies:
			if USP_CPY = '1' and DR = '0' then -- Copy the address register to user stack pointer.
				if AR_NR_B < 7 then
					USP <= AR(AR_NR_B);
				elsif SBIT = '1' then
					USP <= SSP;
				end if;
			elsif USP_CPY = '1' then -- Copy the user stack pointer to the address register.
				if AR_NR_B < 7 then
					AR(AR_NR_B) <= USP;
				elsif SBIT = '1' then
					SSP <= USP;
				end if;
			end if;

			-- Program counter arithmetics:
			if PC_WR = '1' then -- JMP, JSR.
				PC <= DATA_SIGNED;
			elsif PC_INIT = '1' then
				PC <= ADATA_IN;
			-- The PC_ADD_DISPL and the PC_INC are asserted simultaneously when the
			-- operation is used for Bcc and BRA. Therefore the prioritization of
			-- PC_ADD_DISPL over PC_INC is important.
			-- When PC_INC is active, the program counter is increased by the 
			-- value of PC_TMP plus two when the following execution state after 
			-- a fetch phase is FETCH_BIW_1.
			elsif PC_ADD_DISPL = '1' then -- Used for Bcc, BRA, BSR, DBcc.
				PC <= PC + DISPL_EXT + "10";
			elsif PC_INC = '1' then
				PC <= PC + PC_TMP + "10";
			end if;
		end if;
	end process REG_WR_MODIFY;
end BEHAVIOR;
