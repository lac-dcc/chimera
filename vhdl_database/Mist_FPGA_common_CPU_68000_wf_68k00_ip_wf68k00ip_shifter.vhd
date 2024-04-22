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
---- This file contains the 68Ks shifter unit.                    ----
----                                                              ----
----                                                              ----
---- Description:                                                 ----
---- This module performs the shifting operations ASL, ASR, LSL,  ----
---- LSR, ROL, ROR, ROXL and ROXR as also the bit manipulation    ----
---- and test operations BCHG, BCLR, BSET and BTST.               ----
---- The timing of the core is as follows:                        ----
---- All bit manipulation operations are performed by concurrent  ----
---- statement modelling which results in immediate bit process-  ----
---- ing. Thus, the result is valid one clock cycle after the     ----
---- settings for the operands are stable.
---- The shift and rotate operations start with SHIFTER_LOAD.     ----
---- The data processing time is depending on the selected number ----
---- of bits and is indicated by the SHFT_BUSY flag. During       ----
---- SHFT_BUSY is asserted, the data calculation is in progress.  ----
---- The execution time for these operations is n clock           ----
---- cycles +2 where n is the desired number of shifts or rotates.----
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

entity WF68K00IP_SHIFTER is
	port (
		CLK				: in bit;
		RESETn			: in bit;

		DATA_IN			: in std_logic_vector(31 downto 0); -- Operand data.
		DATA_OUT		: out std_logic_vector(31 downto 0); -- Shifted operand.

		OP				: in OP_68K00;
		
		OP_SIZE			: in OP_SIZETYPE; -- The operand's size.
		BIT_POS			: in std_logic_vector(4 downto 0); -- Bit position control.
		CNT_NR			: in std_logic_vector(5 downto 0); -- Count control.
		
		-- Progress controls:
		SHFT_BREAKn		: in bit;
		SHIFTER_LOAD	: in bit; -- Strobe of 1 clock pulse.
		SHFT_BUSY		: out bit;
		
		-- The FLAGS:
		XNZVC_IN		: in std_logic_vector(4 downto 0);
		XNZVC_OUT		: out std_logic_vector(4 downto 0)
		);
end entity WF68K00IP_SHIFTER;
	
architecture BEHAVIOR of WF68K00IP_SHIFTER is
type SHIFT_STATES is (IDLE, RUN);
signal SHIFT_STATE	: SHIFT_STATES;
signal BIT_OP		: std_logic_vector(31 downto 0);
signal SHFT_OP		: std_logic_vector(31 downto 0);
signal SHFT_EN		: bit;
signal SHFT_X		: std_logic;
begin
	-- Output multiplexer:
	with OP select
		DATA_OUT <= BIT_OP when BCHG | BCLR | BSET | BTST,
					SHFT_OP when others; -- Valid for ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR.

	BIT_PROC: process(BIT_POS, OP, BIT_OP, DATA_IN)
	-- Bit manipulation operations.
	variable BIT_POSITION	: integer range 0 to 31;
	begin
		BIT_POSITION := Conv_Integer(BIT_POS);
		--
		BIT_OP <= DATA_IN; -- The default is the unmanipulated data.
		--
		case OP is
			when BCHG =>
				BIT_OP(BIT_POSITION) <= not DATA_IN(BIT_POSITION);
			when BCLR =>
				BIT_OP(BIT_POSITION) <= '0';
			when BSET =>
				BIT_OP(BIT_POSITION) <= '1';
			when others => 
				BIT_OP <= DATA_IN; -- Dummy, no result required for BTST.
		end case;
	end process BIT_PROC;

	SHIFTER: process(RESETn, CLK)
	begin
		if RESETn = '0' then
			SHFT_OP <= (others => '0');
		elsif CLK = '1' and CLK' event then
			if SHIFTER_LOAD = '1' then -- Load data in the shifter unit.
				SHFT_OP <= DATA_IN; -- Load data for the shift or rotate operations.
			elsif SHFT_EN = '1' then -- Shift and rotate operations:
				case OP is
					when ASL =>
						if OP_SIZE = LONG then
							SHFT_OP <= SHFT_OP(30 downto 0) & '0';
						elsif OP_SIZE = WORD then
							SHFT_OP <= x"0000" & SHFT_OP(14 downto 0) & '0';
						else -- OP_SIZE = BYTE.
							SHFT_OP <= x"000000" & SHFT_OP(6 downto 0) & '0';
						end if;
					when ASR =>
						if OP_SIZE = LONG then
							SHFT_OP <= SHFT_OP(31) & SHFT_OP(31 downto 1);
						elsif OP_SIZE = WORD then
							SHFT_OP <= x"0000" & SHFT_OP(15) & SHFT_OP(15 downto 1);
						else -- OP_SIZE = BYTE.
							SHFT_OP <= x"000000" & SHFT_OP(7) & SHFT_OP(7 downto 1);
						end if;
					when LSL =>
						if OP_SIZE = LONG then
							SHFT_OP <= SHFT_OP(30 downto 0) & '0';
						elsif OP_SIZE = WORD then
							SHFT_OP <= x"0000" & SHFT_OP(14 downto 0) & '0';
						else -- OP_SIZE = BYTE.
							SHFT_OP <= x"000000" & SHFT_OP(6 downto 0) & '0';
						end if;
					when LSR =>
						if OP_SIZE = LONG then
							SHFT_OP <= '0' & SHFT_OP(31 downto 1);
						elsif OP_SIZE = WORD then
							SHFT_OP <= x"0000" & '0' & SHFT_OP(15 downto 1);
						else -- OP_SIZE = BYTE.
							SHFT_OP <= x"000000" & '0' & SHFT_OP(7 downto 1);
						end if;
					when ROTL =>
						if OP_SIZE = LONG then
							SHFT_OP <= SHFT_OP(30 downto 0) & SHFT_OP(31);
						elsif OP_SIZE = WORD then
							SHFT_OP <= x"0000" & SHFT_OP(14 downto 0) & SHFT_OP(15);
						else -- OP_SIZE = BYTE.
							SHFT_OP <= x"000000" & SHFT_OP(6 downto 0) & SHFT_OP(7);
						end if;
						-- X not affected;
					when ROTR =>
						if OP_SIZE = LONG then
							SHFT_OP <= SHFT_OP(0) & SHFT_OP(31 downto 1);
						elsif OP_SIZE = WORD then
							SHFT_OP <= x"0000" & SHFT_OP(0) & SHFT_OP(15 downto 1);
						else -- OP_SIZE = BYTE.
							SHFT_OP <= x"000000" & SHFT_OP(0) & SHFT_OP(7 downto 1);
						end if;
						-- X not affected;
					when ROXL =>
						if OP_SIZE = LONG then
							SHFT_OP <= SHFT_OP(30 downto 0) & SHFT_X;
						elsif OP_SIZE = WORD then
							SHFT_OP <= x"0000" & SHFT_OP(14 downto 0) & SHFT_X;
						else -- OP_SIZE = BYTE.
							SHFT_OP <= x"000000" & SHFT_OP(6 downto 0) & SHFT_X;
						end if;
					when ROXR =>
						if OP_SIZE = LONG then
							SHFT_OP <= SHFT_X & SHFT_OP(31 downto 1);
						elsif OP_SIZE = WORD then
							SHFT_OP <= x"0000" & SHFT_X & SHFT_OP(15 downto 1);
						else -- OP_SIZE = BYTE.
							SHFT_OP <= x"000000" & SHFT_X & SHFT_OP(7 downto 1);
						end if;
					when others => null; -- Unaffected, forbidden.
				end case;
			end if;
		end if;
	end process SHIFTER;

	P_SHFT_CTRL: process(RESETn, CLK, OP)
	-- The variable shift or rotate length requires a control
	-- to achieve the correct OPERAND manipulation. This
	-- process controls the shift process and asserts the
	-- SHFT_BUSY flag during shift or rotation.
	variable BIT_CNT	: std_logic_vector(5 downto 0);
	begin
		if RESETn = '0' then
			SHIFT_STATE <= IDLE;
			BIT_CNT := (others => '0');
			SHFT_EN <= '0';
			SHFT_BUSY <= '0';
		elsif CLK = '1' and CLK' event then
			if SHIFT_STATE = IDLE then
				if SHIFTER_LOAD = '1' and CNT_NR /= "000000" then
					SHIFT_STATE <= RUN;
					BIT_CNT := CNT_NR;
					SHFT_EN <= '1';
					SHFT_BUSY <= '1';
				else
					SHIFT_STATE <= IDLE;
					BIT_CNT := (others => '0');
					SHFT_EN <= '0';
					SHFT_BUSY <= '0';
				end if;
			elsif SHIFT_STATE = RUN then
				-- A break condition for SHFT_BREAKn = '0'
				-- occurs e.g. during interrupt handling.
				if BIT_CNT = "000001" or SHFT_BREAKn = '0' then
					SHIFT_STATE <= IDLE;
					BIT_CNT := CNT_NR;
					SHFT_EN <= '0';
					SHFT_BUSY <= '0';
				else
					SHIFT_STATE <= RUN;
					BIT_CNT := BIT_CNT - '1';
					SHFT_EN <= '1';
					SHFT_BUSY <= '1';
				end if;
			end if;
		end if;
	end process P_SHFT_CTRL;

	COND_CODES: process(BIT_POS, OP, XNZVC_IN, DATA_IN, OP_SIZE, SHFT_OP, SHFT_X, CNT_NR, RESETn, CLK)
	-- This process provides the flags for the shifter and the bit operations.
	-- The flags for the shifter are valid after the shift operation, when the
	-- SHFT_BUSY flag is not asserted. The flags of the bit operations are
	-- valid immediately due to the one clock cycle process time.
	variable BIT_POSITION	: integer range 0 to 31;
	variable SHFT_V			: std_logic;
	begin
		BIT_POSITION := Conv_Integer(BIT_POS); -- Valid during the bit manipulation operations:
		-- Negative and Zero flags:
		case OP is
			when BCHG | BCLR | BSET | BTST =>
				XNZVC_OUT(3 downto 2) <= XNZVC_IN(3) & not DATA_IN(BIT_POSITION);
			when ASL | ASR | LSL | LSR | ROTL | ROTR | ROXL | ROXR =>
				-- Negative flag:
				case OP_SIZE is
					when LONG => 
						XNZVC_OUT(3) <= SHFT_OP(31);
					when WORD => 
						XNZVC_OUT(3) <= SHFT_OP(15);
					when others => 
						XNZVC_OUT(3) <= SHFT_OP(7); -- Byte.
				end case;
				-- Zero flag:
				if OP_SIZE = LONG and SHFT_OP = x"00000000" then
					XNZVC_OUT(2) <= '1';
				elsif OP_SIZE = WORD and SHFT_OP(15 downto 0) = x"0000" then
					XNZVC_OUT(2) <= '1';
				elsif OP_SIZE = BYTE and SHFT_OP(7 downto 0) = x"00" then
					XNZVC_OUT(2) <= '1';
				else
					XNZVC_OUT(2) <= '0';
				end if;
			when others =>
				XNZVC_OUT(3 downto 2) <= XNZVC_IN(3 downto 2);
		end case;
		-- Extended, Overflow and Carry flags:
		if OP = BCHG or OP = BCLR or OP = BSET or OP = BTST then
			XNZVC_OUT(4) <= XNZVC_IN(4);
			XNZVC_OUT(1 downto 0) <= XNZVC_IN(1 downto 0);
		elsif (OP = ROXL or OP = ROXR) and CNT_NR = "000000" then
			XNZVC_OUT(4) <= XNZVC_IN(4);
			XNZVC_OUT(1 downto 0) <= '0' & XNZVC_IN(4);
		elsif CNT_NR = "000000" then
			XNZVC_OUT(4) <= XNZVC_IN(4);
			XNZVC_OUT(1 downto 0) <= "00";
		else
			-- Extended flag:
			case OP is
				when ASL | ASR | LSL | LSR | ROXL | ROXR =>
					XNZVC_OUT(4) <= SHFT_X;
				when others => -- Valid for ROTL, ROTR.
					XNZVC_OUT(4) <= XNZVC_IN(4); -- Unaffected.
			end case;
			-- Overflow flag:
            case OP is
                when ASL | ASR =>
                    XNZVC_OUT(1) <= SHFT_V;
                when others => -- Valid for LSL,LSR, ROL, ROR, ROXL, ROXR.
                    XNZVC_OUT(1) <= '0'; -- Unaffected.
            end case;
			-- Carry flag:
			XNZVC_OUT(0) <= SHFT_X;
		end if;
		--
		-- This register is a mirror for the X flag during the shift operation:
		-- It is used as X flag for the ASL, ASR, LSL, LSR, ROXL and ROXR operations
		-- as also as the C flag for all shift operations.
		if RESETn = '0' then
			SHFT_X <= '0';
		elsif CLK = '1' and CLK' event then
			if SHIFTER_LOAD = '1' then -- Load data in the shifter unit.
				SHFT_X <= XNZVC_IN(4);
			elsif SHFT_EN = '1' then -- Shift and rotate operations:
				case OP is
					when ASL | LSL | ROTL | ROXL =>
						case OP_SIZE is
							when LONG =>
								SHFT_X <= SHFT_OP(31);
							when WORD =>
								SHFT_X <= SHFT_OP(15);
							when BYTE =>
								SHFT_X <= SHFT_OP(7);
						end case;
					when others =>
						SHFT_X <= SHFT_OP(0);
				end case;
			end if;
		end if;
		--
		if RESETn = '0' then
			-- This process provides a detection of any toggling of the most significant
			-- bit of the shifter unit during the ASL shift process. For all other shift
			-- operations, the V flag is always zero.
			SHFT_V := '0';
		elsif CLK = '1' and CLK' event then
			if SHIFTER_LOAD = '1' then
				SHFT_V := '0';
			elsif SHFT_EN = '1' then
				case OP is
					when ASL => -- ASR MSB is always unchanged.
						if OP_SIZE = LONG then
							SHFT_V := (SHFT_OP(31) xor SHFT_OP(30)) or SHFT_V;
						elsif OP_SIZE = WORD then
							SHFT_V := (SHFT_OP(15) xor SHFT_OP(14)) or SHFT_V;
						else -- OP_SIZE = BYTE.
							SHFT_V := (SHFT_OP(7) xor SHFT_OP(6)) or SHFT_V;
						end if;
				when others =>
					SHFT_V := '0';
				end case;
			end if;
		end if;
	end process COND_CODES;
end BEHAVIOR;
