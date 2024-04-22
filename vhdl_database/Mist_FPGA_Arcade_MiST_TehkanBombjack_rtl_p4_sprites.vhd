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
-- ##### PAGE 4 schema - Sprite Generator                                #####
-- ###########################################################################
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;

entity sprite_gen is
	port (
		I_CLK_6M_EN			: in  std_logic;
--		I_CLK_12M			: in  std_logic;
		I_CS_9800_n			: in  std_logic;
		I_MEWR_n				: in  std_logic;
		I_MDL_N				: in  std_logic;
		I_CDL_n				: in  std_logic;
		I_VPL_n				: in  std_logic;
		I_SLOAD_n			: in  std_logic;
		I_SEL					: in  std_logic;
		I_2H					: in  std_logic;
		I_4H					: in  std_logic;
		I_8H					: in  std_logic;
		I_16H					: in  std_logic;
		I_32H					: in  std_logic;
		I_64H					: in  std_logic;
		I_128H				: in  std_logic;
		I_256H_n				: in  std_logic;
		I_5EF_BUS			: in  std_logic_vector ( 7 downto 0);
		I_AB					: in  std_logic_vector ( 6 downto 0);
		I_DB					: in  std_logic_vector ( 7 downto 0);
		I_ROM_7JLM_DATA	: in  std_logic_vector (23 downto 0);
		--
		O_ROM_7JLM_ENA		: out std_logic;
		O_ROM_7JLM_ADDR	: out std_logic_vector (12 downto 0);
		O_MHFLIP				: out std_logic;
		O_MC					: out std_logic_vector (3 downto 0) := (others => '0');
		O_MV					: out std_logic_vector (2 downto 0) := (others => '0');
		O_DB					: out std_logic_vector (7 downto 0)
	);
end sprite_gen;

architecture RTL of sprite_gen is

--	Page 4
	signal s_mhflip			: std_logic := '0';
	signal s_3EF_data			: std_logic_vector( 7 downto 0) := (others => '1');
	signal s_3EF_addr			: std_logic_vector( 6 downto 0) := (others => '1');
	signal s_9800_wr			: std_logic := '0';
	signal s_4H11				: std_logic := '0';
	signal s_4H6				: std_logic := '0';
	signal s_4H8				: std_logic := '0';
	signal s_5H_bus			: std_logic_vector( 7 downto 0) := (others => '1');
	signal s_6E_bus			: std_logic_vector( 7 downto 0) := (others => '1');
	signal s_6F_bus			: std_logic_vector( 7 downto 0) := (others => '1');
	signal s_6H11				: std_logic := '0';
	signal s_6H3				: std_logic := '0';
	signal s_6H6				: std_logic := '0';
	signal s_6H8				: std_logic := '0';
	signal s_6T7				: std_logic := '0';
	signal s_6T9				: std_logic := '0';
	signal s_7C6				: std_logic := '0';
	signal s_7D6				: std_logic := '0';
	signal s_7FH_bus			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_7T6				: std_logic := '0';
	signal s_mv_s1_s0			: std_logic_vector( 1 downto 0) := (others => '0');
	signal s_mv_s1				: std_logic := '0';
	signal s_shifter_6J_5J	: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_shifter_6K_5K	: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_shifter_6L_5L	: std_logic_vector( 7 downto 0) := (others => '0');

begin
	O_DB <= s_3EF_data;
	O_MHFLIP <= s_mhflip;

	-- chips 3H6, 7C8, 2F page 4 moved to top.vhd output data mux

	-- chip 6T7 page 4
	s_6T7 <= (not I_SEL) and I_16H;

	-- chips 1D, 2E page 4
	s_3EF_addr <=
		I_AB when I_CS_9800_n = '0' else
		(I_256H_n & I_128H & I_64H & I_32H & s_6T7 & I_4H & I_2H );

	-- chip 3H8 page 4
	s_9800_wr   <= not (I_MEWR_n or I_CS_9800_n); -- inverted because RAMB has active high CS

	-- chip 3E, 3F page 4
--	RAM_3EF : RAMB16_S9
--	port map (
--		do						=> s_3EF_data,
--		dop					=> open,
--		addr(10 downto 7)	=> "0000",
--		addr( 6 downto 0)	=> s_3EF_addr,
--		clk					=> I_CLK_6M_EN,
--		di						=> I_DB,
--		dip					=> "0",
--		en						=> '1',
--		ssr					=> '0',
--		we						=> s_9800_wr
--	);
	
	RAM_3EF : entity work.gen_ram
	generic map(
		dWidth	=> 8,
		aWidth	=> 7)
	port map(
		clk		=> I_CLK_6M_EN,
		we			=> s_9800_wr,
		addr		=> s_3EF_addr,
		d			=> I_DB,
		q			=> s_3EF_data
	);

	-- chips 4F, 4E page 4
	-- transparent buffers

	-- chip 5H page 4
	U5H : process(I_VPL_n)
	begin
		if rising_edge(I_VPL_n) then
			-- chips 5F, 5E (adders) page 4
			s_5H_bus <= s_3EF_data + I_5EF_BUS;
		end if;
	end process;

	-- chip 6F page 4
	U6F : process(I_MDL_N)
	begin
		if rising_edge(I_MDL_N) then
			s_6F_bus <= s_3EF_data;
		end if;
	end process;

	-- chip 6E page 4
	U6E : process(I_CDL_n)
	begin
		if rising_edge(I_CDL_n) then
			s_6E_bus <= s_3EF_data;
		end if;
	end process;

	-- chips 7F, 7H page 4
	s_7FH_bus <=
		s_6F_bus when I_SEL = '0' else
		(s_6F_bus(5 downto 0) & s_4H11 & s_4H8);

	-- chips 4H8, 4H6, 4H11, 6H page 4
	s_4H11 <= s_6E_bus(7) xor s_5H_bus(4); -- 16MV
	s_4H8  <= s_6E_bus(6) xor I_16H;       -- 16MH
	s_6H3  <= s_6E_bus(7) xor s_5H_bus(3); -- c4
	s_4H6  <= s_6E_bus(6) xor I_8H;        -- c3
	s_6H8  <= s_6E_bus(7) xor s_5H_bus(2); -- c2
	s_6H6  <= s_6E_bus(7) xor s_5H_bus(1); -- c1
	s_6H11 <= s_6E_bus(7) xor s_5H_bus(0); -- c0

	-- chip 7E, 7T11 page 4
	U7E : process(I_CLK_6M_EN)
	begin
		if rising_edge(I_CLK_6M_EN) then
			if I_SLOAD_n = '0' then
				s_mhflip <= s_6E_bus(6);
				O_MC     <= s_6E_bus(3 downto 0);
			end if;
		end if;
	end process;

	-- chip 6T9 page 4
	s_6T9 <= s_5H_bus(4) or I_SEL;

	-- chip 7D6
	s_7D6 <= s_5H_bus(7) and s_5H_bus(6) and s_5H_bus(5) and s_6T9;

	-- chip 7C6 page 4
	s_7C6 <= (not I_SLOAD_n) and s_7D6;

	-- chip 7T6 page 4
	s_7T6 <= s_mhflip or s_7C6;

	-- ROMs 8K, 8H, 8E in separate file
	O_ROM_7JLM_ADDR	<= s_7FH_bus & s_6H3 & s_4H6 & s_6H8 & s_6H6 & s_6H11; -- s_7FH_bus & c4 & c3 & c2 & c1 & c0
	O_ROM_7JLM_ENA		<= '1'; -- ROM output always active

	s_mv_s1_s0 <= (s_mv_s1 & s_7T6);
	-- chips 6J, 5J, 6K, 5K, 6L, 5L page 4
	shifters_pg4 : process(I_CLK_6M_EN)
	begin
		if rising_edge(I_CLK_6M_EN) then
			case s_mv_s1_s0 is
				when "11" =>         -- load
					s_shifter_6J_5J <= I_ROM_7JLM_DATA(23 downto 16);
					s_shifter_6K_5K <= I_ROM_7JLM_DATA(15 downto  8);
					s_shifter_6L_5L <= I_ROM_7JLM_DATA( 7 downto  0);
				when "10" =>         -- shift left
					s_shifter_6J_5J <= s_shifter_6J_5J(6 downto 0) & "0";
					s_shifter_6K_5K <= s_shifter_6K_5K(6 downto 0) & "0";
					s_shifter_6L_5L <= s_shifter_6L_5L(6 downto 0) & "0";
				when "01" =>         -- shift right
					s_shifter_6J_5J <= "0" & s_shifter_6J_5J(7 downto 1);
					s_shifter_6K_5K <= "0" & s_shifter_6K_5K(7 downto 1);
					s_shifter_6L_5L <= "0" & s_shifter_6L_5L(7 downto 1);
				when others => null; -- hold
			end case;
		end if;
	end process;

	-- chip 6M page 4
	s_mv_s1 <= s_7C6 when s_mhflip = '1' else '1';
	O_MV <= ( s_shifter_6L_5L(0) & s_shifter_6K_5K(0) & s_shifter_6J_5J(0) ) when s_mhflip = '1'
		else ( s_shifter_6L_5L(7) & s_shifter_6K_5K(7) & s_shifter_6J_5J(7) );

end RTL;
