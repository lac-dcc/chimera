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

-- ###########################################################################
-- ##### PAGE 9 schema - CPU + RAM + ROM + glue logic                    #####
-- ###########################################################################

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;

--use work.bj_package.all;

entity audio is
	port (
		I_RESET_n	: in  std_logic;
		I_CLK_3M		: in  std_logic;
		I_VSYNC_n	: in  std_logic;
		I_CS_B800_n	: in  std_logic;
		I_MERW_n		: in  std_logic;
		I_DB_CPU		: in  std_logic_vector( 7 downto 0);
		I_SD			: in  std_logic_vector( 7 downto 0);
		O_SD			: out std_logic_vector( 7 downto 0);
		O_SA0			: out std_logic;
		O_PSG1_n		: out std_logic;
		O_PSG2_n		: out std_logic;
		O_PSG3_n		: out std_logic;
		O_SWR_n		: out std_logic;
		O_SRD_n		: out std_logic
	);
end audio;

architecture RTL of audio is
	signal cpu_addr		: std_logic_vector(15 downto 0) := (others => '0');
	signal cpu_data_in	: std_logic_vector( 7 downto 0) := (others => '0');
	signal cpu_data_out	: std_logic_vector( 7 downto 0) := (others => '0');
	signal rom_3H_data	: std_logic_vector( 7 downto 0) := (others => '0');
--	signal rom_3J_data	: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_2L_bus		: std_logic_vector( 7 downto 0) := (others => '0');
	signal ram_data		: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_CLK_3M_n		: std_logic := '0';
	signal s_b800_wr_n	: std_logic := '1';
	signal s_60H_n			: std_logic := '1';
	signal s_sram			: std_logic := '0';
	signal s_srom1			: std_logic := '0';
--	signal s_srom2			: std_logic := '0';
	signal s_srd_n			: std_logic := '1';
	signal s_swr			: std_logic := '0';
	signal s_swr_n			: std_logic := '1';
	signal s_mreq_n		: std_logic := '1';
	signal s_iorq_n		: std_logic := '1';
	signal s_2F3			: std_logic := '0';
	signal s_2F6			: std_logic := '0';
	signal s_2J6_n			: std_logic := '1';
	signal s_2J8_n			: std_logic := '1';
	signal s_2M3_n			: std_logic := '1';

begin
	-- outputs to PSG board
	O_SD		<= cpu_data_out;
	O_SA0		<= cpu_addr(0);
	O_SWR_n	<= s_swr_n;
	O_SRD_n	<= s_srd_n;

	-- PSG selector
	O_PSG3_n  <= not ( (not s_iorq_n) and (    cpu_addr(7)) and (not cpu_addr(4)) );
	O_PSG2_n  <= not ( (not s_iorq_n) and (not cpu_addr(7)) and (    cpu_addr(4)) );
	O_PSG1_n  <= not ( (not s_iorq_n) and (not cpu_addr(7)) and (not cpu_addr(4)) );

	s_CLK_3M_n <= not I_CLK_3M;
	s_swr <= not s_swr_n;

	-- chip 3N6 page 2
	s_b800_wr_n <= I_MERW_n or I_CS_B800_n; -- /B800H on schema page 2

	-- chip 5D page 9
	s_60H_n <= not ( (not s_mreq_n) and (    cpu_addr(14)) and (    cpu_addr(13)) );
	-- we actually need these inverted due to active high chip selects
	s_sram  <=     ( (not s_mreq_n) and (    cpu_addr(14)) and (not cpu_addr(13)) );
--	s_srom2 <=     ( (not s_mreq_n) and (not cpu_addr(14)) and (    cpu_addr(13)) );
	s_srom1 <=     ( (not s_mreq_n) and (not cpu_addr(14)) and (not cpu_addr(13)) );

	-- chip 2M3
	s_2M3_n <= I_RESET_n and s_60H_n;

	-- chip 2F3
	s_2F3 <= s_srd_n or s_60H_n;

	-- chip 2F6
	s_2F6 <= I_CLK_3M or s_2J6_n;

	-- chip 2J6 page 9
	U2J6 : process(s_2F3, s_2F6)
	begin
		if s_2F6 = '0' then
			s_2J6_n <= '1';
		elsif rising_edge(s_2F3) then
			s_2J6_n <= '0';
		end if;
	end process;

	-- chip 2J8 page 9
	-- F/F clock not labeled on schema, determined to be /vsync
	U2J8 : process(I_VSYNC_n, s_2M3_n)
	begin
		if s_2M3_n = '0' then
			s_2J8_n <= '1';
		elsif rising_edge(I_VSYNC_n) then
			s_2J8_n <= '0';
		end if;
	end process;

	-- chip 2L page 9
	U2L : process(s_b800_wr_n, s_2J6_n)
	begin
		if s_2J6_n = '0' then
			s_2L_bus <= (others => '0');
		elsif rising_edge(s_b800_wr_n) then
			s_2L_bus <= I_DB_CPU;
		end if;
	end process;

	-- CPU data bus mux
	cpu_data_in <=
		s_2L_bus    when (s_2F3   = '0') else
		ram_data    when (s_sram  = '1') else
		rom_3H_data when (s_srom1 = '1') else
--		rom_3J_data when (s_srom2 = '1') else
		I_SD;

	-- CPU RAM 
	-- chip 3K page 9
--	ram_3K : RAMB16_S9
--	port map (
--		do   => ram_data,
--		dop  => open,
--		addr => cpu_addr(10 downto 0),
--		clk  => s_CLK_3M_n,
--		di   => cpu_data_out,
--		dip  => "0",
--		en   => s_sram,
--		ssr  => '0',
--		we   => s_swr
--	);
	
	ram_3K : entity work.gen_ram
	generic map(
		dWidth	=> 8,
		aWidth	=> 11)
	port map(
		clk		=> s_CLK_3M_n and s_sram,
		we			=> s_swr,
		addr		=> cpu_addr(10 downto 0),
		d			=> cpu_data_out,
		q			=> ram_data
	);

	-- chip 3H page 9
	ROM_3H : entity work.ROM_3H
		port map (
			CLK	=> s_CLK_3M_n and s_srom1,
--			ENA	=> s_srom1,
			ADDR	=> cpu_addr(12 downto 0),
			DATA	=> rom_3H_data
		);

--	-- chip 3J page 9 (not fitted to board, empty socket)

	-- Z80 CPU on sound board
	-- chip 34F page 9
	cpu_34F : entity work.T80sed
		port map (
			-- inputs
			DI      => cpu_data_in,
			RESET_n => I_RESET_n,
			CLK_n   => I_CLK_3M,			-- 3Mhz active on rising edge
			CLKEN   => '1',
			INT_n   => '1',
			WAIT_n  => '1',
			BUSRQ_n => '1',
			NMI_n   => s_2J8_n,
			-- outputs
			MREQ_n  => s_mreq_n,
			RD_n    => s_srd_n,
			WR_n    => s_swr_n,
			A       => cpu_addr,
			DO      => cpu_data_out,
			RFSH_n  => open,
			M1_n    => open,
			IORQ_n  => s_iorq_n,
			HALT_n  => open,
			BUSAK_n => open
		);

end RTL;
