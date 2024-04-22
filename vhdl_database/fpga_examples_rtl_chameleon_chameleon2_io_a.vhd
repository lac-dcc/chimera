-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2019 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

architecture rtl of chameleon2_io is
-- Clocks
	signal no_clock_loc : std_logic;
	signal phi : std_logic;
	signal end_of_phi_0 : std_logic;
	signal end_of_phi_1 : std_logic;

-- I/O entity internal C64 bus
	signal c64_cs_loc : std_logic;
	signal c64_cs_roms_loc : std_logic;
	signal c64_cs_vicii_loc : std_logic;
	signal c64_cs_clockport_loc : std_logic;
	signal c64_we_loc : std_logic;
	signal c64_a_loc : unsigned(15 downto 0);
	signal c64_d_loc : unsigned(7 downto 0);
	signal c64_q_loc : unsigned(7 downto 0);

-- C64 joystick/keyboard
	signal c64_joystick1 : unsigned(6 downto 0);
	signal c64_joystick2 : unsigned(6 downto 0);
	signal c64_joystick3 : unsigned(6 downto 0);
	signal c64_joystick4 : unsigned(6 downto 0);
	signal c64_keys : unsigned(63 downto 0);

-- CDTV remote
	signal ir_up : std_logic := '0';
	signal ir_down : std_logic := '0';
	signal ir_left : std_logic := '0';
	signal ir_right : std_logic := '0';
	signal ir_f1 : std_logic := '0';
	signal ir_f2 : std_logic := '0';
	signal ir_f3 : std_logic := '0';
	signal ir_f4 : std_logic := '0';
	signal ir_f5 : std_logic := '0';
	signal ir_f6 : std_logic := '0';
	signal ir_f7 : std_logic := '0';
	signal ir_f8 : std_logic := '0';
	signal ir_space : std_logic := '0';
	signal ir_enter : std_logic := '0';
	signal ir_left_button : std_logic := '0';
	signal ir_middle_button : std_logic := '0';
	signal ir_right_button : std_logic := '0';
	signal ir_arrowleft : std_logic := '0';
	signal ir_y : std_logic := '0';
	signal ir_n : std_logic := '0';
	signal ir_runstop : std_logic := '0';
	signal ir_keys : unsigned(63 downto 0);
	signal ir_joystick1 : unsigned(6 downto 0) := (others => '1');
	signal ir_joystick2 : unsigned(6 downto 0) := (others => '1');

-- Docking-station
	signal docking_station_loc : std_logic;
	signal docking_version_loc : std_logic;
	signal docking_joystick1 : unsigned(6 downto 0);
	signal docking_joystick2 : unsigned(6 downto 0);
	signal docking_joystick3 : unsigned(6 downto 0);
	signal docking_joystick4 : unsigned(6 downto 0);
	signal docking_keys : unsigned(63 downto 0);
	signal docking_amiga_reset_n : std_logic;
	signal docking_amiga_scancode : unsigned(7 downto 0);
begin
	no_clock <= no_clock_loc;
	docking_station <= docking_station_loc;
	docking_version <= docking_version_loc;

	phi_out <= phi;
	phi_end_0 <= end_of_phi_0;
	phi_end_1 <= end_of_phi_1;
	--
	c64_q <= c64_q_loc;
	--
	joystick1 <= docking_joystick1 and ir_joystick1 and c64_joystick1;
	joystick2 <= docking_joystick2 and ir_joystick2 and c64_joystick2;
	joystick3 <= docking_joystick3 and c64_joystick3;
	joystick4 <= docking_joystick4 and c64_joystick4;
	keys <= docking_keys and c64_keys and ir_keys;

	midi_rxd <= ba_in or (not docking_station_loc) or (not docking_version_loc);

-- -----------------------------------------------------------------------
-- PHI2 clock sync
-- -----------------------------------------------------------------------
	phiInstance : entity work.chameleon_phi_clock
		generic map (
			phase_shift => 8
		)
		port map (
			clk => clk,
			phi2_n => phi2_n,
			mode => phi_mode,

			no_clock => no_clock_loc,
			docking_station => docking_station_loc,

			phiLocal => phi,
			phiCnt => phi_cnt,
			phiPreHalf => end_of_phi_0,
			phiPreEnd => end_of_phi_1,
			phiPost1 => phi_post_1,
			phiPost2 => phi_post_2,
			phiPost3 => phi_post_3,
			phiPost4 => phi_post_4
		);

-- -----------------------------------------------------------------------
-- Docking-station
-- To enable set enable_docking_station to true.
-- -----------------------------------------------------------------------
	genDockingStation : if enable_docking_station generate
		myDockingStation : entity work.chameleon_docking_station
			port map (
				clk => clk,

				docking_station => docking_station_loc,
				docking_version => docking_version_loc,

				dotclock_n => dotclock_n,
				io_ef_n => ioef,
				rom_lh_n => romlh,
				irq_q => docking_irq,

				joystick1 => docking_joystick1,
				joystick2 => docking_joystick2,
				joystick3 => docking_joystick3,
				joystick4 => docking_joystick4,
				keys => docking_keys,
				restore_key_n => restore_key_n,

				amiga_power_led => amiga_power_led,
				amiga_drive_led => amiga_drive_led,
				amiga_reset_n => amiga_reset_n,
				amiga_trigger => amiga_trigger,
				amiga_scancode => amiga_scancode
			);
	end generate;

	noDockingStation : if not enable_docking_station generate
		docking_version <= '0';
		docking_joystick1 <= (others => '1');
		docking_joystick2 <= (others => '1');
		docking_joystick3 <= (others => '1');
		docking_joystick4 <= (others => '1');
		docking_keys <= (others => '1');
	end generate;

-- -----------------------------------------------------------------------
-- CDTV remote support
-- To enable set enable_cdtv_remote to true.
-- -----------------------------------------------------------------------
	genCdtvRemote : if enable_cdtv_remote generate
		myCdtvRemote : entity work.chameleon_cdtv_remote
			port map (
				clk => clk,
				ena_1mhz => ena_1mhz,
				ir => ir_data,

				key_1 => ir_f1,
				key_2 => ir_f2,
				key_3 => ir_f3,
				key_4 => ir_f4,
				key_5 => ir_f5,
				key_6 => ir_f6,
				key_7 => ir_f7,
				key_8 => ir_f8,
				key_9 => ir_runstop,
				key_0 => ir_space,
				key_escape => ir_arrowleft,
				key_enter => ir_enter,
				key_genlock => ir_left_button,
				key_cdtv => ir_middle_button,
				key_power => ir_right_button,
				key_rew => ir_left,
				key_play => ir_up,
				key_ff => ir_right,
				key_stop => ir_down,
				key_vol_up => ir_y,
				key_vol_dn => ir_n,

				joystick_a => ir_joystick1(5 downto 0),
				joystick_b => ir_joystick2(5 downto 0)
			);

			-- IR remote doesn't have thrid fire button
			ir_joystick1(6) <= '1';
			ir_joystick2(6) <= '1';

			ir_keys <= (not ir_runstop) & "11" & (not ir_n) & "111" & (not (ir_up or ir_down)) &
					"1111111" & (not (ir_f5 or ir_f6)) &
					"1111111" & (not (ir_f3 or ir_f4)) &
					(not ir_space) & (not (ir_left or ir_up or ir_f2 or ir_f4 or ir_f6 or ir_f8)) & "11111" & (not (ir_f1 or ir_f2)) &
					"1111111" & (not (ir_f7 or ir_f8)) &
					"1111111" & (not (ir_left or ir_right)) &
					(not ir_arrowleft) & "111" & (not ir_y) & "11" & (not ir_enter) &
					"11111111";
	end generate;

	noCdtvRemote : if not enable_cdtv_remote generate
		ir_keys <= (others => '1');
		ir_joystick1 <= (others => '1');
		ir_joystick2 <= (others => '1');
	end generate;

-- -----------------------------------------------------------------------
-- C64 keyboard and joystick support
-- To enable set enable_c64_joykeyb to true.
-- -----------------------------------------------------------------------
	c64_joykeyb_gen : if enable_c64_joykeyb generate
		c64_joykeyb_blk : block
			signal c64_kb_cs_reg : std_logic := '0';
			signal c64_kb_req : std_logic := '0';
			signal c64_kb_ack : std_logic := '0';
			signal c64_kb_we : std_logic := '0';
			signal c64_kb_a : unsigned(15 downto 0);
			signal c64_kb_d : unsigned(7 downto 0);
			signal c64_kb_q : unsigned(7 downto 0);
		begin
			c64_joykeyb_inst : entity work.chameleon_c64_joykeyb
				generic map (
					enable_4player => enable_c64_4player
				)
				port map (
					clk => clk,
					ena_1mhz => ena_1mhz,
					no_clock => no_clock_loc,
					reset => reset,

					ba => ba_in,
					req => c64_kb_req,
					ack => c64_kb_ack,
					we => c64_kb_we,
					a => c64_kb_a,
					d => c64_kb_d,
					q => c64_kb_q,

					joystick1 => c64_joystick1,
					joystick2 => c64_joystick2,
					joystick3 => c64_joystick3,
					joystick4 => c64_joystick4,
					keys => c64_keys
				);

			process(clk)
			begin
				if rising_edge(clk) then
					if end_of_phi_1 = '1' then
						c64_kb_cs_reg <= '0';
						if c64_kb_req /= c64_kb_ack then
							if c64_kb_cs_reg = '1' then
								-- C64 bus transaction finished
								c64_kb_ack <= c64_kb_req;
							else
								-- Start new C64 bus transaction
								c64_kb_cs_reg <= '1';
							end if;
						end if;
					end if;
				end if;
			end process;

			c64_cs_loc <= c64_kb_cs_reg;
			c64_cs_roms_loc <= '0';
			c64_cs_vicii_loc <= '0';
			c64_cs_clockport_loc <= '0';
			c64_we_loc <= c64_kb_we;
			c64_a_loc <= c64_kb_a;
			c64_d_loc <= c64_kb_q;
			c64_kb_d <= c64_q_loc;
		end block;
	end generate;

	no_c64_joykeyb_gen : if not enable_c64_joykeyb generate
		c64_joystick1 <= (others => '1');
		c64_joystick2 <= (others => '1');
		c64_joystick3 <= (others => '1');
		c64_joystick4 <= (others => '1');
		c64_keys <= (others => '1');

		c64_cs_loc <= c64_cs;
		c64_cs_roms_loc <= c64_cs_roms;
		c64_cs_vicii_loc <= c64_cs_vicii;
		c64_cs_clockport_loc <= c64_cs_clockport;
		c64_we_loc <= c64_we;
		c64_a_loc <= c64_a;
		c64_d_loc <= c64_d;
	end generate;

-- -----------------------------------------------------------------------
-- Cartridge port and C64 bus control
-- -----------------------------------------------------------------------
	c64_bus_blk : block
		constant dir_fr_c64 : std_logic := '0';
		constant dir_to_c64 : std_logic := '1';

		type state_t is (
			BUS_RESET,
			BUS_WAIT_PHI0,
			BUS0_00, BUS0_01, BUS0_02, BUS0_03,
			BUS0_04, BUS0_05, BUS0_06, BUS0_07, BUS0_08,
			BUS0_09, BUS0_0A, --BUS0_0B, BUS0_0C, BUS0_0D, BUS0_0E, BUS0_0F,
			BUS_WAIT_PHI1,
			BUS1_00, BUS1_01, BUS1_02, BUS1_03, BUS1_04, BUS1_05);

		signal state_reg : state_t := BUS_RESET;
		--signal exrom_out_reg : std_logic := '0';
		signal clock_ior_reg : std_logic := '1';
		signal clock_iow_reg : std_logic := '1';

		signal game_out_reg : std_logic := '1';
		signal rw_out_reg : std_logic := '0';

		signal sa_dir_reg : std_logic := '1';
		signal sa_oe_reg : std_logic := '1';
		signal sa15_out_reg : std_logic := '0';

		signal low_a_oe_reg : std_logic := '0';
		signal low_a_reg : unsigned(15 downto 0) := (others => '0');

		signal sd_dir_reg : std_logic := '1';
		signal sd_oe_reg : std_logic := '1';
		signal low_d_inp_reg : unsigned(7 downto 0) := (others => '0');
		signal low_d_oe_reg : std_logic := '0';
		signal low_d_out_reg : unsigned(7 downto 0) := (others => '0');

		signal c64_q_reg : unsigned(c64_q'range) := (others => '1');

	begin
		process(clk)
		begin
			if rising_edge(clk) then
				low_d_inp_reg <= low_d;
				case state_reg is
				when BUS_RESET =>
					clock_ior_reg <= '1';
					clock_iow_reg <= '1';
					game_out_reg <= '1';
					rw_out_reg <= '0';
					sa_oe_reg <= '1';
					sa15_out_reg <= '0';
					sd_oe_reg <= '1';
					low_a_oe_reg <= '0';
					low_d_oe_reg <= '0';
					if reset = '0' then
						state_reg <= BUS_WAIT_PHI0;
					end if;
				when BUS_WAIT_PHI0 =>
					c64_q_reg <= low_d_inp_reg;
					if phi = '0' then
						state_reg <= BUS0_00;
					else
						if c64_cs_vicii_loc = '1' then
							low_d_out_reg <= c64_d_loc;
						end if;
					end if;
				when BUS0_00 =>
					state_reg <= BUS0_01;
				when BUS0_01 =>
					game_out_reg <= '1';
					low_a_reg(15) <= '0';
					clock_ior_reg <= '1';
					clock_iow_reg <= '1';
					state_reg <= BUS0_02;
				when BUS0_02 =>
					state_reg <= BUS0_03;
				when BUS0_03 =>
					low_a_oe_reg <= '0';
					rw_out_reg <= '0';
					sa_oe_reg <= '1';
					state_reg <= BUS0_04;
				when BUS0_04 =>
					sa15_out_reg <= '1';
					state_reg <= BUS0_05;
				when BUS0_05 =>
					state_reg <= BUS0_06;
				when BUS0_06 =>
					state_reg <= BUS0_07;
				when BUS0_07 =>
					state_reg <= BUS0_08;
				when BUS0_08 =>
					state_reg <= BUS0_09;
				when BUS0_09 =>
					sd_dir_reg <= dir_to_c64;
					state_reg <= BUS0_0A;
				when BUS0_0A =>
					low_d_oe_reg <= '1';
					sd_oe_reg <= '0';
					state_reg <= BUS_WAIT_PHI1;
				--	state_reg <=
				-- when BUS0_04 => state_reg <= BUS0_05;
				-- when BUS0_05 => state_reg <= BUS0_06;
				-- when BUS0_06 => state_reg <= BUS0_07;
				-- when BUS0_07 => state_reg <= BUS0_08;
				-- when BUS0_08 => state_reg <= BUS0_09;
				-- when BUS0_09 => state_reg <= BUS0_0A;
				-- when BUS0_0A => state_reg <= BUS0_0B;
				-- when BUS0_0B => state_reg <= BUS0_0C;
				-- when BUS0_0C => state_reg <= BUS0_0D;
				-- when BUS0_0D => state_reg <= BUS0_0E;
				-- when BUS0_0E => state_reg <= BUS0_0F;
				-- when BUS0_0F =>
					-- state_reg <= BUS_WAIT_PHI1;
				when BUS_WAIT_PHI1 =>
					low_d_out_reg <= c64_vicii_data;
					if phi = '1' then
						state_reg <= BUS1_00;
					end if;
				when BUS1_00 =>
					state_reg <= BUS1_01;
				when BUS1_01 =>
					state_reg <= BUS1_02;
				when BUS1_02 =>
					sa_dir_reg <= dir_to_c64;
					rw_out_reg <= c64_we_loc and c64_cs_loc;
					if (c64_cs_loc = '1') and (c64_cs_vicii_loc = '0') then
						sa15_out_reg <= '0';
						low_a_oe_reg <= '1';
					end if;
					if ((c64_cs_loc and c64_we_loc) = '0') and (c64_cs_vicii_loc = '0') then
						low_d_oe_reg <= '0';
						sd_oe_reg <= '1';
					end if;

					-- For reading ROMs the GAME line need to be high (game_out_reg low as driver inverts).
					game_out_reg <= '1';
					if c64_cs_roms_loc = '1' then
						game_out_reg <= '0';
					end if;

					low_a_reg <= "0" & c64_a_loc(14 downto 0);
					low_d_out_reg <= c64_d_loc;
					state_reg <= BUS1_03;
				when BUS1_03 =>
					if (c64_cs_loc = '1') and (c64_cs_vicii_loc = '0') then
						sa_oe_reg <= '0';
					end if;
					if c64_cs_vicii_loc = '1' then
						sa15_out_reg <= '1';
					end if;
					low_a_reg <= "0" & c64_a_loc(14 downto 0);
					low_d_out_reg <= c64_d_loc;
					state_reg <= BUS1_04;
				when BUS1_04 =>
					sd_dir_reg <= dir_fr_c64;
					if ((c64_cs_loc and c64_we_loc) or c64_cs_vicii_loc) = '1' then
						sd_dir_reg <= dir_to_c64;
						low_d_oe_reg <= '1';
					end if;
					low_a_reg <= "0" & c64_a_loc(14 downto 0);
					low_d_out_reg <= c64_d_loc;
					state_reg <= BUS1_05;
				when BUS1_05 =>
					sd_oe_reg <= '0';
					if c64_cs_clockport_loc = '1' then
						clock_ior_reg <= c64_we_loc;
						clock_iow_reg <= not c64_we_loc;
					end if;
					low_a_reg <= c64_a_loc(15 downto 0);
					low_d_out_reg <= c64_d_loc;
					state_reg <= BUS_WAIT_PHI0;
				end case;

				if (no_clock_loc = '1') and (docking_station_loc = '1') and (docking_version_loc = '1') then
					-- GAME line is MIDI out on docking-station V2
					game_out_reg <= not midi_txd;
				end if;
			end if;
		end process;

		clock_ior <= clock_ior_reg;
		clock_iow <= clock_iow_reg;

		dma_out <= '1';
		exrom_out <= '0';
		game_out <= game_out_reg;
		rw_out <= rw_out_reg;

		sa_dir <= sa_dir_reg;
		sa_oe <= sa_oe_reg;
		sa15_out <= sa15_out_reg;
		low_a <= low_a_reg when low_a_oe_reg = '1' else (others => 'Z');

		sd_dir <= sd_dir_reg;
		sd_oe <= sd_oe_reg;
		low_d <= low_d_out_reg when low_d_oe_reg = '1' else (others => 'Z');

		c64_q_loc <= c64_q_reg;
	end block;
end architecture;
