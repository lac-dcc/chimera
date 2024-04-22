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
-- Gigatron emulator main logic file.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity gigatron_top is
	generic (
		clk_ticks_per_usec : integer;
		romload_size : integer := 131072
	);
	port (
		clk : in std_logic;
		reset : in std_logic;

		flashslot : in unsigned(4 downto 0);

	-- SPI interface
		spi_cs_n : out std_logic;
		spi_req : out std_logic;
		spi_ack : in std_logic;
		spi_d : out unsigned(7 downto 0);
		spi_q : in unsigned(7 downto 0);

	-- SDRAM interface
		ram_data : inout unsigned(15 downto 0);
		ram_addr : out unsigned(12 downto 0);
		ram_ba : out unsigned(1 downto 0);
		ram_we : out std_logic;
		ram_ras : out std_logic;
		ram_cas : out std_logic;
		ram_ldqm : out std_logic;
		ram_udqm : out std_logic;

	-- Keyboard and joystick
		ps2_keyboard_clk_in : in std_logic;
		ps2_keyboard_dat_in : in std_logic;
		ps2_keyboard_clk_out : out std_logic;
		ps2_keyboard_dat_out : out std_logic;
		joystick : in unsigned(6 downto 0);

	-- LEDs
		led_green : out std_logic;
		led_red : out std_logic;

	-- Audio
		audio : out std_logic;

	-- Video
		red : out unsigned(4 downto 0);
		grn : out unsigned(4 downto 0);
		blu : out unsigned(4 downto 0);
		hsync : out std_logic;
		vsync : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gigatron_top is
	signal romload_start : std_logic;
	signal romload_busy : std_logic;

	signal romload_req : std_logic;
	signal romload_ack : std_logic;
	signal romload_a : unsigned(24 downto 0);
	signal romload_q : unsigned(7 downto 0);

	signal rom_req : std_logic;
	signal rom_ack : std_logic;
	signal rom_a : unsigned(15 downto 0);
	signal rom_q : unsigned(15 downto 0);

	signal sram_we : std_logic;
	signal sram_a : unsigned(15 downto 0); -- Only lower 32kb connected
	signal sram_d : unsigned(7 downto 0);
	signal sram_q : unsigned(7 downto 0);

	signal inport : unsigned(7 downto 0);
	signal outport : unsigned(7 downto 0);
	signal xoutport : unsigned(7 downto 0);

	signal tick : std_logic;
begin
-- -----------------------------------------------------------------------
-- ROM loader from spi-flash into sdram
-- -----------------------------------------------------------------------
	romload_blk : block
	begin
		romload_inst : entity work.chameleon_spi_flash
			generic map (
				a_bits => 25
			)
			port map (
				clk => clk,
				slot => flashslot(3 downto 0),
				start => romload_start,

				start_addr => (others => '0'),
				flash_offset => (others => '0'),
				amount => to_unsigned(romload_size, 24),

				busy => romload_busy,

				cs_n => spi_cs_n,
				spi_req => spi_req,
				spi_ack => spi_ack,
				spi_d => spi_d,
				spi_q => spi_q,

				req => romload_req,
				ack => romload_ack,
				a => romload_a,
				q => romload_q
			);
	end block;

-- -----------------------------------------------------------------------
-- SDRAM controller (emulating 16-bit ROM)
-- -----------------------------------------------------------------------
	sdram_ctrl_inst : entity work.gigatron_sdram_ctrl
		generic map (
			clk_ticks_per_usec => clk_ticks_per_usec
		)
		port map (
			clk => clk,
			reset => reset,

		-- Parameters
			cas_latency => "10",
			ras_nops => "0001",
			write_nops => "0000",
			precharge_nops => "0001",
			refresh_nops => "0110",

		-- Initial ROM image load from spi-flash
			romload_req => romload_req,
			romload_ack => romload_ack,
			romload_a => romload_a,
			romload_d => romload_q,

		-- Reading of 16-bit ROM data from emulation
			rom_req => rom_req,
			rom_ack => rom_ack,
			rom_a => rom_a,
			rom_q => rom_q,

		-- SDRAM interface
			ram_data => ram_data,
			ram_addr => ram_addr,
			ram_ba => ram_ba,
			ram_we => ram_we,
			ram_ras => ram_ras,
			ram_cas => ram_cas,
			ram_ldqm => ram_ldqm,
			ram_udqm => ram_udqm
		);

-- -----------------------------------------------------------------------
-- 32k internal SRAM mapped to FPGA blockram
-- -----------------------------------------------------------------------
	sram_inst : entity work.gigatron_ram
		port map (
			clk => clk,

			we => sram_we,
			a => sram_a(14 downto 0),
			d => sram_d,
			q => sram_q
		);

-- -----------------------------------------------------------------------
-- Logic emulation
-- -----------------------------------------------------------------------
	logic_blk : block
	begin
		logic_inst : entity work.gigatron_logic
			port map (
				clk => clk,
				reset => reset,
				tick => tick,

				rom_req => rom_req,
				rom_a => rom_a,
				rom_q => rom_q,

				sram_we => sram_we,
				sram_a => sram_a,
				sram_d => sram_d,
				sram_q => sram_q,

				inport => inport,
				outport => outport,
				xoutport => xoutport
			);
	end block;

-- -----------------------------------------------------------------------
-- Audio
-- -----------------------------------------------------------------------
	audio_blk : block
		signal audio_unsigned : unsigned(5 downto 0);
		signal audio_signed : signed(5 downto 0);
	begin
		-- Convert from unsigned to signed (by reversing highest bit)
		-- Also /4 to reduce amplitude of output to resonable line levels.
		audio_unsigned <=
			(not xoutport(7)) & (not xoutport(7)) & (not xoutport(7)) &
			xoutport(6 downto 4);
		audio_signed <= signed(audio_unsigned);

		dac_inst : entity work.audio_sigmadelta_dac
			generic map (
				audioBits => 6
			)
			port map (
				clk => clk,
				d => audio_signed,
				q => audio
			);
	end block;

-- -----------------------------------------------------------------------
-- Keyboard/Joystick mapping
--
-- PS/2 mappings are simular to pluggy-mcplugface
--
-- Cursor -> joystick up/down/left/right
-- Page up -> start
-- Page down -> select
-- end / delete / backspace -> button A
-- home / insert -> button B
--
-- Many others generate ASCII codes that are held for 3 frames.
-- For this vsync (outport bit 7) pluses are counted.
-- -----------------------------------------------------------------------
	keyboard_blk : block
		constant ascii_frame_init : unsigned(1 downto 0) := "11";

		signal trigger : std_logic;
		signal scancode : unsigned(7 downto 0);
		signal inport_reg : unsigned(7 downto 0) := (others => '1');
		signal outport_dly : unsigned(7 downto 0) := (others => '0');

		signal ascii_reg : unsigned(7 downto 0) := (others => '0');
		signal ascii_frame_reg : unsigned(1 downto 0) := (others => '0');

		signal release_flag : std_logic := '0';
		signal extended_flag : std_logic := '0';
		signal pause_flag : std_logic := '0';

		type keys_t is record
				-- Modifiers
				shift_l : std_logic;
				shift_r : std_logic;
				ctrl : std_logic;

				curs_u : std_logic;
				curs_d : std_logic;
				curs_l : std_logic;
				curs_r : std_logic;
				pageup : std_logic;
				pagedown : std_logic;
				-- B buttons
				home : std_logic;
				insert : std_logic;
				-- A buttons
				xend : std_logic;
				del : std_logic;
				backsp : std_logic;
			end record;
		signal keys : keys_t := (others => '0');

		signal emu_joystick : unsigned(7 downto 0);
	begin
		inport <= inport_reg;

		-- First blinken-light mapped to green
		led_green <= xoutport(0);
		-- The last blinken-light mapped to red (others on PS/2 keyboard).
		-- Kinda the best we can do with the limited LEDs available.
		led_red <= xoutport(3);

		ps2_keyboard_inst : entity work.io_ps2_keyboard
			generic map (
				ticksPerUsec => clk_ticks_per_usec
			)
			port map (
				clk => clk,
				reset => reset,

				ps2_clk_in => ps2_keyboard_clk_in,
				ps2_dat_in => ps2_keyboard_dat_in,
				ps2_clk_out => ps2_keyboard_clk_out,
				ps2_dat_out => ps2_keyboard_dat_out,

				-- Map first three of the four blinken-lights to the keyboard.
				-- Fourth is mapped to the red led on the housing.
				-- Kinda the best we can do with the limited LEDs available.
				-- Also on my keyboards order is numlk, capslk, scrolllk, but that might differ distroying the "walking" effect.
				num_lock => xoutport(0),
				caps_lock => xoutport(1),
				scroll_lock => xoutport(2),

				trigger => trigger,
				scancode => scancode
			);

		process(clk)
		begin
			if rising_edge(clk) then
				outport_dly <= outport;
				if ascii_frame_reg /= 0 then
					if (outport(7) = '1') and (outport_dly(7) = '0') then
						ascii_frame_reg <= ascii_frame_reg - 1;
					end if;
				end if;

				if trigger = '1' then
					-- Handle control
					case scancode is
					when X"E0" =>
						extended_flag <= '1';
					when X"F0" =>
						release_flag <= '1';
					when others =>
						extended_flag <= '0';
						release_flag <= '0';
					end case;

					-- Process keys
					case scancode is
					when X"0E" => -- ` ~
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"60";
							else
								ascii_reg <= X"7E";
							end if;
						end if;
					when X"12" => if extended_flag = '0' then keys.shift_l <= not release_flag; end if;
					when X"14" => keys.ctrl <= not release_flag;
					when X"15" => -- Q
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"11";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"71";
							else
								ascii_reg <= X"51";
							end if;
						end if;
					when X"16" => -- 1
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"31";
							else
								ascii_reg <= X"21";
							end if;
						end if;
					when X"1A" => -- Z
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"1A";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"7A";
							else
								ascii_reg <= X"5A";
							end if;
						end if;
					when X"1B" => -- S
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"13";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"73";
							else
								ascii_reg <= X"53";
							end if;
						end if;
					when X"1C" => -- A
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"01";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"61";
							else
								ascii_reg <= X"41";
							end if;
						end if;
					when X"1D" => -- W
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"17";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"77";
							else
								ascii_reg <= X"57";
							end if;
						end if;
					when X"1E" => -- 2
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"32";
							else
								ascii_reg <= X"40";
							end if;
						end if;
					when X"21" => -- C
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"03";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"63";
							else
								ascii_reg <= X"43";
							end if;
						end if;
					when X"22" => -- X
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"18";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"78";
							else
								ascii_reg <= X"58";
							end if;
						end if;
					when X"23" => -- D
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"04";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"64";
							else
								ascii_reg <= X"44";
							end if;
						end if;
					when X"24" => -- E
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"05";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"65";
							else
								ascii_reg <= X"45";
							end if;
						end if;
					when X"25" => -- 4
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"34";
							else
								ascii_reg <= X"24";
							end if;
						end if;
					when X"26" => -- 3
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"33";
							else
								ascii_reg <= X"23";
							end if;
						end if;
					when X"29" => -- Space
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							ascii_reg <= X"20";
						end if;
					when X"2A" => -- V
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"16";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"76";
							else
								ascii_reg <= X"56";
							end if;
						end if;
					when X"2B" => -- F
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"06";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"66";
							else
								ascii_reg <= X"46";
							end if;
						end if;
					when X"2C" => -- T
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"14";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"74";
							else
								ascii_reg <= X"54";
							end if;
						end if;
					when X"2D" => -- R
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"12";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"72";
							else
								ascii_reg <= X"52";
							end if;
						end if;
					when X"2E" => -- 5
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"35";
							else
								ascii_reg <= X"25";
							end if;
						end if;
					when X"31" => -- N
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"0E";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"6E";
							else
								ascii_reg <= X"4E";
							end if;
						end if;
					when X"32" => -- B
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"02";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"62";
							else
								ascii_reg <= X"42";
							end if;
						end if;
					when X"33" => -- H
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"08";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"68";
							else
								ascii_reg <= X"48";
							end if;
						end if;
					when X"34" => -- G
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"07";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"67";
							else
								ascii_reg <= X"47";
							end if;
						end if;
					when X"35" => -- Y
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"19";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"79";
							else
								ascii_reg <= X"59";
							end if;
						end if;
					when X"36" => -- 6
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"36";
							else
								ascii_reg <= X"5E";
							end if;
						end if;
					when X"3A" => -- M
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"0D";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"6D";
							else
								ascii_reg <= X"4D";
							end if;
						end if;
					when X"3B" => -- J
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"0A";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"6A";
							else
								ascii_reg <= X"4A";
							end if;
						end if;
					when X"3C" => -- U
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"15";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"75";
							else
								ascii_reg <= X"55";
							end if;
						end if;
					when X"3D" => -- 7
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"37";
							else
								ascii_reg <= X"26";
							end if;
						end if;
					when X"3E" => -- 8
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"38";
							else
								ascii_reg <= X"2A";
							end if;
						end if;
					when X"41" => -- , <
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"2C";
							else
								ascii_reg <= X"3C";
							end if;
						end if;
					when X"42" => -- K
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"0B";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"6B";
							else
								ascii_reg <= X"4B";
							end if;
						end if;
					when X"43" => -- I
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"09";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"69";
							else
								ascii_reg <= X"49";
							end if;
						end if;
					when X"44" => -- O
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"0F";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"6F";
							else
								ascii_reg <= X"4F";
							end if;
						end if;
					when X"45" => -- 0
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"30";
							else
								ascii_reg <= X"29";
							end if;
						end if;
					when X"46" => -- 9
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"39";
							else
								ascii_reg <= X"28";
							end if;
						end if;
					when X"49" => -- . >
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"2E";
							else
								ascii_reg <= X"3E";
							end if;
						end if;
					when X"4A" => -- / ?
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"2F";
							else
								ascii_reg <= X"3F";
							end if;
						end if;
					when X"4B" => -- L
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"0C";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"6C";
							else
								ascii_reg <= X"4C";
							end if;
						end if;
					when X"4C" => -- : ;
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"3B";
							else
								ascii_reg <= X"3A";
							end if;
						end if;
					when X"4D" => -- P
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if keys.ctrl = '1' then
								ascii_reg <= X"10";
							elsif (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"70";
							else
								ascii_reg <= X"50";
							end if;
						end if;
					when X"4E" => -- - _
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"2D";
							else
								ascii_reg <= X"5F";
							end if;
						end if;
					when X"52" => -- ' "
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"27";
							else
								ascii_reg <= X"22";
							end if;
						end if;
					when X"54" => -- [ {
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"5B";
							else
								ascii_reg <= X"7B";
							end if;
						end if;
					when X"55" => -- = +
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"3D";
							else
								ascii_reg <= X"2B";
							end if;
						end if;
					when X"59" => if extended_flag = '0' then keys.shift_r <= not release_flag; end if;
					when X"5A" => -- Return
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
--							ascii_reg <= X"0D";
							ascii_reg <= X"0A";
						end if;
					when X"5B" => -- ] }
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"5D";
							else
								ascii_reg <= X"7D";
							end if;
						end if;
					when X"5D" => -- \ |
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							if (keys.shift_l or keys.shift_r) = '0' then
								ascii_reg <= X"5C";
							else
								ascii_reg <= X"7C";
							end if;
						end if;
					when X"66" => keys.backsp <= not release_flag;
					when X"69" => if extended_flag = '1' then keys.xend <= not release_flag; end if;
					when X"6B" => if extended_flag = '1' then keys.curs_l <= not release_flag; end if;
					when X"6C" => if extended_flag = '1' then keys.home <= not release_flag; end if;
					when X"70" => if extended_flag = '1' then keys.insert <= not release_flag; end if;
					when X"71" => if extended_flag = '1' then keys.del <= not release_flag; end if;
					when X"72" => if extended_flag = '1' then keys.curs_d <= not release_flag; end if;
					when X"74" => if extended_flag = '1' then keys.curs_r <= not release_flag; end if;
					when X"75" => if extended_flag = '1' then keys.curs_u <= not release_flag; end if;
					when X"76" => -- Escape
						if release_flag = '0' then
							ascii_frame_reg <= ascii_frame_init;
							ascii_reg <= X"1B";
						end if;
					when X"77" => -- Numlock / end of pause key
						if release_flag = '1' then
							pause_flag <= '0';
						end if;
					when X"7A" => if extended_flag = '1' then keys.pagedown <= not release_flag; end if;
					when X"7D" => if extended_flag = '1' then keys.pageup <= not release_flag; end if;
					when X"E1" => -- Pause key. E1 14 77 E1 F0 14 F0 77.
						pause_flag <= '1';
					when others =>
						null;
					end case;
				end if;

				if reset = '1' then
					extended_flag <= '0';
					release_flag <= '0';
					keys <= (others => '0');
				end if;
			end if;
		end process;

		-- Button A
		emu_joystick(7) <= joystick(4) and (not keys.xend) and (not keys.del) and (not keys.backsp);
		-- Button B
		emu_joystick(6) <= joystick(5) and (not keys.home) and (not keys.insert);
		-- Button select
		emu_joystick(5) <= not keys.pagedown;
		-- Button start
		emu_joystick(4) <= not keys.pageup;
		-- Direction Up
		emu_joystick(3) <= joystick(0) and (not keys.curs_u);
		-- Direction Down
		emu_joystick(2) <= joystick(1) and (not keys.curs_d);
		-- Direction Left
		emu_joystick(1) <= joystick(2) and (not keys.curs_l);
		-- Direction Right
		emu_joystick(0) <= joystick(3) and (not keys.curs_r);

		process(clk)
		begin
			if rising_edge(clk) then
				inport_reg <= emu_joystick;
				-- Give joystick priority on inport, but if nothing is held down
				-- forward ascii code for upto 3 frames.
				if (emu_joystick = X"FF") and (ascii_frame_reg /= 0) then
					inport_reg <= ascii_reg;
				end if;
			end if;
		end process;
	end block;

-- -----------------------------------------------------------------------
-- Video/Color encoding
-- -----------------------------------------------------------------------
	red <= outport(1 downto 0) & outport(1 downto 0) & outport(1);
	grn <= outport(3 downto 2) & outport(3 downto 2) & outport(3);
	blu <= outport(5 downto 4) & outport(5 downto 4) & outport(5);
	hsync <= outport(6);
	vsync <= outport(7);

-- -----------------------------------------------------------------------
-- Main statemachine
-- -----------------------------------------------------------------------
	main_blk : block
		type state_t is (
			ST_RESET, ST_WAITSLOT, ST_LOADROM, ST_RUN);
		signal state_reg : state_t := ST_RESET;
		signal romload_start_reg : std_logic := '0';
		signal tick_div_reg : unsigned(4 downto 0) := (others => '0');
		signal tick_reg : std_logic := '0';
	begin
		romload_start <= romload_start_reg;
		tick <= tick_reg;

		process(clk)
		begin
			if rising_edge(clk) then
				romload_start_reg <= '0';
				tick_reg <= '0';

				case state_reg is
				when ST_RESET =>
					state_reg <= ST_WAITSLOT;
				when ST_WAITSLOT =>
					if flashslot(4) = '1' then
						romload_start_reg <= '1';
						state_reg <= ST_LOADROM;
					end if;
				when ST_LOADROM =>
					if (romload_start_reg = '0') and (romload_busy = '0') then
						state_reg <= ST_RUN;
					end if;
				when ST_RUN =>
					if tick_div_reg = 15 then
						if rom_req = rom_ack then
							tick_div_reg <= (others => '0');
							tick_reg <= '1';
						end if;
					else
						tick_div_reg <= tick_div_reg + 1;
					end if;
				end case;
				if reset = '1' then
					state_reg <= ST_RESET;
				end if;
			end if;
		end process;
	end block;
end architecture;
