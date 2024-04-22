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
-- ##### PAGE 7 schema - Background Image Selector                       #####
-- ###########################################################################
library ieee;
use ieee.std_logic_1164.all;

entity bgnd_tiles is
	port ( 
		I_CLK_6M_EN			: in  std_logic;
		I_CS_9E00_n			: in  std_logic;
		I_MEWR_n				: in  std_logic;
		I_CMPBLK_n			: in  std_logic;
		I_SLOAD_n			: in  std_logic;
		I_SL2_n				: in  std_logic;
		I_FLIP				: in  std_logic;
		I_4P_BUS				: in  std_logic_vector ( 8 downto 0);
		I_T_BUS				: in  std_logic_vector ( 4 downto 0);
		I_DB					: in  std_logic_vector ( 4 downto 0);
		I_ROM_4P_DATA		: in  std_logic_vector ( 7 downto 0);
		I_ROM_8RNL_DATA	: in  std_logic_vector (23 downto 0);
		--
		O_ROM_4P_ENA		: out std_logic;
		O_ROM_8RNL_ENA		: out std_logic;
		O_ROM_4P_ADDR		: out std_logic_vector (12 downto 0);
		O_ROM_8RNL_ADDR	: out std_logic_vector (12 downto 0);
		O_BC					: out std_logic_vector ( 3 downto 0) := (others => '0');
		O_BV					: out std_logic_vector ( 2 downto 0) := (others => '0')
	);
end bgnd_tiles;

architecture RTL of bgnd_tiles is

-- Page 7
	signal s_shifter_7R_7S	: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_shifter_7N_7P	: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_shifter_7L_7M	: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_6S_bus			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_4S_bus			: std_logic_vector( 4 downto 0) := (others => '0');
	signal s_kill				: std_logic := '0';
	signal s_5S15				: std_logic := '0';
	signal s_9e00_wr_n		: std_logic := '0';
	signal s_5R6				: std_logic := '0';
	signal s_6R3				: std_logic := '0';
	signal s_6R6				: std_logic := '0';
	signal s_6R8				: std_logic := '0';
	signal s_6R11				: std_logic := '0';
--	signal s_5P8				: std_logic := '0';
	signal s_5P3				: std_logic := '0';
	signal s_5R3				: std_logic := '0';
	signal s_bv_s1_s0			: std_logic_vector( 1 downto 0) := (others => '0');
	signal s_bv_s1				: std_logic := '0';

begin
	-- chip 5P6 page 7
	s_9e00_wr_n <= I_CS_9E00_n or I_MEWR_n;

	-- chip 4S page 7
	U4S : process(I_CLK_6M_EN)
	begin
		if rising_edge(I_CLK_6M_EN) then
			if s_9e00_wr_n= '0' then
				s_4S_bus <= I_DB;
			end if;
		end if;
	end process;

	-- chip 5R8 page 7
	s_kill <= not s_4S_bus(4);

	-- chip 6S page 7
	U6S7 : process(I_SL2_n)
	begin
		if rising_edge(I_SL2_n) then
			s_6S_bus <= I_ROM_4P_DATA;
		end if;
	end process;

	-- chips 6R, 5R11, 5P11, 5R6 page 7
	-- s_5R11 just a buffered copy of I_ROM_4P_DATA(7)
	-- s_5P11 just a buffered copy of I_ROM_4P_DATA(6)
	s_6R6  <= I_T_BUS(4) xor I_ROM_4P_DATA(7); -- T2
	s_6R8  <= I_T_BUS(3) xor I_ROM_4P_DATA(7); -- T1
	s_6R11 <= I_T_BUS(2) xor I_ROM_4P_DATA(7); -- T0
	s_6R3  <= I_T_BUS(1) xor I_ROM_4P_DATA(7); -- T4
	s_5R6  <= I_T_BUS(0) xor I_ROM_4P_DATA(6); -- T3

	-- ROMs 4P, 8R, 8N, 8L in separate file
	O_ROM_4P_ADDR		<= s_4S_bus(3 downto 0) & I_4P_BUS;
	O_ROM_4P_ENA		<= I_CMPBLK_n; -- because unlike the real ROMs with active low CS, we're active high CS

	O_ROM_8RNL_ADDR	<= s_6S_bus & s_6R3 & s_5R6 & s_6R6 & s_6R8 & s_6R11; -- bus & T4 & T3 & T2 & T1 & T0
	O_ROM_8RNL_ENA		<= I_CMPBLK_n; -- because unlike the real ROMs with active low CS, we're active high CS

	s_bv_s1_s0 <= s_bv_s1 & s_5P3;
	-- chips 7R, 7S, 7N, 7P, 7L, 7M page 7
	shifters_pg7 : process(I_CLK_6M_EN)
	begin
		if rising_edge(I_CLK_6M_EN) then
			case s_bv_s1_s0 is
				when "11" =>			-- load
					s_shifter_7R_7S <= I_ROM_8RNL_DATA(23 downto 16); -- 8R
					s_shifter_7N_7P <= I_ROM_8RNL_DATA(15 downto  8); -- 8N
					s_shifter_7L_7M <= I_ROM_8RNL_DATA( 7 downto  0); -- 8L
				when "10" =>			-- shift left
					s_shifter_7R_7S <= s_shifter_7R_7S(6 downto 0) & "0";
					s_shifter_7N_7P <= s_shifter_7N_7P(6 downto 0) & "0";
					s_shifter_7L_7M <= s_shifter_7L_7M(6 downto 0) & "0";
				when "01" =>			-- shift right
					s_shifter_7R_7S <= "0" & s_shifter_7R_7S(7 downto 1);
					s_shifter_7N_7P <= "0" & s_shifter_7N_7P(7 downto 1);
					s_shifter_7L_7M <= "0" & s_shifter_7L_7M(7 downto 1);
				when others => null; -- hold
			end case;
		end if;
	end process;

	-- chip 5P8 page 7
--	s_5P8  <= I_CLK_6M_EN or I_SLOAD_n;

	-- chip 5S page 7
	U5S : process(I_SLOAD_n)
	begin
		if rising_edge(I_SLOAD_n) then
				s_5S15 <= I_ROM_4P_DATA(6);
				O_BC   <= I_ROM_4P_DATA(3 downto 0);
		end if;
	end process;

	-- chip 5R3 page 7
	s_5R3 <= I_FLIP xor s_5S15;

	-- chip 5P3 page 7
	s_5P3 <= (not I_SLOAD_n) or s_5R3;

	-- chip 5N page 7
	s_bv_s1 <= ( ( (not s_kill) and (not s_5R3)                          ) or ( (not s_kill) and (s_5R3) and (not I_SLOAD_n)      ) );
	O_BV(2) <= ( ( (not s_kill) and (not s_5R3) and (s_shifter_7L_7M(7)) ) or ( (not s_kill) and (s_5R3) and (s_shifter_7L_7M(0)) ) );
	O_BV(1) <= ( ( (not s_kill) and (not s_5R3) and (s_shifter_7N_7P(7)) ) or ( (not s_kill) and (s_5R3) and (s_shifter_7N_7P(0)) ) );
	O_BV(0) <= ( ( (not s_kill) and (not s_5R3) and (s_shifter_7R_7S(7)) ) or ( (not s_kill) and (s_5R3) and (s_shifter_7R_7S(0)) ) );

end RTL;
