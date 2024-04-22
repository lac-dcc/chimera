-------------------------------------------------------------------------------
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
-- ZX Spectrum Next
--
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity next_top is
	generic (
		hdmi_output_g	: boolean	:= false
	);
	port (
		-- Clocks
		clock_50_i			: in    std_logic;

		-- SRAM (AS7C34096)
		ram_addr_o			: out   std_logic_vector(18 downto 0)	:= (others => '0');
		ram_data_io			: inout std_logic_vector(15 downto 0)	:= (others => 'Z');
		ram_oe_n_o			: out   std_logic								:= '1';
		ram_we_n_o			: out   std_logic								:= '1';
		ram_ce_n_o			: out   std_logic_vector( 3 downto 0)	:= (others => '1');

		-- PS2
		ps2_clk_io			: inout std_logic								:= 'Z';
		ps2_data_io			: inout std_logic								:= 'Z';
		ps2_pin6_io			: inout std_logic								:= 'Z';	-- Mouse clock
		ps2_pin2_io 		: inout std_logic								:= 'Z';	-- Mouse data

		-- SD Card
		sd_cs0_n_o			: out   std_logic								:= '1';
		sd_cs1_n_o			: out   std_logic								:= '1';
		sd_sclk_o			: out   std_logic								:= '0';
		sd_mosi_o			: out   std_logic								:= '0';
		sd_miso_i			: in    std_logic;

		-- Flash
		flash_cs_n_o		: out   std_logic								:= '1';
		flash_sclk_o		: out   std_logic								:= '0';
		flash_mosi_o		: out   std_logic								:= '0';
		flash_miso_i		: in    std_logic;
		flash_wp_o			: out   std_logic								:= '0';
		flash_hold_o		: out   std_logic								:= '1';

		-- Joystick
		joyp1_i				: in    std_logic;
		joyp2_i				: in    std_logic;
		joyp3_i				: in    std_logic;
		joyp4_i				: in    std_logic;
		joyp6_i				: in    std_logic;
		joyp7_o				: out   std_logic								:= '1';
		joyp9_i				: in    std_logic;
		joysel_o				: out   std_logic								:= '0';

		-- Audio
		audioext_l_o		: out   std_logic								:= '0';
		audioext_r_o		: out   std_logic								:= '0';
		audioint_o			: out   std_logic								:= '0';

		-- K7
		ear_port_i			: in    std_logic;
		mic_port_o			: out   std_logic								:= '0';

		-- Buttons
		btn_divmmc_n_i		: in    std_logic;
		btn_multiface_n_i	: in    std_logic;
		btn_reset_n_i		: in    std_logic;

		-- Matrix keyboard
		keyb_row_o			: out   std_logic_vector( 7 downto 0)	:= (others => '1');
		keyb_col_i			: in    std_logic_vector( 4 downto 0);

		-- Bus
		bus_rst_n_io		: inout std_logic								:= 'Z';
		bus_clk35_o			: out   std_logic								:= '0';
		bus_addr_o			: out   std_logic_vector(15 downto 0)	:= (others => '0');
		bus_data_io			: inout std_logic_vector( 7 downto 0)	:= (others => 'Z');
		bus_int_n_i			: in    std_logic;
		bus_nmi_n_i			: in    std_logic;
		bus_ramcs_i			: in    std_logic;
		bus_romcs_i			: in    std_logic;
		bus_wait_n_i		: in    std_logic;
		bus_halt_n_o		: out   std_logic								:= '1';
		bus_iorq_n_o		: out   std_logic								:= '1';
		bus_m1_n_o			: out   std_logic								:= '1';
		bus_mreq_n_o		: out   std_logic								:= '1';
		bus_rd_n_o			: out   std_logic								:= '1';
		bus_wr_n_o			: out   std_logic								:= '1';
		bus_rfsh_n_o		: out   std_logic								:= '1';
		bus_busreq_n_i		: in    std_logic;
		bus_busack_n_o		: out   std_logic								:= '1';
		bus_iorqula_n_i	: in    std_logic;

		-- VGA
		rgb_r_o				: out   std_logic_vector( 2 downto 0)	:= (others => '0');
		rgb_g_o				: out   std_logic_vector( 2 downto 0)	:= (others => '0');
		rgb_b_o				: out   std_logic_vector( 2 downto 0)	:= (others => '0');
		hsync_o				: out   std_logic								:= '1';
		vsync_o				: out   std_logic								:= '1';
		csync_o				: out   std_logic								:= '1';

		-- HDMI
		hdmi_p_o				: out   std_logic_vector(3 downto 0);
		hdmi_n_o				: out   std_logic_vector(3 downto 0);
--		hdmi_cec_i			: in    std_logic;

		-- I2C (RTC and HDMI)
		i2c_scl_io			: inout std_logic								:= 'Z';
		i2c_sda_io			: inout std_logic								:= 'Z';

		-- ESP
		esp_gpio0_io		: inout std_logic								:= 'Z';
		esp_gpio2_io		: inout std_logic								:= 'Z';
		esp_rx_i				: in    std_logic;
		esp_tx_o				: out   std_logic								:= '0';

		-- ACCELERATOR BOARD
		accel_io_27		: out std_logic;
		accel_io_26		: out std_logic;
		accel_io_25		: out std_logic;
		accel_io_24		: out std_logic;
		accel_io_23		: out std_logic;
		accel_io_22		: out std_logic;
		accel_io_21		: out std_logic;
		accel_io_20		: out  std_logic;
		accel_io_19		: out  std_logic;
		accel_io_18		: out  std_logic;
		accel_io_17		: out  std_logic;
		accel_io_16		: out  std_logic;
		accel_io_15		: out  std_logic;
		accel_io_14		: out  std_logic;
		accel_io_13		: out  std_logic;
		accel_io_12		: out  std_logic;
		accel_io_11		: out  std_logic;
		accel_io_10		: out  std_logic;
		accel_io_9		: out  std_logic;
		accel_io_8		: out std_logic;
		accel_io_7		: out std_logic;
		accel_io_6		: out std_logic;
		accel_io_5		: out std_logic;
		accel_io_4		: out std_logic;
		accel_io_3		: out std_logic;
		accel_io_2		: out std_logic;
		accel_io_1		: out std_logic;
		accel_io_0		: out std_logic;
		
		-- Vacant pins
		extras_io			: inout std_logic_vector(2 downto 0)	:= (others => 'Z')
	);
end entity;

use work.cv_keys_pack.all;
use work.vdp18_col_pack.all;

architecture behavior of next_top is

	-- Resets
	signal pll_locked_s		: std_logic;
	signal reset_s				: std_logic;
	signal soft_reset_s		: std_logic;
	signal por_n_s				: std_logic;
	signal por_cnt_s			: unsigned(7 downto 0)				:= (others => '1');

	-- Clocks
	signal clock_master_s	: std_logic;
	signal clock_mem_s		: std_logic;
	signal clock_vga_s		: std_logic;
	signal clock_dvi_s		: std_logic;
	signal clock_vdp_en_s	: std_logic;
	signal clock_5m_en_s		: std_logic;
	signal clock_3m_en_s		: std_logic;
	signal clock_hdmi_s		: std_logic;

	-- RAM memory
	signal ram_addr_s			: std_logic_vector(16 downto 0);		-- 128K
	signal d_from_ram_s		: std_logic_vector(7 downto 0);
	signal d_to_ram_s			: std_logic_vector(7 downto 0);
	signal ram_ce_s			: std_logic;
	signal ram_oe_s			: std_logic;
	signal ram_we_s			: std_logic;

	-- VRAM memory
	signal vram_addr_s		: std_logic_vector(13 downto 0);		-- 16K
	signal vram_do_s			: std_logic_vector(7 downto 0);
	signal vram_di_s			: std_logic_vector(7 downto 0);
	signal vram_ce_s			: std_logic;
	signal vram_oe_s			: std_logic;
	signal vram_we_s			: std_logic;

	-- Audio
	signal audio_signed_s	: signed(7 downto 0);
	signal audio_s				: std_logic_vector(7 downto 0);
	signal audio_dac_s		: std_logic;

	-- Video
	signal rgb_col_s			: std_logic_vector( 3 downto 0);		-- 15KHz
	signal rgb_hsync_n_s		: std_logic;								-- 15KHz
	signal rgb_vsync_n_s		: std_logic;								-- 15KHz
	signal rgb_r_s				: std_logic_vector( 2 downto 0);
	signal rgb_g_s				: std_logic_vector( 2 downto 0);
	signal rgb_b_s				: std_logic_vector( 2 downto 0);
	signal cnt_hor_s			: std_logic_vector( 8 downto 0);
	signal cnt_ver_s			: std_logic_vector( 7 downto 0);
	signal vga_col_s			: std_logic_vector( 3 downto 0);
	signal vga_r_s				: std_logic_vector( 7 downto 0);
	signal vga_g_s				: std_logic_vector( 7 downto 0);
	signal vga_b_s				: std_logic_vector( 7 downto 0);
	signal vga_hsync_n_s		: std_logic;
	signal vga_vsync_n_s		: std_logic;
	signal vga_blank_s		: std_logic;
	signal sound_hdmi_s		: std_logic_vector(15 downto 0);
	signal tdms_s				: std_logic_vector( 7 downto 0);
	signal btn_scan_s			: std_logic;
	signal scanlines_en_s	: std_logic;
	signal odd_line_s			: std_logic;

	-- Keyboard
	signal ps2_keys_s			: std_logic_vector(15 downto 0);
	signal ps2_joy_s			: std_logic_vector(15 downto 0);

	-- Controller
	signal ctrl_p1_s			: std_logic_vector( 2 downto 1)	:= "00";
	signal ctrl_p2_s			: std_logic_vector( 2 downto 1)	:= "00";
	signal ctrl_p3_s			: std_logic_vector( 2 downto 1)	:= "00";
	signal ctrl_p4_s			: std_logic_vector( 2 downto 1)	:= "00";
	signal ctrl_p5_s			: std_logic_vector( 2 downto 1)	:= "00";
	signal ctrl_p6_s			: std_logic_vector( 2 downto 1)	:= "00";
	signal ctrl_p7_s			: std_logic_vector( 2 downto 1)	:= "00";
	signal ctrl_p8_s			: std_logic_vector( 2 downto 1)	:= "00";
	signal ctrl_p9_s			: std_logic_vector( 2 downto 1)	:= "00";
	
	signal but_up_s			: std_logic_vector( 2 downto 1);
	signal but_down_s			: std_logic_vector( 2 downto 1);
	signal but_left_s			: std_logic_vector( 2 downto 1);
	signal but_right_s		: std_logic_vector( 2 downto 1);
	signal but_f1_s			: std_logic_vector( 2 downto 1);
	signal but_f2_s			: std_logic_vector( 2 downto 1);
	
	-- Joystick
	signal joy1_s				: std_logic_vector(5 downto 0);
	signal joy2_s				: std_logic_vector(5 downto 0);

begin

	-- PLL
	pll_1: entity work.pll1
	port map (
		CLK_IN1	=> clock_50_i,				-- 50.000
		CLK_OUT1	=> clock_master_s,		-- 21.429 (21,47727 MHz)
		CLK_OUT2	=> clock_mem_s,			-- 42.857
		CLK_OUT3 => clock_vga_s,			--  25.20000 (25.000) MHz
		CLK_OUT4 => clock_hdmi_s			-- 126.0000 (125.000) MHz
	);

		-- Clocks
	clks: entity work.clocks
	port map (
		clock_i			=> clock_master_s,
		por_i				=> not por_n_s,
		clock_vdp_en_o	=> clock_vdp_en_s,
		clock_5m_en_o	=> clock_5m_en_s,
		clock_3m_en_o	=> clock_3m_en_s
	);

	vg: entity work.colecovision
	generic map (
		num_maq_g		=> 6,
		compat_rgb_g	=> 0
	)
	port map (
		clock_i				=> clock_master_s,
		clk_en_10m7_i		=> clock_vdp_en_s,
		clk_en_5m37_i		=> clock_5m_en_s,
		clk_en_3m58_i		=> clock_3m_en_s,
		reset_i				=> reset_s,
		por_n_i				=> por_n_s,
		-- Controller Interface
		ctrl_p1_i			=> ctrl_p1_s,
		ctrl_p2_i			=> ctrl_p2_s,
		ctrl_p3_i			=> ctrl_p3_s,
		ctrl_p4_i			=> ctrl_p4_s,
		ctrl_p5_o			=> ctrl_p5_s,
		ctrl_p6_i			=> ctrl_p6_s,
		ctrl_p7_i			=> ctrl_p7_s,
		ctrl_p8_o			=> ctrl_p8_s,
		ctrl_p9_i			=> ctrl_p9_s,
		-- CPU RAM Interface
		ram_addr_o			=> ram_addr_s,
		ram_ce_o				=> ram_ce_s,
		ram_we_o				=> ram_we_s,
		ram_oe_o				=> ram_oe_s,
		ram_data_i			=> d_from_ram_s,
		ram_data_o			=> d_to_ram_s,
		-- Video RAM Interface
		vram_addr_o			=> vram_addr_s,
		vram_ce_o			=> vram_ce_s,
		vram_oe_o			=> vram_oe_s,
		vram_we_o			=> vram_we_s,
		vram_data_i			=> vram_do_s,
		vram_data_o			=> vram_di_s,
		-- Cartridge ROM Interface
		cart_addr_o			=> open,
		cart_data_i			=> (others => '1'),
		cart_en_80_n_o		=> open,
		cart_en_a0_n_o		=> open,
		cart_en_c0_n_o		=> open,
		cart_en_e0_n_o		=> open,
		-- Audio Interface
		audio_o				=> open,
		audio_signed_o		=> audio_signed_s,
		-- RGB Video Interface
		col_o					=> rgb_col_s,
		cnt_hor_o			=> cnt_hor_s,
		cnt_ver_o			=> cnt_ver_s,
		rgb_r_o				=> open,
		rgb_g_o				=> open,
		rgb_b_o				=> open,
		hsync_n_o			=> rgb_hsync_n_s,
		vsync_n_o			=> rgb_vsync_n_s,
		comp_sync_n_o		=> open,
		-- SPI
		spi_miso_i			=> sd_miso_i,
		spi_mosi_o			=> sd_mosi_o,
		spi_sclk_o			=> sd_sclk_o,
		spi_cs_n_o			=> sd_cs0_n_o,
		sd_cd_n_i			=> '1',
		-- DEBUG
		D_cpu_addr			=> open
	);

	-- SRAM
	sram0: entity work.dpSRAM_4x512x16
	port map (
		clk_i				=> clock_mem_s,
		-- Port 0
		port0_addr_i	=> "0000" & ram_addr_s,
		port0_ce_i		=> ram_ce_s,
		port0_oe_i		=> ram_oe_s,
		port0_we_i		=> ram_we_s,
		port0_data_i	=> d_to_ram_s,
		port0_data_o	=> d_from_ram_s,
		-- Port 1
		port1_addr_i	=> "0011111" & vram_addr_s,
		port1_ce_i		=> vram_ce_s,
		port1_oe_i		=> vram_oe_s,
		port1_we_i		=> vram_we_s,
		port1_data_i	=> vram_di_s,
		port1_data_o	=> vram_do_s,
		-- SRAM in board
		sram_addr_o		=> ram_addr_o,
		sram_data_io	=> ram_data_io,
		sram_ce_n_o		=> ram_ce_n_o,
		sram_oe_n_o		=> ram_oe_n_o,
		sram_we_n_o		=> ram_we_n_o
	);
	
	-- Audio
	audioout: entity work.dac
	generic map (
		msbi_g		=> 7
	)
	port map (
		clk_i		=> clock_master_s,
		res_i		=> reset_s,
		dac_i		=> audio_s,
		dac_o		=> audio_dac_s
	);

	-- PS/2 keyboard interface
	ps2if_inst: entity work.colecoKeyboard
	port map (
		clk		=> clock_master_s,
		reset		=> reset_s,
		-- inputs from PS/2 port
		ps2_clk	=> ps2_clk_io,
		ps2_data	=> ps2_data_io,
		-- user outputs
		keys		=> ps2_keys_s,
		joy		=> ps2_joy_s
	);

	---------------------------------
	-- scanlines
	btnscl: entity work.debounce
	generic map (
		counter_size_g	=> 16
	)
	port map (
		clk_i				=> clock_master_s,
		button_i			=> btn_multiface_n_i,
		result_o			=> btn_scan_s
	);

	-- Glue Logic
	
	process(clock_master_s)
	begin
		if rising_edge(clock_master_s) then
			if por_cnt_s /= 0 then
				por_cnt_s <= por_cnt_s - 1;
			end if;
		end if;
	end process;
	
	por_n_s		<= '0' when por_cnt_s /= 0 or (btn_reset_n_i = '0')	else '1';
	reset_s		<= not por_n_s or not btn_divmmc_n_i or soft_reset_s;

	-- Controller
	but_up_s		<= joy2_s(3)		& joy1_s(3);
	but_down_s	<= joy2_s(2)		& joy1_s(2);
	but_left_s	<= joy2_s(1)		& joy1_s(1);
	but_right_s	<= joy2_s(0)		& joy1_s(0);
	but_f1_s		<= joy2_s(4)		& joy1_s(4);
	but_f2_s		<= joy2_s(5)		& joy1_s(5);

	-----------------------------------------------------------------------------
	-- Process pad_ctrl
	--
	-- Purpose:
	--   Maps the gamepad signals to the controller buses of the console.
	--
	pad_ctrl: process (
		ctrl_p5_s, ctrl_p8_s, ps2_keys_s, ps2_joy_s, but_up_s, but_down_s,
		but_left_s, but_right_s, but_f1_s, but_f2_s
	)
		variable key_v : natural range cv_keys_t'range;
	begin
		-- quadrature device not implemented
		ctrl_p7_s          <= "11";
		ctrl_p9_s          <= "11";

		--------------------------------------------------------------------
		-- soft reset to get to cart menu : use ps2 ESC key in keys(8)
		if ps2_keys_s(8) = '1' then
			soft_reset_s <= '1';
		else
			soft_reset_s <= '0';
		end if;
		------------------------------------------------------------------------

		for idx in 1 to 2 loop -- was 2
			if ctrl_p5_s(idx) = '0' and ctrl_p8_s(idx) = '1' then
				-- keys and right button enabled --------------------------------------
				-- keys not fully implemented

				key_v := cv_key_none_c;

				if ps2_keys_s(13) = '1' then
					-- KEY 1
					key_v := cv_key_1_c;
				elsif ps2_keys_s(7) = '1' then
					-- KEY 2
					key_v := cv_key_2_c;
				elsif ps2_keys_s(12) = '1' then
					-- KEY 3
					key_v := cv_key_3_c;
				elsif ps2_keys_s(2) = '1' then
					-- KEY 4
					key_v := cv_key_4_c;
				elsif ps2_keys_s(3) = '1' then
					-- KEY 5
					key_v := cv_key_5_c;	
				elsif ps2_keys_s(14) = '1' then
					-- KEY 6
					key_v := cv_key_6_c;
				elsif ps2_keys_s(5) = '1' then
					-- KEY 7
					key_v := cv_key_7_c;				
				elsif ps2_keys_s(1) = '1' then
					-- KEY 8
					key_v := cv_key_8_c;				
				elsif ps2_keys_s(11) = '1' then
					-- KEY 9
					key_v := cv_key_9_c;
				elsif ps2_keys_s(10) = '1' then
					-- KEY 0
					key_v := cv_key_0_c;
				elsif ps2_keys_s(6) = '1' then
					-- KEY *
					key_v := cv_key_asterisk_c;
				elsif ps2_keys_s(9) = '1' then
					-- KEY #
					key_v := cv_key_number_c;
				end if;

				ctrl_p1_s(idx) <= cv_keys_c(key_v)(1);
				ctrl_p2_s(idx) <= cv_keys_c(key_v)(2);
				ctrl_p3_s(idx) <= cv_keys_c(key_v)(3);
				ctrl_p4_s(idx) <= cv_keys_c(key_v)(4);
				ctrl_p6_s(idx) <= not ps2_keys_s(0) and but_f2_s(idx);	-- button right
		  
			elsif ctrl_p5_s(idx) = '1' and ctrl_p8_s(idx) = '0' then
				-- joystick and left button enabled -----------------------------------
				ctrl_p1_s(idx) <= not ps2_joy_s(0) and but_up_s(idx);		-- up
				ctrl_p2_s(idx) <= not ps2_joy_s(1) and but_down_s(idx);	-- down
				ctrl_p3_s(idx) <= not ps2_joy_s(2) and but_left_s(idx);	-- left
				ctrl_p4_s(idx) <= not ps2_joy_s(3) and but_right_s(idx);	-- right
				ctrl_p6_s(idx) <= not ps2_joy_s(4) and but_f1_s(idx);		-- button left

			else
				-- nothing active -----------------------------------------------------
				ctrl_p1_s(idx) <= '1';
				ctrl_p2_s(idx) <= '1';
				ctrl_p3_s(idx) <= '1';
				ctrl_p4_s(idx) <= '1';
				ctrl_p6_s(idx) <= '1';
				ctrl_p7_s(idx) <= '1';
			end if;
		end loop;
	end process pad_ctrl;	 

	-- Audio
	audio_s <= std_logic_vector(unsigned(audio_signed_s + 128));
	audioext_l_o	<= audio_dac_s;
	audioext_r_o	<= audio_dac_s;

	-----------------------------------------------------------------------------
	-- VGA Output
	-----------------------------------------------------------------------------

	process (pll_locked_s, btn_scan_s)
	begin
		if pll_locked_s = '0' then
			scanlines_en_s <= '0';
		elsif falling_edge(btn_scan_s) then
			scanlines_en_s <= not scanlines_en_s;
		end if;
	end process;

	-- VGA framebuffer
	vga: entity work.vga
	port map (
		I_CLK			=> clock_master_s,
		I_CLK_VGA	=> clock_vga_s,
		I_COLOR		=> rgb_col_s,
		I_HCNT		=> cnt_hor_s,
		I_VCNT		=> cnt_ver_s,
		O_HSYNC		=> vga_hsync_n_s,
		O_VSYNC		=> vga_vsync_n_s,
		O_COLOR		=> vga_col_s,
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

	-- Process vga_col
	--
	-- Purpose:
	--   Converts the color information (doubled to VGA scan) to RGB values.
	--
	-- 15 KHz
	process (clock_master_s)
		variable rgb_col_v	: natural range 0 to 15;
		variable rgb1_r_v,
					rgb1_g_v,
					rgb1_b_v		: rgb_val_t;
		variable rgb2_r_v,
					rgb2_g_v,
					rgb2_b_v		: std_logic_vector(7 downto 0);
	begin
		if rising_edge(clock_master_s) then
			rgb_col_v := to_integer(unsigned(rgb_col_s));
			rgb1_r_v	:= full_rgb_table_c(rgb_col_v)(r_c);
			rgb1_g_v	:= full_rgb_table_c(rgb_col_v)(g_c);
			rgb1_b_v	:= full_rgb_table_c(rgb_col_v)(b_c);
			rgb2_r_v	:= std_logic_vector(to_unsigned(rgb1_r_v, 8));
			rgb2_g_v	:= std_logic_vector(to_unsigned(rgb1_g_v, 8));
			rgb2_b_v	:= std_logic_vector(to_unsigned(rgb1_b_v, 8));
			rgb_r_s	<= rgb2_r_v(7 downto 5);
			rgb_g_s	<= rgb2_g_v(7 downto 5);
			rgb_b_s	<= rgb2_b_v(7 downto 5);
		end if;
	end process;

	-- VGA
	process (clock_vga_s)
		variable rgb_col_v	: natural range 0 to 15;
		variable rgb1_r_v,
					rgb1_g_v,
					rgb1_b_v		: rgb_val_t;
		variable rgb2_r_v,
					rgb2_g_v,
					rgb2_b_v		: std_logic_vector(7 downto 0);
	begin
		if rising_edge(clock_vga_s) then
			rgb_col_v := to_integer(unsigned(vga_col_s));
			rgb1_r_v	:= full_rgb_table_c(rgb_col_v)(r_c);
			rgb1_g_v	:= full_rgb_table_c(rgb_col_v)(g_c);
			rgb1_b_v	:= full_rgb_table_c(rgb_col_v)(b_c);
			rgb2_r_v	:= std_logic_vector(to_unsigned(rgb1_r_v, 8));
			rgb2_g_v	:= std_logic_vector(to_unsigned(rgb1_g_v, 8));
			rgb2_b_v	:= std_logic_vector(to_unsigned(rgb1_b_v, 8));
			vga_r_s	<= rgb2_r_v;
			vga_g_s	<= rgb2_g_v;
			vga_b_s	<= rgb2_b_v;
		end if;
	end process;


	

	nuh: if not hdmi_output_g generate
		rgb_r_o		<= vga_r_s(7 downto 5);
		rgb_g_o		<= vga_g_s(7 downto 5);
		rgb_b_o		<= vga_b_s(7 downto 5);
		hsync_o		<= vga_hsync_n_s;
		vsync_o		<= vga_vsync_n_s;
		
	--	rgb_r_o		<= rgb_r_s;
	--	rgb_g_o		<= rgb_g_s;
	--	rgb_b_o		<= rgb_b_s;
	--	hsync_o		<= rgb_hsync_n_s;
	--	vsync_o		<= rgb_vsync_n_s;	
		
		
	end generate;
	
	process(clock_master_s)
		variable state_v : unsigned(2 downto 0)	:= "000";
	begin
		if rising_edge(clock_master_s) then
			state_v := state_v + 1;
			case state_v is
				when "000" =>
					joy2_s <=  (joyp9_i & joyp6_i & joyp1_i & joyp2_i & joyp3_i & joyp4_i);
					joysel_o <= '0';
				when "100" =>
					joy1_s <=  (joyp9_i & joyp6_i & joyp1_i & joyp2_i & joyp3_i & joyp4_i);
					joysel_o <= '1';
				when others =>
					null;
			end case;
		end if;
	end process;
	
	
--------------------------------------------------------
-- Unused outputs
--------------------------------------------------------
 
	-- Rpi port
	accel_io_0     <= 'Z';
	accel_io_1     <= 'Z';
	accel_io_2     <= 'Z';
	accel_io_3     <= 'Z';
	accel_io_4     <= 'Z';
	accel_io_5     <= 'Z';
	accel_io_6     <= 'Z';
	accel_io_7     <= 'Z';
	accel_io_8     <= 'Z';
	accel_io_9     <= 'Z';
	accel_io_10    <= 'Z';
	accel_io_11    <= 'Z';
	accel_io_12    <= 'Z';
	accel_io_13    <= 'Z';
	accel_io_14    <= 'Z';
	accel_io_15    <= 'Z';
	accel_io_16    <= 'Z';
	accel_io_17    <= 'Z';
	accel_io_18    <= 'Z';
	accel_io_19    <= 'Z';
	accel_io_20    <= 'Z';
	accel_io_21    <= 'Z';
	accel_io_22    <= 'Z';
	accel_io_23    <= 'Z';
	accel_io_24    <= 'Z';
	accel_io_25    <= 'Z';
	accel_io_26    <= 'Z';
	accel_io_27    <= 'Z';

	
    -- Interal audio (speaker, not fitted)
    audioint_o     <= '0';

    -- Spectrum Next Bus
    bus_addr_o     <= x"0000";
    bus_busack_n_o <= '1';
    bus_clk35_o    <= '1';
    bus_data_io    <= "ZZZZZZZZ";
    bus_halt_n_o   <= '1';
    bus_iorq_n_o   <= '1';
    bus_m1_n_o     <= '1';
    bus_mreq_n_o   <= '1';
    bus_rd_n_o     <= '1';
    bus_rfsh_n_o   <= '1';
    bus_rst_n_io   <= 'Z';
    bus_wr_n_o     <= '1';

    -- TODO: add support for sRGB output
    csync_o        <= '1';

    -- ESP 8266 module
    esp_gpio0_io   <= 'Z';
    esp_gpio2_io   <= 'Z';

    -- Addtional flash pins; used at IO2 and IO3 in Quad SPI Mode
    flash_hold_o   <= 'Z';
    flash_wp_o     <= 'Z';

    -- TODO: add support for HDMI output
    OBUFDS_c0  : OBUFDS port map ( O  => hdmi_p_o(0), OB => hdmi_n_o(0), I => '1');
    OBUFDS_c1  : OBUFDS port map ( O  => hdmi_p_o(1), OB => hdmi_n_o(1), I => '1');
    OBUFDS_c2  : OBUFDS port map ( O  => hdmi_p_o(2), OB => hdmi_n_o(2), I => '1');
    OBUFDS_clk : OBUFDS port map ( O  => hdmi_p_o(3), OB => hdmi_n_o(3), I => '1');

    i2c_scl_io <= 'Z';
    i2c_sda_io <= 'Z';

    -- Keyboard row
    keyb_row_o <= x"FF";

    -- Mic Port (output, as it connects to the mic input on cassette deck)
    mic_port_o <= '0';

    -- CS1 is for internal SD socket
    sd_cs1_n_o <= '1';

end architecture;