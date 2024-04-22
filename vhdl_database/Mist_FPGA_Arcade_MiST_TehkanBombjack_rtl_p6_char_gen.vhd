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
-- ##### PAGE 6 schema - Character Generator                             #####
-- ###########################################################################
library ieee;
	use ieee.std_logic_1164.all;

entity char_gen is
	port (
		I_CLK_6M_EN			: in  std_logic;
		I_CLK_12M			: in  std_logic;
		I_CS_9000_n			: in  std_logic;
		I_MEWR_n				: in  std_logic;
		I_CMPBLK_n			: in  std_logic;
		I_FLIP				: in  std_logic;
		I_SS					: in  std_logic;
		I_SL1_n				: in  std_logic;
		I_SL2_n				: in  std_logic;
		I_SLOAD_n			: in  std_logic;
		I_6LM_BUS			: in  std_logic_vector (10 downto 0);
		I_DB					: in  std_logic_vector ( 7 downto 0);
		I_AB					: in  std_logic_vector (10 downto 0);
		I_ROM_8KHE_DATA	: in  std_logic_vector (23 downto 0);
		I_6P_BUS				: in  std_logic_vector ( 2 downto 0);
		--
		O_SV					: out std_logic_vector ( 2 downto 0);
		O_SC					: out std_logic_vector ( 3 downto 0) := (others => '0');
		O_DB					: out std_logic_vector ( 7 downto 0) := (others => '0');
		O_ROM_8KHE_ADDR	: out std_logic_vector (12 downto 0);
		O_ROM_8KHE_ENA		: out std_logic
	);
end char_gen;

architecture RTL of char_gen is

-- Page 6
	signal s_9000_rd_n		: std_logic := '0';
	signal s_CLK_12M_n		: std_logic := '0';
	signal s_4M12				: std_logic := '0';
	signal s_6N8				: std_logic := '0';
	signal s_6P11				: std_logic := '0';
	signal s_6P3				: std_logic := '0';
	signal s_6P6				: std_logic := '0';
	signal s_6P8				: std_logic := '0';
	signal s_6LM_wr			: std_logic := '0';
	signal s_sv_s1				: std_logic := '0';
	signal s_sv_s1_s0			: std_logic_vector( 1 downto 0) := (others => '0');
	signal s_6LM_addr			: std_logic_vector(10 downto 0) := (others => '0');
	signal s_6LM_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_4L_bus			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_5L_bus			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_shifter_7J_7K	: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_shifter_7F_7H	: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_shifter_7D_7E	: std_logic_vector( 7 downto 0) := (others => '0');
begin

	O_DB <= s_6LM_data; -- when s_6LM_wr = '1' else (others => 'Z');
	s_CLK_12M_n <= not I_CLK_12M;

	-- chips 3L, 2R6, 8C6, 6N11 page 6 moved to top.vhd output data bus mux

	-- chip 6N3, 6K4 page 6
	s_6LM_wr <= not (I_MEWR_n or I_CS_9000_n or I_SS); -- inverted because our BRAM WR is active high

	-- chips 6H, 6J, 6K page 6
	s_6LM_addr  <= I_AB(10 downto 0) when I_SS = '0' else I_6LM_BUS;

	-- chip 6LM page 6
--	RAM_6LM : RAMB16_S9
--	port map (
--		do						=> s_6LM_data,
--		dop					=> open,
--		addr					=> s_6LM_addr,
--		clk					=> s_CLK_12M_n, -- due to T80 early read in T3 state, this 2x clock is required here
--		di						=> I_DB,
--		dip					=> "0",
--		en						=> '1',
--		ssr					=> '0',
--		we						=> s_6LM_wr
--	);
	
	RAM_6LM : entity work.gen_ram
	generic map(
		dWidth	=> 8,
		aWidth	=> 11)
	port map(
		clk		=> s_CLK_12M_n,
		we			=> s_6LM_wr,
		addr		=> s_6LM_addr,
		d			=> I_DB,
		q			=> s_6LM_data
	);

	-- chip 5L page 6
	process(I_SL1_n)
	begin
		if rising_edge(I_SL1_n) then
			s_5L_bus <= s_6LM_data;
		end if;
	end process;

	-- chip 4L page 6
	process(I_SL2_n)
	begin
		if rising_edge(I_SL2_n) then
			s_4L_bus <= s_6LM_data;
		end if;
	end process;

	-- chip 6P3, 6P8, 6P11 page 6
	s_6P3  <= I_6P_BUS(2) xor s_4L_bus(7); -- T2
	s_6P8  <= I_6P_BUS(1) xor s_4L_bus(7); -- T1
	s_6P11 <= I_6P_BUS(0) xor s_4L_bus(7); -- T0

	-- chip 4M, 6N6 page 6
	U4M : process(I_CLK_6M_EN)
	begin
		if rising_edge(I_CLK_6M_EN) then
			if I_SLOAD_n = '0' then
				s_4M12 <= s_4L_bus(6);
				O_SC   <= s_4L_bus(3 downto 0);
			end if;
		end if;
	end process;

	-- ROMs 8K, 8H, 8E in separate file
	O_ROM_8KHE_ADDR	<= s_4L_bus(5 downto 4) & s_5L_bus & s_6P3 & s_6P8 & s_6P11;
	O_ROM_8KHE_ENA		<= I_CMPBLK_n; -- inverted because our BRAMs have active high EN

	s_sv_s1_s0 <= (s_sv_s1 & s_6N8);

	-- chips 7J, 7K, 7F, 7H, 7D, 7E page 6
	shifters_pg6 : process(I_CLK_6M_EN)
	begin
		if rising_edge(I_CLK_6M_EN) then
			case s_sv_s1_s0 is
				when "11" =>         -- load
					s_shifter_7J_7K <= I_ROM_8KHE_DATA(23 downto 16);
					s_shifter_7F_7H <= I_ROM_8KHE_DATA(15 downto  8);
					s_shifter_7D_7E <= I_ROM_8KHE_DATA( 7 downto  0);
				when "10" =>         -- shift left
					s_shifter_7J_7K <= s_shifter_7J_7K(6 downto 0) & "0";
					s_shifter_7F_7H <= s_shifter_7F_7H(6 downto 0) & "0";
					s_shifter_7D_7E <= s_shifter_7D_7E(6 downto 0) & "0";
				when "01" =>         -- shift right
					s_shifter_7J_7K <= "0" & s_shifter_7J_7K(7 downto 1);
					s_shifter_7F_7H <= "0" & s_shifter_7F_7H(7 downto 1);
					s_shifter_7D_7E <= "0" & s_shifter_7D_7E(7 downto 1);
				when others => null; -- hold
			end case;
		end if;
	end process;

	-- chip 6P6 page 6
	s_6P6 <= I_FLIP xor s_4M12;

	-- chip 6N8 page 6
	s_6N8 <= (not I_SLOAD_n) or s_6P6;

	-- chip 6F page 6
	s_sv_s1 <= (not I_SLOAD_n) when s_6P6 = '1' else '1';
	O_SV <= ( s_shifter_7D_7E(0) & s_shifter_7F_7H(0) & s_shifter_7J_7K(0) ) when s_6P6 = '1'
		else ( s_shifter_7D_7E(7) & s_shifter_7F_7H(7) & s_shifter_7J_7K(7) );

end RTL;
