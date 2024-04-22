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
--
-- Chameleon timing and I/O driver. Handles all the timing and multiplexing
-- details of the cartridge port for the Chameleon second edition.
--   - Detects the type of mode the chameleon is running in.
--   - Multiplexes the PS/2 keyboard and mouse signals.
--   - Gives access to joysticks and keyboard on a C64 in cartridge mode.
--   - Gives access to joysticks and keyboard on a docking-station
--   - Gives access to MMC card and serial-flash through
--   - Drives the two LEDs on the Chameleon (or an optional Amiga keyboard).
--   - Can optionally give access to the IEC bus
--   - Can optionally give access to other C64 resources like the SID.
--
-- -----------------------------------------------------------------------
-- enable_docking_station - Enable support for the docking-station.
-- enable_cdtv_remove     - Enable support for the cdtv remote. CDTV will
--                          be mapped to first two joysticks and the "keys"
--                          array when set to true. Otherwise the raw ir signal
--                          is also available for external decoding.
-- enable_c64_joykeyb     - Automatically read joystick and keyboard on the C64 bus.
--                          Take note this disables the C64 bus access feature
--                          on this entity (c64_* inputs).
-- enable_c64_4player     - Enable 4player support on the user-port of the C64.
--                          The flag enable_c64_joykeyb must be true for this to work.
-- -----------------------------------------------------------------------
-- clk             - system clock
-- ena_1mhz        - Enable must be '1' one clk cycle each 1 Mhz.
-- phi2_n          - PHI2 clock from the cartridge port (inverted on Chameleon)
-- dotclock_n      - Dotclock from the cartridge port (inverted on Chameleon)
--
-- reset           - Perform a reset of the subsystems. Should be high directly at
--                   start and stay high for a while to give soft PLL time to
--                   lock to phi2_n (in cartridge mode).
--
-- ir_data         - Data from IR-eye for decoding the CDTV remote signals
-- ioef            - Combined IO_E and IO_F from the cartridge port
-- romlh           - Combined ROML and ROMH from the cartridge port
-- dma_out         - Drives DMA line, when high pulls DMA signal low
-- rw_out          - Drives R/W line, when high pulls R/W signal low.
--
-- sa_dir
-- sa_oe
-- sa15_out
-- low_a
-- sd_dir
-- sd_oe
-- low_d
--
-- no_clock        - '0' when connected to C64 cartridge port.
--                   '1' when in standalone mode or docking-station connected.
-- docking_station - '0' standalone/cartrdige mode
--                   '1' when docking-station is connected.
-- docking_version - '0' first version, supports 2 fire buttons on each port
--                   '1' second version, 3 fire buttons on each port and midi in/out
--
-- joystick*       - Joystick ports of both docking-station and C64.
--                   Bits: fire3, fire2, fire1, right, left, down, up
--                   The C64 only supports one button fire1. The signals are low active
--
-- keys            - C64 keyboard. One bit for each key on the keyboard. Low active.
--          63..56 -  RUN/S   /     ,     N    V    X     LSHFT     UPDN
--          55..48 -  Q       ^     @     O    U    T     E         F5
--          47..40 -  C=                                            F3
--          39..32 -  SPACE   RSHFT                                 F1
--          31..24 -  2       HOME  -                               F7
--          23..16 -  CTRL    ;                                     LEFT/RIGHT
--          15.. 8 -                                                Return
--           7.. 0 -  1             +                               Inst/Del
-- restore_key_n   - Trigger for restore key on docking-station.
--                   On a C64 the restore key is wired to the NMI line instead.
--
-- midi_txd        - Midi transmit data ('1' at rest, '0' drives output)
-- midi_rxd        - Midi receive data ('1' at rest, '0' when current flows through opto)
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon2_io is
	generic (
		enable_docking_station : boolean := true;
		enable_cdtv_remote : boolean := false;
		enable_c64_joykeyb : boolean := false;
		enable_c64_4player : boolean := false
	);
	port (
-- Clocks
		clk : in std_logic;
		ena_1mhz : in std_logic;
		phi2_n : in std_logic;
		dotclock_n : in std_logic;

-- Control
		reset : in std_logic;

-- Toplevel signals
		ir_data : in std_logic;

		clock_ior : out std_logic;
		clock_iow : out std_logic;

		ioef : in std_logic;
		romlh : in std_logic;

		dma_out : out std_logic;
		game_out : out std_logic;
		exrom_out : out std_logic;

		ba_in : in std_logic;
--		rw_in : in std_logic;
		rw_out : out std_logic;

		sa_dir : out std_logic;
		sa_oe : out std_logic;
		sa15_out : out std_logic;
		low_a : inout unsigned(15 downto 0);

		sd_dir : out std_logic;
		sd_oe : out std_logic;
		low_d : inout unsigned(7 downto 0);

-- Config
		no_clock : out std_logic;
		docking_station : out std_logic;
		docking_version : out std_logic;
		docking_irq : out std_logic;

-- C64 timing (only for C64 related cores)
		phi_mode : in std_logic := '0';
		phi_out : out std_logic;
		phi_cnt : out unsigned(7 downto 0);
		phi_end_0 : out std_logic;
		phi_end_1 : out std_logic;
		phi_post_1 : out std_logic;
		phi_post_2 : out std_logic;
		phi_post_3 : out std_logic;
		phi_post_4 : out std_logic;

-- C64 bus (only for C64 related cores)
		c64_vicii_data : in unsigned(7 downto 0) := (others => '1');
		c64_cs : in std_logic := '0';
		c64_cs_roms : in std_logic := '0';
		c64_cs_vicii : in std_logic := '0';
		c64_cs_clockport : in std_logic := '0';
		c64_we : in std_logic := '0';
		c64_a : in unsigned(15 downto 0) := (others => '0');
		c64_d : in unsigned(7 downto 0) := (others => '1');
		c64_q : out unsigned(7 downto 0);

-- Joysticks
		joystick1 : out unsigned(6 downto 0);
		joystick2 : out unsigned(6 downto 0);
		joystick3 : out unsigned(6 downto 0);
		joystick4 : out unsigned(6 downto 0);

-- Keyboards
		--  0 = col0, row0
		--  1 = col1, row0
		--  8 = col0, row1
		-- 63 = col7, row7
		keys : out unsigned(63 downto 0);
		restore_key_n : out std_logic;
		amiga_power_led : in std_logic := '0';
		amiga_drive_led : in std_logic := '0';
		amiga_reset_n : out std_logic;
		amiga_trigger : out std_logic;
		amiga_scancode : out unsigned(7 downto 0);

-- MIDI (only available on Docking-station V2)
		midi_txd : in std_logic := '1';
		midi_rxd : out std_logic
	);
end entity;
