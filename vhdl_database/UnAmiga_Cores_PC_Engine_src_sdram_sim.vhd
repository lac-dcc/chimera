-- Copyright (c) 2010 Gregory Estrade (greg@torlus.com)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sdram_sim is
	port(
		DRAM_ADDR	: in unsigned(11 downto 0);
		DRAM_BA_0	: in std_logic;
		DRAM_BA_1	: in std_logic;
		DRAM_CAS_N	: in std_logic;
		DRAM_CKE	: in std_logic;
		DRAM_CLK	: in std_logic;
		DRAM_CS_N	: in std_logic;
		DRAM_DQ		: inout unsigned(15 downto 0);
		DRAM_LDQM	: in std_logic;
		DRAM_RAS_N	: in std_logic;
		DRAM_UDQM	: in std_logic;
		DRAM_WE_N	: in std_logic		
	);
end sdram_sim;

architecture sim of sdram_sim is

type memory is array(natural range <>) of unsigned(15 downto 0);
signal RAMEXT : memory(0 to 2**(12+8) - 1) := (others => x"ffff"); -- 64KWords (32KWords 68000, 4KWords Z80)

signal row		: unsigned(11 downto 0);
signal sdrseq	: integer range 0 to 255;
signal data		: unsigned(15 downto 0);

signal address	: unsigned(12+8-1 downto 0);

begin
	
	DRAM_DQ <= RAMEXT(to_integer(address + 4 - sdrseq)) WHEN (sdrseq <= 4 AND sdrseq > 0) else "ZZZZZZZZZZZZZZZZ";
	-- DRAM_DQ <= "ZZZZZZZZZZZZZZZZ";
	
	process( DRAM_CLK )
	begin
		if rising_edge( DRAM_CLK ) then
			if sdrseq /= 0 then
				sdrseq <= sdrseq - 1;
			end if;
			
			if DRAM_RAS_N = '0' and DRAM_CAS_N = '1' then
				row <= DRAM_ADDR;
			end if;

			if DRAM_RAS_N = '1' and DRAM_CAS_N = '0' then				
				if DRAM_WE_N = '0' then
					if DRAM_LDQM = '0' then
						RAMEXT(to_integer(row & DRAM_ADDR(7 downto 0)))(7 downto 0) <= DRAM_DQ(7 downto 0);
					end if;
					if DRAM_UDQM = '0' then
						RAMEXT(to_integer(row & DRAM_ADDR(7 downto 0)))(15 downto 8) <= DRAM_DQ(15 downto 8);
					end if;
				else
					address <= row & DRAM_ADDR(7 downto 0);
					data <= RAMEXT(to_integer(row & DRAM_ADDR(7 downto 0)));
					sdrseq <= 4+2;
				end if;
			end if;
		
		end if;
	end process;
	
end sim;
