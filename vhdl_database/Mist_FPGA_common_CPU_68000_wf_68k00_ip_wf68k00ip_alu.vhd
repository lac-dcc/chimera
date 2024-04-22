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
---- This file contains the arithmetic logic unit (ALU).          ----
----                                                              ----
----                                                              ----
---- Description:                                                 ----
---- Arithmetic Logic Unit performs the arithmetic and logic      ----
---- operations during execution of an instruction. It contains   ----
---- the accumulator and related logic such as arithmetic unit,   ----
---- logic unit, multiplier and divider. BCD operation are exe-   ----
---- cuted in this unit and condition code flags (N-negative,     ----
---- Z-zero, C-carry V-overflow) for most instructions.           ----
---- For a proper operation, the ALU requires sign extended       ----
---- operands OP_IN_S, OP_IN_D_LO and OP_IN_D_HI. In case of the  ----
---- OP_IN_D_HI a sign extension is required for the long         ----
---- (DIVL) only.                                                 ----
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

use work.WF68K00IP_PKG.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity WF68K00IP_ALU is
	port (
		RESETn			: in bit;
		CLK				: in bit;
		ADR_MODE		: in std_logic_vector(2 downto 0);
		OP_SIZE			: in OP_SIZETYPE;
		OP				: in OP_68K00;
		-- The Flags:
		XNZVC_IN		: in std_logic_vector(4 downto 0);
		XNZVC_OUT		: out std_logic_vector(4 downto 0);
		
		-- Operands and result:
		OP_IN_S			: in std_logic_vector(31 downto 0);
		OP_IN_D_HI		: in std_logic_vector(31 downto 0);
		OP_IN_D_LO		: in std_logic_vector(31 downto 0);
		RESULT_HI		: out std_logic_vector(31 downto 0);
		RESULT_LO		: out std_logic_vector(31 downto 0);

		-- Status and Control:
		OP_START		: in bit; -- 1 CLK cycle.
		TRAP_CHK_EN		: in bit; -- 1 CLK cycle.
		DIV_MUL_32n64	: in bit; -- 1 for 64 bit long MUL or DIV, 0 for 32 bit long MUL or DIV.
		OP_BUSY			: out bit;
		TRAP_CHK		: out bit; -- Trap due to the CHK instruction.
		TRAP_DIVZERO	: out bit -- Trap due to divide by zero.
		);
end entity WF68K00IP_ALU;
	
architecture BEHAVIOR of WF68K00IP_ALU is
type MUL_STATES is (MUL_IDLE, MUL_ADD, MUL_VERIFY_SHIFT);
type DIV_STATES is (DIV_IDLE, DIV_VERIFY, DIV_ADDSUB, DIV_SIGN);
signal MUL_STATE		: MUL_STATES;
signal NEXT_MUL_STATE	: MUL_STATES;
signal DIV_STATE		: DIV_STATES;
signal NEXT_DIV_STATE	: DIV_STATES;
signal OP_IN_S_SIGN		: std_logic_vector(31 downto 0);
signal OP_IN_D_SIGN_LO	: std_logic_vector(31 downto 0);
signal RESULT_LOGOP		: std_logic_vector(31 downto 0);
signal RESULT_BCD		: std_logic_vector(7 downto 0);
signal RESULT_INTOP		: std_logic_vector(31 downto 0);
signal RESULT_SPECIAL	: std_logic_vector(31 downto 0);
signal RESULT_I_DIV		: std_logic_vector(31 downto 0);
signal RESULT_I			: std_logic_vector(31 downto 0);
signal RESULT_II		: std_logic_vector(32 downto 0);
signal DIVISOR			: std_logic_vector(63 downto 0);
signal DIVIDEND			: std_logic_vector(63 downto 0);
signal CB_BCD			: std_logic;
signal OV_DIV			: std_logic;
signal MUL_CYC_CNT 		: unsigned(5 downto 0);
signal OP_MUL			: bit;
signal OP_DIV			: bit;
signal MUL_DIV_OP_S		: std_logic_vector(31 downto 0);
signal MUL_OP_D			: std_logic_vector(31 downto 0);
signal DIV_VAR			: std_logic_vector(31 downto 0);
signal DIV_OLD_MSB		: std_logic;
signal DIV_SHIFT_EN		: bit;
begin
	OP_BUSY <= OP_MUL or OP_DIV;

	-- Result multiplexers:
	with OP select
		RESULT_HI <= RESULT_II(31 downto 0) when DIVS | DIVU | MULS | MULU, x"00000000" when others;
	with OP select
		RESULT_LO <= RESULT_LOGOP when AND_B | ANDI | ANDI_TO_CCR | ANDI_TO_SR | EOR | EORI | EORI_TO_CCR,
					 RESULT_LOGOP when EORI_TO_SR | NOT_B | OR_B | ORI | ORI_TO_CCR | ORI_TO_SR,
					 RESULT_INTOP when ADD | ADDA | ADDI | ADDQ | ADDX | CLR | CMP | CMPA | CMPI | CMPM,
					 RESULT_INTOP when NEG | NEGX | SUB | SUBA | SUBI | SUBQ | SUBX,
 					 RESULT_SPECIAL when EXTW | SWAP | TAS,
					 x"000000" & RESULT_BCD when ABCD | NBCD | SBCD, -- Byte only.
					 RESULT_I_DIV when DIVS | DIVU,
					 RESULT_I when MULS | MULU,
					 OP_IN_S when others; -- Default for CHK, MOVE, MOVEQ.

	-- Use low bytes of RESULT_II and RESULT_I for word wide DIVS, DIVU:
	RESULT_I_DIV <= RESULT_II(15 downto 0) & RESULT_I(15 downto 0) when OP_SIZE = WORD else RESULT_I;

	SIGNEXT: process(OP, OP_IN_S, OP_IN_D_LO, OP_SIZE)
	-- This module provides the required sign extensions.
	begin
		case OP_SIZE is
			when LONG =>
				OP_IN_S_SIGN <= OP_IN_S;
				OP_IN_D_SIGN_LO <= OP_IN_D_LO;
			when WORD =>
				for i in 31 downto 16 loop
					OP_IN_S_SIGN(i) <= OP_IN_S(15);
					OP_IN_D_SIGN_LO(i) <= OP_IN_D_LO(15);
				end loop;
				OP_IN_S_SIGN(15 downto 0) <= OP_IN_S(15 downto 0);
				OP_IN_D_SIGN_LO(15 downto 0) <= OP_IN_D_LO(15 downto 0);
			when BYTE =>
				for i in 31 downto 8 loop
					OP_IN_S_SIGN(i) <= OP_IN_S(7);
					OP_IN_D_SIGN_LO(i) <= OP_IN_D_LO(7);
				end loop;
				OP_IN_S_SIGN(7 downto 0) <= OP_IN_S(7 downto 0);
				OP_IN_D_SIGN_LO(7 downto 0) <= OP_IN_D_LO(7 downto 0);
		end case;
	end process SIGNEXT;

	TRAP_CHK <= '1' when TRAP_CHK_EN = '1' and OP_IN_D_SIGN_LO(31) = '1' else -- Negative destination.
				'1' when TRAP_CHK_EN = '1' and RESULT_INTOP(31) = '0' else '0'; -- Destination > Source.
					
	TRAP_DIVZERO <=	'1' when OP = DIVU and DIV_STATE = DIV_IDLE and OP_START = '1' and OP_IN_S = x"00000000" else
					'1' when OP = DIVS and DIV_STATE = DIV_IDLE and OP_START = '1' and OP_IN_S = x"00000000" else '0';

	P_LOGOP: process(OP, OP_IN_S, OP_IN_D_LO)
	-- This process provides the logic operations:
	-- AND, OR, XOR and NOT.
	-- The logic operations require no signed / unsigned
	-- modelling.
	begin
		case OP is
			when AND_B | ANDI | ANDI_TO_CCR | ANDI_TO_SR =>
				RESULT_LOGOP <= OP_IN_S and OP_IN_D_LO;
			when OR_B | ORI | ORI_TO_CCR | ORI_TO_SR =>
				RESULT_LOGOP <= OP_IN_S or OP_IN_D_LO;
			when EOR | EORI | EORI_TO_CCR | EORI_TO_SR =>
				RESULT_LOGOP <= OP_IN_S xor OP_IN_D_LO;
			when NOT_B =>
				RESULT_LOGOP <= not OP_IN_D_LO;
			when MOVE =>
				RESULT_LOGOP <= OP_IN_S; -- Used for MOVE.
			when others =>
				RESULT_LOGOP <= OP_IN_D_LO; -- Used for TST.
		end case;
	end process P_LOGOP;

	P_INTOP: process(OP, OP_IN_S, OP_IN_S_SIGN, OP_IN_D_LO, OP_IN_D_SIGN_LO, ADR_MODE, XNZVC_IN, OP_SIZE, RESULT_INTOP)
	-- The integer arithmetics ADD, SUB, NEG and CMP in their different variations are modelled here.
	variable X_IN_I			: Std_Logic_Vector(0 downto 0);
	variable RESULT		 	: unsigned(31 downto 0);
	begin
		X_IN_I(0) := XNZVC_IN(4); -- Extended Flag.
		case OP is
            when ADDA =>
                RESULT := unsigned(OP_IN_D_LO) + unsigned(OP_IN_S_SIGN); -- No sign extension for the destination.
            when ADDQ =>
                case ADR_MODE is
                    when "001" => RESULT := unsigned(OP_IN_D_LO) + unsigned(OP_IN_S_SIGN); -- No sign extension for address destination.
                    when others => RESULT := unsigned(OP_IN_D_SIGN_LO) + unsigned(OP_IN_S_SIGN);
                end case;
            when ADD | ADDI =>
				RESULT := unsigned(OP_IN_D_SIGN_LO) + unsigned(OP_IN_S_SIGN);
			when ADDX =>
				RESULT := unsigned(OP_IN_D_SIGN_LO) + unsigned(OP_IN_S_SIGN) + unsigned(X_IN_I);
            when CMPA | SUBA =>
                RESULT := unsigned(OP_IN_D_LO) - unsigned(OP_IN_S_SIGN); -- No sign extension for the destination.
            when SUBQ =>
                case ADR_MODE is
                    when "001" => RESULT := unsigned(OP_IN_D_LO) - unsigned(OP_IN_S_SIGN); -- No sign extension for address destination.
                    when others => RESULT := unsigned(OP_IN_D_SIGN_LO) - unsigned(OP_IN_S_SIGN);
                end case;
            when CHK | CMP | CMPI | CMPM | SUB | SUBI =>
				RESULT := unsigned(OP_IN_D_SIGN_LO) - unsigned(OP_IN_S_SIGN);
			when SUBX =>
				RESULT := unsigned(OP_IN_D_SIGN_LO) - unsigned(OP_IN_S_SIGN) - unsigned(X_IN_I);
			when NEG =>
				RESULT := unsigned(OP_IN_S_SIGN) - unsigned(OP_IN_D_SIGN_LO);
			when NEGX =>
				RESULT := unsigned(OP_IN_S_SIGN) - unsigned(OP_IN_D_SIGN_LO) - unsigned(X_IN_I);
			when CLR =>
				RESULT := (others => '0');
			when others =>
				RESULT := (others => '0'); -- Don't care.
		end case;
		RESULT_INTOP <= std_logic_vector(RESULT);
	end process P_INTOP;

	P_SPECIAL: process(OP, OP_IN_S, OP_IN_D_LO, OP_SIZE, RESULT_INTOP)
	-- This process provides the calculation for special operations.
	variable RESULT	: unsigned(31 downto 0);
	begin
		case OP is
 			when EXTW =>
				case OP_SIZE is
					when LONG =>
						for i in 31 downto 16 loop
							RESULT(i) := OP_IN_S(15);
						end loop;
						RESULT(15 downto 0) := unsigned(OP_IN_S(15 downto 0));
					when others => -- Word.
						for i in 15 downto 8 loop
							RESULT(i) := OP_IN_S(7);
						end loop;
						RESULT(31 downto 16) := unsigned(OP_IN_S(31 downto 16));
						RESULT(7 downto 0) := unsigned(OP_IN_S(7 downto 0));
				end case;
			when SWAP =>
				RESULT := unsigned(OP_IN_S(15 downto 0)) & unsigned(OP_IN_S(31 downto 16));
			when TAS =>
				RESULT := x"000000" & '1' & unsigned(OP_IN_D_LO(6 downto 0)); -- Set the MSB.
			when others =>
				RESULT := (others => '0'); -- Don't care.
		end case;
		RESULT_SPECIAL <= std_logic_vector(RESULT);
	end process P_SPECIAL;

	P_BCDOP: process(OP, XNZVC_IN, OP_IN_S, OP_IN_D_LO)
	-- The BCD operations are all byte wide and unsigned.
	variable X_IN_I			: unsigned(0 downto 0);
	variable TEMP0			: unsigned(4 downto 0);
	variable TEMP1			: unsigned(4 downto 0);
	variable Z_0			: unsigned(3 downto 0);
	variable C_0			: unsigned(0 downto 0);
	variable Z_1			: unsigned(3 downto 0);
	variable C_1			: std_logic;
	variable S_0			: unsigned(3 downto 0);
	variable S_1			: unsigned(3 downto 0);
	begin
		X_IN_I(0) := XNZVC_IN(4); -- Inverted extended Flag.
		case OP is
			when ABCD =>
				TEMP0 := unsigned('0' & OP_IN_D_LO(3 downto 0)) + unsigned('0' & OP_IN_S(3 downto 0)) + ("0000" & X_IN_I);
				TEMP1 := unsigned('0' & OP_IN_D_LO(7 downto 4)) + unsigned('0' & OP_IN_S(7 downto 4)) + ("0000" & C_0);
			when NBCD =>
				TEMP0 := "00000" - unsigned('0' & OP_IN_D_LO(3 downto 0)) - ("0000" & X_IN_I);
				TEMP1 := "00000" - unsigned('0' & OP_IN_D_LO(7 downto 4)) - ("0000" & C_0);
			when others => -- Valid for SBCD.
				TEMP0 := unsigned('0' & OP_IN_D_LO(3 downto 0)) - unsigned('0' & OP_IN_S(3 downto 0)) - ("0000" & X_IN_I);
				TEMP1 := unsigned('0' & OP_IN_D_LO(7 downto 4)) - unsigned('0' & OP_IN_S(7 downto 4)) - ("0000" & C_0);
		end case;
		if std_logic_vector(TEMP0) > "01001" then
			Z_0 := "0110";
			C_0 := "1";
		else
			Z_0 := "0000";
			C_0 := "0";
		end if;
		if std_logic_vector(TEMP1) > "01001" then
			Z_1 := "0110";
			C_1 := '1';
		else
			Z_1 := "0000";
			C_1 := '0';
		end if;
		case OP is
			when ABCD =>
				S_1 := TEMP1(3 downto 0) + Z_1;
				S_0 := TEMP0(3 downto 0) + Z_0;
			when others => -- Valid for SBCD, NBCD.
				S_1 := TEMP1(3 downto 0) - Z_1;
				S_0 := TEMP0(3 downto 0) - Z_0;
		end case;			
		--
		CB_BCD <= C_1;
		RESULT_BCD(7 downto 4) <= std_logic_vector(S_1);
		RESULT_BCD(3 downto 0) <= std_logic_vector(S_0);
	end process P_BCDOP;

	COND_CODES: process(OP, RESULT_BCD, CB_BCD, RESULT_LOGOP, RESULT_INTOP, OP_SIZE, XNZVC_IN, RESULT_SPECIAL,
						OP_IN_D_SIGN_LO, OP_IN_S_SIGN, RESULT_I, RESULT_II, MUL_STATE, DIV_MUL_32n64, OV_DIV)
	-- In this process all the condition codes X (eXtended), N (Negative)
	-- Z (Zero), V (oVerflow) and C (Carry / borrow) are calculated for
	-- all integer operations. Except for the MULS, MULU, DIVS, DIVU the
	-- new conditions are valid one clock cycle after the operation starts.
	-- For the multiplication and the division, the codes are valid after
	-- BUSY is released.
	-- Although MOVE, MOVEQ and CHK does not require any data processing by the ALU,
	-- the condition codes are computated here.
	variable Z, RM, SM, DM	: std_logic;
	begin
		-- Concerning Z,V,C Flags:
		case OP is
			when ADD | ADDI | ADDQ | ADDX | CMP | CMPA | CMPI | CMPM | NEG | NEGX | SUB | SUBI | SUBQ | SUBX  =>
				RM := RESULT_INTOP(31);
				SM := OP_IN_S_SIGN(31);
				DM := OP_IN_D_SIGN_LO(31);
			when others =>
				RM := '-'; SM := '-'; DM := '-';
		end case;
		-- Concerning Z Flag:
		case OP is
			when ADD | ADDI | ADDQ | ADDX | CMP | CMPA | CMPI | CMPM | NEG | NEGX | SUB | SUBI | SUBQ | SUBX  =>
				if RESULT_INTOP = x"00000000" then
					Z := '1';
				else
					Z := '0';
				end if;
			when others =>
				Z := '0';
		end case;
		--
		case OP is
			when ABCD | NBCD | SBCD =>
				if RESULT_BCD = x"00" then -- N and V are undefined, don't care.
					XNZVC_OUT <= CB_BCD & '-' & XNZVC_IN(2) & '-' & CB_BCD;
				else
					XNZVC_OUT <= CB_BCD & '-' & '0' & '-' & CB_BCD;
				end if;
			when ADD | ADDI | ADDQ | ADDX =>
				if Z = '1' then
					if OP = ADDX then
						XNZVC_OUT(3 downto 2) <= '0' & XNZVC_IN(2);
					else
						XNZVC_OUT(3 downto 2) <= "01";
					end if;
				else
					XNZVC_OUT(3 downto 2) <= RM & '0';
				end if;
				--
				case To_Bit(RM) & To_Bit(SM) & To_Bit(DM) is
					when "011" => XNZVC_OUT(1) <= '1';
					when "100" => XNZVC_OUT(1) <= '1';
					when others => XNZVC_OUT(1) <= '0';
				end case;
				if (SM = '1' and DM = '1') or (RM = '0' and SM = '1') or (RM = '0' and DM = '1') then
					XNZVC_OUT(4) <= '1'; XNZVC_OUT(0) <= '1';
				else
					XNZVC_OUT(4) <= '0'; XNZVC_OUT(0) <= '0';
				end if;						
			when CLR =>
				XNZVC_OUT <= XNZVC_IN(4) & "0100";
			when SUB | SUBI | SUBQ | SUBX =>
				if Z = '1' then
					if OP = SUBX then
						XNZVC_OUT(3 downto 2) <= '0' & XNZVC_IN(2);
					else
						XNZVC_OUT(3 downto 2) <= "01";
					end if;
				else
					XNZVC_OUT(3 downto 2) <= RM & '0';
				end if;
				--
				case To_Bit(RM) & To_Bit(SM) & To_Bit(DM) is
					when "001" => XNZVC_OUT(1) <= '1';
					when "110" => XNZVC_OUT(1) <= '1';
					when others => XNZVC_OUT(1) <= '0';
				end case;
				if (SM = '1' and DM = '0') or (RM = '1' and SM = '1') or (RM = '1' and DM = '0') then
					XNZVC_OUT(4) <= '1'; XNZVC_OUT(0) <= '1';
				else
					XNZVC_OUT(4) <= '0'; XNZVC_OUT(0) <= '0';
				end if;						
			when CMP | CMPA | CMPI | CMPM =>
				XNZVC_OUT(4) <= XNZVC_IN(4);
				if Z = '1' then
					XNZVC_OUT(3 downto 2) <= "01";
				else
					XNZVC_OUT(3 downto 2) <= RM & '0';
				end if;
				--
				case To_Bit(RM) & To_Bit(SM) & To_Bit(DM) is
					when "001" => XNZVC_OUT(1) <= '1';
					when "110" => XNZVC_OUT(1) <= '1';
					when others => XNZVC_OUT(1) <= '0';
				end case;
				if (SM = '1' and DM = '0') or (RM = '1' and SM = '1') or (RM = '1' and DM = '0') then
					XNZVC_OUT(0) <= '1';
				else
					XNZVC_OUT(0) <= '0';
				end if;						
			when NEG | NEGX =>
				if Z = '1' then
					if OP = NEGX then
						XNZVC_OUT(3 downto 2) <= '0' & XNZVC_IN(2);
					else
						XNZVC_OUT(3 downto 2) <= "01";
					end if;
				else
					XNZVC_OUT(3 downto 2) <= RM & '0';
				end if;
				XNZVC_OUT(4) <= DM or RM;
				XNZVC_OUT(1) <= DM and RM;
				XNZVC_OUT(0) <= DM or RM;
			when AND_B | ANDI | EOR | EORI | OR_B | ORI | MOVE | NOT_B | TST =>
				case OP_SIZE is
					when LONG =>
						if RESULT_LOGOP = x"00000000" then
							XNZVC_OUT <= XNZVC_IN(4) & "0100";
						else
							XNZVC_OUT <= XNZVC_IN(4) & RESULT_LOGOP(31) &"000";
						end if;
					when WORD =>
						if RESULT_LOGOP(15 downto 0) = x"0000" then
							XNZVC_OUT <= XNZVC_IN(4) & "0100";
						else
							XNZVC_OUT <= XNZVC_IN(4) & RESULT_LOGOP(15) &"000";
						end if;
					when others => -- Byte.
						if RESULT_LOGOP(7 downto 0) = x"00" then
							XNZVC_OUT <= XNZVC_IN(4) & "0100";
						else
							XNZVC_OUT <= XNZVC_IN(4) & RESULT_LOGOP(7) &"000";
						end if;
				end case;
			-- The ANDI_TO_CCR, ANDI_TO_SR, EORI_TO_CCR, EORI_TO_SR, ORI_TO_CCR, ORI_TO_SR
			-- are determined in the LOGOP process.
			when CHK =>
                if OP_IN_D_SIGN_LO(31) = '1' then
                    XNZVC_OUT <= XNZVC_IN(4) & '1' & "---";
                elsif RESULT_INTOP(31) = '0' then
                    XNZVC_OUT <= XNZVC_IN(4) & '0' & "---";
                else
                    XNZVC_OUT <= XNZVC_IN(4 downto 3) & "---";
                end if;
			when DIVS | DIVU =>
				if OP_SIZE = WORD and RESULT_I(15) = '1' then
					XNZVC_OUT <= XNZVC_IN(4) & '1' & '0' & OV_DIV & '0'; -- Negative number.
				elsif RESULT_I(31) = '1' then
					XNZVC_OUT <= XNZVC_IN(4) & '1' & '0' & OV_DIV & '0'; -- Negative number.
				elsif RESULT_I = x"00000000" then
					XNZVC_OUT <= XNZVC_IN(4) & '0' & '1' & OV_DIV & '0'; -- Zero.
				else
					XNZVC_OUT <= XNZVC_IN(4) & '0' & '0' & OV_DIV & '0';
				end if;
			when EXTW =>
				case OP_SIZE is
					when LONG =>
						if RESULT_SPECIAL = x"00000000" then
							XNZVC_OUT <= XNZVC_IN(4) & "0100";
						else
							XNZVC_OUT <= XNZVC_IN(4) & RESULT_SPECIAL(31) & "000";
						end if;
					when others => -- Word.
						if RESULT_SPECIAL(15 downto 0) = x"0000" then
							XNZVC_OUT <= XNZVC_IN(4) & "0100";
						else
							XNZVC_OUT <= XNZVC_IN(4) & RESULT_SPECIAL(15) & "000";
						end if;
				end case;
			when MOVEQ =>
				if OP_IN_S_SIGN(7 downto 0) = x"00" then
					XNZVC_OUT <= XNZVC_IN(4) & "0100";
				else
					XNZVC_OUT <= XNZVC_IN(4) & OP_IN_S_SIGN(7) & "000";
				end if;
			when MULS | MULU =>
				-- X is unaffected, C is always zero.
				-- The sign flag is stored in the end of the operation. The Z and V flags 
				-- are valid after the operation, when the MULU or the MULS is not BUSY.
				--
				XNZVC_OUT <= XNZVC_IN(4) & '0' & '0' & '0' & '0'; -- Default...
				--
				if RESULT_I = x"00000000" and RESULT_II(31 downto 0) = x"00000000" then
					XNZVC_OUT <= XNZVC_IN(4) & '0' & '1' & '0' & '0'; -- Result is zero.
				elsif OP_SIZE = WORD and RESULT_I(31) = '1' then
					XNZVC_OUT <= XNZVC_IN(4) & '1' & '0' & '0' & '0'; -- Negative result.
				elsif OP_SIZE = LONG and DIV_MUL_32n64 = '0' then
					if RESULT_I(31) = '1' and RESULT_II(31 downto 0) /= x"00000000" then -- Negative and overflow.
						XNZVC_OUT <= XNZVC_IN(4) & '1' & '0' & '1' & '0';
					elsif RESULT_I(31) = '1' then -- Negative.
						XNZVC_OUT <= XNZVC_IN(4) & '1' & '0' & '0' & '0';
					elsif RESULT_II(31 downto 0) /= x"00000000" then -- Overflow.
						XNZVC_OUT <= XNZVC_IN(4) & '0' & '0' & '1' & '0';
					end if;
				elsif OP_SIZE = LONG and RESULT_II(31) = '1' then -- Long64 form: negative result, no overflow.
					XNZVC_OUT <= XNZVC_IN(4) & '1' & '0' & '0' & '0';
				end if;
			when SWAP =>
				-- The FLAGS are calculated 'look ahead' for the register and the
				-- condition code register is written simultaneously.
				-- The OP_IN(15) is the swapped bit 31.
				if RESULT_SPECIAL = x"00000000" then
					XNZVC_OUT <= XNZVC_IN(4) & "0100";
				else
					XNZVC_OUT <= XNZVC_IN(4) & RESULT_SPECIAL(31) & "000";
				end if;	
			when TAS => -- TAS is Byte only.
				if OP_IN_D_SIGN_LO(7 downto 0) = x"00" then
					XNZVC_OUT <= XNZVC_IN(4) & "0100";
				else
					XNZVC_OUT <= XNZVC_IN(4) & OP_IN_D_SIGN_LO(7) &"000";
				end if;
			when others => XNZVC_OUT <= "-----";
		end case;
	end process COND_CODES;

	-- For the source and destination operands it is necessary to distinguish between WORD and LONG format and between
	-- signed and unsigned operations:
	MUL_DIV_OP_S <= x"FFFF" & OP_IN_S(15 downto 0) when OP_SIZE = WORD and OP_IN_S(15) = '1' and (OP = MULS or OP = DIVS) else
					x"0000" & OP_IN_S(15 downto 0) when OP_SIZE = WORD else OP_IN_S;
						
	MUL_OP_D <= x"FFFF" & OP_IN_D_LO(15 downto 0) when OP_SIZE = WORD and OP_IN_D_LO(15) = '1' and OP = MULS else
				x"0000" & OP_IN_D_LO(15 downto 0) when OP_SIZE = WORD else OP_IN_D_LO;

	MUL_DIV_BUFFER: process(RESETn, CLK)
	-- The Result is stored in two 32 bit wide registers. If a register is not used in an
	-- operation, it remains unchanged. If parts of a register are not used, the respective
	-- bits also  remain unchanged.
	begin
		if RESETn = '0' then
			RESULT_I <= (others => '0');
			RESULT_II <= (others => '0');
		elsif CLK = '1' and CLK' event then
			-- The MULS, MULU, DIVS, DIVU require a definite start condition in form
			-- of a start strobe.
			if OP_START = '1' then
				case OP is
					when MULS | MULU => -- Load operands.
						RESULT_II <= (others => '0');
						if OP_IN_D_LO = x"00000000" or OP_IN_S = x"00000000" then
							-- The result is zero if any of the operands is zero.
							RESULT_I <= x"00000000";
						else
							RESULT_I <= MUL_OP_D;
						end if;
					when DIVU =>
						-- Register function: see DIV_STATE_DEC process.
						if OP_SIZE = LONG and DIV_MUL_32n64 = '1' then
							DIVIDEND <= OP_IN_D_HI & OP_IN_D_LO;
						else
							DIVIDEND <= x"00000000" & OP_IN_D_LO;
						end if;
						DIVISOR <= x"00000000" & MUL_DIV_OP_S;
						RESULT_I <= (others => '0'); -- Initialize.
						RESULT_II <= (others => '0'); -- Initialize.
						DIV_VAR <= x"00000001"; -- Shift variable.
					when DIVS =>
						-- Register function: see DIV_STATE_DEC process.
						if OP_SIZE = LONG and DIV_MUL_32n64 = '1' and OP_IN_D_HI(31) = '0' then
							DIVIDEND <= OP_IN_D_HI & OP_IN_D_LO; -- Positive.
						elsif OP_SIZE = LONG and DIV_MUL_32n64 = '1' then
							DIVIDEND <= unsigned(not(OP_IN_D_HI & OP_IN_D_LO)) + '1';
						elsif OP_IN_D_LO(31) = '0' then
							DIVIDEND <= x"00000000" & OP_IN_D_LO; -- Positive.
						else
							DIVIDEND <= x"00000000" & unsigned(not(OP_IN_D_LO)) + '1'; -- Negative, load twos complement.
						end if;
						--
						if MUL_DIV_OP_S(31) = '1' then
							DIVISOR <= x"00000000" & unsigned(not(MUL_DIV_OP_S)) + '1'; -- Negative, load twos complement.
						else
							DIVISOR <= x"00000000" & MUL_DIV_OP_S;
						end if;
						RESULT_I <= (others => '0'); -- Initialize.
						RESULT_II <= (others => '0'); -- Initialize.
						DIV_VAR <= x"00000001"; -- Shift variable.
					when others =>
						null;
				end case;
			elsif MUL_STATE = MUL_ADD then
				-- Use sign extended value of source operand for MULS.
				-- The RESULT_II(32) is the carry bit of the adder.
				RESULT_II <= unsigned(RESULT_II) + unsigned(MUL_DIV_OP_S);
			elsif MUL_STATE = MUL_VERIFY_SHIFT then -- Right shift.
				-- Special case:
				-- The MULS algorithm works fine, if we sign extend the operands and shift over a bit width of the result width.
				-- This is done for the WORD format. In case of the LONG format, we shift 32 times (time efficient multiplication).
				-- The algorithm delivers a wrong result in case of the signed multiplikation, when one or both operand are
				-- negative. This error does not take any effect in the first LONG form, where the wrong high register result is
				-- discarded. In case of the second long form, the high register result must be corrected by the addition of the
				-- twos complements of the respective operands. The correction takes place during the last shift step.
				case  MUL_CYC_CNT is
					when "000000" => 
						if OP = MULS and OP_SIZE = LONG and MUL_DIV_OP_S(31) = '1' and OP_IN_D_LO(31) = '1' then
							RESULT_II <= unsigned('0' & RESULT_II(32 downto 1)) + unsigned(not(OP_IN_D_LO)) + '1'
                                                                                + unsigned(not(MUL_DIV_OP_S)) + '1';
						elsif OP = MULS and OP_SIZE = LONG and MUL_DIV_OP_S(31) = '1' then
							RESULT_II <= unsigned('0' & RESULT_II(32 downto 1)) + unsigned(not(OP_IN_D_LO)) + '1';
						elsif OP = MULS and OP_SIZE = LONG and OP_IN_D_LO(31) = '1' then
							RESULT_II <= unsigned('0' & RESULT_II(32 downto 1)) + unsigned(not(MUL_DIV_OP_S)) + '1';
						else
							RESULT_II <= '0' & RESULT_II(32 downto 1); -- Carry Bit at MSB.
						end if;
					when others => RESULT_II <= '0' & RESULT_II(32 downto 1);
				end case;
				RESULT_I <= RESULT_II(0) & RESULT_I(31 downto 1);
			elsif DIV_SHIFT_EN = '1' then -- Shift the DIVIDEND left.
				-- Shift the DIVIDEND and the shift variable:
				DIVISOR <= DIVISOR(62 downto 0) & '0';
				DIV_VAR <= DIV_VAR(30 downto 0) & '0';
			elsif DIV_STATE = DIV_ADDSUB then
				-- The subtraction is unsigned for DIVS and DIVU.
				DIVIDEND <= unsigned(DIVIDEND) - unsigned(DIVISOR); -- Remainder's register.
				RESULT_I <= unsigned(RESULT_I) + unsigned(DIV_VAR); -- Quotient's register.
				-- Reset the shift variable and reload the DIVISOR:
				DIV_VAR <= x"00000001";
				if OP = DIVS and MUL_DIV_OP_S(31) = '1' then
					DIVISOR <= x"00000000" & unsigned(not(MUL_DIV_OP_S)) + '1'; -- Negative, load twos complement.
				else
					DIVISOR <= x"00000000" & MUL_DIV_OP_S;
				end if;
			elsif DIV_STATE = DIV_SIGN then
				case OP_SIZE is
					when LONG =>
						if DIV_MUL_32n64 = '1' and OP = DIVS and ((OP_IN_D_HI(31) xor OP_IN_S(31)) = '1') then -- 64 bit dividend.
							RESULT_I <= unsigned(not(RESULT_I)) + '1'; -- Negative, change sign.
						elsif OP = DIVS and ((OP_IN_D_LO(31) xor OP_IN_S(31)) = '1') then -- 32 bit dividend.
							RESULT_I <= unsigned(not(RESULT_I)) + '1'; -- Negative, change sign.
						end if;
					when others => -- WORD.
						if OP = DIVS and ((OP_IN_D_LO(31) xor OP_IN_S(15)) = '1') then
							RESULT_I <= unsigned(not(RESULT_I)) + '1'; -- Negative, change sign.
						end if;
				end case;
				--
				-- Remainder's sign = DIVISOR's sign:
				if OP = DIVS and OP_SIZE = LONG and DIV_MUL_32n64 = '1' and OP_IN_D_HI(31) = '1' then
					RESULT_II(31 downto 0) <= unsigned(not(DIVIDEND(31 downto 0))) + '1';
				elsif OP = DIVS and DIV_MUL_32n64 = '0' and OP_IN_D_LO(31) = '1' then
					RESULT_II(31 downto 0) <= unsigned(not(DIVIDEND(31 downto 0))) + '1';
				else
					RESULT_II(31 downto 0) <= DIVIDEND(31 downto 0);
				end if;
			end if;
		end if;
	end process MUL_DIV_BUFFER;

	MUL_REGs: process(RESETn, CLK, MUL_CYC_CNT, MUL_STATE)
	-- This unit provides on the one hand the state register for the
	-- multiplier state machine and on the other hand the progress
	-- control in form of the cycle counter MUL_CYC_CNT.
	begin
		if RESETn = '0' then
			MUL_CYC_CNT <= "000000";
			MUL_STATE <= MUL_IDLE;
		elsif CLK = '1' and CLK' event then
			--
			MUL_STATE <= NEXT_MUL_STATE;
			--
			-- Cycle counter arithmetic:
			if (OP = MULS or OP = MULU) and OP_START = '1' then
				MUL_CYC_CNT <= "100000";
			elsif MUL_STATE = MUL_VERIFY_SHIFT and (OP_IN_D_LO = x"00000000" or OP_IN_S = x"00000000") then
				MUL_CYC_CNT <= "000000";
			elsif MUL_STATE = MUL_VERIFY_SHIFT then
				case MUL_CYC_CNT is
					when "000000" => null;
					when others => MUL_CYC_CNT <= MUL_CYC_CNT - '1';
				end case;
			end if;
		end if;
		--
		case MUL_CYC_CNT is
			when "000000" =>
				if MUL_STATE = MUL_IDLE then
					OP_MUL <= '0';
				else
					OP_MUL <= '1';
				end if;
			when others => OP_MUL <= '1';
		end case;
	end process MUL_REGs;

	MUL_DEC: process(MUL_STATE, OP_START, OP, RESULT_I, MUL_CYC_CNT, OP_IN_D_LO, OP_IN_S)
	--This is the process for the MULU and MULS operation.
	-- This multiplier provides the WORD format as also the LONG formats of the 68K20+.
	-- The algorithm for this multiplication is partly taken from:
	-- http://mandalex.manderby.com/i/integerarithmetik.php?id=94, dated September, 2006.
	-- The site is in German language.
	begin
		case MUL_STATE is
			when MUL_IDLE =>
				if (OP = MULS or OP = MULU) and OP_START = '1' then
					NEXT_MUL_STATE <= MUL_VERIFY_SHIFT;
				else
					NEXT_MUL_STATE <= MUL_IDLE;
				end if;
			when MUL_VERIFY_SHIFT =>
				if OP_IN_D_LO = x"00000000" or OP_IN_S = x"00000000" then
					NEXT_MUL_STATE <= MUL_IDLE; -- Product is zero.
				elsif RESULT_I(0) = '1' then
					NEXT_MUL_STATE <= MUL_ADD;
				else
					case MUL_CYC_CNT is
						when "000000" =>
							NEXT_MUL_STATE <= MUL_IDLE; -- Finished.
						when others =>
							NEXT_MUL_STATE <= MUL_VERIFY_SHIFT; -- Go on.
					end case;
				end if;
			when MUL_ADD =>
				NEXT_MUL_STATE <= MUL_VERIFY_SHIFT;
		end case;
	end process MUL_DEC;

	DIV_REGs: process(RESETn, CLK)
	-- This unit provides the state register for the divider
	-- state machine.
	begin
		if RESETn = '0' then
			DIV_STATE <= DIV_IDLE;
		elsif CLK = '1' and CLK' event then
			DIV_STATE <= NEXT_DIV_STATE;
			-- MSB for overflow check:
			-- During adding a value to the RESULT_I, one operand is ADR_VAR and the other
			-- one is RESULT_I itself. For overflow checking, it is therefore required to store
			-- the old RESULT_I operand's MSB.
			if OP_START = '1' then
				DIV_OLD_MSB <= '0';
			elsif DIV_STATE = DIV_ADDSUB and OP = DIVS then
				case OP_SIZE is
					when LONG =>
						DIV_OLD_MSB <= RESULT_I(30);
					when others => -- Word.
						DIV_OLD_MSB <= RESULT_I(14);
				end case;
			elsif DIV_STATE = DIV_ADDSUB then
				case OP_SIZE is
					when LONG =>
						DIV_OLD_MSB <= RESULT_I(31);
					when others => -- Word.
						DIV_OLD_MSB <= RESULT_I(15);
				end case;
			end if;
		end if;
	end process DIV_REGs;

	DIV_DEC: process(DIV_STATE, OP_START, OP, OP_IN_S, DIVIDEND, DIVISOR, RESULT_I, OP_SIZE, DIV_VAR, DIV_OLD_MSB)
	-- This is the process for the DIVU and DIVS operation. The division is always done
	-- with the positive operands by loading the positive value or the 2s complement of the
	-- negative value. After the last computation step, the sign is taken into account to get
	-- the correct result.
	-- This divider provides the WORD format as also the LONG formats of the 68K20+.
	--
	-- The Registers are used as follows:
	-- Word:
	-- The DIVIDEND is located in the DIVIDEND register.
	-- The DIVISOR is located in lowest word of the DIVISOR register.
	-- The quotient is located in RESULT_I(15 downto 0).
	-- The remainder is located in RESULT_II(15 downto 0).
	-- The shift variable is located in DIV_VAR.
	-- LONG:
	-- The DIVIDEND is located in the DIVIDEND register (lower Word for 32 bit DIVIDEND).
	-- The DIVISOR is located in the lower half of the DIVISOR register.
	-- The quotient is located in RESULT_I
	-- The remainder is located in RESULT_II
	-- The shift variable is located in DIV_VAR.
	begin
		-- Default assignments:
		DIV_SHIFT_EN <= '0';
		OP_DIV <= '1';

		case DIV_STATE is
			when DIV_IDLE =>
				if (OP = DIVS or OP = DIVU) and OP_START = '1' and OP_IN_S = x"00000000" then
					NEXT_DIV_STATE <= DIV_IDLE; -- Divide by zero -> Trap.
				elsif (OP = DIVS or OP = DIVU) and OP_START = '1' then
					NEXT_DIV_STATE <= DIV_VERIFY;
				else
					NEXT_DIV_STATE <= DIV_IDLE;
				end if;
				OP_DIV <= '0';
			when DIV_VERIFY =>
				-- Check overflow:
				-- The variable ADR_VAR carries only one bit with a value of '1' at the same time.
				-- Therefore the overflow can be detected by looking at the old MSB and the new one.
				if OP_SIZE = LONG and OP = DIVS and DIV_OLD_MSB = '1' and RESULT_I(30) = '0' then
					NEXT_DIV_STATE <= DIV_IDLE; -- Break due to overflow.
				elsif OP_SIZE = WORD and OP = DIVS and DIV_OLD_MSB = '1' and RESULT_I(14) = '0' then
					NEXT_DIV_STATE <= DIV_IDLE; -- Break due to overflow.
				elsif OP_SIZE = LONG and OP = DIVU and DIV_OLD_MSB = '1' and RESULT_I(31) = '0' then
					NEXT_DIV_STATE <= DIV_IDLE; -- Break due to overflow.
				elsif OP_SIZE = WORD and OP = DIVU and DIV_OLD_MSB = '1' and RESULT_I(15) = '0' then
					NEXT_DIV_STATE <= DIV_IDLE; -- Break due to overflow.
				elsif DIVIDEND < DIVISOR then
					NEXT_DIV_STATE <= DIV_SIGN;
				--
				-- A ADDSUB operation takes place, when the shifted result
				-- would be greater than the current remainder. Otherwise, there
				-- takes place a shift operation.
				elsif DIVISOR(63 downto 0) & '0' > '0' & DIVIDEND then
					NEXT_DIV_STATE <= DIV_ADDSUB;
				else -- Shift condition:
					if OP_SIZE = LONG and DIV_VAR(31) = '1' then
						NEXT_DIV_STATE <= DIV_IDLE; -- Break due to DIV_VAR overflow.
					elsif OP_SIZE = WORD and DIV_VAR(15) = '1' then
						NEXT_DIV_STATE <= DIV_IDLE; -- Break due to DIV_VAR overflow.
					else
						NEXT_DIV_STATE <= DIV_VERIFY;
						DIV_SHIFT_EN <= '1'; -- Shift operation enabled.
					end if;
				end if;
			when DIV_ADDSUB =>
				NEXT_DIV_STATE <= DIV_VERIFY;
			when DIV_SIGN =>
				-- Set the sign and computate the 2s complement of the quotient and the
				-- remainder, when necessary. See result buffer.
				NEXT_DIV_STATE <= DIV_IDLE;
		end case;
	end process DIV_DEC;

	OV_DIV <= 	'1' when OP_SIZE = LONG and DIV_VAR(31) = '1' else 
				'1' when OP_SIZE = WORD and DIV_VAR(15) = '1' else
				'1' when OP_SIZE = LONG and OP = DIVS and DIV_OLD_MSB = '1' and RESULT_I(30) = '0' else
				'1' when OP_SIZE = WORD and OP = DIVS and DIV_OLD_MSB = '1' and RESULT_I(14) = '0' else
				'1' when OP_SIZE = LONG and OP = DIVU and DIV_OLD_MSB = '1' and RESULT_I(31) = '0' else
				'1' when OP_SIZE = WORD and OP = DIVU and DIV_OLD_MSB = '1' and RESULT_I(15) = '0' else '0';
end BEHAVIOR;
