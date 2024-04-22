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
-- Toplevel entity of hardware test for Turbo Chameleon 64 second edition.
--
-- -----------------------------------------------------------------------
--
-- Hardware test can be executed when plug'ed into a C64, standalone or with docking-station.
-- In C64 mode the machine will startup normally as the Chameleon will be invisible to the machine.
-- The address-bus of the Chameleon is completely tri-stated in the hardware test.
-- The hardware test can also be used to test the docking-station. Additional icons become
-- visible when the docking station is connected.
--
-- Connect PS/2 keyboard
-- Connect PS/2 3 button/wheel mouse
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
-- * Hot plug custom IEC test cable into Chameleon
--    Binary pattern that is put on the pins will change depending on the test cable.
--    IEC detect goes from filled white to black on the left side.
--    Reset will flash together with the red/green led pattern.
--    This way all signals can be tested.
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
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.video_pkg.all;

-- -----------------------------------------------------------------------

architecture rtl of chameleon2 is
	constant version_str : string := "20190514";
	constant reset_cycles : integer := 131071;
	constant enable_phi2_waveform : boolean := false;

-- System clocks
	signal sysclk : std_logic;
	signal clk_150 : std_logic;
	--signal clk_video : std_logic;
	signal ena_1mhz : std_logic;
	signal ena_1khz : std_logic;
	signal ena_1sec : std_logic;

	signal reset : std_logic;

-- Docking station
	signal no_clock : std_logic;
	signal docking_station : std_logic;
	signal docking_version : std_logic;
	signal docking_irq : std_logic;
	signal phi_cnt : unsigned(7 downto 0);
	signal phi_end_1 : std_logic;

-- RAM Test
	type state_t is (TEST_IDLE, TEST_FILL, TEST_FILL_W, TEST_CHECK, TEST_CHECK_W, TEST_ERROR);
	signal ram_test_state : state_t := TEST_IDLE;
	signal ram_test_a : unsigned(24 downto 0);
	signal ram_test_d : unsigned(15 downto 0);
	signal ram_test_exp : unsigned(15 downto 0);

-- IEC
	type iec_results_t is array(integer range 0 to 15) of unsigned(3 downto 0);
	signal iec_results_reg : iec_results_t := (others => (others => '0'));
	signal iec_clk_in : std_logic;
	signal iec_dat_in : std_logic;
	signal iec_atn_in : std_logic;
	signal iec_srq_in : std_logic;

-- LEDs
	signal led_green : std_logic;
	signal led_red : std_logic;

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

-- Sound
	signal sigma_l_reg : std_logic := '0';
	signal sigma_r_reg : std_logic := '0';

-- Joysticks
	signal joystick1 : unsigned(6 downto 0);
	signal joystick2 : unsigned(6 downto 0);
	signal joystick3 : unsigned(6 downto 0);
	signal joystick4 : unsigned(6 downto 0);

-- C64 keyboard
	signal keys : unsigned(63 downto 0);
	signal restore_n : std_logic;

-- Amiga keyboard
	signal amiga_reset_n : std_logic;
	signal amiga_scancode : unsigned(7 downto 0);

-- MIDI
	signal midi_txd : std_logic;
	signal midi_rxd : std_logic;
	signal midi_data : unsigned(63 downto 0);

-- Video pipeline
	signal end_of_line : std_logic;
	signal end_of_frame : std_logic;
	signal video_phi2 : std_logic := '0';

	type stage_t is record
			ena_pixel : std_logic;
			hsync : std_logic;
			vsync : std_logic;
			x : unsigned(11 downto 0);
			y : unsigned(11 downto 0);
			r : unsigned(4 downto 0);
			g : unsigned(4 downto 0);
			b : unsigned(4 downto 0);
		end record;
	signal vga_master : stage_t;
	signal vga_colors : stage_t;

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
-- -----------------------------------------------------------------------
-- Control signals
-- -----------------------------------------------------------------------
	clock_ior <= '1';
	clock_iow <= '1';
	irq_out <= not docking_irq;

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
				c1 => open,
				c2 => clk_150,
				c3 => ram_clk_loc,
				locked => open
			);

		ram_clk <= ram_clk_loc;
	end block;

-- -----------------------------------------------------------------------
-- 1 Mhz and 1 Khz clocks
-- -----------------------------------------------------------------------
	ena1mhz_inst : entity work.chameleon_1mhz
		generic map (
			clk_ticks_per_usec => 100
		)
		port map (
			clk => sysclk,
			ena_1mhz => ena_1mhz,
			ena_1mhz_2 => open
		);

	ena1khz_inst : entity work.chameleon_1khz
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
-- Reset
-- -----------------------------------------------------------------------
	myReset : entity work.gen_reset
		generic map (
			resetCycles => reset_cycles
		)
		port map (
			clk => sysclk,
			enable => '1',

			button => '0',
			reset => reset
		);

-- -----------------------------------------------------------------------
-- Memory test
-- -----------------------------------------------------------------------
	blk_memory_test : block
		signal noise_bits : unsigned(7 downto 0);

		signal sdram_req : std_logic := '0';
		signal sdram_ack : std_logic;
		signal sdram_we : std_logic := '0';
		signal sdram_a : unsigned(24 downto 0) := (others => '0');
		signal sdram_d : unsigned(7 downto 0) := (others => '0');
		signal sdram_q : unsigned(7 downto 0);

		signal sdram_req_pipeline : std_logic := '0';
		signal sdram_ack_pipeline : std_logic := '0';
		signal sdram_we_pipeline : std_logic := '0';
		signal sdram_a_pipeline : unsigned(24 downto 0) := (others => '0');
		signal sdram_d_pipeline : unsigned(7 downto 0) := (others => '0');
		signal sdram_q_pipeline : unsigned(7 downto 0) := (others => '0');
	begin
		ram_test_a <= sdram_a;
		ram_test_d <= "00000000" & sdram_q_pipeline;
		ram_test_exp <= "00000000" & noise_bits;

		myNoise : entity work.fractal_noise
			generic map (
				dBits => 25,
				qBits => 8
			)
			port map (
				d => sdram_a,
				q => noise_bits
			);

		sdram_inst : entity work.chameleon_sdram
			generic map (
				enable_cpu6510_port => true,
				casLatency => 3,
				ras_cycles => 2,
				precharge_cycles => 2,
				colAddrBits => 9,
				rowAddrBits => 13,
	--			t_ck_ns => 10.0
				t_clk_ns => 6.7
			)
			port map (
				clk => clk_150,

				reserve => '0',

				sd_data => ram_d,
				sd_addr => ram_a,
				sd_we_n => ram_we,
				sd_ras_n => ram_ras,
				sd_cas_n => ram_cas,
				sd_ba_0 => ram_ba(0),
				sd_ba_1 => ram_ba(1),
				sd_ldqm => ram_ldqm,
				sd_udqm => ram_udqm,

				cache_req => '0',
				cache_ack => open,
				cache_we => '0',
				cache_burst => '0',
				cache_a => (others => '0'),
				cache_d => (others => '0'),
				cache_q => open,

				vid0_req => '0',
				vid0_ack => open,
				vid0_addr => (others => '0'),
				vid0_do => open,

				vid1_req => '0',
				vid1_ack => open,
				vid1_addr => (others => '0'),
				vid1_do => open,

				cpu6510_req => sdram_req_pipeline,
				cpu6510_ack => sdram_ack,
				cpu6510_we => sdram_we_pipeline,
				cpu6510_a => sdram_a_pipeline,
				cpu6510_d => sdram_d_pipeline,
				cpu6510_q => sdram_q,

				debugIdle => open,
				debugRefresh => open
			);

		process(clk_150)
		begin
			if rising_edge(clk_150) then
				sdram_req_pipeline <= sdram_req;
				sdram_we_pipeline <= sdram_we;
				sdram_a_pipeline <= sdram_a;
				sdram_d_pipeline <= sdram_d;

				sdram_ack_pipeline <= sdram_ack;
				sdram_q_pipeline <= sdram_q;
			end if;
		end process;

		process(sysclk)
		begin
			if rising_edge(sysclk) then
				case ram_test_state is
				when TEST_IDLE =>
					sdram_a <= (others => '0');
					sdram_we <= '0';
					ram_test_state <= TEST_FILL;
				when TEST_FILL =>
					sdram_req <= not sdram_req;
					sdram_we <= '1';
					sdram_d <= noise_bits;
					ram_test_state <= TEST_FILL_W;
				when TEST_FILL_W =>
					if sdram_req = sdram_ack_pipeline then
						sdram_a <= sdram_a + 1;
						if sdram_a =  "1111111111111111111111111" then
							ram_test_state <= TEST_CHECK;
						else
							ram_test_state <= TEST_FILL;
						end if;
					end if;
				when TEST_CHECK =>
					sdram_req <= not sdram_req;
					sdram_we <= '0';
					ram_test_state <= TEST_CHECK_W;
				when TEST_CHECK_W =>
					if sdram_req = sdram_ack_pipeline then
						if sdram_q_pipeline /= noise_bits then
							ram_test_state <= TEST_ERROR;
						else
							sdram_a <= sdram_a + 1;
							ram_test_state <= TEST_CHECK;
						end if;
					end if;
				when TEST_ERROR =>
					--if ena_1khz = '1' then
						--sdram_a <= sdram_a + 1;
					--end if;
					null;
				end case;
				if reset = '1' then
					ram_test_state <= TEST_IDLE;
				end if;
				if ena_1khz = '1' then
					if freeze_btn = '0' then
						ram_test_state <= TEST_IDLE;
					end if;
				end if;
			end if;
		end process;
	end block;

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
				if (mouse_right_button = '1') or (reset_btn = '0') then
					sigma_r_reg <= not sigma_r_reg;
				end if;
			end if;
		end if;
	end process;
	sigma_l <= sigma_l_reg;
	sigma_r <= sigma_r_reg;

-- -----------------------------------------------------------------------
-- IEC test
-- -----------------------------------------------------------------------
	iec_test_blk : block
		signal state_reg : unsigned(3 downto 0);
	begin
		process(sysclk)
		begin
			if rising_edge(sysclk) then
				if ena_1khz = '1' then
					state_reg <= state_reg + 1;
					iec_results_reg(to_integer(state_reg)) <= iec_srq_in & iec_atn_in & iec_dat_in & iec_clk_in;
				end if;
			end if;
		end process;

		iec_clk_out <= not state_reg(0);
		iec_dat_out <= not state_reg(1);
		iec_atn_out <= not state_reg(2);
		iec_srq_out <= not state_reg(3);
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
-- LED, PS2 and reset shiftregister
-- -----------------------------------------------------------------------
	io_shiftreg_inst : entity work.chameleon2_io_shiftreg
		port map (
			clk => sysclk,

			ser_out_clk => ser_out_clk,
			ser_out_dat => ser_out_dat,
			ser_out_rclk => ser_out_rclk,

			reset_c64 => '0', -- system_reset,
			reset_iec => led_green,
			ps2_mouse_clk => ps2_mouse_clk_out,
			ps2_mouse_dat => ps2_mouse_dat_out,
			ps2_keyboard_clk => ps2_keyboard_clk_out,
			ps2_keyboard_dat => ps2_keyboard_dat_out,
			led_green => led_green,
			led_red => led_red
		);

-- -----------------------------------------------------------------------
-- Chameleon IO, docking station and cartridge port
-- -----------------------------------------------------------------------
	chameleon2_io_blk : block
	begin
		chameleon2_io_inst : entity work.chameleon2_io
			generic map (
				enable_docking_station => true,
				enable_cdtv_remote => true,
				enable_c64_joykeyb => true,
				enable_c64_4player => true
			)
			port map (
				clk => sysclk,
				ena_1mhz => ena_1mhz,
				phi2_n => phi2_n,
				dotclock_n => dotclk_n,

				reset => reset,

				ir_data => ir_data,
				ioef => ioef,
				romlh => romlh,

				dma_out => dma_out,
				game_out => game_out,
				exrom_out => exrom_out,

				ba_in => ba_in,
--				rw_in => rw_in,
				rw_out => rw_out,

				sa_dir => sa_dir,
				sa_oe => sa_oe,
				sa15_out => sa15_out,
				low_a => low_a,

				sd_dir => sd_dir,
				sd_oe => sd_oe,
				low_d => low_d,

				no_clock => no_clock,
				docking_station => docking_station,
				docking_version => docking_version,
				docking_irq => docking_irq,

				phi_cnt => phi_cnt,
				phi_end_1 => phi_end_1,

				joystick1 => joystick1,
				joystick2 => joystick2,
				joystick3 => joystick3,
				joystick4 => joystick4,
				keys => keys,
				restore_key_n => restore_n,
				amiga_power_led => led_red,
				amiga_drive_led => led_green,
				amiga_reset_n => amiga_reset_n,
				amiga_scancode => amiga_scancode,

				midi_txd => midi_txd,
				midi_rxd => midi_rxd
			);
	end block;

-- -----------------------------------------------------------------------
-- Phi_2 waveform check
-- -----------------------------------------------------------------------
	phi2_waveform_gen : if enable_phi2_waveform generate
		phi2_waveform_blk : block
			type phi2_measure_t is array(integer range 0 to 255) of unsigned(8 downto 0);
			signal phi2_measure : phi2_measure_t;
			signal phi2_n_dly : std_logic := '1';
			signal cnt : unsigned(7 downto 0);
			signal last_phi_cnt : unsigned(7 downto 0);
			signal armed : std_logic := '0';
			signal run : std_logic := '0';
			signal video_reg : std_logic;
		begin
			process(sysclk)
			begin
				if rising_edge(sysclk) then
					phi2_n_dly <= phi2_n;
					if run = '1' then
						if phi2_n_dly = '1' then
							phi2_measure(to_integer(phi_cnt)) <= phi2_measure(to_integer(phi_cnt)) + 1;
						end if;
					end if;
					if phi_end_1 = '1' then
						last_phi_cnt <= phi_cnt;
						if run = '1' then
							cnt <= cnt - 1;
							if cnt = 0 then
								run <= '0';
							end if;
						end if;
						if armed = '1' then
							run <= '1';
							armed <= '0';
						end if;
					end if;
					if end_of_frame = '1' then
						armed <= '1';
						cnt <= (others => '1');
						for i in phi2_measure'range loop
							phi2_measure(i) <= "000000000";
						end loop;
					end if;

					video_phi2 <= '0';
					video_reg <= '0';
					if phi2_measure(to_integer(vga_master.x(7 downto 0)))(8 downto 2) = vga_master.y(6 downto 0) then
						video_reg <= '1';
					end if;
					if last_phi_cnt <= vga_master.x(7 downto 0) then
						-- Don't display signal outside used range.
						video_reg <= '0';
					end if;
					if vga_master.y >= 128 and vga_master.y < 256 then
						if vga_master.x >= 256 and vga_master.x < 512 then
							video_phi2 <= video_reg;
						end if;
					end if;
				end if;
			end process;
		end block;
	end generate;

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
-- Video timing 640x480
-- -----------------------------------------------------------------------
	vga_master_inst : entity work.video_vga_master
		generic map (
			clkDivBits => 4
		)
		port map (
			clk => sysclk,
			-- 100 Mhz / (3+1) = 25 Mhz
			clkDiv => X"3",

			hSync => vga_master.hsync,
			vSync => vga_master.vsync,

			endOfPixel => vga_master.ena_pixel,
			endOfLine => end_of_line,
			endOfFrame => end_of_frame,
			currentX => vga_master.x,
			currentY => vga_master.y,

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
-- VGA colors
-- -----------------------------------------------------------------------
	vga_colors_blk : block
		signal dac_stage_reg : stage_t;
		signal vga_colors_reg : stage_t;
		signal rambit_reg : std_logic;
		signal rambit_visible : std_logic;

		signal vid_chameleon_buttons : std_logic;
		signal vid_mouse_buttons : std_logic;
		signal vid_docking_mode : std_logic;
		signal vid_iec_results : std_logic;
		signal vid_joystick_results : std_logic;
		signal vid_keyboard_results : std_logic;
		signal vid_amiga_results : std_logic;
		signal vid_midi_results : std_logic;
		signal vid_mode : std_logic;
		signal vid_version : std_logic;
	begin
		vga_colors <= vga_colors_reg;

		-- Show all values of the VGA DAC.
		-- Separate R,G and B and white to check proper balance of the signals.
		process(sysclk)
		begin
			if rising_edge(sysclk) then
				dac_stage_reg <= vga_master;
				if vga_master.ena_pixel = '1' then
					dac_stage_reg.r <= (others => '0');
					dac_stage_reg.g <= (others => '0');
					dac_stage_reg.b <= (others => '0');
					if vga_master.y < 256 then
						case vga_master.x(11 downto 7) is
						when "00001" =>
							dac_stage_reg.r <= vga_master.x(6 downto 2);
						when "00010" =>
							dac_stage_reg.g <= vga_master.x(6 downto 2);
						when "00011" =>
							dac_stage_reg.b <= vga_master.x(6 downto 2);
						when "00100" =>
							dac_stage_reg.r <= vga_master.x(6 downto 2);
							dac_stage_reg.g <= vga_master.x(6 downto 2);
							dac_stage_reg.b <= vga_master.x(6 downto 2);
						when others =>
							null;
						end case;
					end if;
				end if;
			end if;
		end process;

		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(vga_master.x);
			y := signed(vga_master.y);
			if rising_edge(sysclk) then
				vid_chameleon_buttons <= '0';
				box(vid_chameleon_buttons, x, y,  64, 64, not usart_cts);
				box(vid_chameleon_buttons, x, y,  96, 64, not freeze_btn);
				box(vid_chameleon_buttons, x, y, 128, 64, not reset_btn);
			end if;
		end process;

		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(vga_master.x);
			y := signed(vga_master.y);
			if rising_edge(sysclk) then
				vid_mouse_buttons <= '0';
				box(vid_mouse_buttons, x, y,  64, 128, mouse_left_button);
				box(vid_mouse_buttons, x, y,  96, 128, mouse_middle_button);
				box(vid_mouse_buttons, x, y, 128, 128, mouse_right_button);
			end if;
		end process;

		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(vga_master.x);
			y := signed(vga_master.y);
			if rising_edge(sysclk) then
				vid_docking_mode <= '0';
				box(vid_docking_mode, x, y,  64, 192, not no_clock);
				box(vid_docking_mode, x, y,  96, 192, docking_station);
--				box(vid_docking_mode, x, y, 128, 128, mouse_right_button);
			end if;
		end process;

		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(vga_master.x);
			y := signed(vga_master.y);
			if rising_edge(sysclk) then
				vid_iec_results <= '0';
				box(vid_iec_results, x, y,  16, 288, iec_present);
				for i in 0 to 15 loop
					box(vid_iec_results, x, y,  32, 288 + i*12, iec_results_reg(i)(3));
					box(vid_iec_results, x, y,  48, 288 + i*12, iec_results_reg(i)(2));
					box(vid_iec_results, x, y,  64, 288 + i*12, iec_results_reg(i)(1));
					box(vid_iec_results, x, y,  80, 288 + i*12, iec_results_reg(i)(0));
				end loop;
			end if;
		end process;

		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(vga_master.x);
			y := signed(vga_master.y);
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
			x := signed(vga_master.x);
			y := signed(vga_master.y);
			if rising_edge(sysclk) then
				vid_keyboard_results <= '0';
				for row in 0 to 7 loop
					for col in 0 to 7 loop
						box(vid_keyboard_results, x, y, 144 + col*16, 352 + row*16, keys(row*8 + col));
					end loop;
				end loop;
				box(vid_keyboard_results, x, y, 144 + 9*16, 352, restore_n);
			end if;
		end process;

		process(sysclk) is
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(vga_master.x);
			y := signed(vga_master.y);
			if rising_edge(sysclk) then
				vid_amiga_results <= '0';
				box(vid_amiga_results, x, y, 144 + 9*16, 288, amiga_reset_n);
				for i in 0 to 7 loop
					box(vid_amiga_results, x, y, 144 + i*16, 288, amiga_scancode(7-i));
				end loop;
			end if;
		end process;

		process(sysclk) is
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(vga_master.x);
			y := signed(vga_master.y);
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
			x := signed(vga_master.x);
			y := signed(vga_master.y);
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
			x := signed(vga_master.x);
			y := signed(vga_master.y);
			if rising_edge(sysclk) then
				vid_version <= '0';
				drawtext(vid_version, x, y, 560, 464, version_str);
			end if;
		end process;

		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(vga_master.x);
			y := signed(vga_master.y);
			if rising_edge(sysclk) then
				vga_colors_reg <= dac_stage_reg;
				if dac_stage_reg.ena_pixel = '1' then
					-- SDRAM check
					if (vga_master.y >= 256) and (vga_master.y < 272) then
						if (ram_test_state = TEST_FILL) or (ram_test_state = TEST_FILL_W) then
							if vga_master.x > ram_test_a(24 downto 16) then
								vga_colors_reg.r <= "01111";
								vga_colors_reg.g <= "01111";
								vga_colors_reg.b <= (others => '1');
							else
								vga_colors_reg.b <= (others => '1');
							end if;
						end if;
						if (ram_test_state = TEST_CHECK) or (ram_test_state = TEST_CHECK_W) then
							if vga_master.x > ram_test_a(24 downto 16) then
								vga_colors_reg.r <= "01111";
								vga_colors_reg.g <= (others => '1');
								vga_colors_reg.b <= "01111";
							else
								vga_colors_reg.g <= (others => '1');
							end if;
						end if;
						if (ram_test_state = TEST_ERROR) then
							if vga_master.x > ram_test_a(24 downto 16) then
								vga_colors_reg.r <= "00111";
							else
								vga_colors_reg.r <= (others => '1');
							end if;
						end if;
						rambit_visible <= '1';
						case to_integer(vga_master.x(9 downto 3)) is
						when  0 => rambit_reg <= ram_test_a(24);
						when  1 => rambit_reg <= ram_test_a(23);
						when  2 => rambit_reg <= ram_test_a(22);
						when  3 => rambit_reg <= ram_test_a(21);
						when  4 => rambit_reg <= ram_test_a(20);
						when  5 => rambit_reg <= ram_test_a(19);
						when  6 => rambit_reg <= ram_test_a(18);
						when  7 => rambit_reg <= ram_test_a(17);
						when  8 => rambit_reg <= ram_test_a(16);
						when  9 => rambit_reg <= ram_test_a(15);
						when 10 => rambit_reg <= ram_test_a(14);
						when 11 => rambit_reg <= ram_test_a(13);
						when 12 => rambit_reg <= ram_test_a(12);
						when 13 => rambit_reg <= ram_test_a(11);
						when 14 => rambit_reg <= ram_test_a(10);
						when 15 => rambit_reg <= ram_test_a( 9);
						when 16 => rambit_reg <= ram_test_a( 8);
						when 17 => rambit_reg <= ram_test_a( 7);
						when 18 => rambit_reg <= ram_test_a( 6);
						when 19 => rambit_reg <= ram_test_a( 5);
						when 20 => rambit_reg <= ram_test_a( 4);
						when 21 => rambit_reg <= ram_test_a( 3);
						when 22 => rambit_reg <= ram_test_a( 2);
						when 23 => rambit_reg <= ram_test_a( 1);
						when 24 => rambit_reg <= ram_test_a( 0);
						when 25 => rambit_visible <= '0';
						when 26 => rambit_visible <= '0';
						when 27 => rambit_reg <= ram_test_d(15);
						when 28 => rambit_reg <= ram_test_d(14);
						when 29 => rambit_reg <= ram_test_d(13);
						when 30 => rambit_reg <= ram_test_d(12);
						when 31 => rambit_reg <= ram_test_d(11);
						when 32 => rambit_reg <= ram_test_d(10);
						when 33 => rambit_reg <= ram_test_d( 9);
						when 34 => rambit_reg <= ram_test_d( 8);
						when 35 => rambit_reg <= ram_test_d( 7);
						when 36 => rambit_reg <= ram_test_d( 6);
						when 37 => rambit_reg <= ram_test_d( 5);
						when 38 => rambit_reg <= ram_test_d( 4);
						when 39 => rambit_reg <= ram_test_d( 3);
						when 40 => rambit_reg <= ram_test_d( 2);
						when 41 => rambit_reg <= ram_test_d( 1);
						when 42 => rambit_reg <= ram_test_d( 0);
						when 43 => rambit_visible <= '0';
						when 44 => rambit_visible <= '0';
						when 45 => rambit_reg <= ram_test_exp(15);
						when 46 => rambit_reg <= ram_test_exp(14);
						when 47 => rambit_reg <= ram_test_exp(13);
						when 48 => rambit_reg <= ram_test_exp(12);
						when 49 => rambit_reg <= ram_test_exp(11);
						when 50 => rambit_reg <= ram_test_exp(10);
						when 51 => rambit_reg <= ram_test_exp( 9);
						when 52 => rambit_reg <= ram_test_exp( 8);
						when 53 => rambit_reg <= ram_test_exp( 7);
						when 54 => rambit_reg <= ram_test_exp( 6);
						when 55 => rambit_reg <= ram_test_exp( 5);
						when 56 => rambit_reg <= ram_test_exp( 4);
						when 57 => rambit_reg <= ram_test_exp( 3);
						when 58 => rambit_reg <= ram_test_exp( 2);
						when 59 => rambit_reg <= ram_test_exp( 1);
						when 60 => rambit_reg <= ram_test_exp( 0);
						when others => rambit_visible <= '0';
						end case;
						if vga_master.x(2 downto 1) = "11" and (rambit_visible = '1') then
							if vga_master.y(3) /= rambit_reg then
								vga_colors_reg.r <= (others => '0');
								vga_colors_reg.g <= (others => '0');
								vga_colors_reg.b <= (others => '0');
							end if;
						end if;
					end if;

					if enable_phi2_waveform and (video_phi2 = '1') then
						vga_colors_reg.r <= (others => '1');
						vga_colors_reg.g <= (others => '1');
						vga_colors_reg.b <= (others => '1');
					end if;

					-- IR tester
					if (abs(x - 128) < 7) and (abs(y - 192) < 7) and (ir_data = '0') then
						vga_colors_reg.r <= (others => '1');
					elsif (abs(x - 128) = 7) and (abs(y - 192) < 7) then
						vga_colors_reg.r <= (others => '1');
					elsif (abs(x - 128) < 7) and (abs(y - 192) = 7) then
						vga_colors_reg.r <= (others => '1');
					end if;

					-- Draw boxes
					if (vid_chameleon_buttons
					or vid_mouse_buttons
					or vid_docking_mode
					or vid_iec_results
					or vid_joystick_results
					or vid_keyboard_results
					or vid_amiga_results
					or vid_midi_results
					or vid_mode
					or vid_version) = '1' then
						vga_colors_reg.r <= (others => '1');
						vga_colors_reg.g <= (others => '1');
						vga_colors_reg.b <= (others => '1');
					end if;

					-- Draw mouse cursor
					if mouse_present = '1' then
						if (abs(x - cursor_x) < 5) and (abs(y - cursor_y) < 5) then
							vga_colors_reg.r <= (others => '1');
							vga_colors_reg.g <= (others => '1');
							vga_colors_reg.b <= (others => '0');
						end if;
					end if;

					--
					-- One pixel border around the screen
					if (vga_master.x = 0) or (vga_master.x = 639) or (vga_master.y =0) or (vga_master.y = 479) then
						vga_colors_reg.r <= (others => '1');
						vga_colors_reg.g <= (others => '1');
						vga_colors_reg.b <= (others => '1');
					end if;

					--
					-- Never draw pixels outside the visual area
					if (vga_master.x >= 640) or (vga_master.y >= 480) then
						vga_colors_reg.r <= (others => '0');
						vga_colors_reg.g <= (others => '0');
						vga_colors_reg.b <= (others => '0');
					end if;
				end if;
			end if;
		end process;
	end block;

	process(sysclk)
	begin
		if rising_edge(sysclk) then
			if vga_colors.ena_pixel = '1' then
				hsync_n <= vga_colors.hsync;
				vsync_n <= vga_colors.vsync;
				red <= vga_colors.r;
				grn <= vga_colors.g;
				blu <= vga_colors.b;
			end if;
		end if;
	end process;
end architecture;

