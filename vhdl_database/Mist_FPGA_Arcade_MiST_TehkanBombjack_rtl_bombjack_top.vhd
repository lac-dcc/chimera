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
--	This is a VHDL implementation of the game "Bomb Jack" (c) 1984 Tehkan
--	Translated from schematic to VHDL Q1 2012, d18c7db
--
-- Implemented on a Papilio Plus board, basic h/w specs:
--		Spartan 6 LX9
--		32Mhz xtal oscillator
--		256Kx16 SRAM 10ns access
--		4Mbit serial Flash
--
-- v0.1	Initial release
--
-- added testbed folder and moved all testbed related files into it
-- changed UCF to use Megawing
-- split audio file into p9/p10
-- fixed: sprites not showing, clock to sprite RAMS 4A,B,C,D had to be inverted
-- fixed: audio issue with PSG1 chan C, missing chip selects to RAM/ROM
-- fixed: Sometimes enemy robots get stuck inside a platform, clock to 6L,M had to be inverted
-- fixed: RAM4 fails self test, clock timing issue with 6L,M had to double clock frequency
-- fixed: Bomb Jack death animation sequence, wrongly inverting s_7C6 though 6M on page 4
-- fixed: 32x32 tiles not showing correclty when running from SRAM but correct when running from BRAM, SRAM state machine needed to run continuously
--
--	Known Issues
--
-- Last 8 pixels of the last video line not showing, can be observed quring squares test pattern (not visible in game)
--		this issue is due to /vblank signal rising too early (see page 8 chips 8B, 7A) clearing the video output while
--		there are 8 pixels left to shift out. Unclear why this is happening as all video timing signals are derived from
--		the H and V counters and I have triple checked for errors, can't see the cause. Minor cosmetic issue.

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

entity bombjack_top is
	port(
		-- VGA monitor output
		O_VIDEO_R			: out		std_logic_vector(3 downto 0);
		O_VIDEO_G			: out		std_logic_vector(3 downto 0);
		O_VIDEO_B			: out		std_logic_vector(3 downto 0);
		O_HSYNC				: out		std_logic;
		O_VSYNC				: out		std_logic;
		O_HBLANK				: out		std_logic;
		O_VBLANK				: out		std_logic;	
		
		p1_sw					: in		std_logic_vector(7 downto 0);--"000",jump,down,up,left,right
		p2_sw					: in		std_logic_vector(7 downto 0);--"000",jump,down,up,left,right
		s_sys					: in		std_logic_vector(7 downto 0);--"1111",start2,start1,coin2,coin1
		s_sw1					: in		std_logic_vector(7 downto 0) := "11100000";
		-- sw1 presets
		--s_sw1(7)				<= '1';					-- demo sounds 1=on, 0=off
		--s_sw1(6)				<= '1';					-- orientation 1=upright, 0=cocktail
		--s_sw1(5 downto 4)	<= "10";					-- lives 00=3, 01=4, 10=5, 11=2
		--s_sw1(3 downto 2)	<= "00";					-- coin b 00=1Coin/1Credit, 01=2Coins/1Credit, 10=1Coin/2Credits, 11=1Coin/3Credits
		--s_sw1(1 downto 0)	<= "00";					-- coin a 00=1Coin/1Credit, 01=1Coin/2Credits, 10=1Coin/3Credits, 11=1Coin/6Credits
		s_sw2					: in		std_logic_vector(7 downto 0) := "00000010";
		-- sw2 presets
		--s_sw2(7)				<= '0';					-- special coin 0=easy, 1=hard
		--s_sw2(6 downto 5)	<= "00";					-- enemies number and speed 00=easy, 01=medium, 10=hard, 11=insane
		--s_sw2(4 downto 3)	<= "00";					-- bird speed 00=easy, 01=medium, 10=hard, 11=insane
		--s_sw2(2 downto 0)	<= "010";				-- bonus life 000=none, 001=every 100k, 010=every 30k, 011=50k only, 100=100k only, 101=50k and 100k, 110=100k and 300k, 111=50k and 100k and 300k

		cpu_rom_addr		: out		std_logic_vector(15 downto 0) := (others => '0');
		cpu_rom_data		: in		std_logic_vector(7 downto 0) := (others => '0');
		
		bg_rom_addr			: out		std_logic_vector(12 downto 0) := (others => '0');
		bg_rom_data			: in		std_logic_vector(23 downto 0) := (others => '0');

		-- Sound out
		O_AUDIO_L		: out std_logic_vector (11 downto 0);
		O_AUDIO_R		: out std_logic_vector (11 downto 0);

		-- Active high external buttons
		RESETn				: in		std_logic;
		clk_4M_en			: in		std_logic := '0';
		clk_6M_en			: in		std_logic := '0';
		clk_12M				: in		std_logic := '0';
		clk_48M				: in		std_logic := '0'
	);
end bombjack_top;

architecture RTL of bombjack_top is
	-- bootstrap control of SRAM, these signals connect to SRAM when bootstrap_done = '0'
	signal bs_A					: std_logic_vector(17 downto 0) := (others => '0');
	signal bs_Dout				: std_logic_vector( 7 downto 0) := (others => '0');
	signal bs_nCS				: std_logic := '1';
	signal bs_nWE				: std_logic := '1';
	signal bs_nOE				: std_logic := '1';

-- Bomb Jack signals
	signal clk_4M_en_n		: std_logic := '0';
	signal s_flip				: std_logic := '0';
	signal s_merd_n			: std_logic := '1';
	signal s_mewr_n			: std_logic := '1';
	signal s_mewr				: std_logic := '0';
	signal s_cs_9000_n		: std_logic := '1';
	signal s_cs_9800_n		: std_logic := '1';
	signal s_cs_9a00_n		: std_logic := '1';
	signal s_cs_9c00_n		: std_logic := '1';
	signal s_cs_9e00_n		: std_logic := '1';
	signal s_cs_b000_n		: std_logic := '1';
	signal s_cs_b800_n		: std_logic := '1';
	signal cs_80_n				: std_logic := '0';
	signal cs_98_n				: std_logic := '0';
	signal VIDEOR	:		std_logic_vector(3 downto 0);
	signal VIDEOG	:		std_logic_vector(3 downto 0);
	signal VIDEOB	:		std_logic_vector(3 downto 0);
	signal HSYNC		:		std_logic;
	signal VSYNC		:		std_logic;

	signal s_red				: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_grn				: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_blu				: std_logic_vector( 3 downto 0) := (others => '0');
	signal dummy				: std_logic_vector( 3 downto 0) := (others => '0');

	signal i_rom_4P_data		: std_logic_vector( 7 downto 0) := (others => '0');
	signal o_rom_4P_addr		: std_logic_vector(12 downto 0) := (others => '0');
	signal o_rom_4P_ena		: std_logic := '1';

	signal i_rom_7JLM_data	: std_logic_vector(23 downto 0) := (others => '0');
	signal o_rom_7JLM_addr	: std_logic_vector(12 downto 0) := (others => '0');
--	signal o_rom_7JLM_ena	: std_logic := '1';

	signal i_rom_8KHE_data	: std_logic_vector(23 downto 0) := (others => '0');
	signal o_rom_8KHE_addr	: std_logic_vector(12 downto 0) := (others => '0');
	signal o_rom_8KHE_ena	: std_logic := '1';

	signal i_rom_8RNL_data	: std_logic_vector(23 downto 0) := (others => '0');
	signal o_rom_8RNL_addr	: std_logic_vector(12 downto 0) := (others => '0');
	signal o_rom_8RNL_ena	: std_logic := '1';

	signal ram_state_ctr		: std_logic_vector( 5 downto 0) := (others => '0');

	-- player controls
	signal psg_data_out		: std_logic_vector( 7 downto 0) := (others => '0');
	signal psg_data_in		: std_logic_vector( 7 downto 0) := (others => '0');

	signal cpu_addr			: std_logic_vector(15 downto 0) := (others => '0');
	signal cpu_data_in		: std_logic_vector( 7 downto 0) := (others => '0');
	signal cpu_data_out		: std_logic_vector( 7 downto 0) := (others => '0');
	signal ram0_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal ram1_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal rom_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal io_data				: std_logic_vector( 7 downto 0) := (others => '0');
	signal rom_sel				: std_logic_vector( 4 downto 0) := (others => '0');
	signal wd_ctr				: std_logic_vector( 3 downto 0) := (others => '0');
	signal cpu_rd_n			: std_logic := '0';
	signal cpu_wr_n			: std_logic := '0';
	signal cpu_rfsh_n			: std_logic := '0';
	signal cpu_mreq_n			: std_logic := '0';
	signal cpu_reset_n		: std_logic := '0';
--	signal RESETn				: std_logic := '1';

	signal s_wait				: std_logic := '0';
	signal s_wait_n			: std_logic := '1';
	signal s_wram0				: std_logic := '0';
	signal s_wram0_n			: std_logic := '1';
	signal s_wram1				: std_logic := '0';
	signal s_wram1_n			: std_logic := '1';
	signal s_ram0_n			: std_logic := '1';
	signal s_ram1_n			: std_logic := '1';
	signal s_ram2_n			: std_logic := '1';
	signal s_csen_n			: std_logic := '0';
	signal s_7P5				: std_logic := '0';
	signal s_7P9				: std_logic := '0';
	signal s_nmi_n				: std_logic := '1';
	signal s_nmion				: std_logic := '0';
	signal s_wdclr				: std_logic := '0';
	signal s_mhflip			: std_logic := '0';
	signal s_psg1_n			: std_logic := '0';
	signal s_psg2_n			: std_logic := '0';
	signal s_psg3_n			: std_logic := '0';
	signal s_swr_n				: std_logic := '0';
	signal s_srd_n				: std_logic := '0';
	signal s_sa0				: std_logic := '0';

	signal palette_data		: std_logic_vector( 7 downto 0) := (others => '0');
	signal sprite_data		: std_logic_vector( 7 downto 0) := (others => '0');
	signal char_data			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_t_bus				: std_logic_vector( 4 downto 0) := (others => '0');
	signal s_4p_bus			: std_logic_vector( 8 downto 0) := (others => '0');
	signal s_5ef_bus			: std_logic_vector( 7 downto 0) := (others => '0');
	signal s_6lm_bus			: std_logic_vector(10 downto 0) := (others => '0');
	signal s_6p_bus			: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_oc					: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_ov					: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_sc					: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_sv					: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_bc					: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_bv					: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_mc					: std_logic_vector( 3 downto 0) := (others => '0');
	signal s_mv					: std_logic_vector( 2 downto 0) := (others => '0');
	signal s_dac_out			: std_logic := '1';
	signal s_hsync_n			: std_logic := '1';
	signal s_cmpblk_n_r		: std_logic := '1';
	signal s_hblank_n			: std_logic := '1';
	signal s_hblank			: std_logic := '1';
	signal s_vblank_n			: std_logic := '1';
	signal s_vblank			: std_logic := '1';
	signal s_cmpblk_n			: std_logic := '1';
	signal s_cmpblk_n_last	: std_logic := '1';
	signal s_sw_n				: std_logic := '1';
	signal s_hbl				: std_logic := '0';
	signal s_vpl_n				: std_logic := '1';
	signal s_cdl_n				: std_logic := '1';
	signal s_mdl_n				: std_logic := '1';
	signal s_sel				: std_logic := '0';
	signal s_ss					: std_logic := '0';
	signal s_sload_n			: std_logic := '1';
	signal s_sl1_n				: std_logic := '1';
	signal s_sl2_n				: std_logic := '1';

	signal s_1H					: std_logic := '0';
	signal s_2H					: std_logic := '0';
	signal s_4H					: std_logic := '0';
	signal s_8H					: std_logic := '0';
	signal s_16H				: std_logic := '0';
	signal s_32H				: std_logic := '0';
	signal s_64H				: std_logic := '0';
	signal s_128H				: std_logic := '0';
	signal s_256H_n			: std_logic := '1';

	signal s_8H_x				: std_logic := '0';
	signal s_16H_x				: std_logic := '0';
	signal s_32H_x				: std_logic := '0';
	signal s_64H_x				: std_logic := '0';
	signal s_128H_x			: std_logic := '0';

	signal s_1V_x				: std_logic := '0';
	signal s_2V_x				: std_logic := '0';
	signal s_4V_x				: std_logic := '0';
	signal s_8V_x				: std_logic := '0';
	signal s_16V_x				: std_logic := '0';
	signal s_32V_x				: std_logic := '0';
	signal s_64V_x				: std_logic := '0';
	signal s_128V_x			: std_logic := '0';
	signal s_vsync_n			: std_logic := '1';

	signal s_1V_r				: std_logic := '0';
	signal s_1V_n_r			: std_logic := '1';
	signal s_256H_r			: std_logic := '0';
	signal s_contrlda_n		: std_logic := '1';
	signal s_contrldb_n		: std_logic := '1';
begin

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- USER portion begins here
------------------------------------------------------------------------------
----------------------------------------------------------------------------
	O_VIDEO_R			<= VideoR;
	O_VIDEO_G			<= VideoG;
	O_VIDEO_B			<= VideoB;
	O_HSYNC				<= s_hsync_n;
	O_VSYNC				<= s_vsync_n;
	O_HBLANK				<= s_hblank;	
	O_VBLANK			   <= s_vblank;		

	----------------------------------------------------------------------------
	-- concatenate some signals so we can pass them to modules as a logic vector
	----------------------------------------------------------------------------
	s_6p_bus		<= s_4V_x & s_2V_x & s_1V_x;
	s_t_bus		<= s_4V_x & s_2V_x & s_1V_x & s_8V_x & s_8H_x;
	s_4p_bus		<= s_4H & s_128V_x & s_64V_x & s_32V_x & s_16V_x & s_128H_x & s_64H_x & s_32H_x & s_16H_x;
	s_5ef_bus	<= s_128V_x & s_64V_x & s_32V_x & s_16V_x & s_8V_x & s_4V_x & s_2V_x & s_1V_x;
	s_6lm_bus	<= s_2H & s_128V_x & s_64V_x & s_32V_x & s_16V_x & s_8V_x & s_128H_x & s_64H_x & s_32H_x & s_16H_x & s_8H_x;

	clk_4M_en_n <= not clk_4M_en;

	-- chip 4L6 page 1
	cpu_reset_n <= RESETn and (not wd_ctr(3));

	-- chip 5N page 1
	watchdog : process(s_vblank, s_wdclr)
	begin
		if (s_wdclr = '1') then
			wd_ctr <= "0000";
		elsif falling_edge(s_vblank) then
			wd_ctr <= wd_ctr  + 1;
		end if;
	end process;

	-- chip 3H3 page 1
	s_merd_n <= cpu_mreq_n or cpu_rd_n;

	-- chip 3H11 page 1
	s_mewr_n <= cpu_mreq_n or cpu_wr_n;

	-- chip 1C12 page 1
	s_wait <= not (s_ram2_n or s_sw_n or s_hbl);

	-- chip 4L3 page 1
	s_csen_n <= s_wait and s_7P5;

	-- chip 6P10 page 1
	s_wait_n <= not (s_wait or s_7P9);

	-- chip 5P5 page 1
	U5P5 : process(s_vblank, s_nmion)
	begin
		if s_nmion = '0' then
			s_nmi_n <= '1';
		elsif rising_edge(s_vblank) then
			s_nmi_n <= '0';
		end if;
	end process;

	-- chip 7P page 1
	U7P5 : process(clk_4M_en, s_vblank)
	begin
		if s_vblank = '1' then
			s_7P5 <= '0';
		elsif rising_edge(clk_4M_en) then
			s_7P5 <= s_wait;
		end if;
	end process;

	U7P9 : process(clk_4M_en)
	begin
		if rising_edge(clk_4M_en) then
			s_7P9 <= s_7P5;
		end if;
	end process;

cpu_rom_addr <= cpu_addr(15 downto 0); 
rom_data <= cpu_rom_data;

	-----------
	-- CPU RAMs
	-----------
	-- our BRAM signals are opposite polarity from real SRAMs
	s_wram0  <= not s_wram0_n;
	s_wram1  <= not s_wram1_n;
	s_mewr <= not s_mewr_n;

	-- CPU RAM 0x8000 - 0x87ff
	-- chip 1E page 1	
	ram_1E : entity work.gen_ram
	generic map(
		dWidth	=> 8,
		aWidth	=> 11)
	port map(
		clk		=> clk_4M_en_n and s_wram0,
		we			=> s_mewr,
		addr		=> cpu_addr(10 downto 0),
		d			=> cpu_data_out,
		q			=>  ram0_data
	);
	
	ram_1H : entity work.gen_ram
	generic map(
		dWidth	=> 8,
		aWidth	=> 11)
	port map(
		clk		=> clk_4M_en_n and s_wram1,
		we			=> s_mewr,
		addr		=> cpu_addr(10 downto 0),
		d			=> cpu_data_out,
		q			=>  ram1_data
	);
	
	-------------------------------------------------------------------------------------------------------------
	-- CPU data bus mux: depending on address decoding logic connects a specific source to the cpu data bus input
	-------------------------------------------------------------------------------------------------------------
	cpu_data_in <=
		ram0_data		when							  (s_ram0_n = '0')		else -- chips 2H, 6N8 page 1
		ram1_data		when							  (s_ram1_n = '0')		else -- chips 2H, 6N8 page 1
		rom_data			when (s_merd_n = '0') and (rom_sel /= "11111")	else -- chips 2H, 6N8 page 1
		char_data		when (s_merd_n = '0') and (s_cs_9000_n = '0')	else -- chips 3L, 2R6, 8C6, 6N11 page 6
		sprite_data		when (s_merd_n = '0') and (s_cs_9800_n = '0')	else -- chips 2F, 7C8, 3H6 page 4
		palette_data	when (s_merd_n = '0') and (s_cs_9c00_n = '0')	else -- chips 7B, 7C, 8C11, 8C8 page 8
		io_data			when (s_merd_n = '0') and (s_cs_b000_n = '0')	else -- chips 3N3, 3N11, 3P page 2
		(others => '0');		

	--------------------------------------------------------------------------------
	-- memory decoder generates active low select signals for various memory regions
	--------------------------------------------------------------------------------
		
		
	-- chip 3M page 1
	rom_sel(0)	<= '0' when (                      cpu_addr(15 downto 13) = "000"   ) else '1'; -- 0x0000 - 0x1fff
	rom_sel(1)	<= '0' when (                      cpu_addr(15 downto 13) = "001"   ) else '1'; -- 0x2000 - 0x3fff
	rom_sel(2)	<= '0' when (                      cpu_addr(15 downto 13) = "010"   ) else '1'; -- 0x4000 - 0x5fff
	rom_sel(3)	<= '0' when (                      cpu_addr(15 downto 13) = "011"   ) else '1'; -- 0x6000 - 0x7fff
	
	rom_sel(4)	<= '0' when ( cpu_mreq_n = '0' and cpu_addr(15 downto 13) = "110"   ) else '1'; -- 0xc000 - 0xdfff

	-- chip 5M page 1
	s_ram0_n		<= '0' when ( cpu_mreq_n = '0' and cpu_addr(15 downto 11) = "10000" ) else '1'; -- 0x8000 - 0x87ff
	s_ram1_n		<= '0' when ( cpu_mreq_n = '0' and cpu_addr(15 downto 11) = "10001" ) else '1'; -- 0x8800 - 0x8fff
	s_ram2_n		<= '0' when ( cpu_mreq_n = '0' and cpu_addr(15 downto 11) = "10010" ) else '1'; -- 0x9000 - 0x97ff

	-- chip 4M page 1
	s_wram0_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10000"  ) else '1'; -- 0x8000 - 0x87ff
	s_wram1_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10001"  ) else '1'; -- 0x8800 - 0x8fff
	s_cs_9000_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10010"  ) else '1'; -- 0x9000 - 0x97ff
	s_cs_b000_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10110"  ) else '1'; -- 0xb000 - 0xb7ff
	s_cs_b800_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 11) = "10111"  ) else '1'; -- 0xb800 - 0xbfff

	-- chip 2S page 1
	s_cs_9800_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 9) = "1001100" ) else '1'; -- 0x9800 - 0x99ff
	s_cs_9a00_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 9) = "1001101" ) else '1'; -- 0x9a00 - 0x9bff
	s_cs_9c00_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 9) = "1001110" ) else '1'; -- 0x9c00 - 0x9dff
	s_cs_9e00_n	<= '0' when ( cpu_mreq_n = '0' and cpu_rfsh_n = '1' and s_csen_n = '0' and cpu_addr(15 downto 9) = "1001111" ) else '1'; -- 0x9e00 - 0x9fff

VideoR <= s_red;
VideoG <= s_grn;
VideoB <= s_blu;
O_HSYNC <= s_hsync_n;
O_VSYNC <= s_vsync_n;
	------------------------
	-- Z80 CPU on main board
	------------------------
	-- chip 3K page 1
	cpu_3K : entity work.T80sed
	port map (
		-- inputs
		WAIT_n		=> s_wait_n,
		NMI_n			=> s_nmi_n,
		DI				=> cpu_data_in,
		RESET_n		=> cpu_reset_n,
		CLK_n			=> clk_4M_en,
		CLKEN			=> '1',
		INT_n			=> '1',  -- unused
		BUSRQ_n		=> '1',  -- unused
		-- outputs
		RFSH_n		=> cpu_rfsh_n,
		MREQ_n		=> cpu_mreq_n,
		RD_n			=> cpu_rd_n,
		WR_n			=> cpu_wr_n,
		A				=> cpu_addr,
		DO				=> cpu_data_out,
		M1_n			=> open, -- unused
		IORQ_n		=> open, -- unused
		HALT_n		=> open, -- unused
		BUSAK_n		=> open  -- unused
	);

	-------------------------------------------------------------------------
	-- page 2 schematic - input switches, watchdog and non-maskable interrupt
	-------------------------------------------------------------------------
	p2 : entity work.switches
	port map (
		I_AB					=> cpu_addr(2 downto 0),
		I_DB0					=> cpu_data_out(0),
		I_CLK					=> clk_6M_en,
		I_CS_B000_n			=> s_cs_b000_n,	-- mem select region 0xb000 - 0xb7ff
		I_MERD_n				=> s_merd_n,		-- mem rd signal
		I_MEWR_n				=> s_mewr_n,		-- mem wr signal
		--
		I_P1					=> p1_sw,			-- Player 1 active low switches
		I_P2					=> p2_sw,			-- Player 2 active low switches
		I_SYS					=> s_sys,			-- System active low switches
		I_SW1					=> s_sw1,			-- SW1 presets
		I_SW2					=> s_sw2,			-- SW2 presets
		--
		O_DB					=> io_data,
		O_WDCLR				=> s_wdclr,
		O_NMION				=> s_nmion,
		O_FLIP				=> s_flip
	);

	-------------------------------------------------------
	-- page 3 schematic - video and timing signal generator
	-------------------------------------------------------
	p3 : entity work.timing
	port map (
		I_CLK_6M_EN			=> clk_6M_en,
		I_FLIP				=> s_flip,
		I_CS_9A00_n			=> s_cs_9a00_n,
		I_MEWR_n				=> s_mewr_n,
		I_AB					=> cpu_addr(0),
		I_DB					=> cpu_data_out( 3 downto 0),
		--
		O_SLOAD_n			=> s_sload_n,
--		O_SLOAD				=> open,
		O_SL1_n				=> s_sl1_n,
		O_SL2_n				=> s_sl2_n,
		O_SW_n				=> s_sw_n,
		O_SS					=> s_ss,
		O_HBL					=> s_hbl,
		O_CONTROLDB_n		=> s_contrldb_n,
		O_CONTROLDA_n		=> s_contrlda_n,
		O_VPL_n				=> s_vpl_n,
		O_CDL_n				=> s_cdl_n,
		O_MDL_n				=> s_mdl_n,
		O_SEL					=> s_sel,
		O_1V_r				=> s_1V_r,
		O_1V_n_r				=> s_1V_n_r,
		O_256H_r				=> s_256H_r,
		O_CMPBLK_n_r		=> s_cmpblk_n_r,
		O_CMPBLK_n			=> s_cmpblk_n,
--		O_CMPBLK				=> open,
		O_HBLANK_n			=> s_hblank_n,
		O_HBLANK				=> s_hblank,
		O_VBLANK_n			=> s_vblank_n,
		O_VBLANK				=> s_vblank,
		O_TVSYNC_n			=> open,
		O_HSYNC_n 			=> s_hsync_n,

		O_1H					=> s_1H,
		O_2H					=> s_2H,
		O_4H					=> s_4H,
		O_8H					=> s_8H,
		O_16H					=> s_16H,
		O_32H					=> s_32H,
		O_64H					=> s_64H,
		O_128H				=> s_128H,
		O_256H_n 			=> s_256H_n,

		O_8H_X				=> s_8H_x,
		O_16H_X				=> s_16H_x,
		O_32H_X				=> s_32H_x,
		O_64H_X				=> s_64H_x,
		O_128H_X 			=> s_128H_x,

		O_1V_X				=> s_1V_x,
		O_2V_X				=> s_2V_x,
		O_4V_X				=> s_4V_x,
		O_8V_X				=> s_8V_x,
		O_16V_X				=> s_16V_x,
		O_32V_X				=> s_32V_x,
		O_64V_X				=> s_64V_x,
		O_128V_X				=> s_128V_x,
		O_VSYNC_n			=> s_vsync_n
	);

	--------------------------------------
	-- page 4 schematic - sprite generator
	--------------------------------------
	p4 : entity work.sprite_gen
	port map (
		I_CLK_6M_EN			=> clk_6M_en,
--		I_CLK_12M			=> clk_12M,
		I_CS_9800_n			=> s_cs_9800_n,
		I_MEWR_n				=> s_mewr_n,
		I_MDL_n				=> s_mdl_n,
		I_CDL_n				=> s_cdl_n,
		I_VPL_n				=> s_vpl_n,
		I_SLOAD_n			=> s_sload_n,
		I_SEL					=> s_sel,

		I_2H					=> s_2H,
		I_4H					=> s_4H,
		I_8H					=> s_8H,
		I_16H					=> s_16H,
		I_32H					=> s_32H,
		I_64H					=> s_64H,
		I_128H				=> s_128H,
		I_256H_n				=> s_256H_n,

		I_5EF_BUS			=> s_5ef_bus,
		I_AB					=> cpu_addr( 6 downto 0),
		I_DB					=> cpu_data_out,
		I_ROM_7JLM_DATA	=> i_rom_7JLM_data,
		--
--		O_ROM_7JLM_ENA		=> o_rom_7JLM_ena,
		O_ROM_7JLM_ADDR	=> o_rom_7JLM_addr,
		O_MHFLIP				=> s_mhflip,
		O_MC					=> s_mc,
		O_MV					=> s_mv,
		O_DB					=> sprite_data
	);

	----------------------------------------
	-- page 5 schematic - sprite positioning
	----------------------------------------
	p5 : entity work.sprite_position
	port map (
		I_CLK_6M_EN		=> clk_6M_en,
		I_CLK_12M		=> clk_12M,
		I_FLIP			=> s_flip,
		I_CONTRLDA_n	=> s_contrlda_n,
		I_CONTRLDB_n	=> s_contrldb_n,
		I_MHFLIP			=> s_mhflip,
		I_1V_r			=> s_1V_r,
		I_1V_n_r			=> s_1V_n_r,
		I_256H_r			=> s_256H_r,
		I_CTR				=> sprite_data,
		I_MC				=> s_mc,
		I_MV				=> s_mv,
		--
		O_OC				=> s_oc,
		O_OV				=> s_ov
	);

	-----------------------------------------
	-- page 6 schematic - character generator
	-----------------------------------------
	p6 : entity work.char_gen
	port map (
		I_CLK_6M_EN			=> clk_6M_en,
		I_CLK_12M			=> clk_12M,
		I_CS_9000_n			=> s_cs_9000_n,
		I_MEWR_n				=> s_mewr_n,
		I_CMPBLK_n			=> s_cmpblk_n,
		I_FLIP				=> s_flip,
		I_SS					=> s_ss,
		I_SL1_n				=> s_sl1_n,
		I_SL2_n				=> s_sl2_n,
		I_SLOAD_n			=> s_sload_n,
		I_6LM_BUS			=> s_6lm_bus,
		I_DB					=> cpu_data_out,
		I_AB					=> cpu_addr(10 downto 0),
		I_ROM_8KHE_DATA	=> i_rom_8KHE_data,
		I_6P_BUS				=> s_6p_bus,
		--
		O_SV					=> s_sv,
		O_SC					=> s_sc,
		O_DB					=> char_data,
		O_ROM_8KHE_ENA		=> o_rom_8KHE_ena,
		O_ROM_8KHE_ADDR	=> o_rom_8KHE_addr
	);

	------------------------------------------------
	-- page 7 schematic - background image generator
	------------------------------------------------
	p7 : entity work.bgnd_tiles
	port map (
		I_CLK_6M_EN			=> clk_6M_en,
		I_CS_9E00_n			=> s_cs_9e00_n,
		I_MEWR_n				=> s_mewr_n,
		I_CMPBLK_n			=> s_cmpblk_n,
		I_SLOAD_n			=> s_sload_n,
		I_SL2_n				=> s_sl2_n,
		I_FLIP				=> s_flip,
		I_4P_BUS				=> s_4p_bus,
		I_T_BUS				=> s_t_bus,
		I_DB					=> cpu_data_out(4 downto 0),
		I_ROM_4P_DATA		=> i_rom_4P_data,
		I_ROM_8RNL_DATA	=> i_rom_8RNL_data,
		--
		O_ROM_4P_ENA		=> o_rom_4P_ena,
		O_ROM_4P_ADDR		=> o_rom_4P_addr,
		O_ROM_8RNL_ENA		=> o_rom_8RNL_ena,
		O_ROM_8RNL_ADDR	=> o_rom_8RNL_addr,
		O_BC					=> s_bc,
		O_BV					=> s_bv
	);

	----------------------------------------------------
	-- page 8 schematic - color palette and video output
	----------------------------------------------------
	p8 : entity work.palette
	port map (
		I_CLK_6M_EN			=> clk_6M_en,
		I_CS_9C00_n			=> s_cs_9c00_n,
		I_MEWR_n				=> s_mewr_n,
		I_MERD_n				=> s_merd_n,
		I_CMPBLK_n_r		=> s_cmpblk_n_r,
		I_VBLANK_n			=> s_vblank_n,
		I_OC					=> s_oc,
		I_OV					=> s_ov,
		I_SC					=> s_sc,
		I_SV					=> s_sv,
		I_BC					=> s_bc,
		I_BV					=> s_bv,
		I_AB					=> cpu_addr(8 downto 0),
		I_DB					=> cpu_data_out,
		--
		O_DB					=> palette_data,
		O_R					=> s_red,
		O_G					=> s_grn,
		O_B					=> s_blu
	);

	-----------------------------------------
	-- page 9 schematic - audio CPU, ROM, RAM
	-----------------------------------------
	p9 : entity work.audio
	port map (
		I_RESET_n			=> RESETn,
		I_CLK_3M				=> s_1H,
		I_VSYNC_n			=> s_vsync_n,
		I_CS_B800_n			=> s_cs_b800_n,
		I_MERW_n				=> s_mewr_n,
		I_DB_CPU				=> cpu_data_out,
		I_SD					=> psg_data_out,
		O_SD					=> psg_data_in,
		O_SA0					=> s_sa0,
		O_PSG1_n				=> s_psg1_n,
		O_PSG2_n				=> s_psg2_n,
		O_PSG3_n				=> s_psg3_n,
		O_SWR_n				=> s_swr_n,
		O_SRD_n				=> s_srd_n
	);

	----------------------------------------------------
	-- page 10 schematic - programmable sound generators
	----------------------------------------------------
	p10 : entity work.psgs
	port map (
		I_RST_n				=> RESETn,
		I_CLK					=> s_1H,
		I_SWR_n				=> s_swr_n,
		I_SRD_n				=> s_srd_n,
		I_SA0					=> s_sa0,
		I_PSG1_n				=> s_psg1_n,
		I_PSG2_n				=> s_psg2_n,
		I_PSG3_n				=> s_psg3_n,
		I_SD					=> psg_data_in,
		O_SD					=> psg_data_out,
		O_AUDIO_L			=> O_AUDIO_L,
		O_AUDIO_R			=> O_AUDIO_R
	);

--	---------------------------------
--	-- page 4 schematic - sprite ROMS
--	---------------------------------
--	-- chip 7J page 4
	ROM_7J : entity work.ROM_7J
		port map (
			CLK	=> clk_6M_en,
--			ENA	=> o_rom_7JLM_ena,
			ADDR	=> o_rom_7JLM_addr,
			DATA	=> i_rom_7JLM_data(23 downto 16)
		);

--	-- chip 7L page 4
	ROM_7L : entity work.ROM_7L
		port map (
			CLK	=> clk_6M_en,
--			ENA	=> o_rom_7JLM_ena,
			ADDR	=> o_rom_7JLM_addr,
			DATA	=> i_rom_7JLM_data(15 downto  8)
		);

--	-- chip 7M page 4
	ROM_7M : entity work.ROM_7M
		port map (
			CLK	=> clk_6M_en,
--			ENA	=> o_rom_7JLM_ena,
			ADDR	=> o_rom_7JLM_addr,
			DATA	=> i_rom_7JLM_data( 7 downto  0)
		);
--
--	----------------------------------------------
--	-- page 6 schematic - character generator ROMs
--	----------------------------------------------
--	-- chip 8K page 6
	ROM_8K : entity work.ROM_8K
		port map (
			CLK	=> clk_6M_en and o_rom_8KHE_ena,
--			ENA	=> o_rom_8KHE_ena,
			ADDR	=> o_rom_8KHE_addr(11 downto 0),
			DATA	=> i_rom_8KHE_data(23 downto 16)
		);
--
--	-- chip 8H page 6
	ROM_8H : entity work.ROM_8H
		port map (
			CLK	=> clk_6M_en and o_rom_8KHE_ena,
--			ENA	=> o_rom_8KHE_ena,
			ADDR	=> o_rom_8KHE_addr(11 downto 0),
			DATA	=> i_rom_8KHE_data(15 downto  8)
		);
--
--	-- chip 8E page 6
	ROM_8E : entity work.ROM_8E
		port map (
			CLK	=> clk_6M_en and o_rom_8KHE_ena,
--			ENA	=> o_rom_8KHE_ena,
			ADDR	=> o_rom_8KHE_addr(11 downto 0),
			DATA	=> i_rom_8KHE_data( 7 downto  0)
		);
--
--	-------------------------------------------
--	-- page 7 schematic - background tiles ROMs
--	-------------------------------------------
bg_rom_addr <= o_rom_8RNL_addr;
i_rom_8RNL_data <= bg_rom_data;
--	-- chip 4P page 7
	ROM_4P : entity work.ROM_4P
		port map (
			clk	=> clk_6M_en,
--			ENA	=> o_rom_4P_ena,
			addr	=> o_rom_4P_addr(11 downto 0),
			data	=> i_rom_4P_data
		);

	-- The following state machine implements all the 10 separate video ROMs (4P, 7J, 7L, 7M, 8K, 8H, 8E, 8R, 8N, 8L)
	-- by reading the external SRAM on a 48Mhz clock and presenting the data just in time to the video circuitry which
	-- thinks it's accessing 10 discrete ROM chips

	-- all the video signals are in syc with each other as they are derived from vcount and hcount.
	-- hcount is free running off the 6Mhz clock and vcount is clocked off hcount's MSB (256H)
	-- because of that we can rely on ram_state_ctr to identify what signal is active and when
	-- /MDL is low when ram_state_ctr   =  4, 5, 6, 7, 8, 9, a, b
	-- /SL1 is low when ram_state_ctr   =  8, 9, a, b, c, d, e, f
	-- /CDL is low when ram_state_ctr   = 14,15,16,17,18,19,1a,1b
	-- /SL2 is low when ram_state_ctr   = 18,19,1a,1b,1c,1d,1e,1f
	-- /VPL is low when ram_state_ctr   = 24,25,26,27,28,29,2a,2b
	-- /SLOAD is low when ram_state_ctr = 38,39,3a,3b,3c,3d,3e,3f

	-- TIMING CHECKS from simulation
	-- background generator - 4P latched @0 and again @20, 8RNL latched @0
	-- character generator  - 8KHE can be read as early as state @20 because T0,T1,T2 only ever change at @0 and 5L is latched @10 and 4L is latched @20
	-- sprite generator     - 7JLM address always stable from rise of /VPL @2C to rise of /SLOAD @00

	-- sync the state machine to rising edge of /CMPBLK and advance 
	ram_state : process(clk_48M, s_cmpblk_n)
	begin
		if rising_edge(clk_48M) then
			s_cmpblk_n_last <= s_cmpblk_n;
			if (s_cmpblk_n_last = '0') and (s_cmpblk_n = '1') then -- rising edge of s_cmpblk_n
				ram_state_ctr <= (others => '0');
			else
				ram_state_ctr <= ram_state_ctr + 1;
			end if;
		end if;
	end process;

end RTL;
