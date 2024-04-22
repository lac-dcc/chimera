-------------------------------------------------------------------------------
--
-- MSX1 FPGA project
--
-- Copyright (c) 2016, Fabio Belavenuto (belavenuto@gmail.com)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------
--
-- Terasic DE2 top-level
--

-- altera message_off 10540 10541

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.msx_pack.all;

-- Generic top-level entity for Altera DE2 board
entity de2_top is
	port (
		-- Clocks
		clk50_i			: in    std_logic;
		clk27_i			: in    std_logic;
		clk_ext_i		: in    std_logic;
		-- Switches
		sw_i			: in    std_logic_vector(17 downto 0);
		-- Buttons
		key_n_i			: in    std_logic_vector( 3 downto 0);
		-- 7 segment displays
		display0_o		: out   std_logic_vector( 6 downto 0)		:= (others => '1');
		display1_o		: out   std_logic_vector( 6 downto 0)		:= (others => '1');
		display2_o		: out   std_logic_vector( 6 downto 0)		:= (others => '1');
		display3_o		: out   std_logic_vector( 6 downto 0)		:= (others => '1');
		display4_o		: out   std_logic_vector( 6 downto 0)		:= (others => '1');
		display5_o		: out   std_logic_vector( 6 downto 0)		:= (others => '1');
		display6_o		: out   std_logic_vector( 6 downto 0)		:= (others => '1');
		display7_o		: out   std_logic_vector( 6 downto 0)		:= (others => '1');
		-- Red LEDs
		ledr_o			: out   std_logic_vector(17 downto 0)		:= (others => '0');
		-- Green LEDs
		ledg_o			: out   std_logic_vector( 8 downto 0)		:= (others => '0');
		-- Serial
		uart_rx_i		: in    std_logic;
		uart_tx_o		: out   std_logic							:= '1';
		-- IRDA
		irda_rx_i		: in    std_logic;
		irda_tx_o		: out   std_logic							:= '0';
		-- SRAM
		sram_addr_o		: out   std_logic_vector(17 downto 0)		:= (others => '0');		-- 256Kx16 = 512Kx8
		sram_data_io	: inout std_logic_vector(15 downto 0)		:= (others => '0');
		sram_ce_n_o		: out   std_logic							:= '1';
		sram_oe_n_o		: out   std_logic							:= '1';
		sram_we_n_o		: out   std_logic							:= '1';
		sram_ub_n_o		: out   std_logic							:= '1';
		sram_lb_n_o		: out   std_logic							:= '1';
		-- SDRAM
		dram_cke_o		: out   std_logic							:= '1';
		dram_clk_o		: out   std_logic							:= '1';
		dram_addr_o		: out   std_logic_vector(11 downto 0)		:= (others => '0');		-- 
		dram_data_io	: inout std_logic_vector(15 downto 0)		:= (others => '0');
		dram_cas_n_o	: out   std_logic							:= '1';
		dram_ras_n_o	: out   std_logic							:= '1';
		dram_cs_n_o		: out   std_logic							:= '1';
		dram_we_n_o		: out   std_logic							:= '1';
		dram_ba_o		: out   std_logic_vector( 1 downto 0)		:= "11";
		dram_ldqm_o		: out   std_logic							:= '1';
		dram_udqm_o		: out   std_logic							:= '1';
		-- Flash
		fl_rst_n_o		: out   std_logic							:= '1';
		fl_addr_o		: out   std_logic_vector(21 downto 0)		:= (others => '0');		-- 4MBx8
		fl_data_io		: inout std_logic_vector( 7 downto 0)		:= (others => 'Z');
		fl_ce_n_o		: out   std_logic							:= '1';
		fl_oe_n_o		: out   std_logic							:= '1';
		fl_we_n_o		: out   std_logic							:= '1';
		--	ISP1362 Interface (USB)
		otg_addr_o		: out   std_logic_vector( 1 downto 0)		:= (others => '0');
		otg_data_io		: inout std_logic_vector(15 downto 0)		:= (others => 'Z');
		otg_cs_n_o		: out   std_logic							:= '1';
		otg_rd_n_o		: out   std_logic							:= '1';
		otg_wr_n_o		: out   std_logic							:= '1';
		otg_rst_n_o		: out   std_logic							:= '1';
		otg_fspeed_o	: out   std_logic							:= 'Z';
		otg_lspeed_o	: out   std_logic							:= 'Z';
		otg_int0_i		: in    std_logic;
		otg_int1_i		: in    std_logic;
		otg_dreq0_i		: in    std_logic;
		otg_dreq1_i		: in    std_logic;
		otg_dack0_n_o	: out   std_logic							:= '1';
		otg_dack1_n_o	: out   std_logic							:= '1';
		--	LCD Module 16X2
		lcd_on_o		: out   std_logic							:= '0';
		lcd_blon_o		: out   std_logic							:= '0';
		lcd_data_io		: inout std_logic_vector(7 downto 0)		:= (others => '0');
		lcd_rw_o		: out   std_logic							:= '1';		-- 0=Write
		lcd_en_o		: out   std_logic							:= '1';
		lcd_rs_o		: out   std_logic							:= '1';		-- 0=Command
		-- SD card (SPI mode)
		sd_miso_i		: in    std_logic;
		sd_mosi_o		: out   std_logic							:= '1';
		sd_cs_n_o		: out   std_logic							:= '1';
		sd_sclk_o		: out   std_logic							:= '1';
		-- I2C
		i2c_sclk_io		: inout std_logic							:= '1';
		i2c_sdat_io		: inout std_logic							:= '1';
		-- PS/2 Keyboard
		ps2_clk_io		: inout std_logic							:= '1';
		ps2_dat_io		: inout std_logic							:= '1';
		-- VGA
		vga_clk_o		: out   std_logic							:= '0';
		vga_r_o			: out   std_logic_vector( 9 downto 0)		:= (others => '0');
		vga_g_o			: out   std_logic_vector( 9 downto 0)		:= (others => '0');
		vga_b_o			: out   std_logic_vector( 9 downto 0)		:= (others => '0');
		vga_hsync_n_o	: out   std_logic							:= '1';
		vga_vsync_n_o	: out   std_logic							:= '1';
		vga_blank_n_o	: out   std_logic							:= '1';
		vga_sync_o		: out   std_logic							:= '0';
		-- Ethernet Interface
		enet_clk_o		: out   std_logic							:= '0';
		enet_data_io	: inout std_logic_vector(15 downto 0)		:= (others => 'Z');
		enet_cmd_o		: out   std_logic							:= '0';		-- 0=Command
		enet_cs_n_o		: out   std_logic							:= '1';
		enet_wr_n_o		: out   std_logic							:= '1';
		enet_rd_n_o		: out   std_logic							:= '1';
		enet_rst_n_o	: out   std_logic							:= '1';
		enet_int_i		: in    std_logic;
		-- Audio
		aud_xck_o		: out   std_logic							:= '0';
		aud_bclk_o		: out   std_logic							:= '0';
		aud_adclrck_o	: out   std_logic							:= '0';
		aud_adcdat_i	: in    std_logic;
		aud_daclrck_o	: out   std_logic							:= '0';
		aud_dacdat_o	: out   std_logic							:= '0';
		-- TV Decoder
		td_data_i		: in    std_logic_vector(7 downto 0);
		td_hsync_n_i	: in    std_logic;
		td_vsync_n_i	: in    std_logic;
		td_reset_n_o	: out   std_logic							:= '1';
		-- GPIO
		gpio0_io		: inout std_logic_vector(35 downto 0)		:= (others => 'Z');
		gpio1_io		: inout std_logic_vector(35 downto 0)		:= (others => 'Z')
	);
end entity;

architecture behavior of de2_top is

	-- Resets
	signal pll_locked_s			: std_logic;
	signal por_s				: std_logic;
	signal reset_s				: std_logic;
	signal soft_por_s			: std_logic;
	signal soft_reset_k_s		: std_logic;
	signal soft_reset_s_s		: std_logic;
	signal soft_rst_cnt_s		: unsigned(7 downto 0)	:= X"FF";
	-- Clocks
	signal clock_master_s		: std_logic;
	signal clock_sdram_s		: std_logic;
	signal clock_3m_en_s		: std_logic;
	signal clock_7m_en_s		: std_logic;
	signal clock_10m_en_s		: std_logic;
	signal clock_cpu_en_s		: std_logic;
	signal clock_audio_s		: std_logic;
	signal clock_16m_s			: std_logic;
	signal turbo_on_s			: std_logic;
	-- RAM
	signal ram_addr_s			: std_logic_vector(22 downto 0);		-- 8MB
	signal ram_data_from_s		: std_logic_vector( 7 downto 0);
	signal ram_data_to_s		: std_logic_vector( 7 downto 0);
	signal ram_ce_n_s			: std_logic;
	signal ram_oe_n_s			: std_logic;
	signal ram_we_n_s			: std_logic;
	-- ROM
--	signal rom_addr_s			: std_logic_vector(14 downto 0);		-- 32K
--	signal rom_data_from_s		: std_logic_vector( 7 downto 0);
--	signal rom_ce_n_s			: std_logic;
--	signal rom_oe_n_s			: std_logic;
	-- VRAM memory
	signal vram_addr_s			: std_logic_vector(13 downto 0);		-- 16K
	signal vram_data_from_s		: std_logic_vector( 7 downto 0);
	signal vram_data_to_s		: std_logic_vector( 7 downto 0);
	signal vram_ce_n_s			: std_logic;
	signal vram_oe_n_s			: std_logic;
	signal vram_we_n_s			: std_logic;
	-- Audio
	signal audio_scc_s			: signed(14 downto 0);
	signal audio_psg_s			: unsigned(7 downto 0);
	signal beep_s				: std_logic;
	signal ear_s				: std_logic;
	signal audio_l_s			: signed(15 downto 0);
	signal audio_r_s			: signed(15 downto 0);
	signal volumes_s			: volumes_t;
	-- Video
	signal rgb_r_s				: std_logic_vector( 3 downto 0);
	signal rgb_g_s				: std_logic_vector( 3 downto 0);
	signal rgb_b_s				: std_logic_vector( 3 downto 0);
	signal rgb_hsync_n_s		: std_logic;
	signal rgb_vsync_n_s		: std_logic;
	signal ntsc_pal_s			: std_logic;
	signal vga_en_s				: std_logic;
	-- Keyboard
	signal rows_s				: std_logic_vector( 3 downto 0);
	signal cols_s				: std_logic_vector( 7 downto 0);
	signal caps_en_s			: std_logic;
	signal extra_keys_s			: std_logic_vector( 3 downto 0);
	signal keyb_valid_s			: std_logic;
	signal keyb_data_s			: std_logic_vector( 7 downto 0);
	signal keymap_addr_s		: std_logic_vector( 8 downto 0);
	signal keymap_data_s		: std_logic_vector( 7 downto 0);
	signal keymap_we_n_s		: std_logic;
	-- Joystick (Minimig Standard)
	alias J0_UP					: std_logic						is gpio1_io(34);	-- Pin 1
	alias J0_DOWN				: std_logic						is gpio1_io(32);	-- Pin 2
	alias J0_LEFT				: std_logic						is gpio1_io(30);	-- Pin 3
	alias J0_RIGHT				: std_logic						is gpio1_io(28);	-- Pin 4
	alias J0_MMB				: std_logic						is gpio1_io(26);	-- Pin 5
	alias J0_BTN				: std_logic						is gpio1_io(35);	-- Pin 6
	alias J0_BTN2				: std_logic						is gpio1_io(29);	-- Pin 9
	alias J1_UP					: std_logic						is gpio1_io(24);
	alias J1_DOWN				: std_logic						is gpio1_io(22);
	alias J1_LEFT				: std_logic						is gpio1_io(20);
	alias J1_RIGHT				: std_logic						is gpio1_io(23);
	alias J1_MMB				: std_logic						is gpio1_io(27);
	alias J1_BTN				: std_logic						is gpio1_io(25);
	alias J1_BTN2				: std_logic						is gpio1_io(21);
	-- SD
	signal sd_cs_n_s			: std_logic;
	-- Bus
	signal bus_addr_s			: std_logic_vector(15 downto 0);
	signal bus_data_from_s		: std_logic_vector( 7 downto 0)		:= (others => '1');
	signal bus_data_to_s		: std_logic_vector( 7 downto 0);
	signal bus_rd_n_s			: std_logic;
	signal bus_wr_n_s			: std_logic;
	signal bus_m1_n_s			: std_logic;
	signal bus_iorq_n_s			: std_logic;
	signal bus_mreq_n_s			: std_logic;
	signal bus_sltsl1_n_s		: std_logic;
	signal bus_sltsl2_n_s		: std_logic;
	signal bus_int_n_s			: std_logic;
	-- JT51
--	signal jt51_cs_n_s			: std_logic							:= '1';
--	signal jt51_data_from_s		: std_logic_vector( 7 downto 0)		:= (others => '1');
--	signal jt51_hd_s			: std_logic							:= '0';
--	signal jt51_left_s			: signed(15 downto 0)				:= (others => '0');
--	signal jt51_right_s			: signed(15 downto 0)				:= (others => '0');
	-- OPLL
	signal opll_mo_s			: signed(12 downto 0)				:= (others => '0');
	signal opll_ro_s			: signed(12 downto 0)				:= (others => '0');
	-- Serial interface
--	signal serial_cs_s			: std_logic							:= '0';
--	signal serial_data_from_s	: std_logic_vector( 7 downto 0)		:= (others => '1');
--	signal serial_hd_s			: std_logic							:= '0';
	-- Debug
	signal D_wait_n_s			: std_logic;
	signal D_ipl_en_s			: std_logic;
	signal D_generic_s			: std_logic;
	signal D_display_s			: std_logic_vector(15 downto 0);
	signal D_slots_s			: std_logic_vector( 7 downto 0);

begin

	-- PLL
	pll_1: entity work.pll1
	port map (
		inclk0		=> clk50_i,
		c0			=> clock_master_s,			-- 21.428571 MHz (6x NTSC)
		c1			=> clock_sdram_s,			-- 85.714286
		c2			=> dram_clk_o,				-- 85.714286 -45°
		locked		=> pll_locked_s
	);

	pll_2: entity work.pll2
	port map (
		inclk0		=> clk27_i,
		c0			=> clock_audio_s,			-- 24.000000 MHz
		c1			=> clock_16m_s				-- 16 MHz
	);

	-- Clocks
	clks: entity work.clocks
	port map (
		clock_master_i	=> clock_master_s,
		por_i			=> not pll_locked_s,
		clock_3m_en_o	=> clock_3m_en_s,
		clock_5m_en_o	=> open,
		clock_7m_en_o	=> clock_7m_en_s,
		clock_10m_en_o	=> clock_10m_en_s
	);

	clock_cpu_en_s	<= clock_3m_en_s	when turbo_on_s = '0' else clock_7m_en_s;
	--clock_cpu_en_s	<= clock_3m_en_s;

	-- The MSX1
	the_msx: entity work.msx
	generic map (
		hw_id_g			=> 2,
		hw_txt_g		=> "DE-2 Board",
		hw_version_g	=> actual_version,
		video_opt_g		=> 1,		-- 0 = no dblscan, 1 = dblscan configurable, 2 = dblscan always enabled, 3 = no dblscan and external palette
		ramsize_g		=> 8192,
		opll_en_g		=> true
	)
	port map (
		-- Resets
		por_i			=> por_s,
		softreset_o		=> soft_reset_s_s,
		reload_o		=> open,
		reset_i			=> reset_s,
		-- Clocks
		clock_master_i	=> clock_master_s,
		clock_vdp_en_i	=> clock_10m_en_s,
		clock_cpu_en_i	=> clock_cpu_en_s,
		clock_psg_en_i	=> clock_3m_en_s,
		-- Turbo
		turbo_on_k_i	=> extra_keys_s(3),	-- F11
		turbo_on_o		=> turbo_on_s,
		-- Options
		opt_nextor_i	=> '1',
		opt_mr_type_i	=> sw_i(2 downto 1),
		opt_vga_on_i	=> '1',
		-- RAM
		ram_addr_o		=> ram_addr_s,
		ram_data_i		=> ram_data_from_s,
		ram_data_o		=> ram_data_to_s,
		ram_ce_n_o		=> ram_ce_n_s,
		ram_we_n_o		=> ram_we_n_s,
		ram_oe_n_o		=> ram_oe_n_s,
		-- ROM
		rom_addr_o		=> open,--rom_addr_s,
		rom_data_i		=> ram_data_from_s,
		rom_ce_n_o		=> open,--rom_ce_n_s,
		rom_oe_n_o		=> open,--rom_oe_n_s,
		-- External bus
		bus_addr_o		=> bus_addr_s,
		bus_data_i		=> bus_data_from_s,
		bus_data_o		=> bus_data_to_s,
		bus_rd_n_o		=> bus_rd_n_s,
		bus_wr_n_o		=> bus_wr_n_s,
		bus_m1_n_o		=> bus_m1_n_s,
		bus_iorq_n_o	=> bus_iorq_n_s,
		bus_mreq_n_o	=> bus_mreq_n_s,
		bus_sltsl1_n_o	=> bus_sltsl1_n_s,
		bus_sltsl2_n_o	=> bus_sltsl2_n_s,
		bus_wait_n_i	=> '1',
		bus_nmi_n_i		=> '1',
		bus_int_n_i		=> bus_int_n_s,
		-- VDP RAM
		vram_addr_o		=> vram_addr_s,
		vram_data_i		=> vram_data_from_s,
		vram_data_o		=> vram_data_to_s,
		vram_ce_n_o		=> vram_ce_n_s,
		vram_oe_n_o		=> vram_oe_n_s,
		vram_we_n_o		=> vram_we_n_s,
		-- Keyboard
		rows_o			=> rows_s,
		cols_i			=> cols_s,
		caps_en_o		=> caps_en_s,
		keyb_valid_i	=> keyb_valid_s,
		keyb_data_i		=> keyb_data_s,
		keymap_addr_o	=> keymap_addr_s,
		keymap_data_o	=> keymap_data_s,
		keymap_we_n_o	=> keymap_we_n_s,
		-- Audio
		audio_scc_o		=> audio_scc_s,
		audio_psg_o		=> audio_psg_s,
		beep_o			=> beep_s,
		opll_mo_o		=> opll_mo_s,
		opll_ro_o		=> opll_ro_s,
		volumes_o		=> volumes_s,
		-- K7
		k7_motor_o		=> open,
		k7_audio_o		=> open,
		k7_audio_i		=> ear_s,
		-- Joystick
		joy1_up_i		=> J0_UP,
		joy1_down_i		=> J0_DOWN,
		joy1_left_i		=> J0_LEFT,
		joy1_right_i	=> J0_RIGHT,
		joy1_btn1_i		=> J0_BTN,
		joy1_btn1_o		=> J0_BTN,
		joy1_btn2_i		=> J0_BTN2,
		joy1_btn2_o		=> J0_BTN2,
		joy1_out_o		=> open,
		joy2_up_i		=> J1_UP,
		joy2_down_i		=> J1_DOWN,
		joy2_left_i		=> J1_LEFT,
		joy2_right_i	=> J1_RIGHT,
		joy2_btn1_i		=> J1_BTN,
		joy2_btn1_o		=> J1_BTN,
		joy2_btn2_i		=> J1_BTN2,
		joy2_btn2_o		=> J1_BTN2,
		joy2_out_o		=> open,
		-- Video
		rgb_r_o			=> rgb_r_s,
		rgb_g_o			=> rgb_g_s,
		rgb_b_o			=> rgb_b_s,
		hsync_n_o		=> rgb_hsync_n_s,
		vsync_n_o		=> rgb_vsync_n_s,
		ntsc_pal_o		=> ntsc_pal_s,
		vga_on_k_i		=> extra_keys_s(2),		-- Print Screen
		scanline_on_k_i	=> extra_keys_s(1),		-- Scroll Lock
		vga_en_o		=> vga_en_s,
		-- SPI/SD
		flspi_cs_n_o	=> open,
		spi_cs_n_o		=> sd_cs_n_s,
		spi_sclk_o		=> sd_sclk_o,
		spi_mosi_o		=> sd_mosi_o,
		spi_miso_i		=> sd_miso_i,
		sd_pres_n_i		=> '0',
		sd_wp_i			=> '0',
		-- DEBUG
		D_wait_o		=> D_wait_n_s,
		D_slots_o		=> D_slots_s,
		D_ipl_en_o		=> D_ipl_en_s,
		D_generic_o		=> D_generic_s
	);

	-- Keyboard PS/2
	keyb: entity work.keyboard
	port map (
		clock_i			=> clock_3m_en_s,
		reset_i			=> reset_s,
		-- MSX
		rows_coded_i	=> rows_s,
		cols_o			=> cols_s,
		keymap_addr_i	=> keymap_addr_s,
		keymap_data_i	=> keymap_data_s,
		keymap_we_n_i	=> keymap_we_n_s,
		-- LEDs
		led_caps_i		=> caps_en_s,
		-- PS/2 interface
		ps2_clk_io		=> ps2_clk_io,
		ps2_data_io		=> ps2_dat_io,
		-- Direct Access
		keyb_valid_o	=> keyb_valid_s,
		keyb_data_o		=> keyb_data_s,
		--
		reset_o			=> soft_reset_k_s,
		por_o			=> soft_por_s,
		reload_core_o	=> open,
		extra_keys_o	=> extra_keys_s
	);

	-- VRAM
	vram: entity work.spram
	generic map (
		addr_width_g 	=> 14,
		data_width_g 	=> 8
	)
	port map (
		clock_i			=> clock_master_s,
		clock_en_i		=> clock_10m_en_s,
		we_n_i			=> vram_we_n_s,
		addr_i			=> vram_addr_s,
		data_i			=> vram_data_to_s,
		data_o			=> vram_data_from_s
	);

	-- RAM
	ram: entity work.ssdram
	generic map (
		freq_g		=> 86
	)
	port map (
		clock_i		=> clock_sdram_s,
		reset_i		=> reset_s,
		refresh_i	=> '1',
		-- Static RAM bus
		addr_i		=> ram_addr_s,
		data_i		=> ram_data_to_s,
		data_o		=> ram_data_from_s,
		cs_n_i		=> ram_ce_n_s,
		oe_n_i		=> ram_oe_n_s,
		we_n_i		=> ram_we_n_s,
		-- SD-RAM ports
		mem_cke_o	=> dram_cke_o,
		mem_cs_n_o	=> dram_cs_n_o,
		mem_ras_n_o	=> dram_ras_n_o,
		mem_cas_n_o	=> dram_cas_n_o,
		mem_we_n_o	=> dram_we_n_o,
		mem_udq_o	=> dram_udqm_o,
		mem_ldq_o	=> dram_ldqm_o,
		mem_ba_o	=> dram_ba_o,
		mem_addr_o	=> dram_addr_o,
		mem_data_io	=> dram_data_io
	);

	-- Audio
	mixer: entity work.mixers
	port map (
		clock_audio_i	=> clock_audio_s,
		volumes_i		=> volumes_s,
		beep_i			=> beep_s,
		ear_i			=> ear_s,
		audio_scc_i		=> audio_scc_s,
		audio_psg_i		=> audio_psg_s,
--		jt51_left_i		=> jt51_left_s,
--		jt51_right_i	=> jt51_right_s,
		opll_mo_i		=> opll_mo_s,
		opll_ro_i		=> opll_ro_s,
		audio_mix_l_o	=> audio_l_s,
		audio_mix_r_o	=> audio_r_s
	);

	codec: entity work.WM8731
	port map (
		clock_i			=> clock_audio_s,
		reset_i			=> reset_s,
		k7_audio_o		=> ear_s,
		audio_l_i		=> audio_l_s,
		audio_r_i		=> audio_r_s,

		i2s_xck_o		=> aud_xck_o,
		i2s_bclk_o		=> aud_bclk_o,
		i2s_adclrck_o	=> aud_adclrck_o,
		i2s_adcdat_i	=> aud_adcdat_i,
		i2s_daclrck_o	=> aud_daclrck_o,
		i2s_dacdat_o	=> aud_dacdat_o,

		i2c_sda_io		=> i2c_sdat_io,
		i2c_scl_io		=> i2c_sclk_io
	);


	-- Glue logic

	-- Resets
	por_s		<= '1'	when pll_locked_s = '0' or soft_por_s = '1' or key_n_i(3) = '0'	else '0';
	reset_s		<= '1'	when soft_rst_cnt_s = X"00" or por_s = '1'  or key_n_i(0) = '0'	else '0';

	process(clock_master_s)
	begin
		if rising_edge(clock_master_s) then
			if reset_s = '1' or por_s = '1' then
				soft_rst_cnt_s	<= X"FF";
			elsif (soft_reset_k_s = '1' or soft_reset_s_s = '1') and soft_rst_cnt_s /= X"00" then
				soft_rst_cnt_s <= soft_rst_cnt_s - 1;
			end if;
		end if;
	end process;

	-- SD
	sd_cs_n_o <= sd_cs_n_s;

	-- VGA Output
	vga_r_o			<= rgb_r_s & "000000";
	vga_g_o			<= rgb_g_s & "000000";
	vga_b_o			<= rgb_b_s & "000000";
	vga_hsync_n_o	<= rgb_hsync_n_s;
	vga_vsync_n_o	<= rgb_vsync_n_s;
	vga_blank_n_o	<= '1';
	vga_clk_o		<= clock_master_s;

	-- Peripheral BUS control
--	bus_data_from_s	<= jt51_data_from_s		when jt51_hd_s = '1'		else
--							   serial_data_from_s	when serial_hd_s = '1'	else
--								(others => '1');
	bus_int_n_s		<= '1';
--
--	ptjt: if per_jt51_g generate
--		-- JT51 tests
--		jt51_cs_n_s <= '0' when bus_addr_s(7 downto 1) = "0010000" and bus_iorq_n_s = '0' and bus_m1_n_s = '1'	else '1';	-- 0x20 - 0x21
--	
--		jt51: entity work.jt51_wrapper
--		port map (
--			clock_i			=> clock_3m_s,
--			reset_i			=> reset_s,
--			addr_i			=> bus_addr_s(0),
--			cs_n_i			=> jt51_cs_n_s,
--			wr_n_i			=> bus_wr_n_s,
--			rd_n_i			=> bus_rd_n_s,
--			data_i			=> bus_data_to_s,
--			data_o			=> jt51_data_from_s,
--			has_data_o		=> jt51_hd_s,
--			ct1_o			=> open,
--			ct2_o			=> open,
--			irq_n_o			=> open,
--			p1_o			=> open,
--			-- Low resolution output (same as real chip)
--			sample_o		=> open,
--			left_o			=> open,
--			right_o			=> open,
--			-- Full resolution output
--			xleft_o			=> jt51_left_s,
--			xright_o		=> jt51_right_s,
--			-- unsigned outputs for sigma delta converters, full resolution
--			dacleft_o		=> open,
--			dacright_o		=> open
--		);
--	end generate;

--	-- Tests UART
--	serial_cs_s	<= '1'	when bus_addr_s(7 downto 3) = "11001" and bus_iorq_n_s = '0' and bus_m1_n_s = '1'	else '0';	-- 0xC8 - 0xCF
--	
--	serial: entity work.uart
--	port map (
--		clock_i		=> clock_16m_s,
--		reset_i		=> reset_s,
--		addr_i		=> bus_addr_s(2 downto 0),
--		data_i		=> bus_data_to_s,
--		data_o		=> serial_data_from_s,
--		has_data_o	=> serial_hd_s,
--		cs_i		=> serial_cs_s,
--		rd_i		=> not bus_rd_n_s,
--		wr_i		=> not bus_wr_n_s,
--		int_n_o		=> open,
--		--
--		rxd_i		=> uart_rx_i,
--		txd_o		=> uart_tx_o,
--		dsr_n_i		=> '0',
--		rts_n_o		=> open,
--		cts_n_i		=> '0',
--		dtr_n_o		=> open,
--		dcd_i		=> '0',
--		ri_n_i		=> '1'
--	);


	-- DEBUG
	D_display_s	<= bus_addr_s;

--	ledg_o(3 downto 0) <= rows_s;
--	ledr_o(7 downto 0) <= cols_s;

	ledg_o(7) <= turbo_on_s;
--	ledg_o(6) <= vga_en_s;
--	ledg_o(5) <= ntsc_pal_s;
--	ledg_o(4) <= not jt51_cs_n_s;
	ledg_o(2) <= D_ipl_en_s;
	ledg_o(1) <= D_generic_s;
	ledg_o(0) <= D_wait_n_s;
--
--	ledr_o(15 downto 0) <= std_logic_vector(jt51_left_s);

	ld5: entity work.seg7
	port map (
		D		=> D_slots_s(7 downto 4),
		Q		=> display5_o
	);
	ld4: entity work.seg7
	port map (
		D		=> D_slots_s(3 downto 0),
		Q		=> display4_o
	);

	ld3: entity work.seg7
	port map(
		D		=> D_display_s(15 downto 12),
		Q		=> display3_o
	);

	ld2: entity work.seg7
	port map(
		D		=> D_display_s(11 downto 8),
		Q		=> display2_o
	);

	ld1: entity work.seg7
	port map(
		D		=> D_display_s(7 downto 4),
		Q		=> display1_o
	);

	ld0: entity work.seg7
	port map(
		D		=> D_display_s(3 downto 0),
		Q		=> display0_o
	);

end architecture;