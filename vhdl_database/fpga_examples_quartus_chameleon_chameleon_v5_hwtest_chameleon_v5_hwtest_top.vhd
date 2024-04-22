-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2019 by Peter Wendrich (pwsoft@syntiac.com)
-- All Rights Reserved.
--
-- http://www.syntiac.com/chameleon.html
--
-- -----------------------------------------------------------------------
--
-- Turbo Chameleon 64 hardware test for version 5 hardware.
--
-- -----------------------------------------------------------------------
--
-- Hardware test can be executed when plug'ed into a C64, standalone or with docking-station.
-- In C64 mode the machine will startup normally as the Chameleon will be invisible to the machine.
-- The address-bus of the Chameleon is completely tri-stated in the hardware test.
-- The hardware test can also be used to test the docking-station. Additional icons become
-- visible when the docking station is connected.
--
--
-- Connect PS/2 keyboard
-- Connect PS/2 3 button/wheel mouse
-- Connect custom IEC test cable
--    Connections are made between IEC bus and VGA monitor detection lines as follows:
--       IEC CLK -> SDA (VGA)
--       IEC DAT -> SLC (VGA)
--       IEC ATN -> ID0 (VGA)
--       IEC SRQ -> ID2 (VGA)
--
-- For docking station testing additional hardware required:
--   C64 keyboard
--   Amiga 500 keyboard
--   Joystick with 9 pin connector or amiga mouse
--
-- -----------------------------------------------------------------------
-- Screen layout
--
-- Top left corner:
--   top row 3x blue represent buttons on the Chameleon
--   middle row 3x yellow represent the state of the PS/2 mouse buttons
--   bottom row left (green): solid if C64 detected, otherwise open
--   bottom row middle (green): solid if docking-station detected, otherwise open
--   bottom row right (red): flashes when a IR signal is detected.
-- Rest of top:
--   Color bars (32 steps for each primary color) and then combined to form gray-scale/white.
-- Running bar in middle:
--   Checking SDRAM memory (memory ok if green), turns red on error.
-- Left bottom:
--   IEC test patterns
-- Middle/Right bottom (only visible with docking-station):
--   Top is last scancode received from Amiga keyboard plus a single block representing reset next to it.
--   Next row is joysticks (from left to right port 4,3,2,1)
--   Below that is 8 by 8 matrix of C64 keyboard on the side is the restore-key state.
--
-- -----------------------------------------------------------------------
-- Chameleon hardware test
--
-- * Press 3 push buttons in sequence and check the blue rectangles in left upper corner
-- * Check LEDs flashing alternating off, red, green and both
-- * Check Num lock and Caps lock flashing on keyboard in sync with LEDs on Chameleon
-- * Check color bars in right upper corner
--   - Should be smooth (32 steps) colors in red, green, blue and gray/white.
-- * Move mouse and check yellow cursor follows movement
-- * Press middle mouse button on mouse, feedback on yellow rectangles
-- * Press left (mouse) button to play test sound on left channel
-- * Press right (mouse) button to play test sound on right channel
-- * Check result of SDRAM memory test (horizontal bar in the center of the screen)
--   * Wait until green/white progress bar has done one complete sequence.
--     If bar stops and turns red the memory test failed. Check the SDRAM!
-- * Check IEC test pattern (needs custom test cable connected)
--   Pattern in left lower corner should look like this:
--      # # # #
--      O # # #
--      # O # #
--      # # O #
--      # # # O
--      O O O O
--   See only open boxes in column? Possibly short to gnd.
--   See only closed boxes in column? Possibly a broken wire / bad solder.
--   See two open boxes in row 1-4? Possibly a short in breakout cable between IEC pins.
--
--   See this pattern? Most likely only VGA cable connected. Check custom IEC test cable is used.
--      O O # #
--      O O # #
--      O O # #
--      O O # #
--      O O # #
--      O O # #
--
-- All tests done
--
-- -----------------------------------------------------------------------
-- Docking-station hardware/software test
--
-- Connect Amiga keyboard
-- * Check LEDs flashing alternating off, drive, power and both
-- * Press 1/! key scancode should be             0000000#
-- * Release key scancode should be               #000000#
-- * Press and release F10 key scancode should be ##0##00#
-- * Press CTRL+AMIGA+AMIGA and the single block next to the scancode should open.
--
-- Connect C64 keyboard
-- * No key pressed the 8 by 8 matrix should be all '#'
-- * Press single keys and observe only one hole in 8 by 8 matrix.
-- * Press restore key. The block on the right side 8 by 8 matrix should open.
--
-- Connect joystick to each joystick port.
-- The joysticks are represented by 4 groups of 7 blocks on the lower/right side
-- of the screen. From top to bottom the groups of blocks belong to port 1, 2, 3 then 4.
-- * Press Up. The most right block in a group should open.
-- * Press Down. The block second from the right in a group should open.
-- * Press Left. The block third from the right in a group should open.
-- * Press Right. The block third from the left in a group should open.
-- * Press fire. The block second from the left in a group should open.
-- * Press second fire (or right Amiga mouse button). The most left block in a group should open.
--
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity chameleon_v5_hwtest_top is
	generic (
		resetCycles: integer := 131071
	);
	port (
-- Clocks
		clk8 : in std_logic;
		phi2_n : in std_logic;
		dotclock_n : in std_logic;

-- Bus
		romlh_n : in std_logic;
		ioef_n : in std_logic;

-- Buttons
		freeze_n : in std_logic;

-- MMC/SPI
		spi_miso : in std_logic;
		mmc_cd_n : in std_logic;
		mmc_wp : in std_logic;

-- MUX CPLD
		mux_clk : out std_logic;
		mux : out unsigned(3 downto 0);
		mux_d : out unsigned(3 downto 0);
		mux_q : in unsigned(3 downto 0);

-- USART
		usart_tx : in std_logic;
		usart_clk : in std_logic;
		usart_rts : in std_logic;
		usart_cts : in std_logic;

-- SDRam
		sd_clk : out std_logic;
		sd_data : inout unsigned(15 downto 0);
		sd_addr : out unsigned(12 downto 0);
		sd_we_n : out std_logic;
		sd_ras_n : out std_logic;
		sd_cas_n : out std_logic;
		sd_ba_0 : out std_logic;
		sd_ba_1 : out std_logic;
		sd_ldqm : out std_logic;
		sd_udqm : out std_logic;

-- Video
		red : out unsigned(4 downto 0);
		grn : out unsigned(4 downto 0);
		blu : out unsigned(4 downto 0);
		nHSync : out std_logic;
		nVSync : out std_logic;

-- Audio
		sigmaL : out std_logic;
		sigmaR : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_v5_hwtest_top is
	constant version_str : string := "20190514";

	type state_t is (TEST_IDLE, TEST_FILL, TEST_FILL_W, TEST_CHECK, TEST_CHECK_W, TEST_ERROR);

-- System clocks
	signal sysclk : std_logic;
	signal clk_150 : std_logic;
	signal sd_clk_loc : std_logic;
	signal clk_locked : std_logic;
	signal ena_1mhz : std_logic;
	signal ena_1khz : std_logic;
	signal ena_1sec : std_logic;
	signal no_clock : std_logic;

	signal reset_button_n : std_logic;

-- Global signals
	signal reset : std_logic;
	signal end_of_pixel : std_logic;
	signal end_of_frame : std_logic;

-- RAM Test
	signal state : state_t := TEST_IDLE;
	signal noise_bits : unsigned(7 downto 0);

-- MUX
	signal mux_clk_reg : std_logic := '0';
	signal mux_reg : unsigned(3 downto 0) := (others => '1');
	signal mux_d_reg : unsigned(3 downto 0) := (others => '1');

-- LEDs
	signal led_green : std_logic;
	signal led_red : std_logic;

-- IR
	signal ir : std_logic := '1';

-- PS/2 Keyboard
	signal ps2_keyboard_clk_in : std_logic;
	signal ps2_keyboard_dat_in : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

	signal keyboard_trigger : std_logic;
	signal keyboard_scancode : unsigned(7 downto 0);

-- PS/2 Mouse
	signal ps2_mouse_clk_in: std_logic;
	signal ps2_mouse_dat_in: std_logic;
	signal ps2_mouse_clk_out: std_logic;
	signal ps2_mouse_dat_out: std_logic;

	signal mouse_present : std_logic;
	signal mouse_active : std_logic;
	signal mouse_trigger : std_logic;
	signal mouse_left_button : std_logic;
	signal mouse_middle_button : std_logic;
	signal mouse_right_button : std_logic;
	signal mouse_delta_x : signed(8 downto 0);
	signal mouse_delta_y : signed(8 downto 0);

	signal cursor_x : signed(11 downto 0) := to_signed(0, 12);
	signal cursor_y : signed(11 downto 0) := to_signed(0, 12);

	signal sdram_req : std_logic := '0';
	signal sdram_ack : std_logic;
	signal sdram_we : std_logic := '0';
	signal sdram_a : unsigned(24 downto 0) := (others => '0');
	signal sdram_d : unsigned(7 downto 0);
	signal sdram_q : unsigned(7 downto 0);

-- VGA
	signal currentX : unsigned(11 downto 0);
	signal currentY : unsigned(11 downto 0);
	signal hsync : std_logic;
	signal vsync : std_logic;

	signal iec_cnt : unsigned(2 downto 0);
	signal iec_reg : unsigned(3 downto 0);
	signal iec_result : unsigned(23 downto 0);
	signal vga_id : unsigned(3 downto 0);

	signal video_amiga : std_logic := '0';

-- Sound
	signal sigma_l_reg : std_logic := '0';
	signal sigma_r_reg : std_logic := '0';

-- Docking station
	signal docking_station : std_logic;
	signal docking_version : std_logic;
	signal docking_keys : unsigned(63 downto 0);
	signal docking_restore_n : std_logic;
	signal docking_irq : std_logic;
	signal irq_n : std_logic;

	signal joystick1 : unsigned(6 downto 0);
	signal joystick2 : unsigned(6 downto 0);
	signal joystick3 : unsigned(6 downto 0);
	signal joystick4 : unsigned(6 downto 0);
	signal docking_amiga_reset_n : std_logic;
	signal docking_amiga_scancode : unsigned(7 downto 0);

-- MIDI
	signal midi_txd : std_logic;
	signal midi_rxd : std_logic;
	signal midi_data : unsigned(63 downto 0);

	procedure drawunsigned(signal video : inout std_logic; x : signed; y : signed; xpos : integer; ypos : integer; t : unsigned) is
		variable index : integer;
		variable nibble : unsigned(3 downto 0);
		variable pixels : unsigned(0 to 63);
	begin
		if (x >= xpos) and ((x - xpos) < 2*t'length)
		and (y >= ypos) and ((y - ypos) < 8) then
			pixels := (others => '0');
			index := (t'length/4-1) - to_integer(x-xpos) / 8;
			nibble := t(index*4+3 downto index*4);
			case nibble is
			when X"0" => pixels := X"1C22222A22221C00";
			when X"1" => pixels := X"0818080808081C00";
			when X"2" => pixels := X"1C22020408103E00";
			when X"3" => pixels := X"1C22020C02221C00";
			when X"4" => pixels := X"0C14243E04040E00";
			when X"5" => pixels := X"3E20203C02221C00";
			when X"6" => pixels := X"1C20203C22221C00";
			when X"7" => pixels := X"3E02040810101000";
			when X"8" => pixels := X"1C22221C22221C00";
			when X"9" => pixels := X"1C22221E02021C00";
			when X"A" => pixels := X"1C22223E22222200";
			when X"B" => pixels := X"3C22223C22223C00";
			when X"C" => pixels := X"1C22202020221C00";
			when X"D" => pixels := X"3C22222222223C00";
			when X"E" => pixels := X"3E20203C20203E00";
			when X"F" => pixels := X"3E20203C20202000";
			when others =>
				null;
			end case;
			video <= pixels(to_integer(y - ypos) * 8 + (to_integer(x - xpos) mod 8));
		end if;
	end procedure;

	procedure drawtext(signal video : inout std_logic; x : signed; y : signed; xpos : integer; ypos : integer; t : string) is
		variable ch : character;
		variable pixels : unsigned(0 to 63);
	begin
		if (x >= xpos) and ((x - xpos) < 8*t'length)
		and (y >= ypos) and ((y - ypos) < 8) then
			pixels := (others => '0');
			ch := t(1 + (to_integer(x-xpos) / 8));
			case ch is
			when ''' => pixels := X"0808000000000000";
			when '.' => pixels := X"00000000000C0C00";
--			when '/' => pixels := X"0002040810204000";
			when '0' => pixels := X"1C22222A22221C00";
			when '1' => pixels := X"0818080808081C00";
			when '2' => pixels := X"1C22020408103E00";
			when '3' => pixels := X"1C22020C02221C00";
			when '4' => pixels := X"0C14243E04040E00";
			when '5' => pixels := X"3E20203C02221C00";
			when '6' => pixels := X"1C20203C22221C00";
			when '7' => pixels := X"3E02040810101000";
			when '8' => pixels := X"1C22221C22221C00";
			when '9' => pixels := X"1C22221E02021C00";
			when ':' => pixels := X"000C0C000C0C0000";
			when 'A' => pixels := X"1C22223E22222200";
			when 'B' => pixels := X"3C22223C22223C00";
			when 'C' => pixels := X"1C22202020221C00";
			when 'D' => pixels := X"3C22222222223C00";
			when 'E' => pixels := X"3E20203C20203E00";
			when 'F' => pixels := X"3E20203C20202000";
			when 'G' => pixels := X"1C22202E22221C00";
			when 'H' => pixels := X"2222223E22222200";
			when 'I' => pixels := X"1C08080808081C00";
			when 'K' => pixels := X"2222243824222200";
			when 'L' => pixels := X"1010101010101E00";
			when 'M' => pixels := X"4163554941414100";
			when 'N' => pixels := X"22322A2A26222200";
			when 'O' => pixels := X"1C22222222221C00";
			when 'P' => pixels := X"1C12121C10101000";
			when 'R' => pixels := X"3C22223C28242200";
			when 'S' => pixels := X"1C22201C02221C00";
			when 'T' => pixels := X"3E08080808080800";
			when 'U' => pixels := X"2222222222221C00";
			when 'V' => pixels := X"2222221414080800";
			when 'W' => pixels := X"4141412A2A141400";
			when 'Y' => pixels := X"2222140808080800";
			when others =>
				null;
			end case;
			video <= pixels(to_integer(y - ypos) * 8 + (to_integer(x - xpos) mod 8));
		end if;
	end procedure;

	procedure box(signal video : inout std_logic; x : signed; y : signed; xpos : integer; ypos : integer; value : std_logic) is
	begin
		if (abs(x - xpos) < 5) and (abs(y - ypos) < 5) and (value = '1') then
			video <= '1';
		elsif (abs(x - xpos) = 5) and (abs(y - ypos) < 5) then
			video <= '1';
		elsif (abs(x - xpos) < 5) and (abs(y - ypos) = 5) then
			video <= '1';
		end if;
	end procedure;
begin
	nHSync <= not hsync;
	nVSync <= not vsync;

-- -----------------------------------------------------------------------
-- Clocks and PLL
-- -----------------------------------------------------------------------
	pllInstance : entity work.pll8
		port map (
			inclk0 => clk8,
			c0 => sysclk,
			c1 => open,
			c2 => clk_150,
			c3 => sd_clk_loc,
			locked => clk_locked
		);
	sd_clk <= sd_clk_loc;

-- -----------------------------------------------------------------------
-- Reset
-- -----------------------------------------------------------------------
	myReset : entity work.gen_reset
		generic map (
			resetCycles => resetCycles
		)
		port map (
			clk => sysclk,
			enable => '1',

			button => '0',
			reset => reset
		);

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

	ena1sec_inst : entity work.chameleon_1khz
		port map (
			clk => sysclk,
			ena_1mhz => ena_1khz,
			ena_1khz => ena_1sec
		);

-- -----------------------------------------------------------------------
-- SDRAM Controller
-- -----------------------------------------------------------------------
	sdramInstance : entity work.chameleon_sdram
		generic map (
			casLatency => 3,
			colAddrBits => 9,
			rowAddrBits => 13,
			enable_cpu6510_port => true
		)
		port map (
			clk => clk_150,

			reserve => '0',

			sd_data => sd_data,
			sd_addr => sd_addr,
			sd_we_n => sd_we_n,
			sd_ras_n => sd_ras_n,
			sd_cas_n => sd_cas_n,
			sd_ba_0 => sd_ba_0,
			sd_ba_1 => sd_ba_1,
			sd_ldqm => sd_ldqm,
			sd_udqm => sd_udqm,

			cpu6510_req => sdram_req,
			cpu6510_ack => sdram_ack,
			cpu6510_we => sdram_we,
			cpu6510_a => sdram_a,
			cpu6510_d => sdram_d,
			cpu6510_q => sdram_q,

			debugIdle => open,
			debugRefresh => open
		);

-- -----------------------------------------------------------------------
-- Memory test
-- -----------------------------------------------------------------------
	myNoise : entity work.fractal_noise
		generic map (
			dBits => 25,
			qBits => 8
		)
		port map (
			d => sdram_a,
			q => noise_bits
		);

	process(sysclk)
	begin
		if rising_edge(sysclk) then
			case state is
			when TEST_IDLE =>
				sdram_a <= (others => '0');
				sdram_we <= '0';
				state <= TEST_FILL;
			when TEST_FILL =>
				sdram_req <= not sdram_req;
				sdram_we <= '1';
				sdram_d <= noise_bits;
				state <= TEST_FILL_W;
			when TEST_FILL_W =>
				if sdram_req = sdram_ack then
					sdram_a <= sdram_a + 1;
					if sdram_a =  "1111111111111111111111111" then
						state <= TEST_CHECK;
					else
						state <= TEST_FILL;
					end if;
				end if;
			when TEST_CHECK =>
				sdram_req <= not sdram_req;
				sdram_we <= '0';
				state <= TEST_CHECK_W;
			when TEST_CHECK_W =>
				if sdram_req = sdram_ack then
					sdram_a <= sdram_a + 1;
					if sdram_q /= noise_bits then
						state <= TEST_ERROR;
					else
						state <= TEST_CHECK;
					end if;
				end if;
			when TEST_ERROR =>
				null;
			end case;
			if reset = '1' then
				state <= TEST_IDLE;
			end if;
		end if;
	end process;


-- -----------------------------------------------------------------------
-- Sound test
-- -----------------------------------------------------------------------
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			if ena_1khz = '1' then
				if (mouse_left_button = '1') or (usart_cts = '0') then
					sigma_l_reg <= not sigma_l_reg;
				end if;
				if (mouse_right_button = '1') or (reset_button_n = '0') then
					sigma_r_reg <= not sigma_r_reg;
				end if;
			end if;
		end if;
	end process;
	sigmaL <= sigma_l_reg;
	sigmaR <= sigma_r_reg;


-- -----------------------------------------------------------------------
-- IEC test
-- -----------------------------------------------------------------------
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			if ena_1khz = '1' then
				case to_integer(iec_cnt) is
				when 0 =>
					iec_result(23) <= vga_id(0);
					iec_result(22) <= vga_id(2);
					iec_result(21) <= vga_id(1);
					iec_result(20) <= vga_id(3);
					iec_reg <= "1111";
				when 1 =>
					iec_result(3) <= vga_id(0);
					iec_result(2) <= vga_id(2);
					iec_result(1) <= vga_id(1);
					iec_result(0) <= vga_id(3);
					iec_reg <= "1110"; -- DAT
				when 2 =>
					iec_result(7) <= vga_id(0);
					iec_result(6) <= vga_id(2);
					iec_result(5) <= vga_id(1);
					iec_result(4) <= vga_id(3);
					iec_reg <= "1101"; -- CLK
				when 3 =>
					iec_result(11) <= vga_id(0);
					iec_result(10) <= vga_id(2);
					iec_result(9) <= vga_id(1);
					iec_result(8) <= vga_id(3);
					iec_reg <= "1011"; -- SRQ
				when 4 =>
					iec_result(15) <= vga_id(0);
					iec_result(14) <= vga_id(2);
					iec_result(13) <= vga_id(1);
					iec_result(12) <= vga_id(3);
					iec_reg <= "0111"; -- ATN
				when 5 =>
					iec_result(19) <= vga_id(0);
					iec_result(18) <= vga_id(2);
					iec_result(17) <= vga_id(1);
					iec_result(16) <= vga_id(3);
					iec_reg <= "0000";
				when others =>
					null;
				end case;

				iec_cnt <= iec_cnt + 1;
				if iec_cnt = 5 then
					iec_cnt <= (others => '0');
				end if;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Chameleon IO entity
-- -----------------------------------------------------------------------
	chameleon_io_inst : entity work.chameleon_io
		generic map (
			enable_docking_station => true,
			enable_docking_irq => true,
			enable_vga_id_read => true,
			enable_cdtv_remote => false,
			enable_c64_joykeyb => true,
			enable_c64_4player => true,
			enable_raw_spi => false,
			enable_iec_access => true
		)
		port map (
		-- Clocks
			clk => sysclk,
			clk_mux => sysclk,
			ena_1mhz => ena_1mhz,
			reset => reset,
			reset_ext => open,

		-- Config
			no_clock => no_clock,
			docking_station => docking_station,
			docking_version => docking_version,
			vga_id => vga_id,

		-- Chameleon FPGA pins
			-- C64 Clocks
			phi2_n => phi2_n,
			dotclock_n => dotclock_n,
			-- C64 cartridge control lines
			io_ef_n => ioef_n,
			rom_lh_n => romlh_n,
			-- SPI bus
			spi_miso => spi_miso,
			-- CPLD multiplexer
			mux_clk => mux_clk,
			mux => mux,
			mux_d => mux_d,
			mux_q => mux_q,

		-- LEDs
			led_green => led_green,
			led_red => led_red,
			ir => ir,

		-- PS/2 Keyboard
			ps2_keyboard_clk_out => ps2_keyboard_clk_out,
			ps2_keyboard_dat_out => ps2_keyboard_dat_out,
			ps2_keyboard_clk_in => ps2_keyboard_clk_in,
			ps2_keyboard_dat_in => ps2_keyboard_dat_in,

		-- PS/2 Mouse
			ps2_mouse_clk_out => ps2_mouse_clk_out,
			ps2_mouse_dat_out => ps2_mouse_dat_out,
			ps2_mouse_clk_in => ps2_mouse_clk_in,
			ps2_mouse_dat_in => ps2_mouse_dat_in,

		-- Buttons
			button_reset_n => reset_button_n,

		-- Joysticks
			joystick1 => joystick1,
			joystick2 => joystick2,
			joystick3 => joystick3,
			joystick4 => joystick4,

		-- Keyboards
			keys => docking_keys,
			restore_key_n => docking_restore_n,
			amiga_reset_n => docking_amiga_reset_n,
			amiga_trigger => open,
			amiga_scancode => docking_amiga_scancode,

		-- IEC bus
			iec_dat_out => iec_reg(0),
			iec_clk_out => iec_reg(1),
			iec_srq_out => iec_reg(2),
			iec_atn_out => iec_reg(3),
			iec_clk_in => open,
			iec_dat_in => open,
			iec_atn_in => open,
			iec_srq_in => open,

		-- MIDI (only available on Docking-station V2)
			midi_txd => midi_txd,
			midi_rxd => midi_rxd
		);

-- -----------------------------------------------------------------------
-- LEDs
-- -----------------------------------------------------------------------
	myGreenLed : entity work.chameleon_led
		port map (
			clk => sysclk,
			clk_1khz => ena_1khz,
			led_on => '0',
			led_blink => '1',
			led => led_red,
			led_1hz => led_green
		);

-- -----------------------------------------------------------------------
-- Keyboard controller
-- -----------------------------------------------------------------------
	myKeyboard : entity work.io_ps2_keyboard
		generic map (
			ticksPerUsec => 100
		)
		port map (
			clk => sysclk,
			reset => reset,

			ps2_clk_in => ps2_keyboard_clk_in,
			ps2_dat_in => ps2_keyboard_dat_in,
			ps2_clk_out => ps2_keyboard_clk_out,
			ps2_dat_out => ps2_keyboard_dat_out,

			-- Flash caps and num lock LEDs
			caps_lock => led_green,
			num_lock => led_red,
			scroll_lock => '0',

			trigger => keyboard_trigger,
			scancode => keyboard_scancode
		);

-- -----------------------------------------------------------------------
-- Mouse controller
-- -----------------------------------------------------------------------
	myMouse : entity work.io_ps2_mouse
		generic map (
			ticksPerUsec => 100
		)
		port map (
			clk => sysclk,
			reset => reset,

			ps2_clk_in => ps2_mouse_clk_in,
			ps2_dat_in => ps2_mouse_dat_in,
			ps2_clk_out => ps2_mouse_clk_out,
			ps2_dat_out => ps2_mouse_dat_out,

			mousePresent => mouse_present,

			trigger => mouse_trigger,
			leftButton => mouse_left_button,
			middleButton => mouse_middle_button,
			rightButton => mouse_right_button,
			deltaX => mouse_delta_x,
			deltaY => mouse_delta_y
		);

-- -----------------------------------------------------------------------
-- VGA timing configured for 640x480
-- -----------------------------------------------------------------------
	myVgaMaster : entity work.video_vga_master
		generic map (
			clkDivBits => 4
		)
		port map (
			clk => sysclk,
			-- 100 Mhz / (3+1) = 25 Mhz
			clkDiv => X"3",

			hSync => hSync,
			vSync => vSync,

			endOfPixel => end_of_pixel,
			endOfLine => open,
			endOfFrame => end_of_frame,
			currentX => currentX,
			currentY => currentY,

			-- Setup 640x480@60hz needs ~25 Mhz
			hSyncPol => '0',
			vSyncPol => '0',
			xSize => to_unsigned(800, 12),
			ySize => to_unsigned(525, 12),
			xSyncFr => to_unsigned(656, 12), -- Sync pulse 96
			xSyncTo => to_unsigned(752, 12),
			ySyncFr => to_unsigned(500, 12), -- Sync pulse 2
			ySyncTo => to_unsigned(502, 12)
		);

-- -----------------------------------------------------------------------
--
-- Reposition mouse cursor.
-- I like to move it, move it. You like to move it, move it.
-- We like to move it, move it. So just move it!
-- -----------------------------------------------------------------------
	process(sysclk)
		variable newX : signed(11 downto 0);
		variable newY : signed(11 downto 0);
	begin
		if rising_edge(sysclk) then
		--
		-- Calculate new cursor coordinates
		-- deltaY is subtracted as line count runs top to bottom on the screen.
			newX := cursor_x + mouse_delta_x;
			newY := cursor_y - mouse_delta_y;
		--
		-- Limit mouse cursor to screen
			if newX > 640 then
				newX := to_signed(640, 12);
			end if;
			if newX < 0 then
				newX := to_signed(0, 12);
			end if;
			if newY > 480 then
				newY := to_signed(480, 12);
			end if;
			if newY < 0 then
				newY := to_signed(0, 12);
			end if;
		--
		-- Update cursor location
			if mouse_trigger = '1' then
				cursor_x <= newX;
				cursor_y <= newY;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Amiga scancode
-- -----------------------------------------------------------------------
	process(sysclk) is
		variable x : signed(11 downto 0);
		variable y : signed(11 downto 0);
	begin
		x := signed(currentX);
		y := signed(currentY);
		if rising_edge(sysclk) then
			video_amiga <= '0';
			box(video_amiga, x, y, 144 + 9*16, 288, docking_amiga_reset_n);
			for i in 0 to 7 loop
				box(video_amiga, x, y, 144 + i*16, 288, docking_amiga_scancode(7-i));
			end loop;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Midi ports on Docking-station V2
-- -----------------------------------------------------------------------
	midi_blk : block
		signal empty : std_logic;

		signal uart_d : unsigned(7 downto 0) := (others => '0');
		signal uart_d_trig : std_logic;
		signal uart_q : unsigned(7 downto 0);
		signal uart_q_trig : std_logic;
		signal midi_data_reg : unsigned(63 downto 0) := (others => '0');
	begin
		midi_data <= midi_data_reg;

		uart_inst : entity work.gen_uart
			generic map (
				bits => 8,
				baud => 31250,
				ticksPerUsec => 100
			)
			port map (
				clk => sysclk,

				d => uart_d,
				d_trigger => uart_d_trig,
				d_empty => empty,

				q => uart_q,
				q_trigger => uart_q_trig,

				serial_rxd => midi_rxd,
				serial_txd => midi_txd
			);

		process(sysclk)
		begin
			if rising_edge(sysclk) then
				if uart_q_trig = '1' then
					midi_data_reg <= midi_data_reg(55 downto 0) & uart_q;
				end if;
			end if;
		end process;

		process(sysclk)
		begin
			if rising_edge(sysclk) then
				uart_d_trig <= '0';
				if ena_1sec = '1' then
					uart_d <= uart_d + 1;
					uart_d_trig <= '1';
				end if;
			end if;
		end process;
	end block;

-- -----------------------------------------------------------------------
-- VGA colors
-- -----------------------------------------------------------------------
	vga_colors_blk : block
		signal vid_joystick_results : std_logic;
		signal vid_keyboard_results : std_logic;
		signal vid_midi_results : std_logic;
		signal vid_mode : std_logic;
		signal vid_version : std_logic;
	begin
		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(currentX);
			y := signed(currentY);
			if rising_edge(sysclk) then
				vid_joystick_results <= '0';
				drawtext(vid_joystick_results, x, y, 476, 288-5, "3 2 1 R L D U");
				drawtext(vid_joystick_results, x, y, 416, 304-5, "PORT 1");
				drawtext(vid_joystick_results, x, y, 416, 320-5, "PORT 2");
				drawtext(vid_joystick_results, x, y, 416, 336-5, "PORT 3");
				drawtext(vid_joystick_results, x, y, 416, 352-5, "PORT 4");
				for i in 0 to 6 loop
					box(vid_joystick_results, x, y, 480 + i*16, 304, joystick1(6-i));
					box(vid_joystick_results, x, y, 480 + i*16, 320, joystick2(6-i));
					box(vid_joystick_results, x, y, 480 + i*16, 336, joystick3(6-i));
					box(vid_joystick_results, x, y, 480 + i*16, 352, joystick4(6-i));
				end loop;
			end if;
		end process;

		process(sysclk) is
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(currentX);
			y := signed(currentY);
			if rising_edge(sysclk) then
				vid_keyboard_results <= '0';
				for row in 0 to 7 loop
					for col in 0 to 7 loop
						box(vid_keyboard_results, x, y, 144 + col*16, 352 + row*16, docking_keys(row*8 + col));
					end loop;
				end loop;
				box(vid_keyboard_results, x, y, 144 + 9*16, 352, docking_restore_n);
			end if;
		end process;

		process(sysclk) is
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(currentX);
			y := signed(currentY);
			if rising_edge(sysclk) then
				vid_midi_results <= '0';
				if docking_version = '1' then
					drawtext(vid_midi_results, x, y, 320, 400, "MIDI:");
					drawunsigned(vid_midi_results, x, y, 320, 408, midi_data);
				end if;
			end if;
		end process;

		process(sysclk) is
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(currentX);
			y := signed(currentY);
			if rising_edge(sysclk) then
				vid_mode <= '0';
				if (docking_station = '1') and (docking_version = '0') then
					drawtext(vid_mode, x, y, 320, 464, "DOCKINGSTATION V1");
				elsif (docking_station = '1') and (docking_version = '1') then
					drawtext(vid_mode, x, y, 320, 464, "DOCKINGSTATION V2");
				elsif no_clock = '1' then
					drawtext(vid_mode, x, y, 320, 464, "STANDALONE");
				else
					drawtext(vid_mode, x, y, 320, 464, "CARTRIDGE");
				end if;
			end if;
		end process;

		process(sysclk) is
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(currentX);
			y := signed(currentY);
			if rising_edge(sysclk) then
				vid_version <= '0';
				drawtext(vid_version, x, y, 560, 464, version_str);
			end if;
		end process;

		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(currentX);
			y := signed(currentY);
			if rising_edge(sysclk) then
				if end_of_pixel = '1' then
					red <= (others => '0');
					grn <= (others => '0');
					blu <= (others => '0');
					if currentY < 256 then
						case currentX(11 downto 7) is
						when "00001" =>
							red <= currentX(6 downto 2);
						when "00010" =>
							grn <= currentX(6 downto 2);
						when "00011" =>
							blu <= currentX(6 downto 2);
						when "00100" =>
							red <= currentX(6 downto 2);
							grn <= currentX(6 downto 2);
							blu <= currentX(6 downto 2);
						when others =>
							null;
						end case;
					end if;

				-- SDRAM check
					if (currentY >= 256) and (currentY < 272) then
						if (state = TEST_FILL) or (state = TEST_FILL_W) then
							if currentX > sdram_a(24 downto 16) then
								red <= (others => '1');
								grn <= (others => '1');
								blu <= (others => '1');
							else
								blu <= (others => '1');
							end if;
						end if;
						if (state = TEST_CHECK) or (state = TEST_CHECK_W) then
							if currentX > sdram_a(24 downto 16) then
								red <= (others => '1');
								grn <= (others => '1');
								blu <= (others => '1');
							else
								grn <= (others => '1');
							end if;
						end if;
						if (state = TEST_ERROR) then
							if currentX > sdram_a(24 downto 16) then
								red <= "00111";
							else
								red <= (others => '1');
							end if;
						end if;
					end if;

				-- Draw 3 push button tests
					if (abs(x - 64) < 7) and (abs(y - 64) < 7) and (usart_cts = '0') then
						blu <= (others => '1');
					elsif (abs(x - 64) = 7) and (abs(y - 64) < 7) then
						blu <= (others => '1');
					elsif (abs(x - 64) < 7) and (abs(y - 64) = 7) then
						blu <= (others => '1');
					end if;

					if (abs(x - 96) < 7) and (abs(y - 64) < 7) and (freeze_n = '0') then
						blu <= (others => '1');
					elsif (abs(x - 96) = 7) and (abs(y - 64) < 7) then
						blu <= (others => '1');
					elsif (abs(x - 96) < 7) and (abs(y - 64) = 7) then
						blu <= (others => '1');
					end if;

					if (abs(x - 128) < 7) and (abs(y - 64) < 7) and (reset_button_n = '0') then
						blu <= (others => '1');
					elsif (abs(x - 128) = 7) and (abs(y - 64) < 7) then
						blu <= (others => '1');
					elsif (abs(x - 128) < 7) and (abs(y - 64) = 7) then
						blu <= (others => '1');
					end if;

				-- Draw mouse button tests
					if (abs(x - 64) < 7) and (abs(y - 128) < 7) and (mouse_left_button = '1') then
						red <= (others => '1');
						grn <= (others => '1');
					elsif (abs(x - 64) = 7) and (abs(y - 128) < 7) then
						red <= (others => '1');
						grn <= (others => '1');
					elsif (abs(x - 64) < 7) and (abs(y - 128) = 7) then
						red <= (others => '1');
						grn <= (others => '1');
					end if;

					if (abs(x - 96) < 7) and (abs(y - 128) < 7) and (mouse_middle_button = '1') then
						red <= (others => '1');
						grn <= (others => '1');
					elsif (abs(x - 96) = 7) and (abs(y - 128) < 7) then
						red <= (others => '1');
						grn <= (others => '1');
					elsif (abs(x - 96) < 7) and (abs(y - 128) = 7) then
						red <= (others => '1');
						grn <= (others => '1');
					end if;

					if (abs(x - 128) < 7) and (abs(y - 128) < 7) and (mouse_right_button = '1') then
						red <= (others => '1');
						grn <= (others => '1');
					elsif (abs(x - 128) = 7) and (abs(y - 128) < 7) then
						red <= (others => '1');
						grn <= (others => '1');
					elsif (abs(x - 128) < 7) and (abs(y - 128) = 7) then
						red <= (others => '1');
						grn <= (others => '1');
					end if;

				-- clock
					if (abs(x - 64) < 7) and (abs(y - 192) < 7) and (no_clock = '0') then
						grn <= (others => '1');
					elsif (abs(x - 64) = 7) and (abs(y - 192) < 7) then
						grn <= (others => '1');
					elsif (abs(x - 64) < 7) and (abs(y - 192) = 7) then
						grn <= (others => '1');
					end if;

				-- docking station
					if (abs(x - 96) < 7) and (abs(y - 192) < 7) and (docking_station = '1') then
						grn <= (others => '1');
					elsif (abs(x - 96) = 7) and (abs(y - 192) < 7) then
						grn <= (others => '1');
					elsif (abs(x - 96) < 7) and (abs(y - 192) = 7) then
						grn <= (others => '1');
					end if;

				-- IR tester
					if (abs(x - 128) < 7) and (abs(y - 192) < 7) and (ir = '0') then
						red <= (others => '1');
					elsif (abs(x - 128) = 7) and (abs(y - 192) < 7) then
						red <= (others => '1');
					elsif (abs(x - 128) < 7) and (abs(y - 192) = 7) then
						red <= (others => '1');
					end if;

				-- Draw IEC test pattern
					for dy in 0 to 5 loop
						for dx in 0 to 3 loop
							if abs(x - (64 + (3-dx)*16)) < 5 and (abs(y - (320 + dy*16)) < 5) and (iec_result(dy*4+dx) = '1') then
								red <= (others => '1');
								grn <= (others => '1');
								blu <= (others => '1');
							elsif abs(x - (64 + (3-dx)*16)) = 5 and (abs(y - (320 + dy*16)) < 5) then
								red <= (others => '1');
								grn <= (others => '1');
								blu <= (others => '1');
							elsif abs(x - (64 + (3-dx)*16)) < 5 and (abs(y - (320 + dy*16)) = 5) then
								red <= (others => '1');
								grn <= (others => '1');
								blu <= (others => '1');
							end if;
						end loop;
					end loop;

				--
				-- Draw test results
					if (vid_joystick_results
					or vid_keyboard_results
					or vid_midi_results
					or video_amiga
					or vid_mode
					or vid_version) = '1' then
						red <= (others => '1');
						grn <= (others => '1');
						blu <= (others => '1');
					end if;

				-- Draw mouse cursor
					if mouse_present = '1' then
						if (abs(x - cursor_x) < 5) and (abs(y - cursor_y) < 5) then
							red <= (others => '1');
							grn <= (others => '1');
							blu <= (others => '0');
						end if;
					end if;

				--
				-- One pixel border around the screen
					if (currentX = 0) or (currentX = 639) or (currentY =0) or (currentY = 479) then
						red <= (others => '1');
						grn <= (others => '1');
						blu <= (others => '1');
					end if;
				--
				-- Never draw pixels outside the visual area
					if (currentX >= 640) or (currentY >= 480) then
						red <= (others => '0');
						grn <= (others => '0');
						blu <= (others => '0');
					end if;
				end if;
			end if;
		end process;
	end block;
end architecture;
