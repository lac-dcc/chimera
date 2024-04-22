-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2012 by Peter Wendrich (pwsoft@syntiac.com)
-- All Rights Reserved.
--
-- http://www.syntiac.com/chameleon.html
--
-- -----------------------------------------------------------------------
--
-- Conway's Game of Life simulator for Chameleon
--
-- -----------------------------------------------------------------------
--
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

architecture rtl of chameleon2 is
	constant reset_cycles : integer := 131071;

-- Game of life settings
	constant life_columns : integer := 512;
	constant life_rows : integer := 472;

-- Game signals
	signal vga_life_background : std_logic := '0';
	signal vga_life_pixel : std_logic := '0';
	signal vga_life_menu : std_logic := '0';
	signal vga_life_rules : std_logic := '0';

-- Clocks
	signal sysclk : std_logic;
	signal clk_150 : std_logic;
	signal sd_clk_loc : std_logic;
	signal clk_locked : std_logic;
	signal ena_1mhz : std_logic;
	signal ena_1khz : std_logic;
	signal no_clock : std_logic;

	signal reset_button_n : std_logic;
-- Global signals
	signal reset : std_logic;

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

	signal cursor_x : signed(11 downto 0) := to_signed(320, 12);
	signal cursor_y : signed(11 downto 0) := to_signed(240, 12);

-- VGA
	signal end_of_pixel : std_logic;
	signal end_of_line : std_logic;
	signal end_of_frame : std_logic;
	signal currentX : unsigned(11 downto 0);
	signal currentY : unsigned(11 downto 0);

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

	signal red_reg : unsigned(4 downto 0) := (others => '0');
	signal grn_reg : unsigned(4 downto 0) := (others => '0');
	signal blu_reg : unsigned(4 downto 0) := (others => '0');

-- Docking station
	signal docking_station : std_logic;
	signal docking_keys : unsigned(63 downto 0);
	signal docking_restore_n : std_logic;
	signal docking_irq : std_logic;
	signal irq_n : std_logic;
	signal docking_joystick1 : unsigned(6 downto 0);
	signal docking_joystick2 : unsigned(6 downto 0);
	signal docking_joystick3 : unsigned(6 downto 0);
	signal docking_joystick4 : unsigned(6 downto 0);
	signal docking_amiga_reset_n : std_logic;
	signal docking_amiga_scancode : unsigned(7 downto 0);

	signal phi_cnt : unsigned(7 downto 0);
	signal phi_end_1 : std_logic;

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

	procedure box(signal video : inout std_logic; x : signed; y : signed; xpos : integer; ypos : integer; ison : boolean) is
	begin
		if (abs(x - xpos) < 5) and (abs(y - ypos) < 5) and ison then
			video <= '1';
		elsif (abs(x - xpos) = 5) and (abs(y - ypos) < 5) then
			video <= '1';
		elsif (abs(x - xpos) < 5) and (abs(y - ypos) = 5) then
			video <= '1';
		end if;
	end procedure;
begin
-- -----------------------------------------------------------------------
-- Unused pins
-- -----------------------------------------------------------------------
	iec_clk_out <= '0';
	iec_atn_out <= '0';
	iec_dat_out <= '0';
	iec_srq_out <= '0';
	irq_out <= '0';
	nmi_out <= '0';
	sigma_l <= '0';
	sigma_r <= '0';

-- -----------------------------------------------------------------------
-- VGA sync
-- -----------------------------------------------------------------------
	hsync_n <= not vga_master.hsync;
	vsync_n <= not vga_master.vsync;


-- -----------------------------------------------------------------------
-- Clocks and PLL
-- -----------------------------------------------------------------------
	pllInstance : entity work.pll50
		port map (
			inclk0 => clk50m,
			c0 => sysclk,
			c1 => open,
			c2 => clk_150,
			c3 => sd_clk_loc,
			locked => clk_locked
		);
	ram_clk <= sd_clk_loc;

-- -----------------------------------------------------------------------
-- Phi 2
-- -----------------------------------------------------------------------
	myPhi2: entity work.chameleon_phi_clock
		port map (
			clk => sysclk,
			phi2_n => phi2_n,

			-- no_clock is high when there are no phiIn changes detected.
			-- This signal allows switching between real I/O and internal emulation.
			no_clock => no_clock,

			-- docking_station is high when there are no phiIn changes (no_clock) and
			-- the phi signal is low. Without docking station phi is pulled up.
			docking_station => docking_station
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
				clock_ior => clock_ior,
				clock_iow => clock_iow,

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

				phi_cnt => phi_cnt,
				phi_end_1 => phi_end_1,

				joystick1 => docking_joystick1,
				joystick2 => docking_joystick2,
				joystick3 => docking_joystick3,
				joystick4 => docking_joystick4,

				keys => docking_keys,
				restore_key_n => docking_restore_n
			);

		flash_cs <= '1';
		mmc_cs <= '1';
		rtc_cs <= '0';
	end block;

-- -----------------------------------------------------------------------
-- Docking station
-- -----------------------------------------------------------------------
--	myDockingStation : entity work.chameleon_docking_station
--		port map (
--			clk => sysclk,
--
--			docking_station => docking_station,
--
--			dotclock_n => dotclock_n,
--			io_ef_n => ioef_n,
--			rom_lh_n => romlh_n,
--			irq_q => docking_irq,
--
--			joystick1 => docking_joystick1,
--			joystick2 => docking_joystick2,
--			joystick3 => docking_joystick3,
--			joystick4 => docking_joystick4,
--			keys => docking_keys,
--			restore_key_n => docking_restore_n,
--
--			amiga_power_led => led_green,
--			amiga_drive_led => led_red,
--			amiga_reset_n => docking_amiga_reset_n,
--			amiga_scancode => docking_amiga_scancode
--		);

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

			iec_clk => open, --iec_clk_in,
			iec_srq => open, --iec_srq_in,
			iec_atn => open, --iec_atn_in,
			iec_dat => open  --iec_dat_in
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

			hSync => vga_master.hsync,
			vSync => vga_master.vsync,

			endOfPixel => end_of_pixel,
			endOfLine => end_of_line,
			endOfFrame => open,
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
			if newX > 639 then
				newX := to_signed(639, 12);
			end if;
			if newX < 0 then
				newX := to_signed(0, 12);
			end if;
			if newY > 479 then
				newY := to_signed(479, 12);
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
-- Game of life
-- -----------------------------------------------------------------------
	game_of_life: block
		subtype line_t is unsigned(0 to life_columns-1);
		type game_field_t is array(0 to life_rows-1) of line_t;
		type game_mode_t is (
			MODE_STOP, MODE_STEP, MODE_SLOW, MODE_MEDIUM, MODE_FAST, MODE_ULTRA, MODE_MAX);
		type game_state_t is (
			GAME_STOP, GAME_WAIT_TIMER,
			GAME_FETCHB, GAME_FETCH0, GAME_FETCH1,
			GAME_READ, GAME_WAIT, GAME_CALC);

		signal game_timer : unsigned(9 downto 0) := (others => '0');
		signal game_mode : game_mode_t := MODE_STOP;
		signal game_state : game_state_t := GAME_STOP;
		signal game_field : game_field_t := (others => (others => '0'));
		signal game_vga_line : line_t := (others => '0');
		signal game_buffer_top : line_t := (others => '0');
		signal game_buffer_mid : line_t := (others => '0');
		signal game_buffer_bot : line_t := (others => '0');
		signal game_buffer_0 : line_t := (others => '0');
		signal game_buffer_shift : std_logic := '0';
		signal game_buffer_shift_dly : std_logic := '0';
		signal game_buffer_store_0 : std_logic := '0';
		signal game_buffer_store_0_dly : std_logic := '0';
		signal game_buffer_cur_row : integer range 0 to life_rows-1 := 0;
		signal game_buffer_next_row : integer range 0 to life_rows-1 := 0;

		-- By default rules are "Conway's game of life". Born with 3 neighbours, stay alive with 2 or 3.
		signal game_rules0 : unsigned(0 to 8) := "000100000";
		signal game_rules1 : unsigned(0 to 8) := "001100000";

		signal vga_line_empty : std_logic := '0';
		signal vga_line_read : std_logic := '0';
		signal vga_line_read2 : std_logic := '0';

		-- Game field memory control. By restricting the access to the gamefield
		-- by a memory interface, it allows Quartus to synthesize Block-RAM.
		--
		signal mem_we : std_logic := '0';
		signal mem_row : integer range 0 to life_rows-1 := 0;
		signal mem_d : line_t;
		signal mem_q : line_t;
		signal mem_mouse : std_logic := '0'; -- Set when mouse update is performed

		signal run_x : std_logic;
		signal run_y : std_logic;
		signal run_column : integer range 0 to life_columns;
		signal run_row : integer range 0 to life_rows;
		signal mouse_row : integer range 0 to life_rows-1 := 0;

		signal mem_mouse_dly : std_logic := '0';
		signal mouse_left_button_dly : std_logic := '0';
	begin
		process(sysclk)
		begin
			if rising_edge(sysclk) then
				if mem_we = '1' then
					game_field(mem_row) <= mem_d;
--				else
				end if;
				mem_q <= game_field(mem_row);
			end if;
		end process;

		process(sysclk)
			variable cycle_available : boolean;
			variable life_neighbours : integer range 0 to 8;
		begin
			if rising_edge(sysclk) then
				mouse_left_button_dly <= mouse_left_button;
				vga_line_read <= '0';
				mem_we <= '0';
				mem_mouse <= '0';
				mem_mouse_dly <= mem_mouse;
				cycle_available := true;

				if mem_mouse_dly = '1' then
					-- Update playfield after mouse click
					cycle_available := false;
					mem_we <= '1';
					mem_row <= mouse_row;
					mem_d <= mem_q;
					-- Set or clear the pixel in the column that was clicked
					if mouse_left_button = '1' then
						-- Left mouse button sets the pixel under the mouse
						mem_d(to_integer(cursor_x-4)) <= '1';
					else
						-- Right mouse button clears the pixel under to mouse
						mem_d(to_integer(cursor_x-4)) <= '0';
					end if;
				elsif (mouse_trigger = '1') and ((mouse_left_button = '1') or (mouse_right_button = '1')) then
					-- Mouse button is clicked
					if (cursor_y > 3) and (cursor_y < (life_rows+4))
					and (cursor_x > 3) and (cursor_x < (life_columns+4)) then
						-- Click was inside the playfield. Perform fetch of the clicked row.
						-- The number of the row is also stored in "mouse_row" as it needs to be written
						-- back after update as the mouse might have be moved in the mean time.
						cycle_available := false;
						mem_row <= (to_integer(cursor_y)-4);
						mouse_row <= (to_integer(cursor_y)-4);
						mem_mouse <= '1';
					end if;
				elsif (vga_line_read = '0') and (vga_line_empty = '1') then
					-- Read data for VGA display
					cycle_available := false;
					mem_row <= run_row;
					vga_line_read <= '1';
				end if;

				-- Memory has 1 cycle delay after which all three line buffers
				-- (game_buffer_top, game_buffer_mid and game_buffer_bot) shift
				-- one position.
				game_buffer_shift <= '0';
				game_buffer_store_0 <= '0';
				game_buffer_shift_dly <= game_buffer_shift;
				game_buffer_store_0_dly <= game_buffer_store_0;
				if game_buffer_shift = '1' then
					game_buffer_cur_row <= game_buffer_next_row;
					game_buffer_next_row <= mem_row;
				end if;
				if game_buffer_shift_dly = '1' then
					game_buffer_top <= game_buffer_mid;
					game_buffer_mid <= game_buffer_bot;
					game_buffer_bot <= mem_q;
					if game_buffer_store_0_dly = '1' then
						-- Store line 0 as it will be overwritten and we need it
						-- for calculating the last line (world is a torus)
						game_buffer_0 <= mem_q;
					elsif game_buffer_next_row = 0 then
						-- Use line 0 stored earlier in the buffer.
						-- The first is already changed in mem, but we need
						-- the original version for calculating the last line
						-- as the world is a torus.
						game_buffer_bot <= game_buffer_0;
					end if;
				end if;


				-- Game state-machine.
				case game_state is
				when GAME_STOP =>
					game_timer <= (others => '0');
					if game_mode /= MODE_STOP then
						game_state <= GAME_WAIT_TIMER;
					end if;
				when GAME_WAIT_TIMER =>
					-- Count the time for slower speeds. Useful for testing
					-- new patterns as maximum speed is really really fast.
					if ena_1khz = '1' then
						game_timer <= game_timer + 1;
					end if;
					case game_mode is
					when MODE_STOP =>
						game_state <= GAME_STOP;
					when MODE_STEP =>
						if game_timer >= 500 then
							game_state <= GAME_FETCHB;
						end if;
					when MODE_SLOW =>
						if game_timer >= 200 then
							game_state <= GAME_FETCHB;
						end if;
					when MODE_MEDIUM =>
						if game_timer >= 50 then
							game_state <= GAME_FETCHB;
						end if;
					when MODE_FAST =>
						if game_timer >= 15 then
							game_state <= GAME_FETCHB;
						end if;
					when MODE_ULTRA =>
						if game_timer >= 5 then
							game_state <= GAME_FETCHB;
						end if;
					when MODE_MAX =>
						game_state <= GAME_FETCHB;
					end case;
				when GAME_FETCHB =>
					if cycle_available then
						-- Fetch bottom row. As the game world is a torus, the
						-- new version of the top row depends on the bottom row.
						mem_row <= life_rows-1;
						game_buffer_shift <= '1';
						game_state <= GAME_FETCH0;
					end if;
				when GAME_FETCH0 =>
					if cycle_available then
						mem_row <= 0;
						game_buffer_shift <= '1';
						game_buffer_store_0 <= '1';
						game_state <= GAME_FETCH1;
					end if;
				when GAME_FETCH1 =>
					if cycle_available then
						mem_row <= 1;
						game_buffer_shift <= '1';
						game_state <= GAME_WAIT;
					end if;
				when GAME_READ =>
					-- Perform a line read from memory until we reach
					-- line 0, which was the line we started with.
					if game_buffer_next_row = 0 then
						game_state <= GAME_STOP;
					elsif cycle_available then
						mem_row <= game_buffer_next_row + 1;
						if game_buffer_next_row = (life_rows-1) then
							-- Reached end of game world. Wrap around to top.
							mem_row <= 0;
						end if;
						game_buffer_shift <= '1';
						game_state <= GAME_WAIT;
					end if;
				when GAME_WAIT =>
					-- Wait for all memory operations to finish.
					if (game_buffer_shift = '0') and (game_buffer_shift_dly = '0') then
						game_state <= GAME_CALC;
					end if;
				when GAME_CALC =>
					if cycle_available then
						mem_we <= '1';
						mem_row <= game_buffer_cur_row;
						for i in 0 to life_columns - 1 loop
							life_neighbours := 0;
							--
							-- Count neighbours
							--
							if game_buffer_top((i-1) mod life_columns) = '1' then
								life_neighbours := life_neighbours + 1;
							end if;
							if game_buffer_top(i) = '1' then
								life_neighbours := life_neighbours + 1;
							end if;
							if game_buffer_top((i+1) mod life_columns) = '1' then
								life_neighbours := life_neighbours + 1;
							end if;

							if game_buffer_mid((i-1) mod life_columns) = '1' then
								life_neighbours := life_neighbours + 1;
							end if;
							if game_buffer_mid((i+1) mod life_columns) = '1' then
								life_neighbours := life_neighbours + 1;
							end if;

							if game_buffer_bot((i-1) mod life_columns) = '1' then
								life_neighbours := life_neighbours + 1;
							end if;
							if game_buffer_bot(i) = '1' then
								life_neighbours := life_neighbours + 1;
							end if;
							if game_buffer_bot((i+1) mod life_columns) = '1' then
								life_neighbours := life_neighbours + 1;
							end if;

							--
							-- Determine next state of the cell
							--
							if game_buffer_mid(i) = '0' then
								mem_d(i) <= game_rules0(life_neighbours);
							else
								mem_d(i) <= game_rules1(life_neighbours);
							end if;
						end loop;
						-- Uncomment next line to implement "Scroll-down-only" for testing memory accesses.
						-- mem_d <= game_buffer_top;
						game_state <= GAME_READ;
					end if;
				when others =>
					null;
				end case;
			end if;
		end process;

		--
		-- Handle clicking in speed selection menu
		process(sysclk)
		begin
			if rising_edge(sysclk) then
				if mouse_left_button = '1' then
					if (cursor_y > 24) and (cursor_y < 40) then
						if (cursor_x > (512+8)) and (cursor_x < (512+24)) then
							game_mode <= MODE_STOP;
						end if;
						if (cursor_x > (512+24)) and (cursor_x < (512+40)) then
							game_mode <= MODE_STEP;
						end if;
						if (cursor_x > (512+40)) and (cursor_x < (512+56)) then
							game_mode <= MODE_SLOW;
						end if;
						if (cursor_x > (512+56)) and (cursor_x < (512+72)) then
							game_mode <= MODE_MEDIUM;
						end if;
						if (cursor_x > (512+72)) and (cursor_x < (512+88)) then
							game_mode <= MODE_FAST;
						end if;
						if (cursor_x > (512+88)) and (cursor_x < (512+104)) then
							game_mode <= MODE_ULTRA;
						end if;
						if (cursor_x > (512+104)) and (cursor_x < (512+120)) then
							game_mode <= MODE_MAX;
						end if;
					end if;
				end if;
			end if;
		end process;

		--
		-- Draw speed selection menu
		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(currentX);
			y := signed(currentY);
			if rising_edge(sysclk) then
				vga_life_menu <= '0';
				drawtext(vga_life_menu, x, y, 512+8, 16, "SPEED");
				box(vga_life_menu, x, y, 512+1*16, 32, game_mode = MODE_STOP);
				box(vga_life_menu, x, y, 512+2*16, 32, game_mode = MODE_STEP);
				box(vga_life_menu, x, y, 512+3*16, 32, game_mode = MODE_SLOW);
				box(vga_life_menu, x, y, 512+4*16, 32, game_mode = MODE_MEDIUM);
				box(vga_life_menu, x, y, 512+5*16, 32, game_mode = MODE_FAST);
				box(vga_life_menu, x, y, 512+6*16, 32, game_mode = MODE_ULTRA);
				box(vga_life_menu, x, y, 512+7*16, 32, game_mode = MODE_MAX);
			end if;
		end process;

		--
		-- Draw rule selection menu
		process(sysclk)
			variable x : signed(11 downto 0);
			variable y : signed(11 downto 0);
		begin
			x := signed(currentX);
			y := signed(currentY);
			if rising_edge(sysclk) then
				vga_life_rules <= '0';
				drawtext(vga_life_rules, x, y, 512+8, 104, "RULES:");
				drawtext(vga_life_rules, x, y, 512+8, 112, "BORN  ALIVE");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 0*16, "0");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 1*16, "1");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 2*16, "2");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 3*16, "3");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 4*16, "4");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 5*16, "5");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 6*16, "6");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 7*16, "7");
				drawtext(vga_life_rules, x, y, 512+44, 124 + 8*16, "8");
				for r in 0 to 8 loop
					box(vga_life_rules, x, y, 512+32, 128 + r*16, game_rules0(r) = '1');
					box(vga_life_rules, x, y, 512+64, 128 + r*16, game_rules1(r) = '1');
				end loop;

				drawtext(vga_life_rules, x, y, 512+8, 416, "CONWAY'S GAME");
				drawtext(vga_life_rules, x, y, 512+8, 424, "   OF LIFE");
				drawtext(vga_life_rules, x, y, 512+8, 440, "BY PW.SOFT.");
				drawtext(vga_life_rules, x, y, 512+8, 448, "SYNTIAC.COM");
			end if;
		end process;

		--
		-- Handle clicking in rule selection menu
		process(sysclk)
		begin
			if rising_edge(sysclk) then
				if (mouse_left_button_dly = '0') and (mouse_left_button = '1') then
					for r in 0 to 8 loop
						if (cursor_x > 512+24) and (cursor_x < 512+40)
						and (cursor_y > 120+r*16) and (cursor_y < 136+r*16) then
							game_rules0(r) <= not game_rules0(r);
						end if;

						if (cursor_x > 512+56) and (cursor_x < 512+72)
						and (cursor_y > 120+r*16) and (cursor_y < 136+r*16) then
							game_rules1(r) <= not game_rules1(r);
						end if;
					end loop;
				end if;
			end if;
		end process;

		process(sysclk)
		begin
			if rising_edge(sysclk) then
				vga_line_read2 <= vga_line_read;
				if vga_line_read = '1' then
					vga_line_empty <= '0';
				end if;
				if vga_line_read2 = '1' then
					game_vga_line <= mem_q;
				end if;
				if currentX = 3 then
					run_x <= run_y;
				end if;
				if currentY = 4 then
					run_y <= '1';
					vga_line_empty <= not run_y;
				end if;
				if (run_x = '1') and (end_of_pixel = '1') then
					if run_column = life_columns then
						run_x <= '0';
						run_column <= 0;
						vga_life_background <= '0';
						vga_life_pixel <= '0';
					else
						vga_life_background <= '1';
						vga_life_pixel <= game_vga_line(run_column);
						run_column <= run_column + 1;
					end if;
				end if;
				if (run_y = '1') and (end_of_line = '1') then
					run_row <= run_row + 1;
					if run_row = (life_rows-1) then
						run_y <= '0';
						run_row <= 0;
					else
						vga_line_empty <= '1';
					end if;
				end if;
			end if;
		end process;
	end block;


-- -----------------------------------------------------------------------
-- VGA colors
-- -----------------------------------------------------------------------
	process(sysclk)
		variable x : signed(11 downto 0);
		variable y : signed(11 downto 0);
	begin
		x := signed(currentX);
		y := signed(currentY);
		if rising_edge(sysclk) then
			-- Pipelined pixel out to get some timing slack.
			red <= red_reg;
			grn <= grn_reg;
			blu <= blu_reg;
			if end_of_pixel = '1' then
				red_reg <= (others => '0');
				grn_reg <= (others => '0');
				blu_reg <= (others => '0');

			--
			-- Draw game
				if vga_life_background = '1' then
					red_reg <= "0" & (currentX(7 downto 4) xor (currentY(9 downto 8) & "10"));
					grn_reg <= "0" & (currentX(7 downto 4) xor currentY(7 downto 4));
					blu_reg <= "0" & (currentY(8 downto 5) xor (currentX(9 downto 8) & currentY(9 downto 8)));
				end if;
				if vga_life_pixel = '1' then
					red_reg <= (others => '1');
					grn_reg <= (others => '1');
					blu_reg <= (others => '1');
				end if;
				if vga_life_menu = '1' then
					red_reg <= (others => '1');
					grn_reg <= (others => '1');
					blu_reg <= (others => '1');
				end if;
				if vga_life_rules = '1' then
					red_reg <= (others => '1');
					grn_reg <= (others => '1');
					blu_reg <= (others => '1');
				end if;

			--
			-- One pixel border around the screen
				if (currentX = 0) or (currentX = 639) or (currentY =0) or (currentY = 479) then
					red_reg <= (others => '1');
					grn_reg <= (others => '1');
					blu_reg <= (others => '1');
				end if;

			--
			-- Draw mouse cursor
				if mouse_present = '1' then
					if ((abs(x - cursor_x) > 1) and (abs(x - cursor_x) < 7) and (abs(y - cursor_y) = 0))
					or ((abs(y - cursor_y) > 1) and (abs(y - cursor_y) < 7) and (abs(x - cursor_x) = 0)) then
						red_reg <= (others => '1');
						grn_reg <= (others => '1');
						blu_reg <= (others => '0');
					end if;
				end if;

			--
			-- Never draw pixels outside the visual area
				if (currentX >= 640) or (currentY >= 480) then
					red_reg <= (others => '0');
					grn_reg <= (others => '0');
					blu_reg <= (others => '0');
				end if;
			end if;
		end if;
	end process;
end architecture;
