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
	use ieee.numeric_std.all;

entity CRAMS is
	port(
		I_MCKR				: in	std_logic;
		I_UDSn				: in	std_logic;
		I_LDSn				: in	std_logic;
		I_CRAMn				: in	std_logic;
		I_BR_Wn				: in	std_logic;
		I_CRA					: in	std_logic_vector( 9 downto 0);
		I_DB					: in	std_logic_vector(15 downto 0);
		O_DB					: out	std_logic_vector(15 downto 0)
	);
end CRAMS;

architecture RTL of CRAMS is
	signal
		sl_CRAM_CS_U,
		sl_CRAM_CS_L,
		sl_CRAMWRn
								: std_logic := '1';

	type RAM_ARRAY_1Kx8 is array (0 to 1023) of std_logic_vector(7 downto 0);
	signal CRAM_U : RAM_ARRAY_1Kx8:=(others=>(others=>'0'));
	signal CRAM_L : RAM_ARRAY_1Kx8:=(others=>(others=>'0'));
	-- Ask Xilinx synthesis to use block RAMs if possible
	attribute ram_style : string;
	attribute ram_style of CRAM_U : signal is "block";
	attribute ram_style of CRAM_L : signal is "block";
	-- Ask Quartus synthesis to use block RAMs if possible
	attribute ramstyle : string;
	attribute ramstyle of CRAM_U : signal is "M10K";
	attribute ramstyle of CRAM_L : signal is "M10K";
begin
	------------------------
	-- sheet 15 Color RAM --
	------------------------

	-- gates 7W, 11P
	sl_CRAM_CS_U	<= I_UDSn and (not I_CRAMn);
	sl_CRAM_CS_L	<= I_LDSn and (not I_CRAMn);

	-- gate 7X
	sl_CRAMWRn	<= I_CRAMn or I_BR_Wn;

	-- 10L, 10M RAM
	p_CRAM_U : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_CRAM_CS_U = '0' then
			if sl_CRAMWRn = '0' then
				CRAM_U(to_integer(unsigned(I_CRA))) <= I_DB(15 downto 8);
			else
				O_DB(15 downto 8) <= CRAM_U(to_integer(unsigned(I_CRA)));
			end if;
		end if;
	end process;

	-- 9L, 9M
	p_CRAM_L : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_CRAM_CS_L = '0' then
			if sl_CRAMWRn = '0' then
				CRAM_L(to_integer(unsigned(I_CRA))) <= I_DB( 7 downto 0);
			else
				O_DB( 7 downto 0) <= CRAM_L(to_integer(unsigned(I_CRA)));
			end if;
		end if;
	end process;
end RTL;
