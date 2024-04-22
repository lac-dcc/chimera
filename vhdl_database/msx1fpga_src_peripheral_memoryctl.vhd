-------------------------------------------------------------------------------
--
-- MSX1 FPGA project
--
-- Copyright (c) 2016, Fabio Belavenuto (belavenuto@gmail.com)
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
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoryctl is
	generic (
		ramsize_g				: integer								:= 512	-- 512, 2048 or 8192
	);
	port (
		cpu_addr_i				: in  std_logic_vector(15 downto 0);
		use_rom_in_ram_i		: in  std_logic;
		--
		rom_cs_n_i				: in  std_logic;
		extrom_cs_n_i			: in  std_logic;
		xb2rom_cs_n_i			: in  std_logic;
		nxt_rom_cs_n_i			: in  std_logic;
		nxt_rom_page_i			: in  std_logic_vector( 2 downto 0);
		ipl_cs_n_i				: in  std_logic;
		ipl_rampage_i			: in  std_logic_vector( 8 downto 0);
		mr_ram_cs_n_i			: in  std_logic;
		mr_ram_addr_i			: in  std_logic_vector(19 downto 0);				-- 1MB
		ram_cs_n_i				: in  std_logic;
		ram_page_i				: in  std_logic_vector( 7 downto 0);
		--
		ram_addr_o				: out std_logic_vector(22 downto 0);				-- Max 8MB
		mapper_mask_o			: out std_logic_vector( 7 downto 0)
	);
end entity;

architecture Behavior of memoryctl is

begin

	m512: if ramsize_g = 512 generate

		-- RAM map
		-- Address Range		System			Size	A22-A14		IPL Pages range
		-- 00 0000-01 FFFF		NEXTOR			128K	0000 00xxx	000-007
		-- 02 0000-03 FFFF		Mapper RAM		128K	0000 01xxx	008-00F
		-- 04 0000-07 FFFF		SCC/Megaram		256K	0000 1xxxx	010-01F
		--	OR
		-- 04 0000-05 FFFF		SCC/Megaram		128K	0000 10xxx	020-023
		-- 06 0000-07 7FFF		(empty)			96K		0000 11...	024-029
		-- 07 8000-07 FFFF		ROM				32K		0000 1111x	01E-01F

		process (nxt_rom_cs_n_i, ipl_cs_n_i, cpu_addr_i, nxt_rom_page_i,
					ram_page_i, ipl_rampage_i, ram_cs_n_i, mr_ram_addr_i,
					use_rom_in_ram_i, mr_ram_cs_n_i, rom_cs_n_i)
		begin
			ram_addr_o <= (others => '0');

			if nxt_rom_cs_n_i = '0' then														-- Nextor
				ram_addr_o <= "000000" & nxt_rom_page_i & cpu_addr_i(13 downto 0);
			elsif ipl_cs_n_i = '0' and cpu_addr_i(15 downto 13) = "001" then					-- RAM 8K (IPL) ($2000-$3FFF)
				ram_addr_o <= "000001111" & cpu_addr_i(13 downto 0);
			elsif ipl_cs_n_i = '0' and cpu_addr_i(15) = '1' then								-- All RAM (IPL) ($8000-$FFFF)
				ram_addr_o <= "0000" & ipl_rampage_i(4 downto 0) & cpu_addr_i(13 downto 0);
			elsif mr_ram_cs_n_i = '0' then														-- SCC/Megaram (only 128 or 256K)
				if use_rom_in_ram_i = '1' then
					ram_addr_o <= "000010" & mr_ram_addr_i(16 downto 0);						
				else
					ram_addr_o <= "00001" & mr_ram_addr_i(17 downto 0);
				end if;
			elsif rom_cs_n_i = '0' and use_rom_in_ram_i = '1' then								-- ROM
				ram_addr_o <= "00001111" & cpu_addr_i(14 downto 0);
			elsif ram_cs_n_i = '0' then															-- Mapper (only 128K)
				ram_addr_o <= "000001" & ram_page_i(2 downto 0)  & cpu_addr_i(13 downto 0);
			else
				null;
			end if;
		end process;

		mapper_mask_o	<= "00000111";	-- 128K

	end generate;
	
	m2M: if ramsize_g = 2048 generate
	
		-- RAM map
		-- Address Range		System			Size	A22-A14		IPL Pages range
		-- 00 0000-00 7FFF		ROM BIOS		32K		00 000000x	000-001
		-- 00 8000-00 BFFF		EXT ROM			16K		00 0000010	002-002
		-- 00 C000-00 FFFF		XBASIC2 ROM		16K		00 0000011	003-003
		-- 01 0000-01 FFFF		(empty)			64K		00 00001xx	004-007
		-- 02 0000-03 FFFF		Nextor ROM		128K	00 0001xxx	008-00F
		-- 04 0000-07 FFFF		(empty)			256K	00 001xxxx	010-01F
		-- 08 0000-0F FFFF		ESCCI			512K	00 01xxxxx	020-03F
		-- 10 0000-1F FFFF		RAM Mapper		1MB		00 1xxxxxx	040-07F

		process (nxt_rom_cs_n_i, ipl_cs_n_i, cpu_addr_i, nxt_rom_page_i,
					ram_page_i, ipl_rampage_i, ram_cs_n_i, mr_ram_addr_i,
					use_rom_in_ram_i, mr_ram_cs_n_i, rom_cs_n_i, extrom_cs_n_i,
					xb2rom_cs_n_i)
		begin
			ram_addr_o <= (others => '0');

			if rom_cs_n_i = '0' then																-- ROM
				ram_addr_o <= "00000000" & cpu_addr_i(14 downto 0);
			elsif extrom_cs_n_i = '0' then															-- Extension ROM
				ram_addr_o <= "000000010" & cpu_addr_i(13 downto 0);
			elsif xb2rom_cs_n_i = '0' then															-- XBASIC2 ROM
				ram_addr_o <= "000000011" & cpu_addr_i(13 downto 0);
			elsif nxt_rom_cs_n_i = '0' then															-- Nextor
				ram_addr_o <= "000001" & nxt_rom_page_i & cpu_addr_i(13 downto 0);
			elsif mr_ram_cs_n_i = '0' then															-- SCC/Megaram (only 512K)
				ram_addr_o <= "0001" & mr_ram_addr_i(18 downto 0);
			elsif ram_cs_n_i = '0' then																-- Mapper (only 1MB)
				ram_addr_o <= "001" & ram_page_i(5 downto 0)  & cpu_addr_i(13 downto 0);
			elsif ipl_cs_n_i = '0' and cpu_addr_i(15 downto 13) = "001" then						-- RAM 8K (IPL) ($2000-$3FFF)
				ram_addr_o <= "001111111" & cpu_addr_i(13 downto 0);
			elsif ipl_cs_n_i = '0' and cpu_addr_i(15) = '1' then									-- All RAM (IPL) ($8000-$FFFF)
				ram_addr_o <= "00" & ipl_rampage_i(6 downto 0) & cpu_addr_i(13 downto 0);
			else
				null;
			end if;
		end process;

		mapper_mask_o	<= "00111111";		-- 1MB

	end generate;


	m8M: if ramsize_g = 8192 generate

		-- RAM map
		-- Address Range		System			Size	A22-A14		IPL Pages range
		-- 00 0000-00 7FFF		ROM BIOS		32K		00 000000x	000-001
		-- 00 8000-00 BFFF		EXT ROM			16K		00 0000010	002-002
		-- 00 C000-00 FFFF		XBASIC2 ROM		16K		00 0000011	003-003
		-- 01 0000-01 FFFF		(empty)			64K		00 00001xx	004-007
		-- 02 0000-03 FFFF		Nextor ROM		128K	00 0001xxx	008-00F
		-- 04 0000-07 FFFF		(empty)			256K	00 001xxxx	010-01F
		-- 08 0000-0F FFFF		(empty)			512K	00 01xxxxx	020-03F
		-- 10 0000-1F FFFF		ESCCI			1MB		00 1xxxxxx	040-07F
		-- 20 0000-3F FFFF		(empty)			2MB		01 xxxxxxx	080-0FF
		-- 40 0000-7F FFFF		RAM Mapper		4MB		1x xxxxxxx	100-1FF

		process (nxt_rom_cs_n_i, ipl_cs_n_i, cpu_addr_i, nxt_rom_page_i,
					ram_page_i, ipl_rampage_i, ram_cs_n_i, mr_ram_addr_i,
					mr_ram_cs_n_i, rom_cs_n_i, extrom_cs_n_i, xb2rom_cs_n_i)
		begin
			ram_addr_o <= (others => '0');

			if rom_cs_n_i = '0' then																-- ROM
				ram_addr_o <= "00000000" & cpu_addr_i(14 downto 0);
			elsif extrom_cs_n_i = '0' then															-- Extension ROM
				ram_addr_o <= "000000010" & cpu_addr_i(13 downto 0);
			elsif xb2rom_cs_n_i = '0' then															-- XBASIC2 ROM
				ram_addr_o <= "000000011" & cpu_addr_i(13 downto 0);
			elsif nxt_rom_cs_n_i = '0' then															-- Nextor
				ram_addr_o <= "000001" & nxt_rom_page_i & cpu_addr_i(13 downto 0);
			elsif mr_ram_cs_n_i = '0' then															-- SCC/Megaram
				ram_addr_o <= "001" & mr_ram_addr_i;
			elsif ram_cs_n_i = '0' then																-- Mapper
				ram_addr_o <= "1" & ram_page_i  & cpu_addr_i(13 downto 0);
			elsif ipl_cs_n_i = '0' and cpu_addr_i(15 downto 13) = "001" then						-- RAM 8K (IPL) ($2000-$3FFF)
				ram_addr_o <= "111111111" & cpu_addr_i(13 downto 0);
			elsif ipl_cs_n_i = '0' and cpu_addr_i(15) = '1' then									-- All RAM (IPL) ($8000-$FFFF)
				ram_addr_o <= ipl_rampage_i & cpu_addr_i(13 downto 0);
			else
				null;
			end if;
		end process;

		mapper_mask_o	<= "11111111";		-- 4MB

	end generate;

end architecture;
