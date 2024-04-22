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

entity VRAMS is
	port(
		I_CK					: in	std_logic;
		I_VRAMWE				: in	std_logic;
		I_SELB				: in	std_logic;
		I_SELA				: in	std_logic;
		I_UDSn				: in	std_logic;
		I_LDSn				: in	std_logic;
		I_VRA					: in	std_logic_vector(11 downto 0);
		I_VRD					: in	std_logic_vector(15 downto 0);
		O_VRD					: out	std_logic_vector(15 downto 0)
	);
end VRAMS;

architecture RTL of VRAMS is
	signal
		sl_PF_HI,
		sl_MO_HI,
		sl_AL_HI,
		sl_PF_LO,
		sl_MO_LO,
		sl_AL_LO,
		sl_PF_CSn,
		sl_MO_CSn,
		sl_AL_CSn
								: std_logic := '1';
	signal
		slv_PF,
		slv_MO,
		slv_AL
								: std_logic_vector(15 downto 0) := (others=>'0');

	type RAM_ARRAY_4Kx8 is array (0 to 4095) of std_logic_vector(7 downto 0);
	signal RAM_PF_LO : RAM_ARRAY_4Kx8:=(others=>(others=>'0'));
	signal RAM_MO_LO : RAM_ARRAY_4Kx8:=(others=>(others=>'0'));
	signal RAM_AL_LO : RAM_ARRAY_4Kx8:=(others=>(others=>'0'));
	signal RAM_PF_HI : RAM_ARRAY_4Kx8:=(others=>(others=>'0'));
	signal RAM_MO_HI : RAM_ARRAY_4Kx8:=(others=>(others=>'0'));
	signal RAM_AL_HI : RAM_ARRAY_4Kx8:=(others=>(others=>'0'));

	-- Ask Xilinx synthesis to use block RAMs if possible
	attribute ram_style : string;
	attribute ram_style of RAM_PF_LO : signal is "block";
	attribute ram_style of RAM_MO_LO : signal is "block";
	attribute ram_style of RAM_AL_LO : signal is "block";
	attribute ram_style of RAM_PF_HI : signal is "block";
	attribute ram_style of RAM_MO_HI : signal is "block";
	attribute ram_style of RAM_AL_HI : signal is "block";
	-- Ask Quartus synthesis to use block RAMs if possible
	attribute ramstyle : string;
	attribute ramstyle of RAM_PF_LO : signal is "M10K";
	attribute ramstyle of RAM_MO_LO : signal is "M10K";
	attribute ramstyle of RAM_AL_LO : signal is "M10K";
	attribute ramstyle of RAM_PF_HI : signal is "M10K";
	attribute ramstyle of RAM_MO_HI : signal is "M10K";
	attribute ramstyle of RAM_AL_HI : signal is "M10K";
begin
	-------------------------
	-- sheet 9 RAM decoder --
	-------------------------
	-- 9C decoders
	sl_PF_CSn <= (     I_SELB ) or (     I_SELA );
	sl_MO_CSn <= (     I_SELB ) or ( not I_SELA );
	sl_AL_CSn <= ( not I_SELB ) or (     I_SELA );

	-- active high memory chip selects
	sl_PF_HI <= not (I_UDSn or sl_PF_CSn);
	sl_MO_HI <= not (I_UDSn or sl_MO_CSn);
	sl_AL_HI <= not (I_UDSn or sl_AL_CSn);

	sl_PF_LO <= not (I_LDSn or sl_PF_CSn);
	sl_MO_LO <= not (I_LDSn or sl_MO_CSn);
	sl_AL_LO <= not (I_LDSn or sl_AL_CSn);

	-----------------------
	-- sheet 8 RAM banks --
	-----------------------

	O_VRD <=
		slv_PF when sl_PF_CSn = '0' else
		slv_MO when sl_MO_CSn = '0' else
		slv_AL when sl_AL_CSn = '0' else
--		slv_AL when sl_AL_CSn = '0' and (I_VRA < x"800" or I_VRA > x"F69") else 	-- disables reads from alphanumerics range 905000-905BB0
		(others=>'0');

-- PF video RAMs 6J, 7J
	p_RAM_PF_LO : process
	begin
		wait until rising_edge(I_CK);
		if sl_PF_LO = '1' then
			if I_VRAMWE = '1' then
				RAM_PF_LO(to_integer(unsigned(I_VRA))) <= I_VRD(7 downto 0);
			else
				slv_PF(7 downto 0) <= RAM_PF_LO(to_integer(unsigned(I_VRA)));
			end if;
		end if;
	end process;

-- PF video RAMs 6D, 7D
	p_RAM_PF_HI : process
	begin
		wait until rising_edge(I_CK);
		if sl_PF_HI = '1' then
			if I_VRAMWE = '1' then
				RAM_PF_HI(to_integer(unsigned(I_VRA))) <= I_VRD(15 downto 8);
			else
				slv_PF(15 downto 8) <= RAM_PF_HI(to_integer(unsigned(I_VRA)));
			end if;
		end if;
	end process;

-- MO video RAMs 6F, 7F
	p_RAM_MO_LO : process
	begin
		wait until rising_edge(I_CK);
		if sl_MO_LO = '1' then
			if I_VRAMWE = '1' then
				RAM_MO_LO(to_integer(unsigned(I_VRA))) <= I_VRD(7 downto 0);
			else
				slv_MO(7 downto 0) <= RAM_MO_LO(to_integer(unsigned(I_VRA)));
			end if;
		end if;
	end process;

-- MO video RAMs 6C, 7C
	p_RAM_MO_HI : process
	begin
		wait until rising_edge(I_CK);
		if sl_MO_HI = '1' then
			if I_VRAMWE = '1' then
				RAM_MO_HI(to_integer(unsigned(I_VRA))) <= I_VRD(15 downto 8);
			else
				slv_MO(15 downto 8) <= RAM_MO_HI(to_integer(unsigned(I_VRA)));
			end if;
		end if;
	end process;

-- AL video RAMs 6K, 7K
	p_RAM_AL_LO : process
	begin
		wait until rising_edge(I_CK);
		if sl_AL_LO = '1' then
			if I_VRAMWE = '1' then
				RAM_AL_LO(to_integer(unsigned(I_VRA))) <= I_VRD(7 downto 0);
			else
				slv_AL(7 downto 0) <= RAM_AL_LO(to_integer(unsigned(I_VRA)));
			end if;
		end if;
	end process;

-- AL video RAMs 6E, 7E
	p_RAM_AL_HI : process
	begin
		wait until rising_edge(I_CK);
		if sl_AL_HI = '1' then
			if I_VRAMWE = '1' then
				RAM_AL_HI(to_integer(unsigned(I_VRA))) <= I_VRD(15 downto 8);
			else
				slv_AL(15 downto 8) <= RAM_AL_HI(to_integer(unsigned(I_VRA)));
			end if;
		end if;
	end process;
end RTL;
