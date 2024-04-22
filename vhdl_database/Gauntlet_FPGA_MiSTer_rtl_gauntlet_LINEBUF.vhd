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
-- Line Buffer used in Motion Object Horizontal Line Buffer module

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity LINEBUF is
	port(
		I_MCKR    : in  std_logic;
		I_BUFCLRn : in	std_logic;
		I_LDn     : in	std_logic;
		I_FLBn    : in  std_logic;
		I_CSn     : in  std_logic;

		I_HPOS    : in  std_logic_vector(8 downto 0);
		I_MOSR    : in  std_logic_vector(7 downto 0);

		O_MPX     : out std_logic_vector(7 downto 0)
	);
end LINEBUF;

architecture RTL of LINEBUF is
	type RAM_ARRAY is array (0 to 511) of std_logic_vector(7 downto 0);
	signal RAM : RAM_ARRAY := ((others=>(others=>'1')));
	-- Ask Xilinx synthesis to use block RAMs if possible
	attribute ram_style : string;
	attribute ram_style of RAM : signal is "block";
	-- Ask Quartus synthesis to use block RAMs if possible
	attribute ramstyle : string;
	attribute ramstyle of RAM : signal is "M10K";

	signal
		sl_CLRn,
		sl_LDn,
		sl_CSn
								: std_logic := '1';
	signal
		slv_LBD
								: std_logic_vector( 7 downto 0) := (others=>'1');
	signal
		slv_LB
								: std_logic_vector( 8 downto 0) := (others=>'1');
begin
	sl_CLRn <= I_FLBn or I_BUFCLRn;
	sl_LDn  <= I_FLBn or I_LDn;
	sl_CSn  <= (not I_FLBn) and I_CSn;

	-- 3T, 3R, 3W, 3U, 3S, 3X counters
	p_ctrs : process
	begin
		wait until rising_edge(I_MCKR);
		if sl_CLRn = '0' then
			slv_LB <= (others=>'0');
		elsif sl_LDn = '0' then
			slv_LB <= I_HPOS;
		else
			slv_LB <= slv_LB + 1;
		end if;
	end process;

	-- 1X, 1W, 2X, 2W RAM
	p_rams : process
	begin
		-- MCKR connected to /WE so RAM is written when MCKR is low
		wait until falling_edge(I_MCKR);
		if sl_CSn = '0' then
			RAM(to_integer(unsigned(slv_LB))) <= slv_LBD;
			-- 4W, 5W latches
			O_MPX <= RAM(to_integer(unsigned(slv_LB)));
		else
			O_MPX <= (others=>'1');
		end if;
	end process;

	-- LBD bus mux, 4X, 5X or pullups RN1, RN2
	slv_LBD	<= I_MOSR when I_FLBn = '0' else (others=>'1');
end RTL;
