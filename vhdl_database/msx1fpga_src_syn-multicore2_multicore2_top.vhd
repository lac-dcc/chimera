-------------------------------------------------------------------------------
--
-- MSX1 FPGA project
--
-- Copyright (c) 2016, Fabio Belavenuto (belavenuto@gmail.com)
--
-- TOP created by Victor Trucco (c) 2018
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
use work.msx_pack.all;

entity multicore2_top is
	port (
		-- Clocks
		clock_50_i			: in    std_logic;

		-- Buttons
		btn_n_i				: in    std_logic_vector(4 downto 1);

		-- SRAM (AS7C34096)
		sram_addr_o			: out   std_logic_vector(18 downto 0)			:= (others => '0');
		sram_data_io		: inout std_logic_vector( 7 downto 0)			:= (others => 'Z');
		sram_we_n_o			: out   std_logic								:= '1';
		sram_oe_n_o			: out   std_logic								:= '1';

		-- SDRAM	(H57V256 = 16Mx16 = 32MB)
		sdram_clk_o			: out   std_logic								:= '0';
		sdram_cke_o			: out   std_logic								:= '0';
		sdram_ad_o			: out   std_logic_vector(12 downto 0)			:= (others => '0');
		sdram_da_io			: inout std_logic_vector(15 downto 0)			:= (others => 'Z');
		sdram_ba_o			: out   std_logic_vector( 1 downto 0)			:= (others => '0');
		sdram_dqm_o			: out   std_logic_vector( 1 downto 0)			:= (others => '1');
		sdram_ras_n_o		: out   std_logic								:= '1';
		sdram_cas_n_o		: out   std_logic								:= '1';
		sdram_cs_n_o		: out   std_logic								:= '1';
		sdram_we_n_o		: out   std_logic								:= '1';

		-- PS2
		ps2_clk_io			: inout std_logic								:= 'Z';
		ps2_data_io			: inout std_logic								:= 'Z';
		ps2_mouse_clk_io  	: inout std_logic								:= 'Z';
		ps2_mouse_data_io 	: inout std_logic								:= 'Z';

		-- SD Card
		sd_cs_n_o			: out   std_logic								:= '1';
		sd_sclk_o			: out   std_logic								:= '0';
		sd_mosi_o			: out   std_logic								:= '0';
		sd_miso_i			: in    std_logic;

		-- Joysticks
		joy1_up_i			: in    std_logic;
		joy1_down_i			: in    std_logic;
		joy1_left_i			: in    std_logic;
		joy1_right_i		: in    std_logic;
		joy1_p6_i			: in    std_logic;
		joy1_p9_i			: in    std_logic;
		joy2_up_i			: in    std_logic;
		joy2_down_i			: in    std_logic;
		joy2_left_i			: in    std_logic;
		joy2_right_i		: in    std_logic;
		joy2_p6_i			: in    std_logic;
		joy2_p9_i			: in    std_logic;
		joyX_p7_o			: out   std_logic								:= '1';

		-- Audio
		dac_l_o				: out   std_logic								:= '0';
		dac_r_o				: out   std_logic								:= '0';
		ear_i				: in    std_logic;
		mic_o				: out   std_logic								:= '0';

		-- VGA
		vga_r_o				: out   std_logic_vector(4 downto 0)			:= (others => '0');
		vga_g_o				: out   std_logic_vector(4 downto 0)			:= (others => '0');
		vga_b_o				: out   std_logic_vector(4 downto 0)			:= (others => '0');
		vga_hsync_n_o		: out   std_logic								:= '1';
		vga_vsync_n_o		: out   std_logic								:= '1';

		-- HDMI
		tmds_o				: out   std_logic_vector(7 downto 0)			:= (others => '0');

		--STM32
		stm_rx_o			: out   std_logic								:= 'Z'; -- stm RX pin, so, is OUT on the slave
		stm_tx_i			: in    std_logic								:= 'Z'; -- stm TX pin, so, is IN on the slave
		stm_rst_o			: out   std_logic								:= '0'; -- '0' to hold the microcontroller reset line, to free the SD card
		stm_a15_io			: inout std_logic								:= 'Z';
		stm_b8_io			: inout std_logic								:= 'Z';
		stm_b9_io			: inout std_logic								:= 'Z';
		stm_b12_io			: inout std_logic								:= 'Z';
		stm_b13_io			: inout std_logic								:= 'Z';
		stm_b14_io			: inout std_logic								:= 'Z';
		stm_b15_io			: inout std_logic								:= 'Z'
	);
end entity;

architecture behavior of multicore2_top is

	-- Buttons
	signal btn_por_n_s			: std_logic;
	signal btn_reset_n_s		: std_logic;
	signal btn_scan_s			: std_logic;

	-- Resets
	signal pll_locked_s			: std_logic;
	signal por_s				: std_logic;
	signal reset_s				: std_logic;
	signal soft_reset_k_s		: std_logic;
	signal soft_reset_s_s		: std_logic;
	signal soft_por_s			: std_logic;
	signal soft_rst_cnt_s		: unsigned(7 downto 0)	:= X"FF";

	-- Clocks
	signal clock_sdram_s		: std_logic;
	signal clock_mem_s			: std_logic;
	signal clock_master_s		: std_logic;
	signal clock_3m_en_s		: std_logic;
	signal clock_7m_en_s		: std_logic;
	signal clock_10m_en_s		: std_logic;
	signal clock_cpu_en_s		: std_logic;
	signal clock_vga_s			: std_logic;
	signal clock_dvi_s			: std_logic;
	signal clock_vga2x_s		: std_logic;
	signal turbo_on_s			: std_logic;

	-- RAM
	signal ram_addr_s			: std_logic_vector(22 downto 0);		-- 8MB
	signal ram_data_from_s		: std_logic_vector( 7 downto 0);
	signal ram_data_to_s		: std_logic_vector( 7 downto 0);
	signal ram_ce_n_s			: std_logic;
	signal ram_oe_n_s			: std_logic;
	signal ram_we_n_s			: std_logic;

	-- VRAM memory
	signal vram_addr_s			: std_logic_vector(13 downto 0);		-- 16K
	signal vram_do_s			: std_logic_vector( 7 downto 0);
	signal vram_di_s			: std_logic_vector( 7 downto 0);
	signal vram_we_n_s			: std_logic;

	-- Audio
	signal audio_scc_s			: signed(14 downto 0);
	signal audio_psg_s			: unsigned( 7 downto 0);
	signal beep_s				: std_logic;
	signal audio_l_s			: unsigned(15 downto 0);
	signal audio_r_s			: unsigned(15 downto 0);
	signal audio_l_amp_s		: unsigned(15 downto 0);
	signal audio_r_amp_s		: unsigned(15 downto 0);
	signal volumes_s			: volumes_t;

	-- Video
	signal rgb_col_s			: std_logic_vector( 3 downto 0);
--	signal rgb_hsync_n_s		: std_logic;
--	signal rgb_vsync_n_s		: std_logic;
	signal cnt_hor_s			: std_logic_vector( 8 downto 0);
	signal cnt_ver_s			: std_logic_vector( 7 downto 0);
	signal vga_hsync_n_s		: std_logic;
	signal vga_vsync_n_s		: std_logic;
	signal vga_blank_s			: std_logic;
	signal vga_col_s			: std_logic_vector( 3 downto 0);
	signal vga_r_s				: std_logic_vector( 3 downto 0);
	signal vga_g_s				: std_logic_vector( 3 downto 0);
	signal vga_b_s				: std_logic_vector( 3 downto 0);
	signal scanlines_en_s		: std_logic;
	signal odd_line_s			: std_logic;
	signal sound_hdmi_l_s		: std_logic_vector(15 downto 0);
	signal sound_hdmi_r_s		: std_logic_vector(15 downto 0);
	signal tdms_r_s				: std_logic_vector( 9 downto 0);
	signal tdms_g_s				: std_logic_vector( 9 downto 0);
	signal tdms_b_s				: std_logic_vector( 9 downto 0);
	signal tdms_p_s				: std_logic_vector( 3 downto 0);
	signal tdms_n_s				: std_logic_vector( 3 downto 0);

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

	-- Joystick
	signal joy1_out_s			: std_logic;
	signal joy2_out_s			: std_logic;

	-- Bus
	signal bus_addr_s			: std_logic_vector(15 downto 0);
	signal bus_data_from_s		: std_logic_vector( 7 downto 0)	:= (others => '1');
	signal bus_data_to_s		: std_logic_vector( 7 downto 0);
	signal bus_rd_n_s			: std_logic;
	signal bus_wr_n_s			: std_logic;
	signal bus_m1_n_s			: std_logic;
	signal bus_iorq_n_s			: std_logic;
	signal bus_mreq_n_s			: std_logic;
	signal bus_sltsl1_n_s		: std_logic;
	signal bus_sltsl2_n_s		: std_logic;
	signal bus_int_n_s			: std_logic;
	signal bus_wait_n_s			: std_logic;

	-- JT51
--	signal jt51_cs_n_s			: std_logic;
--	signal jt51_data_from_s		: std_logic_vector( 7 downto 0)	:= (others => '1');
--	signal jt51_hd_s			: std_logic								:= '0';
--	signal jt51_left_s			: signed(15 downto 0)				:= (others => '0');
--	signal jt51_right_s			: signed(15 downto 0)				:= (others => '0');
		
	-- OPLL
	signal opll_mo_s			: signed(12 downto 0)			:= (others => '0');
	signal opll_ro_s			: signed(12 downto 0)			:= (others => '0');

begin

	-- PLL1
	pll: entity work.pll1
	port map (
		inclk0		=> clock_50_i,
		c0			=> clock_master_s,		-- 21.477 MHz					[21.484]
		c1			=> clock_sdram_s,			-- 85.908 MHz (4x master)	[85.937]
		c2			=> sdram_clk_o,			-- 85.908 MHz -90°
		locked		=> pll_locked_s
	);

	-- PLL2
	pll2: entity work.pll2
	port map (
		inclk0		=> clock_50_i,
		c0			=> clock_vga_s,			--  25.200
		c1			=> clock_dvi_s				-- 126.000
	);

	-- Clocks
	clks: entity work.clocks
	port map (
		clock_master_i		=> clock_master_s,
		por_i				=> not pll_locked_s,
		clock_3m_en_o		=> clock_3m_en_s,
		clock_5m_en_o		=> open,
		clock_7m_en_o		=> clock_7m_en_s,
		clock_10m_en_o		=> clock_10m_en_s
	);

	clock_cpu_en_s	<= clock_3m_en_s	when turbo_on_s = '0' else clock_7m_en_s;

	-- The MSX1
	the_msx: entity work.msx
	generic map (
		hw_id_g				=> 8,
		hw_txt_g			=> "Multicore2 Board",
		hw_version_g		=> actual_version,
		video_opt_g			=> 3,							-- No dblscan and external palette (Color in rgb_r_o)
		ramsize_g			=> 8192,
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
		opt_vga_on_i		=> '1',
		-- RAM
		ram_addr_o			=> ram_addr_s,
		ram_data_i			=> ram_data_from_s,
		ram_data_o			=> ram_data_to_s,
		ram_ce_n_o			=> ram_ce_n_s,
		ram_we_n_o			=> ram_we_n_s,
		ram_oe_n_o			=> ram_oe_n_s,
		-- ROM
		rom_addr_o			=> open,
		rom_data_i			=> ram_data_from_s,
		rom_ce_n_o			=> open,
		rom_oe_n_o			=> open,
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
		bus_wait_n_i		=> bus_wait_n_s,
		bus_nmi_n_i			=> '1',
		bus_int_n_i			=> bus_int_n_s,
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
		k7_audio_o			=> mic_o,
		k7_audio_i			=> ear_i,
		-- Joystick
		joy1_up_i			=> joy1_up_i,
		joy1_down_i			=> joy1_down_i,
		joy1_left_i			=> joy1_left_i,
		joy1_right_i		=> joy1_right_i,
		joy1_btn1_i			=> joy1_p6_i,
		joy1_btn1_o			=> open,
		joy1_btn2_i			=> joy1_p9_i,
		joy1_btn2_o			=> open,
		joy1_out_o			=> joy1_out_s,
		joy2_up_i			=> joy2_up_i,
		joy2_down_i			=> joy2_down_i,
		joy2_left_i			=> joy2_left_i,
		joy2_right_i		=> joy2_right_i,
		joy2_btn1_i			=> joy2_p6_i,
		joy2_btn1_o			=> open,
		joy2_btn2_i			=> joy2_p9_i,
		joy2_btn2_o			=> open,
		joy2_out_o			=> joy2_out_s,
		-- Video
		cnt_hor_o			=> cnt_hor_s,
		cnt_ver_o			=> cnt_ver_s,
		rgb_r_o				=> rgb_col_s,
		rgb_g_o				=> open,
		rgb_b_o				=> open,
		hsync_n_o			=> open,
		vsync_n_o			=> open,
		ntsc_pal_o			=> open,
		vga_on_k_i			=> '0',
		scanline_on_k_i		=> '0',
		vga_en_o			=> open,
		-- SPI/SD
		spi_cs_n_o			=> sd_cs_n_o,
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

	joyX_p7_o <= not joy1_out_s;		-- for Sega Genesis joypad
	--joy2_p7_o <= not joy2_out_s;		-- for Sega Genesis joypad

	-- RAM
	ram: entity work.ssdram256Mb
	generic map (
		freq_g			=> 85
	)
	port map (
		clock_i			=> clock_sdram_s,
		reset_i			=> reset_s,
		refresh_i		=> '1',
		-- Static RAM bus
		addr_i			=> "00" & ram_addr_s,
		data_i			=> ram_data_to_s,
		data_o			=> ram_data_from_s,
		cs_n_i			=> ram_ce_n_s,
		oe_n_i			=> ram_oe_n_s,
		we_n_i			=> ram_we_n_s,
		-- SD-RAM ports
		mem_cke_o		=> sdram_cke_o,
		mem_cs_n_o		=> sdram_cs_n_o,
		mem_ras_n_o		=> sdram_ras_n_o,
		mem_cas_n_o		=> sdram_cas_n_o,
		mem_we_n_o		=> sdram_we_n_o,
		mem_udq_o		=> sdram_dqm_o(1),
		mem_ldq_o		=> sdram_dqm_o(0),
		mem_ba_o		=> sdram_ba_o,
		mem_addr_o		=> sdram_ad_o,
		mem_data_io		=> sdram_da_io
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
		ps2_data_io		=> ps2_data_io,
		-- Direct Access
		keyb_valid_o	=> keyb_valid_s,
		keyb_data_o		=> keyb_data_s,
		--
		reset_o			=> soft_reset_k_s,
		por_o			=> soft_por_s,
		reload_core_o	=> open,
		extra_keys_o	=> extra_keys_s
	);

	-- Audio
	mixer: entity work.mixeru
	port map (
		clock_audio_i	=> clock_master_s,
		volumes_i		=> volumes_s,
		beep_i			=> beep_s,
		ear_i			=> ear_i,
		audio_scc_i		=> audio_scc_s,
		audio_psg_i		=> audio_psg_s,
--		jt51_left_i		=> jt51_left_s,
--		jt51_right_i	=> jt51_right_s,
		opll_mo_i		=> opll_mo_s,
		opll_ro_i		=> opll_ro_s,
		audio_mix_l_o	=> audio_l_s,
		audio_mix_r_o	=> audio_r_s
	);

	audio_l_amp_s	<= audio_l_s(15) & audio_l_s(13 downto 0) & "0";
	audio_r_amp_s	<= audio_r_s(15) & audio_r_s(13 downto 0) & "0";

	-- Left Channel
	audiol : entity work.dac
	generic map (
		nbits_g	=> 16
	)
	port map (
		reset_i		=> reset_s,
		clock_i		=> clock_3m_en_s,
		dac_i		=> audio_l_amp_s,
		dac_o		=> dac_l_o
	);

	-- Right Channel
	audior : entity work.dac
	generic map (
		nbits_g	=> 16
	)
	port map (
		reset_i		=> reset_s,
		clock_i		=> clock_3m_en_s,
		dac_i		=> audio_r_amp_s,
		dac_o		=> dac_r_o
	);

	-- Glue logic

	-- Resets
	btn_por_n_s		<= btn_n_i(2) or btn_n_i(4);
	btn_reset_n_s	<= btn_n_i(3) or btn_n_i(4);

	por_s			<= '1'	when pll_locked_s = '0' or soft_por_s = '1' or btn_por_n_s = '0'		else '0';
	reset_s			<= '1'	when soft_rst_cnt_s = X"01"                 or btn_reset_n_s = '0'	else '0';

	process(reset_s, clock_master_s)
	begin
		if reset_s = '1' then
			soft_rst_cnt_s	<= X"00";
		elsif rising_edge(clock_master_s) then
			if (soft_reset_k_s = '1' or soft_reset_s_s = '1' or por_s = '1') and soft_rst_cnt_s = X"00" then
				soft_rst_cnt_s	<= X"FF";
			elsif soft_rst_cnt_s /= X"00" then
				soft_rst_cnt_s <= soft_rst_cnt_s - 1;
			end if;
		end if;
	end process;

	---------------------------------
	-- scanlines
	btnscl: entity work.debounce
	generic map (
		counter_size_g	=> 16
	)
	port map (
		clk_i				=> clock_master_s,
		button_i			=> btn_n_i(1) or btn_n_i(2),
		result_o			=> btn_scan_s
	);
	
	process (por_s, btn_scan_s)
	begin
		if por_s = '1' then
			scanlines_en_s <= '0';
		elsif falling_edge(btn_scan_s) then
			scanlines_en_s <= not scanlines_en_s;
		end if;
	end process;

	-- VGA framebuffer
	vga: entity work.vga
	port map (
		I_CLK			=> clock_master_s,
		I_CLK_VGA		=> clock_vga_s,
		I_COLOR			=> rgb_col_s,
		I_HCNT			=> cnt_hor_s,
		I_VCNT			=> cnt_ver_s,
		O_HSYNC			=> vga_hsync_n_s,
		O_VSYNC			=> vga_vsync_n_s,
		O_COLOR			=> vga_col_s,
		O_HCNT			=> open,
		O_VCNT			=> open,
		O_H				=> open,
		O_BLANK			=> vga_blank_s
	);

	-- Scanlines
	process(vga_hsync_n_s,vga_vsync_n_s)
	begin
		if vga_vsync_n_s = '0' then
			odd_line_s <= '0';
		elsif rising_edge(vga_hsync_n_s) then
			odd_line_s <= not odd_line_s;
		end if;
	end process;

	-- Index => RGB 
	process (clock_vga_s)
		variable vga_col_v	: integer range 0 to 15;
		variable vga_rgb_v	: std_logic_vector(15 downto 0);
		variable vga_r_v		: std_logic_vector( 3 downto 0);
		variable vga_g_v		: std_logic_vector( 3 downto 0);
		variable vga_b_v		: std_logic_vector( 3 downto 0);
		type ram_t is array (natural range 0 to 15) of std_logic_vector(15 downto 0);
		constant rgb_c : ram_t := (
				--      RB0G
				0  => X"0000",
				1  => X"0000",
				2  => X"240C",
				3  => X"570D",
				4  => X"5E05",
				5  => X"7F07",
				6  => X"D405",
				7  => X"4F0E",
				8  => X"F505",
				9  => X"F707",
				10 => X"D50C",
				11 => X"E80C",
				12 => X"230B",
				13 => X"CB09",
				14 => X"CC0C",
				15 => X"FF0F"
		);
	begin
		if rising_edge(clock_vga_s) then
			vga_col_v := to_integer(unsigned(vga_col_s));
			vga_rgb_v := rgb_c(vga_col_v);
			if scanlines_en_s = '1' then
				--
				if vga_rgb_v(15 downto 12) > 1 and odd_line_s = '1' then
					vga_r_s <= vga_rgb_v(15 downto 12) - 2;
				else
					vga_r_s <= vga_rgb_v(15 downto 12);
				end if;
				--
				if vga_rgb_v(11 downto 8) > 1 and odd_line_s = '1' then
					vga_b_s <= vga_rgb_v(11 downto 8) - 2;
				else
					vga_b_s <= vga_rgb_v(11 downto 8);
				end if;
				--
				if vga_rgb_v(3 downto 0) > 1 and odd_line_s = '1' then
					vga_g_s <= vga_rgb_v(3 downto 0) - 2;
				else
					vga_g_s <= vga_rgb_v(3 downto 0);
				end if;
			else
				vga_r_s <= vga_rgb_v(15 downto 12);
				vga_b_s <= vga_rgb_v(11 downto  8);
				vga_g_s <= vga_rgb_v( 3 downto  0);
			end if;
		end if;
	end process;


	sound_hdmi_l_s <= '0' & std_logic_vector(audio_l_amp_s(15 downto 1));
	sound_hdmi_r_s <= '0' & std_logic_vector(audio_r_amp_s(15 downto 1));

	-- HDMI
	hdmi: entity work.hdmi
	generic map (
		FREQ	=> 25200000,	-- pixel clock frequency 
		FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
		CTS		=> 25200,		-- CTS = Freq(pixclk) * N / (128 * Fs)
		N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
	) 
	port map (
		I_CLK_PIXEL		=> clock_vga_s,
		I_R				=> vga_r_s & vga_r_s,
		I_G				=> vga_g_s & vga_g_s,
		I_B				=> vga_b_s & vga_b_s,
		I_BLANK			=> vga_blank_s,
		I_HSYNC			=> vga_hsync_n_s,
		I_VSYNC			=> vga_vsync_n_s,
		-- PCM audio
		I_AUDIO_ENABLE	=> '1',
		I_AUDIO_PCM_L 	=> sound_hdmi_l_s,
		I_AUDIO_PCM_R	=> sound_hdmi_r_s,
		-- TMDS parallel pixel synchronous outputs (serialize LSB first)
		O_RED			=> tdms_r_s,
		O_GREEN			=> tdms_g_s,
		O_BLUE			=> tdms_b_s
	);

	hdmio: entity work.hdmi_out_altera
	port map (
		clock_pixel_i		=> clock_vga_s,
		clock_tdms_i		=> clock_dvi_s,
		red_i				=> tdms_r_s,
		green_i				=> tdms_g_s,
		blue_i				=> tdms_b_s,
		tmds_out_p			=> tdms_p_s,
		tmds_out_n			=> tdms_n_s
	);

	tmds_o(7)	<= tdms_p_s(2);	-- 2+		
	tmds_o(6)	<= tdms_n_s(2);	-- 2-		
	tmds_o(5)	<= tdms_p_s(1);	-- 1+			
	tmds_o(4)	<= tdms_n_s(1);	-- 1-		
	tmds_o(3)	<= tdms_p_s(0);	-- 0+		
	tmds_o(2)	<= tdms_n_s(0);	-- 0-	
	tmds_o(1)	<= tdms_p_s(3);	-- CLK+	
	tmds_o(0)	<= tdms_n_s(3);	-- CLK-	


	vga_r_o			<= vga_r_s & '0';
	vga_g_o			<= vga_g_s & '0';
	vga_b_o			<= vga_b_s & '0';
	vga_hsync_n_o	<= vga_hsync_n_s;
	vga_vsync_n_o	<= vga_vsync_n_s;

	-- Peripheral BUS control
	bus_data_from_s	<= --jt51_data_from_s	when jt51_hd_s = '1'	else
--							   midi_data_from_s	when midi_hd_s = '1'	else
								(others => '1');
	bus_wait_n_s	<= '1';--midi_wait_n_s;
	bus_int_n_s		<= '1';--midi_int_n_s;

	-- JT51
--	jt51_cs_n_s <= '0' when bus_addr_s(7 downto 1) = "0010000" and bus_iorq_n_s = '0' and bus_m1_n_s = '1'	else '1';	-- 0x20 - 0x21

--	jt51: entity work.jt51_wrapper
--	port map (
--		clock_i			=> clock_3m_s,
--		reset_i			=> reset_s,
--		addr_i			=> bus_addr_s(0),
--		cs_n_i			=> jt51_cs_n_s,
--		wr_n_i			=> bus_wr_n_s,
--		rd_n_i			=> bus_rd_n_s,
--		data_i			=> bus_data_to_s,
--		data_o			=> jt51_data_from_s,
--		has_data_o		=> jt51_hd_s,
--		ct1_o				=> open,
--		ct2_o				=> open,
--		irq_n_o			=> open,
--		p1_o				=> open,
--		-- Low resolution output (same as real chip)
--		sample_o			=> open,
--		left_o			=> open,
--		right_o			=> open,
--		-- Full resolution output
--		xleft_o			=> jt51_left_s,
--		xright_o			=> jt51_right_s,
--		-- unsigned outputs for sigma delta converters, full resolution		
--		dacleft_o		=> open,
--		dacright_o		=> open
--	);

	-- OPLL
--	opll_cs_n_s	<= '0' when bus_addr_s(7 downto 1) = "0111110" and bus_iorq_n_s = '0' and bus_m1_n_s = '1'	else '1';	-- 0x7C - 0x7D

		-- MIDI
--	midi_cs_n_s	<= '0' when bus_addr_s(7 downto 1) = "0111111" and bus_iorq_n_s = '0' and bus_m1_n_s = '1'	else '1';	-- 0x7E - 0x7F

	-- MIDI interface
--	midi: entity work.midiIntf
--	port map (
--		clock_i			=> clock_8m_s,
--		reset_i			=> reset_s,
--		addr_i			=> bus_addr_s(0),
--		cs_n_i			=> midi_cs_n_s,
--		wr_n_i			=> bus_wr_n_s,
--		rd_n_i			=> bus_rd_n_s,
--		data_i			=> bus_data_to_s,
--		data_o			=> midi_data_from_s,
--		has_data_o		=> midi_hd_s,
--		-- Outs
--		int_n_o			=> midi_int_n_s,
--		wait_n_o			=> midi_wait_n_s,
--		tx_o				=> uart_tx_o
--	);

	-- DEBUG
--	leds_n_o(0)		<= not turbo_on_s;
--	leds_n_o(1)		<= not caps_en_s;
--	leds_n_o(2)		<= not soft_reset_k_s;
--	leds_n_o(3)		<= not soft_por_s;

end architecture;