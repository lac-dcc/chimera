--	(c) 2020 d18c7db(a)hotmail
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses
--

library ieee;
	use ieee.std_logic_1164.all;

-- ROMs organized as 512K x 16
entity ROMS_EXT is
	port(
		CLK		: in	std_logic;
		ENA		: in	std_logic;
		ADDR		: in	std_logic_vector(20 downto 0);
		DATA		: out	std_logic_vector(15 downto 0)
	);
end ROMS_EXT;

architecture RTL of ROMS_EXT is
	signal
		slv_ROM_1A,
		slv_ROM_1L,
		slv_ROM_2A,
		slv_ROM_2L,
		slv_ROM_1B,
		slv_ROM_1MN,
		slv_ROM_2B,
		slv_ROM_2MN,
		slv_ROM_1C,
		slv_ROM_1P,
		slv_ROM_2C,
		slv_ROM_2P,
		slv_ROM_1R,
		slv_ROM_1D,
		slv_ROM_2R,
		slv_ROM_2D,
		slv_ROM_1ST,
		slv_ROM_1EF,
		slv_ROM_2ST,
		slv_ROM_2EF,
		slv_ROM_1U,
		slv_ROM_1J,
		slv_ROM_2U,
		slv_ROM_2J,
		slv_ROM_3A,
		slv_ROM_3B,
		slv_ROM_5A,
		slv_ROM_5B,
		slv_ROM_6A,
		slv_ROM_6B,
		slv_ROM_7A,
		slv_ROM_7B,
		slv_ROM_9A,
		slv_ROM_9B,
		slv_ROM_10A,
		slv_ROM_10B,
		slv_ROM_16R,
		slv_ROM_16S
								: std_logic_vector( 7 downto 0) := (others=>'1');
begin
		-- top 6 address bits map each ROM into external memory space
	DATA <=
		slv_ROM_1L  & slv_ROM_1A  when ADDR(20 downto 15)="000000"  and ENA = '1' else -- 00000-07FFF 32K-32K GS0 plane 1, 0
		slv_ROM_1MN & slv_ROM_1B  when ADDR(20 downto 15)="000001"  and ENA = '1' else -- 08000-0FFFF 32K-32K GS1 plane 1, 0
		slv_ROM_1P  & slv_ROM_1C  when ADDR(20 downto 15)="000010"  and ENA = '1' else -- 10000-17FFF 32K-32K GS2 plane 1, 0
		slv_ROM_1R  & slv_ROM_1D  when ADDR(20 downto 15)="000011"  and ENA = '1' else -- 18000-1FFFF 32K-32K GS3 plane 1, 0
		slv_ROM_1ST & slv_ROM_1EF when ADDR(20 downto 15)="000100"  and ENA = '1' else -- 20000-27FFF 32K-32K GS4 plane 1, 0
		slv_ROM_1U  & slv_ROM_1J  when ADDR(20 downto 15)="000101"  and ENA = '1' else -- 28000-2FFFF 32K-32K GS5 plane 1, 0

		slv_ROM_2L  & slv_ROM_2A  when ADDR(20 downto 15)="001000"  and ENA = '1' else -- 40000-47FFF 32K-32K GS0 plane 3, 2
		slv_ROM_2MN & slv_ROM_2B  when ADDR(20 downto 15)="001001"  and ENA = '1' else -- 48000-4FFFF 32K-32K GS1 plane 3, 2
		slv_ROM_2P  & slv_ROM_2C  when ADDR(20 downto 15)="001010"  and ENA = '1' else -- 50000-57FFF 32K-32K GS2 plane 3, 2
		slv_ROM_2R  & slv_ROM_2D  when ADDR(20 downto 15)="001011"  and ENA = '1' else -- 58000-5FFFF 32K-32K GS3 plane 3, 2
		slv_ROM_2ST & slv_ROM_2EF when ADDR(20 downto 15)="001100"  and ENA = '1' else -- 60000-67FFF 32K-32K GS4 plane 3, 2
		slv_ROM_2U  & slv_ROM_2J  when ADDR(20 downto 15)="001101"  and ENA = '1' else -- 68000-6FFFF 32K-32K GS5 plane 3, 2

		slv_ROM_9A  & slv_ROM_9B  when ADDR(20 downto 15)="010000"  and ENA = '1' else -- 80000-87FFF 32K-32K ROM0
		slv_ROM_10A & slv_ROM_10B when ADDR(20 downto 15)="010011"  and ENA = '1' else -- 88000-8FFFF 16K-16K SLAP
		slv_ROM_7A  & slv_ROM_7B  when ADDR(20 downto 15)="010100"  and ENA = '1' else -- 90000-97FFF 32K-32K ROM1
		slv_ROM_6A  & slv_ROM_6B  when ADDR(20 downto 15)="010101"  and ENA = '1' else -- 98000-9FFFF 32K-32K ROM2
		slv_ROM_5A  & slv_ROM_5B  when ADDR(20 downto 15)="010110"  and ENA = '1' else -- A0000-A7FFF 32K-32K ROM3
		slv_ROM_3A  & slv_ROM_3B  when ADDR(20 downto 15)="010111"  and ENA = '1' else -- A8000-AFFFF 32K-32K ROM4
		slv_ROM_16R & slv_ROM_16S when ADDR(20 downto 15)="011000"  and ENA = '1' else -- B0000-B7FFF 16K-32K Audio
		(others=>'1');

	-- Vindicators II ROMs

	-- VIDEO ROMS
	ROM_1A  : entity work.ROM_1A  port map ( CLK=>CLK, DATA=>slv_ROM_1A , ADDR=>ADDR(14 downto 0) );
	ROM_1B  : entity work.ROM_1B  port map ( CLK=>CLK, DATA=>slv_ROM_1B , ADDR=>ADDR(14 downto 0) );
	ROM_1C  : entity work.ROM_1C  port map ( CLK=>CLK, DATA=>slv_ROM_1C , ADDR=>ADDR(14 downto 0) );
	ROM_1D  : entity work.ROM_1D  port map ( CLK=>CLK, DATA=>slv_ROM_1D , ADDR=>ADDR(14 downto 0) );
	ROM_1EF : entity work.ROM_1EF port map ( CLK=>CLK, DATA=>slv_ROM_1EF, ADDR=>ADDR(14 downto 0) );
	ROM_1J  : entity work.ROM_1J  port map ( CLK=>CLK, DATA=>slv_ROM_1J , ADDR=>ADDR(14 downto 0) );
	ROM_1L  : entity work.ROM_1L  port map ( CLK=>CLK, DATA=>slv_ROM_1L , ADDR=>ADDR(14 downto 0) );
	ROM_1MN : entity work.ROM_1MN port map ( CLK=>CLK, DATA=>slv_ROM_1MN, ADDR=>ADDR(14 downto 0) );
	ROM_1P  : entity work.ROM_1P  port map ( CLK=>CLK, DATA=>slv_ROM_1P , ADDR=>ADDR(14 downto 0) );
	ROM_1R  : entity work.ROM_1R  port map ( CLK=>CLK, DATA=>slv_ROM_1R , ADDR=>ADDR(14 downto 0) );
	ROM_1ST : entity work.ROM_1ST port map ( CLK=>CLK, DATA=>slv_ROM_1ST, ADDR=>ADDR(14 downto 0) );
	ROM_1U  : entity work.ROM_1U  port map ( CLK=>CLK, DATA=>slv_ROM_1U , ADDR=>ADDR(14 downto 0) );
	ROM_2A  : entity work.ROM_2A  port map ( CLK=>CLK, DATA=>slv_ROM_2A , ADDR=>ADDR(14 downto 0) );
	ROM_2B  : entity work.ROM_2B  port map ( CLK=>CLK, DATA=>slv_ROM_2B , ADDR=>ADDR(14 downto 0) );
	ROM_2C  : entity work.ROM_2C  port map ( CLK=>CLK, DATA=>slv_ROM_2C , ADDR=>ADDR(14 downto 0) );
	ROM_2D  : entity work.ROM_2D  port map ( CLK=>CLK, DATA=>slv_ROM_2D , ADDR=>ADDR(14 downto 0) );
	ROM_2EF : entity work.ROM_2EF port map ( CLK=>CLK, DATA=>slv_ROM_2EF, ADDR=>ADDR(14 downto 0) );
	ROM_2J  : entity work.ROM_2J  port map ( CLK=>CLK, DATA=>slv_ROM_2J , ADDR=>ADDR(14 downto 0) );
	ROM_2L  : entity work.ROM_2L  port map ( CLK=>CLK, DATA=>slv_ROM_2L , ADDR=>ADDR(14 downto 0) );
	ROM_2MN : entity work.ROM_2MN port map ( CLK=>CLK, DATA=>slv_ROM_2MN, ADDR=>ADDR(14 downto 0) );
	ROM_2P  : entity work.ROM_2P  port map ( CLK=>CLK, DATA=>slv_ROM_2P , ADDR=>ADDR(14 downto 0) );
	ROM_2R  : entity work.ROM_2R  port map ( CLK=>CLK, DATA=>slv_ROM_2R , ADDR=>ADDR(14 downto 0) );
	ROM_2ST : entity work.ROM_2ST port map ( CLK=>CLK, DATA=>slv_ROM_2ST, ADDR=>ADDR(14 downto 0) );
	ROM_2U  : entity work.ROM_2U  port map ( CLK=>CLK, DATA=>slv_ROM_2U , ADDR=>ADDR(14 downto 0) );

	-- MAIN 68K ROMS
	ROM_3A  : entity work.ROM_3A  port map ( CLK=>CLK, DATA=>slv_ROM_3A,  ADDR=>ADDR(14 downto 0) );
	ROM_3B  : entity work.ROM_3B  port map ( CLK=>CLK, DATA=>slv_ROM_3B,  ADDR=>ADDR(14 downto 0) );
	ROM_5A  : entity work.ROM_5A  port map ( CLK=>CLK, DATA=>slv_ROM_5A,  ADDR=>ADDR(14 downto 0) );
	ROM_5B  : entity work.ROM_5B  port map ( CLK=>CLK, DATA=>slv_ROM_5B,  ADDR=>ADDR(14 downto 0) );
	ROM_6A  : entity work.ROM_6A  port map ( CLK=>CLK, DATA=>slv_ROM_6A,  ADDR=>ADDR(14 downto 0) );
	ROM_6B  : entity work.ROM_6B  port map ( CLK=>CLK, DATA=>slv_ROM_6B,  ADDR=>ADDR(14 downto 0) );
	ROM_7A  : entity work.ROM_7A  port map ( CLK=>CLK, DATA=>slv_ROM_7A,  ADDR=>ADDR(14 downto 0) );
	ROM_7B  : entity work.ROM_7B  port map ( CLK=>CLK, DATA=>slv_ROM_7B,  ADDR=>ADDR(14 downto 0) );
	ROM_9A  : entity work.ROM_9A  port map ( CLK=>CLK, DATA=>slv_ROM_9A,  ADDR=>ADDR(14 downto 0) );
	ROM_9B  : entity work.ROM_9B  port map ( CLK=>CLK, DATA=>slv_ROM_9B,  ADDR=>ADDR(14 downto 0) );
	ROM_10A : entity work.ROM_10A port map ( CLK=>CLK, DATA=>slv_ROM_10A, ADDR=>ADDR(13 downto 0) );
	ROM_10B : entity work.ROM_10B port map ( CLK=>CLK, DATA=>slv_ROM_10B, ADDR=>ADDR(13 downto 0) );

	-- AUDIO 6502 ROMS
	ROM_16R : entity work.ROM_16R port map ( CLK=>CLK, DATA=>slv_ROM_16R, ADDR=>ADDR(13 downto 0) );
	ROM_16S : entity work.ROM_16S port map ( CLK=>CLK, DATA=>slv_ROM_16S, ADDR=>ADDR(14 downto 0) );
end RTL;
