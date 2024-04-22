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
use work.msx_pack.all;

entity multicore_top is
	generic (
		hdmi_output_g		: boolean	:= false
	);
	port (
		-- Clocks
		clock_50_i			: in    std_logic;

		-- Buttons
		btn_n_i				: in    std_logic_vector( 4 downto 1);
		btn_oe_n_i			: in    std_logic;
		btn_clr_n_i			: in    std_logic;

		-- SRAM (AS7C34096)
		sram_addr_o			: out   std_logic_vector(18 downto 0)			:= (others => '0');
		sram_data_io		: inout std_logic_vector( 7 downto 0)			:= (others => 'Z');
		sram_we_n_o			: out   std_logic								:= '1';
		sram_ce_n_o			: out   std_logic_vector( 1 downto 0)			:= (others => '1');
		sram_oe_n_o			: out   std_logic								:= '1';

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

		-- Joystick
		joy1_up_i			: in    std_logic;
		joy1_down_i			: in    std_logic;
		joy1_left_i			: in    std_logic;
		joy1_right_i		: in    std_logic;
		joy1_p6_io			: inout std_logic								:= 'Z';
		joy1_p7_o			: out   std_logic								:= '1';
		joy1_p9_io			: inout std_logic								:= 'Z';
		joy2_up_i			: in    std_logic;
		joy2_down_i			: in    std_logic;
		joy2_left_i			: in    std_logic;
		joy2_right_i		: in    std_logic;
		joy2_p6_io			: inout std_logic;
		joy2_p7_o			: out   std_logic								:= '1';
		joy2_p9_io			: inout std_logic;

		-- Audio
		dac_l_o				: out   std_logic								:= '0';
		dac_r_o				: out   std_logic								:= '0';
		ear_i				: in    std_logic;
		mic_o				: out   std_logic								:= '0';

		-- VGA
		vga_r_o				: out   std_logic_vector( 2 downto 0)			:= (others => '0');
		vga_g_o				: out   std_logic_vector( 2 downto 0)			:= (others => '0');
		vga_b_o				: out   std_logic_vector( 2 downto 0)			:= (others => '0');
		vga_hsync_n_o		: out   std_logic								:= '1';
		vga_vsync_n_o		: out   std_logic								:= '1';

		-- Debug
		leds_n_o			: out   std_logic_vector( 7 downto 0)			:= (others => '0')
	);
end entity;

architecture behavior of multicore_top is

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
	signal clock_mem_s			: std_logic;
	signal clock_master_s		: std_logic;
	signal clock_3m_en_s		: std_logic;
	signal clock_7m_en_s		: std_logic;
	signal clock_10m_en_s		: std_logic;
	signal clock_cpu_en_s		: std_logic;
	signal clock_vga_s			: std_logic;
	signal clock_dvi_s			: std_logic;
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
	signal vram_data_from_s		: std_logic_vector( 7 downto 0);
	signal vram_data_to_s		: std_logic_vector( 7 downto 0);
	signal vram_ce_n_s			: std_logic;
	signal vram_oe_n_s			: std_logic;
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

begin

	-- PLL1
	pll: entity work.pll1
	port map (
		inclk0		=> clock_50_i,
		c0			=> clock_master_s,		--  21.477
		c1			=> clock_mem_s,			--  42.954
		locked		=> pll_locked_s
	);

	-- PLL2
	pll2: entity work.pll2
	port map (
		inclk0		=> clock_50_i,
		c0			=> clock_vga_s,			--  25.200
		c1			=> clock_dvi_s			-- 126.000
	);

	-- Clocks
	clks: entity work.clocks
	port map (
		clock_master_i	=> clock_master_s,
		por_i			=> not pll_locked_s,
		clock_3m_en_o	=> clock_3m_en_s,
		clock_5m_en_o	=> open,--clock_5m_en_s,
		clock_7m_en_o	=> clock_7m_en_s,
		clock_10m_en_o	=> clock_10m_en_s
	);

	clock_cpu_en_s	<= clock_3m_en_s	when turbo_on_s = '0' else clock_7m_en_s;

	-- The MSX1
	the_msx: entity work.msx
	generic map (
		hw_id_g			=> 5,
		hw_txt_g		=> "Multicore Board",
		hw_version_g	=> actual_version,
		video_opt_g		=> 3,							-- No dblscan and external palette (Color in rgb_r_o)
		ramsize_g		=> 512,
		hw_hashwds_g	=> '0'
	)
	port map (
		-- Resets
		reset_i			=> reset_s,
		por_i			=> por_s,
		softreset_o		=> soft_reset_s_s,
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
		opt_mr_type_i	=> "00",
		opt_vga_on_i	=> '0',
		-- RAM
		ram_addr_o		=> ram_addr_s,
		ram_data_i		=> ram_data_from_s,
		ram_data_o		=> ram_data_to_s,
		ram_ce_n_o		=> ram_ce_n_s,
		ram_we_n_o		=> ram_we_n_s,
		ram_oe_n_o		=> ram_oe_n_s,
		-- ROM
		rom_addr_o		=> open,
		rom_data_i		=> ram_data_from_s,
		rom_ce_n_o		=> open,
		rom_oe_n_o		=> open,
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
		bus_int_n_i		=> '1',
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
		volumes_o		=> volumes_s,
		-- K7
		k7_motor_o		=> open,
		k7_audio_o		=> mic_o,
		k7_audio_i		=> ear_i,
		-- Joystick
		joy1_up_i		=> joy1_up_i,
		joy1_down_i		=> joy1_down_i,
		joy1_left_i		=> joy1_left_i,
		joy1_right_i	=> joy1_right_i,
		joy1_btn1_i		=> joy1_p6_io,
		joy1_btn1_o		=> joy1_p6_io,
		joy1_btn2_i		=> joy1_p9_io,
		joy1_btn2_o		=> joy1_p9_io,
		joy1_out_o		=> joy1_out_s,
		joy2_up_i		=> joy2_up_i,
		joy2_down_i		=> joy2_down_i,
		joy2_left_i		=> joy2_left_i,
		joy2_right_i	=> joy2_right_i,
		joy2_btn1_i		=> joy2_p6_io,
		joy2_btn1_o		=> joy2_p6_io,
		joy2_btn2_i		=> joy2_p9_io,
		joy2_btn2_o		=> joy2_p9_io,
		joy2_out_o		=> joy2_out_s,
		-- Video
		cnt_hor_o		=> cnt_hor_s,
		cnt_ver_o		=> cnt_ver_s,
		rgb_r_o			=> rgb_col_s,
		rgb_g_o			=> open,
		rgb_b_o			=> open,
		hsync_n_o		=> open,--rgb_hsync_n_s,
		vsync_n_o		=> open,--rgb_vsync_n_s,
		ntsc_pal_o		=> open,
		vga_on_k_i		=> '0',
		scanline_on_k_i	=> '0',
		vga_en_o		=> open,
		-- SPI/SD
		flspi_cs_n_o	=> open,
		spi_cs_n_o		=> sd_cs_n_o,
		spi_sclk_o		=> sd_sclk_o,
		spi_mosi_o		=> sd_mosi_o,
		spi_miso_i		=> sd_miso_i,
		sd_pres_n_i		=> '0',
		sd_wp_i			=> '0',
		-- DEBUG
		D_wait_o		=> open,
		D_slots_o		=> open,
		D_ipl_en_o		=> open
	);

	joy1_p7_o <= not joy1_out_s;		-- for Sega Genesis joypad
	joy2_p7_o <= not joy2_out_s;		-- for Sega Genesis joypad

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
	
	-- RAM and VRAM
	sram0: entity work.dpSRAM_5128
	port map (
		clk_i			=> clock_mem_s,
		-- Port 0
		porta0_addr_i	=> "11101" & vram_addr_s,
		porta0_ce_n_i	=> vram_ce_n_s,
		porta0_oe_n_i	=> vram_oe_n_s,
		porta0_we_n_i	=> vram_we_n_s,
		porta0_data_i	=> vram_data_from_s,
		porta0_data_o	=> vram_data_to_s,
		-- Port 1
		porta1_addr_i	=> ram_addr_s(18 downto 0),
		porta1_ce_n_i	=> ram_ce_n_s,
		porta1_oe_n_i	=> ram_oe_n_s,
		porta1_we_n_i	=> ram_we_n_s,
		porta1_data_i	=> ram_data_to_s,
		porta1_data_o	=> ram_data_from_s,
		-- SRAM in board
		sram_addr_o		=> sram_addr_o,
		sram_data_io	=> sram_data_io,
		sram_ce_n_o		=> sram_ce_n_o(0),
		sram_oe_n_o		=> sram_oe_n_o,
		sram_we_n_o		=> sram_we_n_o
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
--		jt51_left_i		=> (others => '0'),
--		jt51_right_i	=> (others => '0'),
--		opll_mo_i		=> (others => '0'),
--		opll_ro_i		=> (others => '0'),
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
	reset_s			<= '1'	when soft_rst_cnt_s = X"01"                 or btn_reset_n_s = '0'		else '0';

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
		clk_i			=> clock_master_s,
		button_i		=> btn_n_i(1) or btn_n_i(2),
		result_o		=> btn_scan_s
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
		I_CLK		=> clock_master_s,
		I_CLK_VGA	=> clock_vga_s,
		I_COLOR		=> rgb_col_s,
		I_HCNT		=> cnt_hor_s,
		I_VCNT		=> cnt_ver_s,
		O_HSYNC		=> vga_hsync_n_s,
		O_VSYNC		=> vga_vsync_n_s,
		O_COLOR		=> vga_col_s,
		O_HCNT		=> open,
		O_VCNT		=> open,
		O_H			=> open,
		O_BLANK		=> vga_blank_s
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
		variable vga_col_v		: integer range 0 to 15;
		variable vga_rgb_v		: std_logic_vector(15 downto 0);
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

	uh: if hdmi_output_g generate

		sound_hdmi_l_s <= '0' & std_logic_vector(audio_l_amp_s(15 downto 1));
		sound_hdmi_r_s <= '0' & std_logic_vector(audio_r_amp_s(15 downto 1));

		-- HDMI
		hdmi: entity work.hdmi
		generic map (
			FREQ	=> 25200000,	-- pixel clock frequency 
			FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
			CTS	=> 25200,		-- CTS = Freq(pixclk) * N / (128 * Fs)
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
			O_RED				=> tdms_r_s,
			O_GREEN			=> tdms_g_s,
			O_BLUE			=> tdms_b_s
		);

		hdmio: entity work.hdmi_out_altera
		port map (
			clock_pixel_i		=> clock_vga_s,
			clock_tdms_i		=> clock_dvi_s,
			red_i					=> tdms_r_s,
			green_i				=> tdms_g_s,
			blue_i				=> tdms_b_s,
			tmds_out_p			=> tdms_p_s,
			tmds_out_n			=> tdms_n_s
		);

		vga_hsync_n_o	<= tdms_p_s(2);	-- 2+		10
		vga_vsync_n_o	<= tdms_n_s(2);	-- 2-		11
		vga_b_o(2)		<= tdms_p_s(1);	-- 1+		144	
		vga_b_o(1)		<= tdms_n_s(1);	-- 1-		143
		vga_r_o(0)		<= tdms_p_s(0);	-- 0+		133
		vga_g_o(2)		<= tdms_n_s(0);	-- 0-		132
		vga_r_o(1)		<= tdms_p_s(3);	-- CLK+	113
		vga_r_o(2)		<= tdms_n_s(3);	-- CLK-	112
	end generate;

	nuh: if not hdmi_output_g generate
		vga_r_o			<= vga_r_s(3 downto 1);
		vga_g_o			<= vga_g_s(3 downto 1);
		vga_b_o			<= vga_b_s(3 downto 1);
		vga_hsync_n_o	<= vga_hsync_n_s;
		vga_vsync_n_o	<= vga_vsync_n_s;
	end generate;

	-- DEBUG
	leds_n_o(0)		<= not turbo_on_s;
--	leds_n_o(1)		<= not caps_en_s;
--	leds_n_o(2)		<= not soft_reset_k_s;
--	leds_n_o(3)		<= not soft_por_s;

end architecture;