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
-- generic 2K x 8 RAM definition

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity RAM_2K8 is
	port(
		I_MCKR : in  std_logic;
		I_EN   : in  std_logic;
		I_WR   : in  std_logic;
		I_ADDR : in  std_logic_vector(10 downto 0);
		I_DATA : in  std_logic_vector( 7 downto 0);
		O_DATA : out std_logic_vector( 7 downto 0)
	);
end RAM_2K8;

architecture RTL of RAM_2K8 is
	type RAM_ARRAY_2Kx8 is array (0 to 2047) of std_logic_vector(7 downto 0);
	signal RAM : RAM_ARRAY_2Kx8 := (others=>(others=>'0'));

	-- Ask Xilinx synthesis to use block RAMs if possible
	attribute ram_style : string;
	attribute ram_style of RAM : signal is "block";
	-- Ask Quartus synthesis to use block RAMs if possible
	attribute ramstyle : string;
	attribute ramstyle of RAM : signal is "M10K";

begin
	p_RAM : process
	begin
		wait until rising_edge(I_MCKR);
		if I_EN ='1' then
			if I_WR = '1' then
				RAM(to_integer(unsigned(I_ADDR))) <= I_DATA;
			else
				O_DATA <= RAM(to_integer(unsigned(I_ADDR)));
			end if;
		end if;
	end process;
end RTL;
