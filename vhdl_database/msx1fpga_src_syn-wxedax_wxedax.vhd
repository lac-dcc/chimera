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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
--library unisim;
--use unisim.vcomponents.all;
use work.msx_pack.all;

entity wxedax is
	generic (
		use_i2s_g				: boolean		:= true
	);
	port (
		-- Clock (48MHz)
		clock_48M_i				: in    std_logic;
		-- SDRAM (W9864G6JH-6 = 4Mx16 = 8MB)
		sdram_clock_o			: out   std_logic									:= '0';
		sdram_cke_o    	  		: out   std_logic									:= '0';
		sdram_addr_o			: out   std_logic_vector(11 downto 0)				:= (others => '0');
		sdram_dq_io				: inout std_logic_vector(15 downto 0);
		sdram_ba_o				: out   std_logic_vector( 1 downto 0)				:= (others => '0');
		sdram_dqml_o			: out   std_logic;
		sdram_dqmh_o			: out   std_logic;
		sdram_cs_n_o   	  		: out   std_logic									:= '1';
		sdram_we_n_o			: out   std_logic									:= '1';
		sdram_cas_n_o			: out   std_logic									:= '1';
		sdram_ras_n_o			: out   std_logic									:= '1';
		-- SPI FLASH (FPGA and Aux)
		flashf_clk_o			: out   std_logic									:= '0';
		flashf_data_i			: in    std_logic;
		flashf_data_o			: out   std_logic									:= '0';
		flashf_cs_n_o			: out   std_logic									:= '1';
--		flash2_clk_o			: out   std_logic									:= '0';
--		flash2_data_i			: in    std_logic;
--		flash2_data_o			: out   std_logic									:= '0';
		flash2_cs_n_o			: out   std_logic									:= '1';
		-- VGA 5:6:5
		vga_r_o					: out   std_logic_vector(4 downto 0)				:= (others => '0');
		vga_g_o					: out   std_logic_vector(5 downto 0)				:= (others => '0');
		vga_b_o					: out   std_logic_vector(4 downto 0)				:= (others => '0');
		vga_hs_o				: out   std_logic									:= '1';
		vga_vs_o				: out   std_logic									:= '1';
--		-- UART
		uart_tx_o				: out   std_logic									:= '1';
		uart_rx_i				: in    std_logic;
		-- Keys and Leds
		keys_n_i				: in    std_logic_vector(4 downto 1);
		leds_n_o				: out   std_logic_vector(3 downto 0)				:= (others => '1');
		-- PS/2 Keyboard
		ps2_clk_io				: inout std_logic									:= 'Z';
		ps2_dat_io		 		: inout std_logic									:= 'Z';
		-- ADC
		adc_clock_o				: out   std_logic									:= '0';
		adc_data_i				: in    std_logic;
		adc_cs_n_o				: out   std_logic									:= '1';
		-- Audio
		i2s_mclk_o				: out   std_logic									:= '0';
		i2s_bclk_o				: out   std_logic									:= '0';
		i2s_lrclk_o				: out   std_logic									:= '0';
		i2s_data_o				: out   std_logic									:= '0';
		buzzer_o				: out   std_logic									:= '1';
		-- SD Card
		sd_cs_n_o				: out   std_logic									:= '1';
		sd_sclk_o				: out   std_logic									:= '0';
		sd_mosi_o				: out   std_logic									:= '0';
		sd_miso_i				: in    std_logic;
		sd_pres_n_i				: in    std_logic;
		sd_wp_i					: in    std_logic;
		-- Joystick SNES
		pad_clk_o				: out   std_logic									:= '0';
		pad_latch_o				: out   std_logic									:= '0';
		pad_data_i				: in    std_logic;
		-- Others
--		irda_o					: out   std_logic									:= '0';
		gpio_io					: inout std_logic_vector(1 downto 0)				:= (others => 'Z')
	);
end;

architecture behavior of wxedax is

	-- Resets
	signal por_cnt_s			: unsigned(7 downto 0)				:= (others => '1');
	signal por_clock_s			: std_logic;
	signal por_s				: std_logic;
	signal reset_s				: std_logic;
	signal reset_n_s			: std_logic;
	signal soft_por_s			: std_logic;
	signal soft_reset_k_s		: std_logic;
	signal soft_reset_s_s		: std_logic;
	signal soft_rst_cnt_s		: unsigned(7 downto 0)	:= X"FF";
	signal reload_s				: std_logic;

	attribute clock_signal 		: string;
	-- Clocks
	signal clock_master_s		: std_logic;	attribute clock_signal of clock_master_s : signal is "yes";
	signal clock_sdram_s		: std_logic;	attribute clock_signal of clock_sdram_s  : signal is "yes";
	signal clock_3m_en_s		: std_logic;	attribute clock_signal of clock_3m_en_s  : signal is "yes";
	signal clock_7m_en_s		: std_logic;	attribute clock_signal of clock_7m_en_s    : signal is "yes";
	signal clock_10m_en_s		: std_logic;
	signal clock_cpu_en_s		: std_logic;	attribute clock_signal of clock_cpu_en_s     : signal is "yes";
	signal turbo_on_s			: std_logic;
	signal clock_8m_s			: std_logic;	attribute clock_signal of clock_8m_s     : signal is "yes";

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
	signal tapein_s				: std_logic_vector( 7 downto 0);
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
	signal vga_en_s				: std_logic;
	signal ntsc_pal_s			: std_logic;

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
	
	-- SPI
	signal spi_mosi_s			: std_logic;
	signal spi_miso_s			: std_logic;
	signal spi_sclk_s			: std_logic;
	signal sdspi_cs_n_s			: std_logic;
	signal flspi_cs_n_s			: std_logic;

	-- SNES
	signal but_a_s				: std_logic;
	signal but_b_s				: std_logic;
	signal but_x_s				: std_logic;
	signal but_y_s				: std_logic;
	signal but_start_s			: std_logic;
	signal but_sel_s			: std_logic;
	signal but_tl_s				: std_logic;
	signal but_tr_s				: std_logic;
	signal but_up_s				: std_logic;
	signal but_down_s			: std_logic;
	signal but_left_s			: std_logic;
	signal but_right_s			: std_logic;

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
	signal bus_wait_n_s			: std_logic;

	-- JT51
--	signal jt51_cs_n_s			: std_logic								:= '1';
--	signal jt51_data_from_s		: std_logic_vector( 7 downto 0)	:= (others => '1');
--	signal jt51_hd_s			: std_logic								:= '0';
--	signal jt51_left_s			: signed(15 downto 0)				:= (others => '0');
--	signal jt51_right_s			: signed(15 downto 0)				:= (others => '0');

	-- OPLL
	signal opll_mo_s			: signed(12 downto 0)				:= (others => '0');
	signal opll_ro_s			: signed(12 downto 0)				:= (others => '0');

	-- MIDI interface
--	signal midi_cs_n_s			: std_logic								:= '1';
--	signal midi_data_from_s		: std_logic_vector( 7 downto 0)	:= (others => '1');
--	signal midi_hd_s			: std_logic								:= '0';
--	signal midi_int_n_s			: std_logic								:= '1';

	-- Serial interface
--	signal serial_cs_s		: std_logic								:= '0';
--	signal serial_data_from_s: std_logic_vector( 7 downto 0)	:= (others => '1');
--	signal serial_hd_s		: std_logic								:= '0';

begin

	-- PLL
	pll_1: entity work.pll1
	port map (
		CLK_IN1		=> clock_48M_i,
		CLK_OUT1	=> clock_master_s,			-- 21.429 MHz (6x NTSC)
		CLK_OUT2	=> clock_sdram_s,			-- 85.716 MHz (4x master)
		CLK_OUT3	=> sdram_clock_o,			-- 85.716 MHz -90graus
		CLK_OUT4	=> clock_8m_s				-- 8 MHz (for MIDI)
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
		hw_id_g				=> 4,
		hw_txt_g			=> "WXEDAX Board",
		hw_version_g		=> actual_version,
		video_opt_g			=> 1,						-- dblscan configurable
		ramsize_g			=> 8192,
		hw_hashwds_g		=> '1',
		opll_en_g			=> true
	)
	port map (
		-- Resets
		reset_i				=> reset_s,
		por_i				=> por_s,
		softreset_o			=> soft_reset_s_s,
		reload_o			=> reload_s,
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
		k7_audio_o			=> open,
		k7_audio_i			=> ear_s,
		-- Joystick
		joy1_up_i			=> but_up_s,
		joy1_down_i			=> but_down_s,
		joy1_left_i			=> but_left_s,
		joy1_right_i		=> but_right_s,
		joy1_btn1_i			=> but_b_s,
		joy1_btn1_o			=> open,
		joy1_btn2_i			=> but_a_s,
		joy1_btn2_o			=> open,
		joy1_out_o			=> open,
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
		rgb_r_o				=> rgb_r_s,
		rgb_g_o				=> rgb_g_s,
		rgb_b_o				=> rgb_b_s,
		hsync_n_o			=> rgb_hsync_n_s,
		vsync_n_o			=> rgb_vsync_n_s,
		ntsc_pal_o			=> ntsc_pal_s,
		vga_on_k_i			=> extra_keys_s(2),		-- Print Screen
		scanline_on_k_i		=> extra_keys_s(1),		-- Scroll Lock
		vertfreq_on_k_i		=> extra_keys_s(0),		-- Pause
		vga_en_o			=> vga_en_s,
		-- SPI/SD
		flspi_cs_n_o		=> flspi_cs_n_s,
		spi_cs_n_o			=> sdspi_cs_n_s,
		spi_sclk_o			=> spi_sclk_s,
		spi_mosi_o			=> spi_mosi_s,
		spi_miso_i			=> spi_miso_s,
		sd_pres_n_i			=> sd_pres_n_i,
		sd_wp_i				=> sd_wp_i,
		-- DEBUG
		D_wait_o			=> open,
		D_slots_o			=> open,
		D_ipl_en_o			=> open
	);

	-- RAM
	ram: entity work.ssdram
	generic map (
		freq_g			=> 85
	)
	port map (
		clock_i			=> clock_sdram_s,
		reset_i			=> reset_s,
		refresh_i		=> '1',
		-- Static RAM bus
		addr_i			=> ram_addr_s,
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
		mem_udq_o		=> sdram_dqmh_o,
		mem_ldq_o		=> sdram_dqml_o,
		mem_ba_o		=> sdram_ba_o,
		mem_addr_o		=> sdram_addr_o,
		mem_data_io		=> sdram_dq_io
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

	-- Audio
	mixer: entity work.mixers
	port map (
		clock_audio_i	=> clock_master_s,
		volumes_i		=> volumes_s,
		ear_i			=> ear_s,
		beep_i			=> beep_s,
		audio_scc_i		=> audio_scc_s,
		audio_psg_i		=> audio_psg_s,
--		jt51_left_i		=> jt51_left_s,
--		jt51_right_i	=> jt51_right_s,
		opll_mo_i		=> opll_mo_s,
		opll_ro_i		=> opll_ro_s,
		audio_mix_l_o	=> audio_l_s,
		audio_mix_r_o	=> audio_r_s
	);

	ui2s: if use_i2s_g generate
		-- I2S out
		i2s : entity work.i2s_transmitter
		generic map (
			mclk_rate		=> 10714500,		-- unusual values
			sample_rate		=> 167414,
			preamble		=> 0,
			word_length		=> 16
		)
		port map (
			clock_i			=> clock_master_s,	-- 21.477 MHz (2xMCLK)
			reset_i			=> reset_s,
			-- Parallel input
			pcm_l_i			=> std_logic_vector(audio_l_s),
			pcm_r_i			=> std_logic_vector(audio_r_s),
			i2s_mclk_o		=> i2s_mclk_o,
			i2s_lrclk_o		=> i2s_lrclk_o,
			i2s_bclk_o		=> i2s_bclk_o,
			i2s_d_o			=> i2s_data_o
		);
	end generate;

	nui2s: if not use_i2s_g generate
		-- Left Channel
		audiol : entity work.dac_dsm2v
		generic map (
			nbits_g	=> 16
		)
		port map (
			reset_i	=> reset_s,
			clock_i	=> clock_master_s,
			dac_i		=> audio_l_s,
			dac_o		=> i2s_lrclk_o
		);

		-- Right Channel
		audior : entity work.dac_dsm2v
		generic map (
			nbits_g	=> 16
		)
		port map (
			reset_i	=> reset_s,
			clock_i	=> clock_master_s,
			dac_i		=> audio_r_s,
			dac_o		=> i2s_bclk_o
		);
	end generate;

	-- Tape In
	tapein: entity work.tlc549
	generic map (
		frequency_g			=> 21,
		sample_cycles_g		=> 28
	)
	port map (
		clock_i	 			=> clock_master_s,
		reset_i	 			=> reset_s,
		clock_o				=> open,
		data_o				=> tapein_s,
		adc_data_i			=> adc_data_i,
		adc_cs_n_o			=> adc_cs_n_o,
		adc_clk_o			=> adc_clock_o
	);

	-- Multiboot
	mb: entity work.multiboot
	generic map (
		bit_g			=> 2
	)
	port map (
		reset_i		=> por_s,
		clock_i		=> clock_10m_en_s,
		start_i		=> reload_s,
		spi_addr_i	=> X"000000"
	);


	-----------------------------------------------------------------------------
	-- SNES Gamepads
	-----------------------------------------------------------------------------
	snespads_b : entity work.snespad
	generic map (
		num_pads_g			=> 1,
		reset_level_g		=> 1,
		button_level_g		=> 0,
		clocks_per_6us_g	=> 128					-- 6us = 128 ciclos de 21.477MHz
	)
	port map (
		clk_i				=> clock_master_s,
		reset_i				=> reset_s,
		pad_clk_o			=> pad_clk_o,
		pad_latch_o			=> pad_latch_o,
		pad_data_i(0)		=> pad_data_i,
		but_a_o(0)			=> but_a_s,
		but_b_o(0)			=> but_b_s,
		but_x_o(0)			=> but_x_s,
		but_y_o(0)			=> but_y_s,
		but_start_o(0)		=> but_start_s,
		but_sel_o(0)		=> but_sel_s,
		but_tl_o(0)			=> but_tl_s,
		but_tr_o(0)			=> but_tr_s,
		but_up_o(0)			=> but_up_s,
		but_down_o(0)		=> but_down_s,
		but_left_o(0)		=> but_left_s,
		but_right_o(0)		=> but_right_s
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

	por_clock_s		<= '1'	when por_cnt_s /= 0																else '0';
	por_s			<= '1'	when por_cnt_s /= 0  or soft_por_s = '1'   or keys_n_i(4) = '0'	else '0';
	reset_s			<= '1'	when soft_rst_cnt_s = X"00" or por_s = '1' or keys_n_i(1) = '0'	else '0';
	reset_n_s		<= not reset_s;

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

	-- Audio
	buzzer_o			<= beep_s;

	-- Tape In (via ADC)
	process (clock_master_s)
		constant HYST_C  : integer := 20;
		constant LEVEL_C : integer := 128;
		variable tapein_v	: std_logic_vector(8 downto 0);
	begin
		if rising_edge(clock_master_s) then
			tapein_v := '0' & tapein_s;
			if    tapein_v < (LEVEL_C - HYST_C) then
				ear_s <= '0';
			elsif tapein_v > (LEVEL_C + HYST_C) then
				ear_s <= '1';
			end if;
		end if;
	end process;

	-- VGA Output
	vga_r_o		<= rgb_r_s & '0';
	vga_g_o		<= rgb_g_s & "00";
	vga_b_o		<= rgb_b_s & '0';
	vga_hs_o	<= rgb_hsync_n_s;
	vga_vs_o	<= rgb_vsync_n_s;

	-- SD and Flash
	spi_miso_s		<= sd_miso_i when sdspi_cs_n_s = '0' else flashf_data_i;
	sd_mosi_o 		<= spi_mosi_s;
	sd_sclk_o 		<= spi_sclk_s;
	sd_cs_n_o 		<= sdspi_cs_n_s;
	flashf_data_o	<= spi_mosi_s;
	flashf_clk_o	<= spi_sclk_s;
	flashf_cs_n_o	<= flspi_cs_n_s;

	-- Peripheral BUS control
	bus_data_from_s	<= --jt51_data_from_s		when jt51_hd_s = '1'		else
						--	   midi_data_from_s		when midi_hd_s = '1'		else
						--		serial_data_from_s	when serial_hd_s = '1'	else
								(others => '1');
	bus_wait_n_s	<= '1';
	bus_int_n_s		<= '1';--midi_int_n_s;
	
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

	-- MIDI3
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
--		wait_n_o			=> open,
--		tx_o				=> open
--	);

	-- Tests UART
--	serial_cs_s	<= '1'	when bus_addr_s(7 downto 3) = "11001" and bus_iorq_n_s = '0' and bus_m1_n_s = '1'	else '0';	-- 0xC8 - 0xCF
	
--	serial: entity work.uart
--	port map (
--		clock_i		=> clock_master_s,			-- 21.429 MHz
--		reset_i		=> reset_s,
--		addr_i		=> bus_addr_s(2 downto 0),
--		data_i		=> bus_data_to_s,
--		data_o		=> serial_data_from_s,
--		has_data_o	=> serial_hd_s,
--		cs_i			=> serial_cs_s,
--		rd_i			=> not bus_rd_n_s,
--		wr_i			=> not bus_wr_n_s,
--		int_n_o		=> leds_n_o(1),
--		--
--		rxd_i			=> uart_rx_i,
--		txd_o			=> uart_tx_o,
--		cts_n_i		=> gpio_io(0),
--		rts_n_o		=> gpio_io(1),
--		dsr_n_i		=> '0',
--		dtr_n_o		=> open,
--		dcd_i			=> '0',
--		ri_n_i			=> '1'
--	);
	
	-- DEBUG
	leds_n_o(0) <= sdspi_cs_n_s;
--	leds_n_o(1) <= '1';
	leds_n_o(2) <= '1';--not vga_en_s;
	leds_n_o(3) <= '1';--not turbo_on_s;

end architecture;