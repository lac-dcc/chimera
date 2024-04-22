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
---- This file contains the 68Ks data registers.                  ----
----                                                              ----
----                                                              ----
---- Description:                                                 ----
---- Contains the 68K00 data registers D0 to D7 and related logic ----
---- to perform byte, word and long data operations.              ----
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

entity WF68K00IP_DATA_REGISTERS is
	port (
		CLK				: in bit;
		RESETn			: in bit;

		-- Data lines:
		DATA_IN_A		: in std_logic_vector(31 downto 0);
		DATA_IN_B		: in std_logic_vector(31 downto 0);
		
		-- Registers controls:
		REGSEL_A		: in std_logic_vector(2 downto 0);
		REGSEL_B		: in std_logic_vector(2 downto 0);
		REGSEL_C		: in std_logic_vector(2 downto 0);
		DIV_MUL_32n64	: in bit;

		-- Data outputs A and B:
		DATA_OUT_A		: out std_logic_vector(31 downto 0);
		DATA_OUT_B		: out std_logic_vector(31 downto 0);
		DATA_OUT_C		: out std_logic_vector(31 downto 0);
		
		DR_EXG			: in bit; -- Exchange a data register.
		DR_DEC			: in bit; -- Decrement by 1.
		DR_WR			: in bit; -- Data register write control.
		OP				: in OP_68K00;
		OP_SIZE			: in OP_SIZETYPE;
		OP_MODE			: in std_logic_vector(4 downto 0);

		-- Miscellaneous:
		DBcc_COND		: out boolean -- Condition is true for Dn = -1.
		);
end entity WF68K00IP_DATA_REGISTERS;
	
architecture BEHAVIOR of WF68K00IP_DATA_REGISTERS is
type DR_TYPE is array(0 to 7) of std_logic_vector(31 downto 0);
signal DR			: DR_TYPE; -- Data registers D0 to D7.
signal DR_NR_A		: integer range 0 to 7;
signal DR_NR_B		: integer range 0 to 7;
signal DR_NR_C		: integer range 0 to 7;
begin
	-- Address pointers:
	DR_NR_A <= conv_integer(REGSEL_A);
	DR_NR_B <= conv_integer(REGSEL_B);
	DR_NR_C <= conv_integer(REGSEL_C);

	-- Output Multiplexer A and B:
	DATA_OUT_A <= DR(DR_NR_A);
	DATA_OUT_B <= DR(DR_NR_B);
	DATA_OUT_C <= DR(DR_NR_C);

	REGISTERS: process(RESETn, CLK, DR_NR_B, DR)
	-- This process provides data transfer to the respective registers (write).
	-- The MOVEM and MOVEQ require a sign extended source data. 
	-- The BYTE size is not allowed for MOVEM .
	begin
		if RESETn = '0' then
			for i in 0 to 7 loop
				DR(i) <= (others => '0');
			end loop;
		elsif CLK = '1' and CLK' event then
			if DR_WR = '1' then
 				if OP = DIVS or OP = DIVU then
					case OP_SIZE is
						when WORD =>
							DR(DR_NR_A) <= DATA_IN_A;
						when others => -- LONG.
							if DIV_MUL_32n64 = '0' and DR(DR_NR_A) = DR(DR_NR_B) then -- Long 1.
								DR(DR_NR_A) <= DATA_IN_A; -- Quotient returned.
							else -- Long 2, 3.
								DR(DR_NR_A) <= DATA_IN_A;
								DR(DR_NR_B) <= DATA_IN_B;
							end if;
					end case;
 				elsif OP = MULS or OP = MULU then
					if OP_SIZE = WORD then
						DR(DR_NR_A) <= DATA_IN_A;
					elsif DIV_MUL_32n64 = '0' then -- Long 1.
						DR(DR_NR_A) <= DATA_IN_A;
					else -- Long 2.
						DR(DR_NR_A) <= DATA_IN_A;
						DR(DR_NR_B) <= DATA_IN_B;
					end if;
				elsif OP = MOVE or OP = MOVEP then
					case OP_SIZE is
						when LONG => DR(DR_NR_A) <= DATA_IN_A;
						when WORD => DR(DR_NR_A)(15 downto 0) <= DATA_IN_A(15 downto 0);
						when BYTE => DR(DR_NR_A)(7 downto 0) <= DATA_IN_A(7 downto 0);
					end case;
				elsif OP = MOVEQ then -- Sign extended.
					for i in 31 downto 8 loop
						DR(DR_NR_B)(i) <= DATA_IN_B(7);
					end loop;
					DR(DR_NR_B)(7 downto 0) <= DATA_IN_B(7 downto 0);
				elsif OP = MOVEM then -- Sign extended.
					if OP_SIZE = WORD then
						for i in 31 downto 16 loop
							DR(DR_NR_B)(i) <= DATA_IN_B(15);
						end loop;
						DR(DR_NR_B)(15 downto 0) <= DATA_IN_B(15 downto 0);
					else
						DR(DR_NR_B) <= DATA_IN_B;
					end if;
				elsif OP = EXTW or OP = SWAP then
					DR(DR_NR_B) <= DATA_IN_B;
				else
					-- Depending on the size to be written, not all bits of a register
					-- are affected.
					case OP_SIZE is
						when LONG => DR(DR_NR_B) <= DATA_IN_B;
						when WORD => DR(DR_NR_B)(15 downto 0) <= DATA_IN_B(15 downto 0);
						when Byte => DR(DR_NR_B)(7 downto 0) <= DATA_IN_B(7 downto 0);
					end case;
				end if;
			-- Exchange the content of data registers:
			elsif DR_EXG = '1' and OP_MODE = "01000" then -- Exchange two data registers.
				DR(DR_NR_B) <= DATA_IN_A;
				DR(DR_NR_A) <= DATA_IN_B;
			elsif DR_EXG = '1' and OP_MODE = "10001" then -- Exchange a data and an address register.
				DR(DR_NR_A) <= DATA_IN_A;
			-- And decrement:
			elsif DR_DEC = '1' then
				DR(DR_NR_B)(15 downto 0) <= DR(DR_NR_B)(15 downto 0) - '1'; -- Used by the DBcc operation.
			end if;
		end if;
		-- Test condition for the DBcc operation:
		case DR(DR_NR_B)(15 downto 0) is
			when x"FFFF" => DBcc_COND <= true; -- This is signed -1.
			when others => DBcc_COND <= false;
		end case;
	end process REGISTERS;
end BEHAVIOR;
