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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--use work.vdp18_paletas_3bit_pack.all;
use work.msx_pack.all;

entity zxuno is
	port (
		-- Clocks
		clock_50_i			: in    std_logic;

		-- SRAM (AS7C34096)
		sram_addr_o			: out   std_logic_vector(18 downto 0)	:= (others => '0');
		sram_data_io		: inout std_logic_vector( 7 downto 0)	:= (others => 'Z');
		sram_we_n_o			: out   std_logic								:= '1';

		-- SRAM extra (2MB)
		sram_ext_addr_o		: out   std_logic_vector(20 downto 0)	:= (others => '0');
		sram_ext_data_io	: inout std_logic_vector( 7 downto 0)	:= (others => 'Z');
		sram_ext_we_n_o		: out   std_logic								:= '1';

		-- PS2
		ps2_clk_io			: inout std_logic								:= 'Z';
		ps2_data_io			: inout std_logic								:= 'Z';
--		ps2_mouse_clk_io  : inout std_logic								:= 'Z';
--		ps2_mouse_data_io : inout std_logic								:= 'Z';

		-- SD Card
		sd_cs_n_o			: out   std_logic								:= '1';
		sd_sclk_o			: out   std_logic								:= '0';
		sd_mosi_o			: out   std_logic								:= '0';
		sd_miso_i			: in    std_logic;

		-- Flash
		flash_cs_n_o		: out   std_logic								:= '1';
		flash_sclk_o		: out   std_logic								:= '0';
		flash_mosi_o		: out   std_logic								:= '0';
		flash_miso_i		: in    std_logic;
--		flash_wp_o			: out   std_logic								:= '0';
--		flash_hold_o		: out   std_logic								:= '1';

		-- Joystick
		joy_up_i			: in    std_logic;
		joy_down_i			: in    std_logic;
		joy_left_i			: in    std_logic;
		joy_right_i			: in    std_logic;
		joy_fire1_i			: inout std_logic;
		joy_fire2_i			: inout std_logic;
		joy_fire3_o			: out   std_logic								:= '1';

		-- Audio
		dac_l_o				: out   std_logic								:= '0';
		dac_r_o				: out   std_logic								:= '0';
		ear_i				: in    std_logic;

		-- VGA
		vga_r_o				: out   std_logic_vector( 2 downto 0)	:= (others => '0');
		vga_g_o				: out   std_logic_vector( 2 downto 0)	:= (others => '0');
		vga_b_o				: out   std_logic_vector( 2 downto 0)	:= (others => '0');
		vga_csync_n_o		: out   std_logic								:= '1';
		vga_vsync_n_o		: out   std_logic								:= '1';
		vga_ntsc_o			: out   std_logic								:= '0';
		vga_pal_o			: out   std_logic								:= '1';

		-- GPIO
--		gpio_io				: inout std_logic_vector(35 downto 6)	:= (others => 'Z');

		-- Debug
		led_o				: out   std_logic								:= '0'
	);
end entity;

architecture behavior of zxuno is

	-- Resets
	signal por_cnt_s			: unsigned(7 downto 0)				:= (others => '1');
	signal por_clock_s			: std_logic;
	signal por_s				: std_logic;
	signal reset_s				: std_logic;
	signal reset_n_s			: std_logic;
	signal soft_reset_k_s		: std_logic;
	signal soft_reset_s_s		: std_logic;
	signal soft_por_s			: std_logic;
	signal soft_rst_cnt_s		: unsigned(7 downto 0)	:= X"FF";

	-- Clocks
	signal clock_master_s		: std_logic;
	signal clock_vga_s			: std_logic;
	signal clock_hdmi_s			: std_logic;
	signal clock_3m_en_s		: std_logic;
	signal clock_7m_en_s		: std_logic;
	signal clock_10m_en_s		: std_logic;
	signal clock_cpu_en_s		: std_logic;
	signal turbo_on_s			: std_logic;

	-- RAM
	signal ram_addr_s			: std_logic_vector(22 downto 0);		-- 8MB
	signal ram_data_from_s		: std_logic_vector(7 downto 0);
	signal ram_data_to_s		: std_logic_vector(7 downto 0);
	signal ram_ce_n_s			: std_logic;
	signal ram_oe_n_s			: std_logic;
	signal ram_we_n_s			: std_logic;

	-- ROM
	signal rom_addr_s			: std_logic_vector(14 downto 0);		-- 32K
	signal rom_data_s			: std_logic_vector(7 downto 0);
	signal rom_ce_n_s			: std_logic;
	signal rom_oe_n_s			: std_logic;

	-- VRAM memory
	signal vram_addr_s			: std_logic_vector(13 downto 0);		-- 16K
	signal vram_do_s			: std_logic_vector(7 downto 0);
	signal vram_di_s			: std_logic_vector(7 downto 0);
	signal vram_we_n_s			: std_logic;

	-- Audio
	signal audio_scc_s			: signed(14 downto 0);
	signal audio_psg_s			: unsigned(7 downto 0);
	signal beep_s				: std_logic;
	signal audio_l_s			: signed(15 downto 0);
	signal audio_r_s			: signed(15 downto 0);
	signal audio_l_amp_s		: signed(14 downto 0);
	signal audio_r_amp_s		: signed(14 downto 0);
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
	signal reload_core_s		: std_logic;
	signal keyb_valid_s			: std_logic;
	signal keyb_data_s			: std_logic_vector( 7 downto 0);
	signal keymap_addr_s		: std_logic_vector( 8 downto 0);
	signal keymap_data_s		: std_logic_vector( 7 downto 0);
	signal keymap_we_n_s		: std_logic;

	-- SD
	signal sd_cs_n_s			: std_logic;

	-- Joystick
	--signal joy_out1_s			: std_logic;

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

	-- JT51
--	signal jt51_cs_n_s			: std_logic;
--	signal jt51_left_s			: signed(15 downto 0)					:= (others => '0');
--	signal jt51_right_s			: signed(15 downto 0)					:= (others => '0');

	-- OPLL
	signal opll_mo_s			: signed(12 downto 0)					:= (others => '0');
	signal opll_ro_s			: signed(12 downto 0)					:= (others => '0');

begin

	-- PLL
	pll_1: entity work.pll1
	port map (
		CLK_IN1		=> clock_50_i,
		CLK_OUT1	=> clock_master_s,		-- 21.47727 (21.249) MHz (6x NTSC)
		CLK_OUT2 	=> clock_vga_s,			-- 25.20000 (25.000) MHz
		CLK_OUT3 	=> clock_hdmi_s			-- 126.0000 (125.00) MHz
	);

	-- Clocks
	clks: entity work.clocks
	port map (
		clock_master_i		=> clock_master_s,
		por_i				=> por_clock_s,
		clock_3m_en_o		=> clock_3m_en_s,
		clock_5m_en_o		=> open,
		clock_7m_en_o		=> clock_7m_en_s,
		clock_10m_en_o		=> clock_10m_en_s
	);

	clock_cpu_en_s	<= clock_3m_en_s	when turbo_on_s = '0' else clock_7m_en_s;

	-- The MSX1
	the_msx: entity work.msx
	generic map (
		hw_id_g				=> 6,
		hw_txt_g			=> "ZX-Uno Board",
		hw_version_g		=> actual_version,
		video_opt_g			=> 1,						-- 1 = dblscan configurable
		ramsize_g			=> 512,
		hw_hashwds_g		=> '0',
		opll_en_g			=> false
	)
	port map (
		-- Resets
		reset_i				=> reset_s,
		por_i				=> por_s,
		softreset_o			=> soft_reset_s_s,
		-- Clocks
		clock_master_i		=> clock_master_s,
		clock_vdp_en_i		=> clock_10m_en_s,
		clock_cpu_en_i		=> clock_cpu_en_s,
		clock_psg_en_i		=> clock_3m_en_s,
		-- Turbo
		turbo_on_k_i		=> extra_keys_s(3),	-- F11
		turbo_on_o			=> turbo_on_s,
		-- Options
		opt_nextor_i		=> '1',
		opt_mr_type_i		=> "00",
		opt_vga_on_i		=> '0',
		-- RAM
		ram_addr_o			=> ram_addr_s,
		ram_data_i			=> ram_data_from_s,
		ram_data_o			=> ram_data_to_s,
		ram_ce_n_o			=> ram_ce_n_s,
		ram_we_n_o			=> ram_we_n_s,
		ram_oe_n_o			=> ram_oe_n_s,
		-- ROM
		rom_addr_o			=> rom_addr_s,
		rom_data_i			=> rom_data_s,
		rom_ce_n_o			=> rom_ce_n_s,
		rom_oe_n_o			=> rom_oe_n_s,
		-- External bus
		bus_addr_o			=> bus_addr_s,
		bus_data_i			=> bus_data_from_s,
		bus_data_o			=> bus_data_to_s,
		bus_rd_n_o			=> bus_rd_n_s,
		bus_wr_n_o			=> bus_wr_n_s,
		bus_m1_n_o			=> bus_m1_n_s,
		bus_iorq_n_o		=> bus_iorq_n_s,
		bus_mreq_n_o		=> bus_mreq_n_s,
		bus_sltsl1_n_o		=> bus_sltsl1_n_s,
		bus_sltsl2_n_o		=> bus_sltsl2_n_s,
		bus_wait_n_i		=> '1',
		bus_nmi_n_i			=> '1',
		bus_int_n_i			=> '1',
		-- VDP RAM
		vram_addr_o			=> vram_addr_s,
		vram_data_i			=> vram_do_s,
		vram_data_o			=> vram_di_s,
		vram_ce_n_o			=> open,
		vram_oe_n_o			=> open,
		vram_we_n_o			=> vram_we_n_s,
		-- Keyboard
		rows_o				=> rows_s,
		cols_i				=> cols_s,
		caps_en_o			=> caps_en_s,
		keyb_valid_i		=> keyb_valid_s,
		keyb_data_i			=> keyb_data_s,
		keymap_addr_o		=> keymap_addr_s,
		keymap_data_o		=> keymap_data_s,
		keymap_we_n_o		=> keymap_we_n_s,
		-- Audio
		audio_scc_o			=> audio_scc_s,
		audio_psg_o			=> audio_psg_s,
		beep_o				=> beep_s,
		opll_mo_o			=> opll_mo_s,
		opll_ro_o			=> opll_ro_s,
		volumes_o			=> volumes_s,
		-- K7
		k7_motor_o			=> open,
		k7_audio_o			=> open,
		k7_audio_i			=> ear_i,
		-- Joystick
		joy1_up_i			=> joy_up_i,
		joy1_down_i			=> joy_down_i,
		joy1_left_i			=> joy_left_i,
		joy1_right_i		=> joy_right_i,
		joy1_btn1_i			=> joy_fire1_i,
		joy1_btn1_o			=> open,--joy_fire1_i,
		joy1_btn2_i			=> joy_fire2_i,
		joy1_btn2_o			=> open,--joy_fire2_i,
		joy1_out_o			=> open,--joy_out1_s,
		joy2_up_i			=> '1',
		joy2_down_i			=> '1',
		joy2_left_i			=> '1',
		joy2_right_i		=> '1',
		joy2_btn1_i			=> '1',
		joy2_btn1_o			=> open,
		joy2_btn2_i			=> '1',
		joy2_btn2_o			=> open,
		joy2_out_o			=> open,
		-- Video
		cnt_hor_o			=> open,
		cnt_ver_o			=> open,
		rgb_r_o				=> rgb_r_s,
		rgb_g_o				=> rgb_g_s,
		rgb_b_o				=> rgb_b_s,
		hsync_n_o			=> rgb_hsync_n_s,
		vsync_n_o			=> rgb_vsync_n_s,
		ntsc_pal_o			=> ntsc_pal_s,
		vga_on_k_i			=> extra_keys_s(2),		-- Print Screen
		vga_en_o			=> vga_en_s,
		scanline_on_k_i		=> extra_keys_s(1),		-- Scroll Lock
		scanline_en_o		=> open,
		vertfreq_on_k_i		=> extra_keys_s(0),		-- Pause/Break
		-- SPI/SD
		flspi_cs_n_o		=> open,
		spi_cs_n_o			=> sd_cs_n_s,
		spi_sclk_o			=> sd_sclk_o,
		spi_mosi_o			=> sd_mosi_o,
		spi_miso_i			=> sd_miso_i,
		sd_pres_n_i			=> '0',
		sd_wp_i				=> '0',
		-- DEBUG
		D_wait_o			=> open,
		D_slots_o			=> open,
		D_ipl_en_o			=> open

	);

	sd_cs_n_o	<= sd_cs_n_s;
	--joy_fire3_o <= not joy_out1_s;		-- for Sega Genesis joypad

	-- ROM
	rom: entity work.mainrom
	port map (
		clock_i		=> clock_master_s,
		clock_en_i	=> clock_cpu_en_s,
		addr_i		=> rom_addr_s,
		data_o		=> rom_data_s
	);
	
	-- VRAM
	vram: entity work.spram
	generic map (
		addr_width_g => 14,
		data_width_g => 8
	)
	port map (
		clock_i		=> clock_master_s,
		clock_en_i	=> clock_10m_en_s,
		we_n_i		=> vram_we_n_s,
		addr_i		=> vram_addr_s,
		data_i		=> vram_di_s,
		data_o		=> vram_do_s
	);

	-- Keyboard PS/2
	keyb: entity work.keyboard
	port map (
		clock_i				=> clock_3m_en_s,
		reset_i				=> reset_s,
		-- MSX
		rows_coded_i		=> rows_s,
		cols_o				=> cols_s,
		keymap_addr_i		=> keymap_addr_s,
		keymap_data_i		=> keymap_data_s,
		keymap_we_n_i		=> keymap_we_n_s,
		-- LEDs
		led_caps_i			=> '0',
		-- PS/2 interface
		ps2_clk_io			=> ps2_clk_io,
		ps2_data_io			=> ps2_data_io,
		-- Direct Access
		keyb_valid_o		=> keyb_valid_s,
		keyb_data_o			=> keyb_data_s,
		--
		reset_o				=> soft_reset_k_s,
		por_o				=> soft_por_s,
		reload_core_o		=> reload_core_s,
		extra_keys_o		=> extra_keys_s
	);

	-- Audio
	mixer: entity work.mixers
	port map (
		clock_audio_i		=> clock_master_s,
		volumes_i			=> volumes_s,
		beep_i				=> beep_s,
		ear_i				=> ear_i,
		audio_scc_i			=> audio_scc_s,
		audio_psg_i			=> audio_psg_s,
--		jt51_left_i			=> jt51_left_s,
--		jt51_right_i		=> jt51_right_s,
		opll_mo_i			=> opll_mo_s,
		opll_ro_i			=> opll_ro_s,
		audio_mix_l_o		=> audio_l_s,
		audio_mix_r_o		=> audio_r_s
	);

	audio_l_amp_s	<= audio_l_s(15) & audio_l_s(13 downto 0);
	audio_r_amp_s	<= audio_r_s(15) & audio_r_s(13 downto 0);

	-- Left Channel
	audiol : entity work.dac_dsm2v
	generic map (
		nbits_g	=> 15
	)
	port map (
		reset_i		=> reset_s,
		clock_i		=> clock_3m_en_s,
		dac_i		=> audio_l_amp_s,
		dac_o		=> dac_l_o
	);

	-- Right Channel
	audior : entity work.dac_dsm2v
	generic map (
		nbits_g	=> 15
	)
	port map (
		reset_i		=> reset_s,
		clock_i		=> clock_3m_en_s,
		dac_i		=> audio_r_amp_s,
		dac_o		=> dac_r_o
	);

	-- Multiboot
	mb: entity work.multiboot
	generic map (
		bit_g			=> 4
	)
	port map (
		reset_i		=> por_s,
		clock_i		=> clock_10m_en_s,
		start_i		=> reload_core_s,
		spi_addr_i	=> X"000000"
	);

	-- Glue logic

	-- Power-on counter
	process (clock_master_s)
	begin
		if rising_edge(clock_master_s) then
			if por_cnt_s /= 0 then
				por_cnt_s <= por_cnt_s - 1;
			end if;
		end if;
	end process;

	-- Resets
	por_clock_s		<= '1'	when por_cnt_s /= 0									else '0';
	por_s			<= '1'	when por_cnt_s /= 0 or soft_por_s = '1'		else '0';
	reset_s			<= '1'	when por_s = '1' or soft_rst_cnt_s = X"00"	else '0';

	process(reset_s, clock_master_s)
	begin
		if reset_s = '1' then
			soft_rst_cnt_s	<= X"FF";
		elsif rising_edge(clock_master_s) then
			if (soft_reset_k_s = '1' or soft_reset_s_s = '1') and soft_rst_cnt_s /= X"00" then
				soft_rst_cnt_s <= soft_rst_cnt_s - 1;
			end if;
		end if;
	end process;

	-- RAM

--	sram_addr_o			<= ram_addr_s(18 downto 0);
--	sram_data_io		<= ram_data_to_s	when ram_we_n_s = '0'	else (others => 'Z');
--	ram_data_from_s		<= sram_data_io;
--	sram_we_n_o			<= ram_we_n_s;
	-- RAM
	sram0: entity work.spSRAM_5128
	port map (
		clk_i			=> clock_master_s,
		-- Sync
		sync_addr_i		=> ram_addr_s(18 downto 0),
		sync_ce_n_i		=> ram_ce_n_s,
		sync_oe_n_i		=> ram_oe_n_s,
		sync_we_n_i		=> ram_we_n_s,
		sync_data_i		=> ram_data_to_s,
		sync_data_o		=> ram_data_from_s,
		-- SRAM in board
		sram_addr_o		=> sram_addr_o,
		sram_data_io	=> sram_data_io,
		sram_ce_n_o		=> open,
		sram_oe_n_o		=> open,
		sram_we_n_o		=> sram_we_n_o
	);


	-- RGB/VGA Output
	vga_r_o				<= rgb_r_s(3 downto 1);
	vga_g_o				<= rgb_g_s(3 downto 1);
	vga_b_o				<= rgb_b_s(3 downto 1);
	vga_csync_n_o		<= rgb_hsync_n_s			when vga_en_s = '1'	else (rgb_hsync_n_s and rgb_vsync_n_s);
	vga_vsync_n_o		<= rgb_vsync_n_s			when vga_en_s = '1'	else '1';
	vga_ntsc_o			<= not ntsc_pal_s;
	vga_pal_o			<= ntsc_pal_s;

--	ptjt: if ramsize_g = 512 generate
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
--			data_o			=> bus_data_from_s,
--			ct1_o				=> open,
--			ct2_o				=> open,
--			irq_n_o			=> open,
--			p1_o				=> open,
--			-- Low resolution output (same as real chip)
--			sample_o			=> open,
--			left_o			=> open,
--			right_o			=> open,
--			-- Full resolution output
--			xleft_o			=> jt51_left_s,
--			xright_o			=> jt51_right_s,
--			-- unsigned outputs for sigma delta converters, full resolution		
--			dacleft_o		=> open,
--			dacright_o		=> open
--		);
--	end generate;

	-- DEBUG
	led_o		<= not sd_cs_n_s;
--	led_o <= extra_keys_s(1);

end architecture;