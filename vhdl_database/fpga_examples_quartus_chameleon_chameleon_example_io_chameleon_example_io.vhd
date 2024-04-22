-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2013 by Peter Wendrich (pwsoft@syntiac.com)
-- All Rights Reserved.
--
-- http://www.syntiac.com/chameleon.html
--
-- -----------------------------------------------------------------------
--
-- Turbo Chameleon 64 example toplevel demonstrating how to performing I/O
-- on the Chameleon.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity chameleon_example_io is
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

architecture rtl of chameleon_example_io is
-- System clocks
	signal sysclk : std_logic;
	signal ena_1mhz : std_logic;
	signal ena_1khz : std_logic;
	
-- System state
	signal no_clock : std_logic;
	signal docking_station : std_logic;
	signal reset : std_logic;
	signal button_reset_n : std_logic;

-- LEDs
	signal led_green : std_logic := '0';
	signal led_red : std_logic := '0';
	signal ir : std_logic;
	
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

-- Joysticks
	signal joystick1 : unsigned(5 downto 0);
	signal joystick2 : unsigned(5 downto 0);
	signal joystick3 : unsigned(5 downto 0);
	signal joystick4 : unsigned(5 downto 0);

-- C64 keyboard
	signal keys : unsigned(63 downto 0);
	signal restore_key_n : std_logic;

-- VGA
	signal end_of_pixel : std_logic;
	signal currentX : unsigned(11 downto 0);
	signal currentY : unsigned(11 downto 0);
	signal hsync : std_logic;
	signal vsync : std_logic;

	signal video_joysticks : std_logic := '0';
	signal video_keyboard : std_logic := '0';
	signal video_amiga : std_logic := '0';

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
-- Outputs
-- -----------------------------------------------------------------------
	nHSync <= not hsync;
	nVSync <= not vsync;

-- -----------------------------------------------------------------------
-- PLL
-- -----------------------------------------------------------------------
	myPLL : entity work.pll8
		port map (
			inclk0 => clk8,
			c0 => sysclk,
			locked => open
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
-- Reset
-- -----------------------------------------------------------------------
	myReset : entity work.gen_reset
		generic map (
			resetCycles => 131071
		)
		port map (
			clk => sysclk,
			enable => '1',

			button => '0',
			reset => reset
		);

-- -----------------------------------------------------------------------
--
-- The I/O driving entity. The actual thing this example is about ;-)
--
-- -----------------------------------------------------------------------
	myIO : entity work.chameleon_io
		generic map (
			enable_docking_station => true,
			enable_cdtv_remote => true,
			enable_c64_joykeyb => true,
			enable_c64_4player => true
		)
		port map (
		-- Clocks
			clk => sysclk,
			clk_mux => sysclk,
			ena_1mhz => ena_1mhz,
			reset => reset,
			
			no_clock => no_clock,
			docking_station => docking_station,
			
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
			button_reset_n => button_reset_n,

		-- Joysticks
			joystick1(joystick1'range) => joystick1,
			joystick2(joystick2'range) => joystick2,
			joystick3(joystick3'range) => joystick3,
			joystick4(joystick4'range) => joystick4,

		-- Keyboards
			keys => keys,
			restore_key_n => restore_key_n
			
		);

-- -----------------------------------------------------------------------
-- Flash the LEDs
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
	-- process(sysclk) is
		-- variable x : signed(11 downto 0);
		-- variable y : signed(11 downto 0);
	-- begin
		-- x := signed(currentX);
		-- y := signed(currentY);
		-- if rising_edge(sysclk) then
			-- video_amiga <= '0';
			-- box(video_amiga, x, y, 144 + 9*16, 288, docking_amiga_reset_n);
			-- for i in 0 to 7 loop
				-- box(video_amiga, x, y, 144 + i*16, 288, docking_amiga_scancode(7-i));
			-- end loop;
		-- end if;
	-- end process;

-- -----------------------------------------------------------------------
-- Show state of joysticks (docking-station or C64)
-- -----------------------------------------------------------------------
	process(sysclk) is
		variable x : signed(11 downto 0);
		variable y : signed(11 downto 0);
		variable joysticks : unsigned(23 downto 0);
	begin
		x := signed(currentX);
		y := signed(currentY);
		if rising_edge(sysclk) then
			joysticks := joystick4 & joystick3 & joystick2 & joystick1;
			video_joysticks <= '0';
			for i in 0 to 23 loop
				if (abs(x - (144 + (i+i/6)*16)) < 5) and (abs(y - 320) < 5) and (joysticks(23-i) = '1') then
					video_joysticks <= '1';
				elsif (abs(x - (144 + (i+i/6)*16)) = 5) and (abs(y - 320) < 5) then
					video_joysticks <= '1';
				elsif (abs(x - (144 + (i+i/6)*16)) < 5) and (abs(y - 320) = 5) then
					video_joysticks <= '1';
				end if;
			end loop;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Show state of C64 keyboard (docking-station or C64)
-- -----------------------------------------------------------------------
	process(sysclk) is
		variable x : signed(11 downto 0);
		variable y : signed(11 downto 0);
	begin
		x := signed(currentX);
		y := signed(currentY);
		if rising_edge(sysclk) then
			video_keyboard <= '0';
			for row in 0 to 7 loop
				for col in 0 to 7 loop
					box(video_keyboard, x, y, 144 + col*16, 352 + row*16, keys(row*8 + col));
				end loop;
			end loop;
			box(video_keyboard, x, y, 144 + 9*16, 352, restore_key_n);
		end if;
	end process;

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

				if (abs(x - 128) < 7) and (abs(y - 64) < 7) and (button_reset_n = '0') then
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

				if video_joysticks = '1'
				or video_keyboard = '1'
				or video_amiga = '1' then
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

end architecture;

