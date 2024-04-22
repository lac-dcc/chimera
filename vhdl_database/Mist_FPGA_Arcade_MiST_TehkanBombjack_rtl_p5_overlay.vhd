--	(c) 2012 d18c7db(a)hotmail
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

--------------------------------------------------------------------------------

-- ###########################################################################
-- ##### PAGE 5 schema - Sprite Poritioning                              #####
-- ###########################################################################
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;

entity sprite_position is
	port (
		I_CLK_12M		: in  std_logic;
		I_CLK_6M_EN		: in  std_logic;
		I_FLIP			: in  std_logic;
		I_CONTRLDA_n	: in  std_logic;
		I_CONTRLDB_n	: in  std_logic;
		I_MHFLIP			: in  std_logic;
		I_1V_r			: in  std_logic;
		I_1V_n_r			: in  std_logic;
		I_256H_r			: in  std_logic;
		I_CTR				: in  std_logic_vector (7 downto 0);
		I_MC				: in  std_logic_vector (3 downto 0);
		I_MV				: in  std_logic_vector (2 downto 0);
		O_OC				: out std_logic_vector (3 downto 0);
		O_OV				: out std_logic_vector (2 downto 0)
	);
end sprite_position;

architecture RTL of sprite_position is
	signal s_bus_u1			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_bus_u2			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_clk_12M_n		: std_logic := '0';
begin
	-- turns out it's critical that the BRAM runs off inverted 12M to create the
	-- delay required by the other components running off 6M clock
	-- rising edge of /12M must fall in the middle of each 6M half cycle or in other words
	-- rising edge of /12M must not coincide with rising or falling edge of 6M
	--        _   _   _   _   
	-- /12M _| |_| |_| |_| |_
	--          ___     ___
	--   6M ___|   |___|   |_
	s_clk_12M_n <= not I_CLK_12M;

	-- duplicate circuit on page 5 has been implemented as a module in order to simply reuse it

	-- chips 3C, 3D, 2C, 2D, 7B6, 1C6, 6C, 6D, 5C, 5D, 4C, 4D, 7B3, 7A3, 7A11 page 5
	-- these handle odd scan lines
	u_odd : entity work.sprite_buff
	port map (
		I_CLK_12M			=> s_clk_12M_n,
		I_CLK_6M_EN			=> I_CLK_6M_EN,
		I_1V					=> I_1V_n_r,
		I_256H				=> I_256H_r,
		I_FLIP				=> I_FLIP,
		I_CTRL_CLEAR		=> I_CONTRLDA_n,
		I_CTRL_LOAD			=> I_CONTRLDB_n,
		I_CTR					=> I_CTR,
		I_BUS(7)				=> I_MHFLIP,
		I_BUS(6 downto 3)	=> I_MC,
		I_BUS(2 downto 0)	=> I_MV,
		O_BUS					=> s_bus_u1
	);

	-- chips 3A, 3B, 2A, 2B, 7B8, 1C8, 6A, 6B, 5A, 5B, 4A, 4B, 7B11, 7A6, 7A8 page 5
	-- these handle even scan lines
	u_even : entity work.sprite_buff
	port map (
		I_CLK_12M			=> s_clk_12M_n,
		I_CLK_6M_EN			=> I_CLK_6M_EN,
		I_1V					=> I_1V_r,
		I_256H				=> I_256H_r,
		I_FLIP				=> I_FLIP,
		I_CTRL_CLEAR		=> I_CONTRLDB_n,
		I_CTRL_LOAD			=> I_CONTRLDA_n,
		I_CTR					=> I_CTR,
		I_BUS(7)				=> I_MHFLIP,
		I_BUS(6 downto 3)	=> I_MC,
		I_BUS(2 downto 0)	=> I_MV,
		O_BUS					=> s_bus_u2
	);

	-- chips 1A, 1B page 5
	O_OC <=
		s_bus_u1(6 downto 3) when (I_1V_r = '0') else
		s_bus_u2(6 downto 3);

	O_OV <=
		s_bus_u1(2 downto 0) when (I_1V_r = '0') else
		s_bus_u2(2 downto 0);

end RTL;
