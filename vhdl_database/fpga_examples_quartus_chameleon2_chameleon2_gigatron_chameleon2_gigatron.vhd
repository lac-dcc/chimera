-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2021 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/chameleon.html
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------
--
-- Part of the Gigatron emulator.
-- Toplevel for Chameleon V2 hardware.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

architecture rtl of chameleon2 is
-- System settings
	constant clk_ticks_per_usec : integer := 100;
	constant resetCycles : integer := 255;

-- Clocks
	signal sysclk : std_logic;
	signal clk_150 : std_logic;

-- Clocks enables
	signal ena_1mhz : std_logic;
	signal ena_1khz : std_logic;

-- System control signals
	signal reset : std_logic;
	signal reset_trig : std_logic;
	signal reboot_trig : std_logic;

-- SPI controller
	signal spi_req : std_logic;
	signal spi_ack : std_logic;
	signal spi_d : unsigned(7 downto 0);
	signal spi_q : unsigned(7 downto 0);

-- PHI 2
	signal phi : std_logic;
	signal phi_mode : std_logic;
	signal phi_cnt : unsigned(7 downto 0);
	signal end_of_phi_0 : std_logic;
	signal end_of_phi_1 : std_logic;
	signal phi_post_1 : std_logic;
	signal phi_post_2 : std_logic;
	signal phi_post_3 : std_logic;
	signal phi_post_4 : std_logic;

-- LEDs
	signal led_green : std_logic;
	signal led_red : std_logic;

-- PS/2 Keyboard
	signal ps2_keyboard_clk_in : std_logic;
	signal ps2_keyboard_dat_in : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

-- PS/2 Mouse
	signal ps2_mouse_clk_in: std_logic;
	signal ps2_mouse_dat_in: std_logic;
	signal ps2_mouse_clk_out: std_logic;
	signal ps2_mouse_dat_out: std_logic;

-- USB debugging
	signal usb_remote_reset : std_logic;
	signal reconfig_request : std_logic;
	signal reconfig_slot : unsigned(3 downto 0);
	signal flashslot : unsigned(4 downto 0);
	signal usb_req : std_logic;
	signal usb_ack : std_logic;
	signal usb_we : std_logic;
	signal usb_a : unsigned(31 downto 0);
	signal usb_d : unsigned(7 downto 0);
	signal usb_q : unsigned(7 downto 0);

-- IEC bus
	signal iec_clk_in : std_logic := '1';
	signal iec_dat_in : std_logic := '1';
	signal iec_atn_in : std_logic := '1';
	signal iec_srq_in : std_logic := '1';

-- Docking station
	signal docking_joystick1 : unsigned(6 downto 0);
	signal docking_joystick2 : unsigned(6 downto 0);
	signal docking_joystick3 : unsigned(6 downto 0);
	signal docking_joystick4 : unsigned(6 downto 0);
	signal docking_keys : unsigned(63 downto 0);
	signal docking_restore_n : std_logic;

-- Audio output (sigma delta)
	signal audio : std_logic;

-- Video pipeline
	signal end_of_line : std_logic;
	signal end_of_frame : std_logic;
	type vid_stage_t is record
			ena_pixel : std_logic;
			hsync : std_logic;
			vsync : std_logic;
			x : unsigned(11 downto 0);
			y : unsigned(11 downto 0);
			r : unsigned(4 downto 0);
			g : unsigned(4 downto 0);
			b : unsigned(4 downto 0);
		end record;
	signal vga_master : vid_stage_t;

begin
-- -----------------------------------------------------------------------
-- Unused pins
-- -----------------------------------------------------------------------
	clock_ior <= '1';
	clock_iow <= '1';
	iec_clk_out <= '0';
	iec_atn_out <= '0';
	iec_dat_out <= '0';
	iec_srq_out <= '0';
	irq_out <= '0';
	nmi_out <= '0';
	sigma_l <= audio;
	sigma_r <= audio;
	rtc_cs <= '0';
	mmc_cs <= '1';

-- -----------------------------------------------------------------------
-- PLL
-- -----------------------------------------------------------------------
	pll_blk : block
		signal ram_clk_loc : std_logic;
	begin
		pll_inst : entity work.pll50
			port map (
				inclk0 => clk50m,
				c0 => sysclk,
				c1 => ram_clk,
				c2 => open,
				c3 => open,
				locked => open
			);
	end block;

-- -----------------------------------------------------------------------
-- 1 Mhz and 1 Khz clocks
-- -----------------------------------------------------------------------
	my1Mhz : entity work.chameleon_1mhz
		generic map (
			clk_ticks_per_usec => 100
		)
		port map (
			clk => sysclk,
			ena_1mhz => ena_1mhz,
			ena_1mhz_2 => open
		);

	my1Khz : entity work.chameleon_1khz
		port map (
			clk => sysclk,
			ena_1mhz => ena_1mhz,
			ena_1khz => ena_1khz
		);

-- -----------------------------------------------------------------------
-- Reset
-- -----------------------------------------------------------------------
	reset_blk : block
		signal reset_request : std_logic;
	begin
		reset_inst : entity work.gen_reset
			generic map (
				resetCycles => resetCycles
			)
			port map (
				clk => sysclk,
				enable => ena_1khz,

				button => reset_request,
				reset => reset
			);

		reset_request <= reset_trig or usb_remote_reset;
	end block;

-- -----------------------------------------------------------------------
-- Gigatron entity
-- -----------------------------------------------------------------------
	gigatron_top_blk : block
		signal hsync : std_logic;
		signal vsync : std_logic;
	begin
		gigatron_top_inst : entity work.gigatron_top
			generic map (
				clk_ticks_per_usec => clk_ticks_per_usec
			)
			port map (
				clk => sysclk,
				reset => reset,

				flashslot => flashslot,

			-- SPI interface
				spi_cs_n => flash_cs,
				spi_req => spi_req,
				spi_ack => spi_ack,
				spi_d => spi_d,
				spi_q => spi_q,

			-- SDRAM interface
				ram_data => ram_d,
				ram_addr => ram_a,
				ram_ba => ram_ba,
				ram_we => ram_we,
				ram_ras => ram_ras,
				ram_cas => ram_cas,
				ram_ldqm => ram_ldqm,
				ram_udqm => ram_udqm,

			-- Keyboard and joystick
				ps2_keyboard_clk_in => ps2_keyboard_clk_in,
				ps2_keyboard_dat_in => ps2_keyboard_dat_in,
				ps2_keyboard_clk_out => ps2_keyboard_clk_out,
				ps2_keyboard_dat_out => ps2_keyboard_dat_out,

				joystick => docking_joystick1,

			-- LEDs
				led_green => led_green,
				led_red => led_red,

			-- Audio
				audio => audio,

			-- Video
				red => red,
				grn => grn,
				blu => blu,
				hsync => hsync,
				vsync => vsync
			);
		hsync_n <= not hsync;
		vsync_n <= not vsync;
	end block;

-- -----------------------------------------------------------------------
-- PS2IEC multiplexer
-- -----------------------------------------------------------------------
	io_ps2iec_inst : entity work.chameleon2_io_ps2iec
		port map (
			clk => sysclk,

			ps2iec_sel => ps2iec_sel,
			ps2iec => ps2iec,

			ps2_mouse_clk => ps2_mouse_clk_in,
			ps2_mouse_dat => ps2_mouse_dat_in,
			ps2_keyboard_clk => ps2_keyboard_clk_in,
			ps2_keyboard_dat => ps2_keyboard_dat_in,

			iec_clk => iec_clk_in,
			iec_srq => iec_srq_in,
			iec_atn => iec_atn_in,
			iec_dat => iec_dat_in
		);

-- -----------------------------------------------------------------------
-- Button debounce
-- -----------------------------------------------------------------------
	chameleon_buttons_inst : entity work.chameleon_buttons
		port map (
			clk => sysclk,
			ena_1khz => ena_1khz,
			menu_mode => '0',

			button_l => (not usart_cts),
			button_m => (not freeze_btn),
			button_r => (not reset_btn),
			button_config => X"0",

			reset => reset_trig,
			boot => reboot_trig,
			freeze => open,
			menu => open
		);

-- -----------------------------------------------------------------------
-- LED, PS2 and reset shiftregister
-- -----------------------------------------------------------------------
	io_shiftreg_inst : entity work.chameleon2_io_shiftreg
		port map (
			clk => sysclk,

			ser_out_clk => ser_out_clk,
			ser_out_dat => ser_out_dat,
			ser_out_rclk => ser_out_rclk,

			reset_c64 => reset,
			reset_iec => reset,
			ps2_mouse_clk => ps2_mouse_clk_out,
			ps2_mouse_dat => ps2_mouse_dat_out,
			ps2_keyboard_clk => ps2_keyboard_clk_out,
			ps2_keyboard_dat => ps2_keyboard_dat_out,
			led_green => led_green,
			led_red => led_red
		);

-- -----------------------------------------------------------------------
-- SPI controller
-- -----------------------------------------------------------------------
	chameleon2_spi_inst : entity work.chameleon2_spi
		generic map (
			clk_ticks_per_usec => clk_ticks_per_usec
		)
		port map (
			clk => sysclk,
			sclk => spi_clk,
			miso => spi_miso,
			mosi => spi_mosi,

			req => spi_req,
			ack => spi_ack,
			speed => '1', -- select fast speed for flash access
			d => spi_d,
			q => spi_q
		);

-- -----------------------------------------------------------------------
-- USB communication
-- -----------------------------------------------------------------------
	usb_inst : entity work.chameleon_usb
		generic map (
			remote_reset_enabled => true
		)
		port map (
			clk => sysclk,

			req => usb_req,
			ack => usb_ack,
			we => usb_we,
			a => usb_a,
			d => usb_d,
			q => usb_q,

			reconfig => reboot_trig,
			reconfig_slot => X"0",
			flashslot => flashslot,

			serial_clk => usart_clk,
			serial_rxd => usart_tx,
			serial_txd => usart_rx,
			serial_cts_n => usart_rts,

			remote_reset => usb_remote_reset
		);

	usb_ack <= usb_req;

-- -----------------------------------------------------------------------
-- Chameleon I/O
-- -----------------------------------------------------------------------
	chameleon2_io_inst : entity work.chameleon2_io
		generic map (
			enable_docking_station => true,
			enable_cdtv_remote => true,
			enable_c64_joykeyb => true,
			enable_c64_4player => false
		)
		port map (
			-- Clocks
			clk => sysclk,
			ena_1mhz => ena_1mhz,
			phi2_n => phi2_n,
			dotclock_n => dotclk_n,

			-- Control
			reset => reset,

			-- Toplevel signals
			ir_data => ir_data,
			ioef => ioef,
			romlh => romlh,
			dma_out => dma_out,
			game_out => game_out,
			exrom_out => exrom_out,
			ba_in => ba_in,
			rw_out => rw_out,
			sa_dir => sa_dir,
			sa_oe => sa_oe,
			sa15_out => sa15_out,
			low_a => low_a,
			sd_dir => sd_dir,
			sd_oe => sd_oe,
			low_d => low_d,

			-- C64 timing
			phi_mode => phi_mode,
			phi_out => phi,
			phi_cnt => phi_cnt,
			phi_end_0 => end_of_phi_0,
			phi_end_1 => end_of_phi_1,
			phi_post_1 => phi_post_1,
			phi_post_2 => phi_post_2,
			phi_post_3 => phi_post_3,
			phi_post_4 => phi_post_4,

			-- Joysticks
			joystick1 => docking_joystick1,
			joystick2 => docking_joystick2,
			joystick3 => docking_joystick3,
			joystick4 => docking_joystick4,

			-- Keyboards
			keys => docking_keys,
			restore_key_n => docking_restore_n
--			amiga_reset_n => docking_amiga_reset_n,
--			amiga_trigger => docking_amiga_trigger,
--			amiga_scancode => docking_amiga_scancode,
		);
end architecture;
