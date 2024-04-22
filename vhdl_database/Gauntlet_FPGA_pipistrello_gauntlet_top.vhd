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

--------------------------------------------------------------------------------
--	Top level for Gauntlet arcade game targeted for Pipistrello board, basic h/w specs:
--		Spartan 6 LX45
--		50Mhz xtal oscillator
--		128Mbit serial Flash
--		2Mx16 SRAM 10ns on external board

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity GAUNTLET_TOP is
	port(
		-- FLASH
		FLASH_MOSI			: out	std_logic;								-- Serial output to FLASH chip SI pin
		FLASH_SCK			: out	std_logic;								-- FLASH clock
		FLASH_MISO			: in	std_logic;								-- Serial input from FLASH chip SO pin
		FLASH_WPn			: out	std_logic;								-- Write Protect
		FLASH_HOLDn			: out	std_logic;								-- Pause comm without deselecting
		FLASH_CSn			: out	std_logic;								-- Chip select

		-- EXTERNAL MEMORY
		MEM_A					: out	std_logic_vector(20 downto 0);	-- SRAM address bus
		MEM_D					: inout std_logic_vector(15 downto 0);	-- SRAM data bus
		SRAM_nCS				: out	std_logic;								-- SRAM chip select active low
		FLASH_nCE			: out	std_logic;								-- Active low FLASH chip select
		MEM_nWE				: out	std_logic;								-- SRAM write enable active low
		MEM_nOE				: out	std_logic;								-- SRAM output enable active low
		MEM_nBHE				: out	std_logic;								-- SRAM byte hi enable active low
		MEM_nBLE				: out	std_logic;								-- SRAM byte lo enable active low
		MEM_CK				: out	std_logic;

		-- RGB monitor output
--		O_VIDEO_R			: out	std_logic_vector(3 downto 0);
--		O_VIDEO_G			: out	std_logic_vector(3 downto 0);
--		O_VIDEO_B			: out	std_logic_vector(3 downto 0);
--		O_HSYNC				: out	std_logic;
--		O_VSYNC				: out	std_logic;

--		-- HDMI monitor output
		TMDS_P,
		TMDS_N				: out	std_logic_vector(3 downto 0);

		-- Sound out
		O_AUDIO_L,
		O_AUDIO_R			: out	std_logic;

		-- External controller
		PMOD1_IO4			: inout std_logic; -- gamecube controller I/O line
		PMOD1_IO1			: in	std_logic;   -- selftest
		LEDS					: out	std_logic_vector(4 downto 1);

		I_RESET				: in	std_logic;								-- active high reset

		-- 50MHz clock
		CLK_IN				: in	std_logic := '0'						-- External clock
	);
end GAUNTLET_TOP;

architecture RTL of GAUNTLET_TOP is
	constant clk_type			: string :="PLL"; -- "CTR", "SIM", "DCM", "PLL"
--	constant flash_length	: std_logic_vector(23 downto 0) := x"000004"; -- for faster simulation

	-- Define Gauntlet params
	constant slap_type		: integer := 104;
	constant flash_address	: std_logic_vector(23 downto 0) := x"200000"; -- byte offset in flash
	constant flash_length	: std_logic_vector(23 downto 0) := x"0C8000"; -- length in words
	-- Define Gauntlet II params
--	constant slap_type		: integer := 106;
--	constant flash_address	: std_logic_vector(23 downto 0) := x"390000"; -- byte offset in flash
--	constant flash_length	: std_logic_vector(23 downto 0) := x"0C8000"; -- length in words
	-- Define Vindicators II params
--	constant slap_type		: integer := 118;
--	constant flash_address	: std_logic_vector(23 downto 0) := x"520000"; -- byte offset in flash
--	constant flash_length	: std_logic_vector(23 downto 0) := x"0C8000"; -- length in words

	-- bootstrap control of SRAM, these signals connect to SRAM when bs_done = '0'
	signal bs_AD			: std_logic_vector(20 downto 0) := (others => '0');
	signal bs_DO			: std_logic_vector(15 downto 0) := (others => '0');
	signal bs_nCS			: std_logic := '1';
	signal bs_nWE			: std_logic := '1';
	signal bs_nOE			: std_logic := '1';
	signal bs_nBLE			: std_logic := '1';
	signal bs_nBHE			: std_logic := '1';

	signal bs_done			: std_logic := '1';	-- low when FLASH is being copied to SRAM, can be used by user as active low reset
	signal bs_reset		: std_logic := '1';

	--
	-- Gauntlet signals
	--
	signal ram_state_ctr		: natural range 0 to 7 := 0;
	signal
	-- player buttons active low
		p1_coin, p1_start, p1_fire, p1_down, p1_up, p1_left, p1_right,
		p2_coin, p2_start, p2_fire, p2_down, p2_up, p2_left, p2_right,
		p3_coin, but_A, but_B, but_X, but_Y, but_Z, but_S,
		p4_coin, p_stest,
		int_reset,
		clk_7M,    gclk_7M,
		clk_14M,   gclk_14M,
		clk_28M,   gclk_28M, clk_28M_inv,
		clk_dvi_p, gclk_dvi_p,
		clk_dvi_n, gclk_dvi_n,

		user_nCS,
		user_nWE,
		user_nOE,
		user_nBLE,
		user_nBHE,

		sl_cmpblk_n,
		sl_dac_out_l,
		sl_dac_out_r,
		sl_HSync_n,
		sl_VSync_n,
		sl_HSync,
		sl_VSync,
		sl_blank,
		sl_AP_EN,
		sl_GP_EN,
		sl_MP_EN
								: std_logic := '1';
	-- video
	signal
		slv_4R_data,
		slv_int,
		slv_red,
		slv_grn,
		slv_blu,
		slv_R,
		slv_G,
		slv_B,
		slv_VideoI,
		slv_VideoR,
		slv_VideoG,
		slv_VideoB
								: std_logic_vector(3 downto 0) := (others => '0');
	signal
		slv_4R_addr,
--		slv_ROM_10A,
--		slv_ROM_10B,
--		slv_ROM_9A,
--		slv_ROM_9B,
--		slv_ROM_7A,
--		slv_ROM_7B,
--		slv_ROM_6A,
--		slv_ROM_6B,
--		slv_ROM_5A,
--		slv_ROM_5B,
--		slv_ROM_3A,
--		slv_ROM_3B,
--		slv_ROM_1A,
--		slv_ROM_1B,
--		slv_ROM_2A,
--		slv_ROM_2B,
--		slv_ROM_1L,
--		slv_ROM_1MN,
--		slv_ROM_2L,
--		slv_ROM_2MN,
		joy_X,
		joy_Y,
		slv_ROM_16R,
		slv_ROM_16S
								: std_logic_vector( 7 downto 0) := (others => '1');
	signal
		slv_audio_l,
		slv_audio_r
								: std_logic_vector(15 downto 0) := (others => '0');

	signal slv_GP_DATA		: std_logic_vector(31 downto 0) := (others => '0');
	signal slv_MP_DATA		: std_logic_vector(15 downto 0) := (others => '0');
	signal slv_AP_DATA		: std_logic_vector( 7 downto 0) := (others => '0');
	signal slv_CP_DATA		: std_logic_vector( 7 downto 0) := (others => '0');

	signal slv_GP_ADDR		: std_logic_vector(17 downto 0) := (others => '0');
	signal slv_MP_ADDR		: std_logic_vector(18 downto 0) := (others => '0');
	signal slv_AP_ADDR		: std_logic_vector(15 downto 0) := (others => '0');
	signal slv_CP_ADDR		: std_logic_vector(13 downto 0) := (others => '0');

	signal user_AD			: std_logic_vector(20 downto 0) := (others => '0');
	signal user_DI			: std_logic_vector(15 downto 0) := (others => '0');

begin
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- SRAM Bootstrap begins here
------------------------------------------------------------------------------
------------------------------------------------------------------------------

	-- SRAM muxer, allows access to physical SRAM by either bootstrap or user
	MEM_D		<= bs_DO		when bs_done = '0' and bs_nWE = '0' else (others => 'Z');	-- no need for user write

	MEM_A		<= bs_AD		when bs_done = '0' else user_AD;
	SRAM_nCS	<= bs_nCS	when bs_done = '0' else user_nCS;
	MEM_nWE	<= bs_nWE	when bs_done = '0' else user_nWE;
	MEM_nOE	<= bs_nOE	when bs_done = '0' else user_nOE;

	MEM_nBHE	<= bs_nBHE	when bs_done = '0' else user_nBHE;	-- for accessing hi byte lane
	MEM_nBLE	<= bs_nBLE	when bs_done = '0' else user_nBLE;	-- for accessing lo byte lane

	FLASH_nCE	<= '1'; -- SST39LF800A deselected

	-- this isn't needed, just used in the testbench to simulate a 10ns access delay
	ODDR2_inst : ODDR2 generic map(DDR_ALIGNMENT=>"NONE", INIT=>'0', SRTYPE=>"SYNC")
		port map (Q=>MEM_CK, C0=>clk_28M, C1=>clk_28M_inv, CE=>'1', D0=>'1', D1=>'0', R=>'0', S=>'0');
	clk_28M_inv <= not clk_28M;

	u_bs : entity work.bootstrap
	generic map (
		-- Keep the first 2MB of flash available for FPGA bitstream so place game ROM data starting at flash offset 0x200000
		user_address	=> flash_address,
		user_length		=> flash_length
	)
	port map (
		I_CLK				=> gclk_28M,
		I_RESET			=> bs_reset,
		-- FLASH interface
		I_FLASH_SO		=> FLASH_MISO,	-- to FLASH chip SPI output
		O_FLASH_CK		=> FLASH_SCK,	-- to FLASH chip SPI clock
		O_FLASH_CS		=> FLASH_CSn,	-- to FLASH chip select
		O_FLASH_SI		=> FLASH_MOSI,	-- to FLASH chip SPI input
		O_FLASH_WPn		=> FLASH_WPn,  -- N25Q128A write enabled
		O_FLASH_HOLDn	=> FLASH_HOLDn,-- N25Q128A hold deactivated
		-- SRAM interface
		O_A				=> bs_AD,
		O_DOUT			=> bs_DO,
		O_nCS				=> bs_nCS,
		O_nWE				=> bs_nWE,
		O_nOE				=> bs_nOE,
		O_BHEn			=> bs_nBHE,
		O_BLEn			=> bs_nBLE,
		O_BS_DONE		=> bs_done -- reset output to rest of machine
	);

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- USER portion begins here
------------------------------------------------------------------------------
------------------------------------------------------------------------------

	-- Audio output
	O_AUDIO_L	<= sl_dac_out_l;
	O_AUDIO_R	<= sl_dac_out_r;

	-- VGA output
--	O_HSYNC		<= sl_HSync;
--	O_VSYNC		<= sl_VSync;
--	O_VIDEO_R	<= slv_VideoR;
--	O_VIDEO_G	<= slv_VideoG;
--	O_VIDEO_B	<= slv_VideoB;

	user_nCS		<= '0';				-- SRAM always selected
	user_nOE		<= '0';				-- SRAM output enabled
	user_nWE		<= '1';				-- SRAM write enable inactive (we use it as ROM)
	user_nBLE	<= '0';
	user_nBHE	<= '0';

	int_reset	<= not bs_done;	-- active high reset

	-- Clock
	u_clks : entity work.CLOCKS
	generic map (
		clk_type => clk_type
	)
	port map(
		I_CLK => CLK_IN,		-- 50MHz clock
		I_RST => I_RESET,		-- active high reset input
		O_RST => bs_reset,	-- active high reset output
		O_CK0 => clk_7M,		-- 7MHz
		O_CK1 => clk_14M,		-- 14MHz
		O_CK2 => clk_28M,		-- 28MHz
		O_CK3 => clk_dvi_p,	-- 140MHz pos
		O_CK4 => clk_dvi_n,	-- 140MHz neg
		O_CK5 => open			-- UNUSED
	);

	-- route clocks on global clock lines
	clk0_bufg : BUFG port map (O => gclk_7M   , I => clk_7M   );
	clk1_bufg : BUFG port map (O => gclk_14M  , I => clk_14M  );
	clk2_bufg : BUFG port map (O => gclk_28M  , I => clk_28M  );
	clk3_bufg : BUFG port map (O => gclk_dvi_p, I => clk_dvi_p);
	clk4_bufg : BUFG port map (O => gclk_dvi_n, I => clk_dvi_n);

	u_gauntlet : entity work.FPGA_GAUNTLET
	port map(
		-- System Clock
		I_CLK_14M	=> gclk_14M,
		I_CLK_7M		=> gclk_7M,

		-- Active high reset
		I_RESET		=> int_reset,

		-- player 1 controls, active low
		I_P1(7)		=> p1_up,			-- p1_up,					-- P1 up
		I_P1(6)		=> p1_down,			-- p1_down, 				-- P1 down
		I_P1(5)		=> p1_left,			-- p1_left, 				-- P1 left
		I_P1(4)		=> p1_right,		-- p1_right, 				-- P1 right
		I_P1(3)		=> '1',				-- unused
		I_P1(2)		=> '1',				-- unused
		I_P1(1)		=> p1_fire,			-- p1_fire, 				-- P1 fire
		I_P1(0)		=> p1_start,		-- p1_start, 				-- P1 start

		-- player 2 controls, active low
		I_P2			=> x"FF",					-- P2

		-- player 3 controls, active low
		I_P3			=> x"FF",					-- P3

		-- player 4 controls, active low
		I_P4			=> x"FF",					-- P4

		-- system inputs, active low
		I_SYS(4)		=> PMOD1_IO1,			-- SELF TEST active low
		I_SYS(3)		=> p1_coin,				-- COIN1-L
		I_SYS(2)		=> p2_coin,				-- COIN2
		I_SYS(1)		=> p3_coin,				-- COIN3
		I_SYS(0)		=> p4_coin,				-- COIN4-R
		I_SLAP_TYPE	=>	slap_type,			-- slapstic type can be changed dynamically

		O_LEDS		=> LEDS,

		-- Audio out
		O_AUDIO_L	=> slv_audio_l,
		O_AUDIO_R	=> slv_audio_r,

		-- VGA monitor output
		O_VIDEO_I	=> slv_int,
		O_VIDEO_R	=> slv_red,
		O_VIDEO_G	=> slv_grn,
		O_VIDEO_B	=> slv_blu,
		O_HSYNC		=> sl_HSync_n,
		O_VSYNC		=> sl_VSync_n,
		O_CSYNC		=> open,
		O_HBLANK		=> open,
		O_VBLANK		=> open,

		-- Access to external ROMs
		-- GFX ROMs
		O_GP_EN		=> sl_GP_EN,  -- active high (GPEN)
		O_GP_ADDR	=> slv_GP_ADDR,
		I_GP_DATA	=> slv_GP_DATA,
		-- CHAR ROM
		O_CP_ADDR	=> slv_CP_ADDR,
		I_CP_DATA	=> slv_CP_DATA,
		-- Main Program ROMs
		O_MP_EN		=> sl_MP_EN,  -- active high (AS)
		O_MP_ADDR	=> slv_MP_ADDR,
		I_MP_DATA	=> slv_MP_DATA,
		-- MO control
		O_4R_ADDR	=> slv_4R_addr,
		I_4R_DATA	=> slv_4R_data,
		-- Audio Program ROMs
		O_AP_EN		=> sl_AP_EN,  -- active high (CPUENA)
		O_AP_ADDR	=> slv_AP_ADDR,
		I_AP_DATA	=> slv_AP_DATA
	);

	u_4R : entity work.PROM_4R_G1 port map (CLK=>gclk_14M, ADDR=>slv_4R_addr, DATA=>slv_4R_data);

	-- convert input video from 16bit IRGB to 12 bit RGB
	u_R : entity work.RGBI port map (ADDR(7 downto 4)=>slv_int, ADDR(3 downto 0)=>slv_red, DATA=>slv_R);
	u_G : entity work.RGBI port map (ADDR(7 downto 4)=>slv_int, ADDR(3 downto 0)=>slv_grn, DATA=>slv_G);
	u_B : entity work.RGBI port map (ADDR(7 downto 4)=>slv_int, ADDR(3 downto 0)=>slv_blu, DATA=>slv_B);

	u_gc : entity work.gamecube
	port map (
		clk	=> gclk_28M,
		reset	=> int_reset,
		serio	=> PMOD1_IO4,

		but_S	=> but_S,	-- button Start
		but_X	=> but_X,	-- button X
		but_Y	=> but_Y,	-- button Y
		but_Z	=> but_Z,	-- button Z
		but_A	=> but_A,	-- button A
		but_B	=> but_B,	-- button B
		but_L	=> open,		-- button Left
		but_R	=> open,		-- button Right
		but_DU=> open,		-- button Dpad up
		but_DD=> open,		-- button Dpad down
		but_DL=> open,		-- button Dpad left
		but_DR=> open,		-- button Dpad right

		joy_X	=> joy_X,	-- Joy X analog
		joy_Y	=> joy_Y,	-- Joy Y analog
		cst_X	=> open,		-- C-Stick X analog
		cst_Y	=> open,		-- C-Stick Y analog
		ana_L	=> open,		-- Left Button analog
		ana_R	=> open		-- Right Button analog
	);

	p1_right	<= '0' when (joy_X > x"A0") else '1';
	p1_left	<= '0' when (joy_X < x"60") else '1';
	p1_up		<= '0' when (joy_Y > x"A0") else '1';
	p1_down	<= '0' when (joy_Y < x"60") else '1';
	p1_coin	<= '0' when (but_Z = '1')   else '1';
	p1_start	<= '0' when (but_B = '1')   else '1';
	p1_fire	<= '0' when (but_A = '1')   else '1';

	-----------------------------------------------------------------
	-- video scan converter required to display video on VGA hardware
	-----------------------------------------------------------------
	-- game native resolution 336x240 visible area or 456x262 total pixel area
	-- take note: the values below are relative to the CLK period not standard VGA clock period
	u_scan : entity work.VGA_SCANCONV
	generic map (
		-- mark start of active area of input video
		vstart      =>   88,  -- start  of active video
		vlength     =>  336,  -- length of active video

		-- parameters below affect output video timing
		-- these must add up to 456 (including hpad*2)
		hF				=>   8,	-- h front porch
		hS				=>  46,	-- h sync
		hB				=>  22,	-- h back porch
		hV				=> 336,	-- active video
		hpad			=>  22,	-- create H black border

		-- these should add up to 262 (including vpad*2)
		vF				=>   1,	-- v front porch
		vS				=>   1,	-- v sync
		vB				=>  20,	-- v back porch
		vV				=> 240,	-- active video
		vpad			=>   0	-- create V black border
	)
	port map (
		I_VIDEO(15 downto 12)=> "0000",
		I_VIDEO(11 downto 8) => slv_R,
		I_VIDEO( 7 downto 4) => slv_G,
		I_VIDEO( 3 downto 0) => slv_B,

		I_HSYNC					=> sl_HSync_n,
		I_VSYNC					=> sl_VSync_n,
		--
		O_VIDEO(15 downto 12)=> slv_VideoI,
		O_VIDEO(11 downto 8) => slv_VideoR,
		O_VIDEO( 7 downto 4) => slv_VideoG,
		O_VIDEO( 3 downto 0) => slv_VideoB,
		O_HSYNC					=> sl_HSync,
		O_VSYNC					=> sl_VSync,
		O_CMPBLK_N				=> sl_cmpblk_n,
		--
		CLK						=> clk_7M,
		CLK_x2					=> gclk_14M
	);

	sl_blank <= not sl_cmpblk_n;

	u_dvid : entity work.dvid
	port map(
		--clocks
		clk_p					=> gclk_dvi_p,
		clk_n					=> gclk_dvi_n,
		clk_pixel			=> gclk_28M,
		-- inputs
		red_p(7 downto 4)	=> slv_VideoR,
		red_p(3 downto 0)	=> x"0",
		grn_p(7 downto 4)	=> slv_VideoG,
		grn_p(3 downto 0)	=> x"0",
		blu_p(7 downto 4)	=> slv_VideoB,
		blu_p(3 downto 0)	=> x"0",
		blank					=> sl_blank,
		hsync					=> sl_HSync,
		vsync					=> sl_VSync,
		-- outputs
		tmds_p				=> TMDS_P,
		tmds_n				=> TMDS_N
	);

	-----------------------
	-- 1 bit D/A converters
	-----------------------
	u_dacl : entity work.DAC
	generic map (msbi_g => 15)
	port map (
		clk_i	=> gclk_28M,
		res_i	=> int_reset,
		dac_i	=> slv_audio_l,
		dac_o	=> sl_dac_out_l
	);

	u_dacr : entity work.DAC
	generic map (msbi_g => 15)
	port map (
		clk_i	=> gclk_28M,
		res_i	=> int_reset,
		dac_i	=> slv_audio_r,
		dac_o	=> sl_dac_out_r
	);

--	#################################################
-- ## Internal ROM addresses to external SRAM mapper

--	slv_GP_ADDR(17 downto 0) slv_GP_DATA(31 downto 0)
--			GP17..15	P-0 P-1 P-2 P-3
--	GCS0	0  0  0	1A  1L  2A  2L
--	GCS1	0  0  1	1B  1MN 2B  2MN
--	GCS2	0  1  0	1C  1P  2C  2P
--	GCS3	0  1  1	1D  1R  2D  2R
--	GCS4	1  0  0	1EF 1ST 2EF 2ST
--	GCS5	1  0  1	1J  1U  2J  2U

--	slv_MP_ADDR(18 downto 0) slv_MP_DATA(15 downto 0)
--			A17..15
--	ROM0	0  0  0	9A  9B
--	SLAP	0  1  1	10A 10B
--	ROM1	1  0  0	7A  7B
--	ROM2	1  0  1	6A  6B
--	ROM3	1  1  0	5A  5B
--	ROM4	1  1  1	3A  3B

--	Mapping of 16K Selectors in SRAM to ROMs
-- SRAM			ROMS
--	A20..15		A14..0

--	000000	-	1L  1A
--	000001	-	1MN 1B
--	000010	-	1P  1C
--	000011	-	1R  1D
--	000100	-	1ST 1EF
--	000101	-	1U  1J
--	000110	-
--	000111	-
--	001000	-	2L  2A
--	001001	-	2MN 2B
--	001010	-	2P  2C
--	001011	-	2R  2D
--	001100	-	2ST 2EF
--	001101	-	2U  2J
--	001110	-
--	001111	-
--	010000	-	9A  9B
--	010001	-
--	010010	-
--	010011	-	10A 10B
--	010100	-	7A  7B
--	010101	-	6A  6B
--	010110	-	5A  5B
--	010111	-	3A  3B
--	011000	-
--	011001	-
--	011010	-
--	011011	-
--	011100	-

	-- multiplex internal ROMs to external SRAM
	p_ram_mux : process
	begin
		wait until rising_edge(gclk_28M);
		if ram_state_ctr /= 0 and clk_7M = '1' then
			ram_state_ctr <= 0;
		else
			ram_state_ctr <= ram_state_ctr + 1;
		end if;

		case ram_state_ctr is
			when 3 =>
				user_AD <= "01" & slv_MP_ADDR;		-- set 68K program ROM address
			when 0 =>
				user_AD <= "000" & slv_GP_ADDR;		-- set graphics ROM address for lower data word
				slv_MP_DATA <= MEM_D; 					-- get 68K program data word
			when 1 =>
				user_AD <= "001" & slv_GP_ADDR;		-- set graphics ROM address for upper data word
				slv_GP_DATA(15 downto  0) <= MEM_D;	-- get graphics ROM lower data word
			when 2 =>
				slv_GP_DATA(31 downto 16) <= MEM_D;	-- get graphics ROM upper data word
			when others => null;
		end case;
	end process;

	-- 6P CHAR ROM
	ROM_6P  : entity work.ROM_6P  port map ( CLK=>gclk_28M, DATA=>slv_CP_DATA,  ADDR=>slv_CP_ADDR);

	-- 6502 directly connected ROMS
	ROM_16R : entity work.ROM_16R port map ( CLK=>gclk_28M, DATA=>slv_ROM_16R, ADDR=>slv_AP_ADDR(13 downto 0) );	-- @4000-7FFF
	ROM_16S : entity work.ROM_16S port map ( CLK=>gclk_28M, DATA=>slv_ROM_16S, ADDR=>slv_AP_ADDR(14 downto 0) );	-- @8000-FFFF
	slv_AP_DATA <= slv_ROM_16S when slv_AP_ADDR(15)='1' else slv_ROM_16R;

	-- 68K directly connected ROMS
--	ROM_9A  : entity work.ROM_9A  port map ( CLK=>gclk_28M, DATA=>slv_ROM_9A,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_9B  : entity work.ROM_9B  port map ( CLK=>gclk_28M, DATA=>slv_ROM_9B,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_10A : entity work.ROM_10A port map ( CLK=>gclk_28M, DATA=>slv_ROM_10A, ADDR=>slv_MP_ADDR(13 downto 0) );
--	ROM_10B : entity work.ROM_10B port map ( CLK=>gclk_28M, DATA=>slv_ROM_10B, ADDR=>slv_MP_ADDR(13 downto 0) );
--	ROM_7A  : entity work.ROM_7A  port map ( CLK=>gclk_28M, DATA=>slv_ROM_7A,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_7B  : entity work.ROM_7B  port map ( CLK=>gclk_28M, DATA=>slv_ROM_7B,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_6A  : entity work.ROM_6A  port map ( CLK=>gclk_28M, DATA=>slv_ROM_6A,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_6B  : entity work.ROM_6B  port map ( CLK=>gclk_28M, DATA=>slv_ROM_6B,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_5A  : entity work.ROM_5A  port map ( CLK=>gclk_28M, DATA=>slv_ROM_5A,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_5B  : entity work.ROM_5B  port map ( CLK=>gclk_28M, DATA=>slv_ROM_5B,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_3A  : entity work.ROM_3A  port map ( CLK=>gclk_28M, DATA=>slv_ROM_3A,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	ROM_3B  : entity work.ROM_3B  port map ( CLK=>gclk_28M, DATA=>slv_ROM_3B,  ADDR=>slv_MP_ADDR(14 downto 0) );
--	slv_MP_DATA <=
--		slv_ROM_9A  & slv_ROM_9B  when slv_MP_ADDR(18 downto 15)="0000" else -- /ROM0 00000
--		slv_ROM_10A & slv_ROM_10B when slv_MP_ADDR(18 downto 15)="0011" else -- /SLAP 38000
--		slv_ROM_7A  & slv_ROM_7B  when slv_MP_ADDR(18 downto 15)="0100" else -- /ROM1 40000
--		slv_ROM_6A  & slv_ROM_6B  when slv_MP_ADDR(18 downto 15)="0101" else -- /ROM2 50000
--		slv_ROM_5A  & slv_ROM_5B  when slv_MP_ADDR(18 downto 15)="0110" else -- /ROM3 60000
--		slv_ROM_3A  & slv_ROM_3B  when slv_MP_ADDR(18 downto 15)="0111" else -- /ROM4 70000
--		(others=>'1');

	-- VIDEO ROMS
--	ROM_1A  : entity work.ROM_1A  port map ( CLK=>gclk_28M, DATA=>slv_ROM_1A , ADDR=>slv_GP_ADDR(14 downto 0) );
--	ROM_1B  : entity work.ROM_1B  port map ( CLK=>gclk_28M, DATA=>slv_ROM_1B , ADDR=>slv_GP_ADDR(14 downto 0) );
--	ROM_1L  : entity work.ROM_1L  port map ( CLK=>gclk_28M, DATA=>slv_ROM_1L , ADDR=>slv_GP_ADDR(14 downto 0) );
--	ROM_1MN : entity work.ROM_1MN port map ( CLK=>gclk_28M, DATA=>slv_ROM_1MN, ADDR=>slv_GP_ADDR(14 downto 0) );
--	ROM_2A  : entity work.ROM_2A  port map ( CLK=>gclk_28M, DATA=>slv_ROM_2A , ADDR=>slv_GP_ADDR(14 downto 0) );
--	ROM_2B  : entity work.ROM_2B  port map ( CLK=>gclk_28M, DATA=>slv_ROM_2B , ADDR=>slv_GP_ADDR(14 downto 0) );
--	ROM_2L  : entity work.ROM_2L  port map ( CLK=>gclk_28M, DATA=>slv_ROM_2L , ADDR=>slv_GP_ADDR(14 downto 0) );
--	ROM_2MN : entity work.ROM_2MN port map ( CLK=>gclk_28M, DATA=>slv_ROM_2MN, ADDR=>slv_GP_ADDR(14 downto 0) );
--	slv_GP_DATA <=
--		slv_ROM_2L  & slv_ROM_2A & slv_ROM_1L  & slv_ROM_1A when slv_GP_ADDR(17 downto 15)="000" else
--		slv_ROM_2MN & slv_ROM_2B & slv_ROM_1MN & slv_ROM_1B when slv_GP_ADDR(17 downto 15)="001" else
--		(others=>'1');
end RTL;
