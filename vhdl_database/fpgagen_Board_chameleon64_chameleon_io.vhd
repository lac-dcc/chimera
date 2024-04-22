-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2013 by Peter Wendrich (pwsoft@syntiac.com)
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
-- For better understanding what this entity does in detail, please refer
-- to the Chameleon core-developers manual. It has documentation about
-- the CPLD MUX, signal timing, docking-station protocol and the cartridge port access.
--
-- Chameleon timing and I/O driver. Handles all the timing and multiplexing
-- details of the cartridge port and the CPLD mux.
--   - Detects the type of mode the chameleon is running in.
--   - Multiplexes the PS/2 keyboard and mouse signals.
--   - Gives access to joysticks and keyboard on a C64 in cartridge mode.
--   - Gives access to joysticks and keyboard on a docking-station
--   - Gives access to MMC card and serial-flash through the CPLD MUX.
--   - Drives the two LEDs on the Chameleon (or an optional Amiga keyboard).
--   - Can optionally give access to the IEC bus
--   - Can optionally give access to other C64 resources like the SID.
--
-- -----------------------------------------------------------------------
-- enable_docking_station - Enable support for the docking-station.
-- enable_c64_joykeyb     - Automatically read joystick and keyboard on the C64 bus.
--                          Take note this disables the C64 bus access feature on this entity.
-- enable_c64_4player     - Enable 4player support on the user-port of the C64.
--                          The flag enable_c64_joykeyb must be true for this to work.
-- enable_raw_spi         - SPI controller inside this entity is switched off.
--                          And the actual SPI lines are exposed. The maximum speed is limited
--                          as the signals are time multiplexed. The maximum spi speed usable
--                          is around 1/12 of clk. (One line transition each 6 clk cycles)
-- enable_iec_access      - Enables support for the IEC bus on the break-out cable.
--                          Set this to 'false' when the IEC bus is not used to save some logic.
-- -----------------------------------------------------------------------
-- clk             - system clock
-- ena_1mhz        - Enable must be '1' one clk cycle each 1 Mhz.
-- reset           - Perform a reset of the subsystems
-- reset_ext       - Hardware reset from the cartridge-port (eg. a C64 reset button)
--
-- no_clock        - '0' when connected to C64 cartridge port.
--                   '1' when in standalone mode or docking-station connected.
-- docking_station - '0' standalone/cartrdige mode
--                   '1' when docking-station is connected.
--
-- to_usb_rx
--
-- The following timing signals are only useful when writing C64 related designs.
-- They can be left unconnected in all other FPGA designs.
-- phi_mode        - Selects timing in standalone mode ('0' is PAL, '1' is NTSC).
-- phi_out         - Regenerated or synthesized phi2 clock.
-- phi_cnt         - Counting the system-clock cycles within one phi2 cycle.
-- phi_end_0       - The half of the cycle where phi_out is low ends.
-- phi_end_1       - The half of the cycle where phi_out is high ends.
-- phi_post_1      - Triggers when phi changes
-- phi_post_2      - Triggers one cycle after phi changed
-- phi_post_3      - Triggers two cycles phi changed
-- phi_post_4      - Triggers three cycles phi changed
--
-- c64_irq_n       - Status of the C64 IRQ line (cartridge mode only)
-- c64_nmi_n       - Status of the C64 NMI line
-- c64_ba          - status of the C64 BA line
--
-- The following signals should be synchronised to the phi_out signal
-- c64_vic         - When set data on c64_d is send to the VIC-II chip.
-- c64_cs          - When set it accesses the C64 databus (uses Ultimax mode, no memory is mapped)
-- c64_cs_roms     - Enables access to the C64 Kernal and Basic ROMs (disables Ultimax mode)
-- c64_clockport   - When set it accesses the clockport.
-- c64_we          - Access is a write when set (note polarity is the inverse of R/W on cartridge port)
-- c64_a           - C64 address bus
-- c64_d           - Data to the C64
-- c64_q           - Data from the C64 (only valid when phi_end_1 is set)
--
-- spi_speed       - 0 SPI bus runs at slow speed (250 Kbit), SPI bus runs at fast speed (8 Mbit)
-- spi_req         - Toggle to request SPI transfer.
-- spi_ack         - Is made equal to spi_req after transfer is complete.
-- spi_d           - Data input into SPI controller.
-- spi_q           - Data output from SPI controller.
--
-- led_green       - Control the green LED (0 off, 1 on). Also power LED on Amiga keyboard.
-- led_red         - Control the red LED (0 off, 1 on). Also drive LED on Amiga keyboard.
-- ir              - ir signal. Input for the chameleon_cdtv_remote entity.
--
-- ps2_*           - PS2 signals for both keyboard and mouse.
-- button_reset_n  - Status of blue reset button (right button) on the Chameleon. Low active.
-- joystick*       - Joystick ports of both docking-station and C64.  Bits: fire2, fire1, right, left, down, up
--                   The C64 only supports one button fire1. The signals are low active
-- keys            - C64 keyboard. One bit for each key on the keyboard. Low active.
-- restore_key_n   - Trigger for restore key on docking-station.
--                   On a C64 the restore key is wired to the NMI line instead.
-- iec_*           - IEC signals. Only valid when enable_iec_access is set to true.
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_io is
	generic (
		enable_docking_station : boolean := true;
		enable_c64_joykeyb : boolean := false;
		enable_c64_4player : boolean := false;
		enable_raw_spi : boolean := false;
		enable_iec_access : boolean := false
	);
	port (
-- Clocks
		clk : in std_logic;
		clk_mux : in std_logic;
		ena_1mhz : in std_logic;
		reset : in std_logic;
		reset_ext : out std_logic;

-- Config
		no_clock : out std_logic;
		docking_station : out std_logic;

-- Chameleon FPGA pins
		-- C64 Clocks
		phi2_n : in std_logic;
		dotclock_n : in std_logic;
		-- C64 cartridge control lines
		io_ef_n : in std_logic;
		rom_lh_n : in std_logic;
		-- SPI bus
		spi_miso : in std_logic;
		-- CPLD multiplexer
		mux_clk : out std_logic;
		mux : out unsigned(3 downto 0);
		mux_d : out unsigned(3 downto 0);
		mux_q : in unsigned(3 downto 0);

-- USB microcontroller (To RX of micro)
		to_usb_rx : in std_logic := '1';

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

-- C64 bus
		c64_irq_n : out std_logic;
		c64_nmi_n : out std_logic;
		c64_ba : out std_logic;

		c64_vic : in std_logic := '0';
		c64_cs : in std_logic := '0';
		c64_cs_roms : in std_logic := '0';
		c64_clockport : in std_logic := '0';
		c64_we : in std_logic := '0';
		c64_a : in unsigned(15 downto 0) := (others => '0');
		c64_d : in unsigned(7 downto 0) := (others => '1');
		c64_q : out unsigned(7 downto 0);

-- SPI chip-selects
		mmc_cs_n : in std_logic := '1';
		flash_cs_n : in std_logic := '1';
		rtc_cs : in std_logic := '0';

-- SPI controller (enable_raw_spi must be set to false)
		spi_speed : in std_logic := '1';
		spi_req : in std_logic := '0';
		spi_ack : out std_logic;
		spi_d : in unsigned(7 downto 0) := (others => '-');
		spi_q : out unsigned(7 downto 0);

-- SPI raw signals (enable_raw_spi must be set to true)
		spi_raw_clk : in std_logic := '1';
		spi_raw_mosi : in std_logic := '1';
		spi_raw_ack : out std_logic;  -- Added by AMR
		
-- LEDs
		led_green : in std_logic := '0';
		led_red : in std_logic := '0';
		ir : out std_logic;

-- PS/2 Keyboard
		ps2_keyboard_clk_out: in std_logic := '1';
		ps2_keyboard_dat_out: in std_logic := '1';
		ps2_keyboard_clk_in: out std_logic;
		ps2_keyboard_dat_in: out std_logic;

-- PS/2 Mouse
		ps2_mouse_clk_out: in std_logic := '1';
		ps2_mouse_dat_out: in std_logic := '1';
		ps2_mouse_clk_in: out std_logic;
		ps2_mouse_dat_in: out std_logic;

-- Buttons
		button_reset_n : out std_logic;
		
-- Joysticks
		joystick1 : out unsigned(5 downto 0);
		joystick2 : out unsigned(5 downto 0);
		joystick3 : out unsigned(5 downto 0);
		joystick4 : out unsigned(5 downto 0);

-- Keyboards
		--  0 = col0, row0
		--  1 = col1, row0
		--  8 = col0, row1
		-- 63 = col7, row7
		keys : out unsigned(63 downto 0);
		restore_key_n : out std_logic;
		amiga_reset_n : out std_logic;
		amiga_trigger : out std_logic;
		amiga_scancode : out unsigned(7 downto 0);

-- IEC bus
		iec_clk_out : in std_logic := '1';
		iec_dat_out : in std_logic := '1';
		iec_atn_out : in std_logic := '1';
		iec_srq_out : in std_logic := '1';
		iec_clk_in : out std_logic;
		iec_dat_in : out std_logic;
		iec_atn_in : out std_logic;
		iec_srq_in : out std_logic
	);
end entity;
-- -----------------------------------------------------------------------

architecture rtl of chameleon_io is
-- Clocks
	signal no_clock_loc : std_logic;
	signal phi : std_logic;
	signal end_of_phi_0 : std_logic;
	signal end_of_phi_1 : std_logic;
	
-- State
	signal reset_pending : std_logic := '0';
	signal reset_in : std_logic := '0';

-- MUX
	type muxstate_t is (
		-- Reset phase
		MUX_RESET,
		-- MMC
		MUX_MMC0L, MUX_MMC0H, MUX_MMC1L, MUX_MMC1H, MUX_MMC2L, MUX_MMC2H, MUX_MMC3L, MUX_MMC3H,
		MUX_MMC4L, MUX_MMC4H, MUX_MMC5L, MUX_MMC5H, MUX_MMC6L, MUX_MMC6H, MUX_MMC7L, MUX_MMC7H,
		-- IEC
		MUX_IEC1, MUX_IEC2, MUX_IEC3, MUX_IEC4,
		-- PS2
		MUX_PS2,
		-- LED
		MUX_LED,
		-- PHI=0
		MUX_WAIT0,
		MUX_A3_C, MUX_BUSVIC,
		MUX_D0VIC, MUX_D1VIC,
		MUX_NMIIRQ1, MUX_NMIIRQ2,
		MUX_ULTIMAX,
		MUX_END0,
		-- PHI=1
		MUX_WAIT1,
		MUX_BUS, MUX_CLKPORT,
		MUX_A0, MUX_A1, MUX_A2, MUX_A3,
		MUX_D0WR, MUX_D1WR, MUX_D0WR_1, MUX_D1WR_1, MUX_D0WR_2, MUX_D1WR_2,
		MUX_D0RD_1, MUX_D1RD_1, MUX_D0RD_2, MUX_D1RD_2
	);
	signal mux_state : muxstate_t;
	signal mux_toggle : std_logic := '0';

	signal mux_c128_timeout : unsigned(7 downto 0) := (others => '1');
	signal mux_clk_reg : std_logic := '0';
	signal mux_d_reg : unsigned(mux_d'range) := X"F";
	signal mux_reg : unsigned(mux'range) := X"F";
	signal mux_d_mmc : unsigned(1 downto 0) := "11";

-- C64 bus
	signal c64_reset_reg : std_logic := '0';
	signal c64_ba_reg : std_logic := '1';
	signal c64_data_reg : unsigned(7 downto 0) := (others => '1');
	signal c64_addr : unsigned(15 downto 0) := (others => '0');
	signal c64_to_io : unsigned(7 downto 0) := (others => '0');
	
	signal c64_we_loc : std_logic := '0';
	signal c64_vic_loc : std_logic := '0';
	signal c64_cs_loc : std_logic := '0';
	signal c64_roms_loc : std_logic := '0';
	signal c64_clockport_loc : std_logic := '0';
	
-- C64 joystick/keyboard
	signal c64_kb_req : std_logic := '0';
	signal c64_kb_ack : std_logic := '0';
	signal c64_kb_we : std_logic := '1';
	signal c64_kb_a : unsigned(15 downto 0) := (others => '0');
	signal c64_kb_q : unsigned(7 downto 0) := (others => '1');
	signal c64_joystick1 : unsigned(5 downto 0);
	signal c64_joystick2 : unsigned(5 downto 0);
	signal c64_joystick3 : unsigned(5 downto 0);
	signal c64_joystick4 : unsigned(5 downto 0);
	signal c64_keys : unsigned(63 downto 0);

-- Docking-station
	signal docking_station_loc : std_logic;
	signal docking_irq : std_logic;
	signal docking_joystick1 : unsigned(5 downto 0);
	signal docking_joystick2 : unsigned(5 downto 0);
	signal docking_joystick3 : unsigned(5 downto 0);
	signal docking_joystick4 : unsigned(5 downto 0);
	signal docking_keys : unsigned(63 downto 0);
	signal docking_amiga_reset_n : std_logic;
	signal docking_amiga_scancode : unsigned(7 downto 0);

-- MMC
	signal mmc_state : unsigned(5 downto 0) := (others => '0');
	signal spi_q_reg : unsigned(7 downto 0) := (others => '1');
	signal spi_run : std_logic := '0';
	signal spi_sample : std_logic := '0';
	signal mmc_shift_req : std_logic;
	signal mmc_shift_ack : std_logic := '0';

-- IEC
	signal iec_clk_reg : std_logic := '1';
	signal iec_dat_reg : std_logic := '1';
	signal iec_atn_reg : std_logic := '1';
	signal iec_srq_reg : std_logic := '1';
begin
	reset_ext <= reset_in;
	no_clock <= no_clock_loc;
	docking_station <= docking_station_loc;
	--
	phi_out <= phi;
	phi_end_0 <= end_of_phi_0;
	phi_end_1 <= end_of_phi_1;
	--
	c64_ba <= c64_ba_reg;
	c64_q <= c64_data_reg;
	--
	spi_q <= spi_q_reg;
	--
	joystick1 <= docking_joystick1 and (c64_joystick1);
	joystick2 <= docking_joystick2 and (c64_joystick2);
	joystick3 <= docking_joystick3 and (c64_joystick3);
	joystick4 <= docking_joystick4 and (c64_joystick4);
	keys <= docking_keys and c64_keys;

-- -----------------------------------------------------------------------
-- PHI2 clock sync
-- -----------------------------------------------------------------------
	phiInstance : entity work.chameleon_phi_clock
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
				
				dotclock_n => dotclock_n,
				io_ef_n => io_ef_n,
				rom_lh_n => rom_lh_n,
				irq_q => docking_irq,
				
				joystick1 => docking_joystick1,
				joystick2 => docking_joystick2,
				joystick3 => docking_joystick3,
				joystick4 => docking_joystick4,
				keys => docking_keys,
				restore_key_n => restore_key_n,
				
				amiga_power_led => led_green,
				amiga_drive_led => led_red,
				amiga_reset_n => amiga_reset_n,
				amiga_trigger => amiga_trigger,
				amiga_scancode => amiga_scancode
			);
	end generate;

	noDockingStation : if not enable_docking_station generate
		docking_joystick1 <= (others => '1');
		docking_joystick2 <= (others => '1');
		docking_joystick3 <= (others => '1');
		docking_joystick4 <= (others => '1');
		docking_keys <= (others => '1');
	end generate;

-- -----------------------------------------------------------------------
-- C64 keyboard and joystick support
-- To enable set enable_c64_joykeyb to true.
-- -----------------------------------------------------------------------
	genC64JoyKeyb : if enable_c64_joykeyb generate
		myC64JoyKeyb : entity work.chameleon_c64_joykeyb
			generic map (
				enable_4player => enable_c64_4player
			)
			port map (
				clk => clk,
				ena_1mhz => ena_1mhz,
				no_clock => no_clock_loc,
				reset => reset,
				
				ba => c64_ba_reg,
				req => c64_kb_req,
				ack => c64_kb_ack,
				we => c64_kb_we,
				a => c64_kb_a,
				d => c64_data_reg,
				q => c64_kb_q,
				
				joystick1 => c64_joystick1,
				joystick2 => c64_joystick2,
				joystick3 => c64_joystick3,
				joystick4 => c64_joystick4,
				keys => c64_keys
			);

		c64_addr <= c64_kb_a;
		c64_to_io <= c64_kb_q;
		c64_vic_loc <= '0';
		c64_roms_loc <= '0';
		c64_clockport_loc <= '0';
		c64_we_loc <= c64_kb_we;

		process(clk)
		begin
			if rising_edge(clk) then
				if end_of_phi_1 = '1' then
					c64_cs_loc <= '0';
					if c64_kb_req /= c64_kb_ack then
						if c64_cs_loc = '1' then
							c64_kb_ack <= c64_kb_req;
						else
							c64_cs_loc <= '1';
						end if;
					end if;
				end if;
			end if;
		end process;
	end generate;
	
	noC64JoyKeyb : if not enable_c64_joykeyb generate
		c64_joystick1 <= (others => '1');
		c64_joystick2 <= (others => '1');
		c64_joystick3 <= (others => '1');
		c64_joystick4 <= (others => '1');
		c64_keys <= (others => '1');
		
		c64_addr <= c64_a;
		c64_to_io <= c64_d;

		c64_vic_loc <= c64_vic;
		c64_cs_loc <= c64_cs;
		c64_roms_loc <= c64_cs_roms;
		c64_clockport_loc <= c64_clockport;
		c64_we_loc <= c64_we;
	end generate;

-- -----------------------------------------------------------------------
-- MUX CPLD
-- -----------------------------------------------------------------------
	-- MUX clock
	process(clk_mux)
	begin
		if rising_edge(clk_mux) then
			mux_clk_reg <= not mux_clk_reg;
		end if;
	end process;

	-- MUX sequence
	process(clk_mux)
	begin
		if rising_edge(clk_mux) then
			if mux_clk_reg = '1' then
				mux_toggle <= not mux_toggle;
				case mux_state is
				when MUX_RESET   =>
					if phi = '1' then
						mux_state <= MUX_WAIT0;
					end if;
-- PHI2  0
				when MUX_WAIT0   =>
					if phi = '0' then
						mux_state <= MUX_MMC0L;
						if mux_c128_timeout /= 0 then
							mux_c128_timeout <= mux_c128_timeout - 1;
						end if;
					end if;
				when MUX_MMC0L   => mux_state <= MUX_A3_C;
				when MUX_A3_C    => mux_state <= MUX_ULTIMAX;
				when MUX_ULTIMAX => mux_state <= MUX_MMC0H;
				when MUX_MMC0H   => mux_state <= MUX_BUSVIC;
				when MUX_BUSVIC  => mux_state <= MUX_IEC1;
				when MUX_IEC1    => mux_state <= MUX_MMC1L;
				when MUX_MMC1L   => mux_state <= MUX_PS2;
				when MUX_PS2     => mux_state <= MUX_A2;
				when MUX_A2      => mux_state <= MUX_MMC1H;
				when MUX_MMC1H   => mux_state <= MUX_NMIIRQ1;
				when MUX_NMIIRQ1 => mux_state <= MUX_LED;
				when MUX_LED     => mux_state <= MUX_MMC2L;
				when MUX_MMC2L   => mux_state <= MUX_A0;
				when MUX_A0      => mux_state <= MUX_IEC4;
				when MUX_IEC4    => mux_state <= MUX_MMC2H;
				when MUX_MMC2H   => mux_state <= MUX_A1;
				when MUX_A1      => mux_state <= MUX_D0VIC;
				when MUX_D0VIC   => mux_state <= MUX_D1VIC;
				when MUX_D1VIC   => mux_state <= MUX_MMC3L;
				when MUX_MMC3L   => mux_state <= MUX_IEC3;
				when MUX_IEC3    => mux_state <= MUX_MMC3H;
				when MUX_MMC3H   => mux_state <= MUX_END0;
				when MUX_END0    => mux_state <= MUX_WAIT1;
-- PHI2  1
				when MUX_WAIT1 =>
					if phi = '1' then
						mux_state <= MUX_MMC4L;
					end if;
				when MUX_MMC4L   => mux_state <= MUX_BUS;
				when MUX_BUS     => mux_state <= MUX_D0WR;
				when MUX_D0WR    => mux_state <= MUX_D1WR;
				when MUX_D1WR    => mux_state <= MUX_MMC4H;
				when MUX_MMC4H   => mux_state <= MUX_A3;
				when MUX_A3      => mux_state <= MUX_CLKPORT;
				when MUX_CLKPORT => mux_state <= MUX_MMC5L;
				when MUX_MMC5L   => mux_state <= MUX_NMIIRQ2;
				when MUX_NMIIRQ2 => mux_state <= MUX_MMC5H;
				when MUX_MMC5H   => mux_state <= MUX_D0WR_1;
				when MUX_D0WR_1  => mux_state <= MUX_D1WR_1;
				when MUX_D1WR_1  => mux_state <= MUX_MMC6L;
				when MUX_MMC6L   => mux_state <= MUX_IEC2;
				when MUX_IEC2    => mux_state <= MUX_MMC6H;
				--when MUX_LED     => mux_state <= MUX_MMC6H;
				when MUX_MMC6H   => mux_state <= MUX_D0WR_2;
				when MUX_D0WR_2  => mux_state <= MUX_D1WR_2;
				when MUX_D1WR_2  => mux_state <= MUX_MMC7L;
				when MUX_MMC7L   => mux_state <= MUX_D0RD_1;
				when MUX_D0RD_1  => mux_state <= MUX_D1RD_1;
				when MUX_D1RD_1  => mux_state <= MUX_MMC7H;
				when MUX_MMC7H   => mux_state <= MUX_D0RD_2;
				when MUX_D0RD_2  => mux_state <= MUX_D1RD_2;
				when MUX_D1RD_2  => mux_state <= MUX_WAIT0;
				end case;
			end if;
			if reset = '1' then
				mux_c128_timeout <= (others => '1');
-- 				system_wait <= '1';
			end if;
		end if;
	end process;

	-- MUX read
	process(clk_mux)
	begin
		if rising_edge(clk_mux) then
			if mux_clk_reg = '1' then
				case mux_reg is
				when X"0" =>
					c64_data_reg(3 downto 0) <= mux_q;
				when X"1" =>
					c64_data_reg(7 downto 4) <= mux_q;
				when X"6" =>
					c64_reset_reg <= not mux_q(0);
					c64_irq_n <= mux_q(2);
					c64_nmi_n <= mux_q(3);
					reset_pending <= reset or c64_reset_reg;
					if reset_pending = '0' then
						reset_in <= c64_reset_reg;
					else
						reset_in <= '0';
					end if;
					if no_clock_loc = '1' then
						c64_irq_n <= '1';
					end if;
				when X"7" =>
					c64_ba_reg <= mux_q(1);
					if no_clock_loc = '1' then
						c64_ba_reg <= '1';
					end if;
				when X"B" =>
					button_reset_n <= mux_q(1);
					ir <= mux_q(3);
				when X"D" =>
					iec_dat_reg <= mux_q(0);
					iec_clk_reg <= mux_q(1);
					iec_srq_reg <= mux_q(2);
					iec_atn_reg <= mux_q(3);
				when X"E" =>
					ps2_keyboard_dat_in <= mux_q(0);
					ps2_keyboard_clk_in <= mux_q(1);
					ps2_mouse_dat_in <= mux_q(2);
					ps2_mouse_clk_in <= mux_q(3);
				when others =>
					null;
				end case;
				if spi_sample = '1' then
					spi_q_reg <= spi_q_reg(6 downto 0) & spi_miso;
				end if;
			end if;
			iec_dat_in <= iec_dat_reg;
			iec_clk_in <= iec_clk_reg;
			iec_srq_in <= iec_srq_reg;
			iec_atn_in <= iec_atn_reg;
		end if;
	end process;

	-- MUX write
	process(clk_mux)
	begin
		if rising_edge(clk_mux) then
			spi_raw_ack <= '0';
			if mux_clk_reg = '1' then
				spi_sample <= '0';
				case mux_state is
--
-- RESET
				when MUX_RESET =>
					mux_d_reg <= (others => '-');
					mux_reg <= X"F";
--
-- MMC
				when MUX_MMC0L =>
					-- Remember current state for lowspeed transfer.
					-- Register is accessed another 15 times in
					-- system cycle, but should not be updated when running on 250khz speed.
					mux_d_mmc(0) <= mmc_state(1) or (not mmc_state(5));
					mux_d_mmc(1) <= spi_d(7 - to_integer(mmc_state(4 downto 2)));
					-- Update register
					mux_d_reg(0) <= mmc_state(1) or (not mmc_state(5));
					mux_d_reg(1) <= spi_d(7 - to_integer(mmc_state(4 downto 2)));
					mux_d_reg(2) <= mmc_cs_n; 
					mux_d_reg(3) <= to_usb_rx;
					mux_reg <= X"C";
					if mmc_state(5) = '1' then
						if spi_speed = '0' then
							-- Slow speed. Only toggle once in two cycles
							mmc_state <= mmc_state + "000001";
							if mmc_state(1 downto 0) = "11" then
								spi_sample <= '1';
							end if;
						else
							-- Fast speed. Toggle 16 times in a cycle
							mmc_state <= mmc_state + "000010";
							if mmc_state(1) = '1' then
								spi_sample <= '1';
							end if;
						end if;
					end if;
					if enable_raw_spi then
						mux_d_reg(0) <= spi_raw_clk;
						mux_d_reg(1) <= spi_raw_mosi;
						mux_d_reg(2) <= mmc_cs_n; 
						mux_d_reg(3) <= to_usb_rx;
						mux_reg <= X"C";
						spi_raw_ack <= '1';
					end if;
				when MUX_MMC1L | MUX_MMC2L | MUX_MMC3L
				   | MUX_MMC4L | MUX_MMC5L | MUX_MMC6L | MUX_MMC7L =>
					mux_d_reg(0) <= mux_d_mmc(0);
					mux_d_reg(1) <= mux_d_mmc(1);
					mux_d_reg(2) <= mmc_cs_n; 
					mux_d_reg(3) <= to_usb_rx;
					mux_reg <= X"C";
					-- Only update register on when running at fast speed (8Mhz).
					if (mmc_state(5) = '1') and (spi_speed = '1') then
						mux_d_reg(0) <= mmc_state(1);
						mux_d_reg(1) <= spi_d(7 - to_integer(mmc_state(4 downto 2)));
						-- Fast speed. Toggle 16 times in a cycle
						mmc_state <= mmc_state + "000010";
						if mmc_state(1) = '1' then
							spi_sample <= '1';
						end if;
					end if;
					if enable_raw_spi then
						mux_d_reg(0) <= spi_raw_clk;
						mux_d_reg(1) <= spi_raw_mosi;
						mux_d_reg(2) <= mmc_cs_n;
						mux_d_reg(3) <= to_usb_rx;
						mux_reg <= X"C";
						spi_raw_ack <= '1';
					end if;

				when MUX_MMC0H | MUX_MMC1H | MUX_MMC2H | MUX_MMC3H
				   | MUX_MMC4H | MUX_MMC5H | MUX_MMC6H | MUX_MMC7H =>
					mux_d_reg(0) <= mux_d_mmc(0);
					mux_d_reg(1) <= mux_d_mmc(1);
					mux_d_reg(2) <= mmc_cs_n;
					mux_d_reg(3) <= to_usb_rx;
					mux_reg <= X"C";
					if (mmc_state(5) = '1') and (spi_speed = '1') then
						-- Only update register on when running at fast speed (8Mhz).
						mux_d_reg(0) <= mmc_state(1);
						mux_d_reg(1) <= spi_d(7 - to_integer(mmc_state(4 downto 2)));
						-- Fast speed. Toggle 16 times in a cycle
						mmc_state <= mmc_state + "000010";
						if mmc_state(1) = '1' then
							spi_sample <= '1';
						end if;
					elsif enable_iec_access then
						-- When MMC transfer is not pending use some of the MMC cycles for IEC transfers.
						mux_d_reg(0) <= iec_dat_out;
						mux_d_reg(1) <= iec_clk_out;
						mux_d_reg(2) <= iec_srq_out;
						mux_d_reg(3) <= iec_atn_out;
						mux_reg <= X"D";
					end if;
					if enable_raw_spi then
						mux_d_reg(0) <= spi_raw_clk;
						mux_d_reg(1) <= spi_raw_mosi;
						mux_d_reg(2) <= mmc_cs_n;
						mux_d_reg(3) <= to_usb_rx;
						mux_reg <= X"C";
						spi_raw_ack <= '1';
					end if;
				when MUX_NMIIRQ1 | MUX_NMIIRQ2=>
					mux_d_reg <= "110" & (not reset);
					mux_reg <= X"6";
					if docking_station_loc = '1' then
						mux_d_reg(2) <= docking_irq;
					end if;
--
-- IEC
				when MUX_IEC1 | MUX_IEC2 | MUX_IEC3 | MUX_IEC4 =>
					mux_d_reg(0) <= iec_dat_out;
					mux_d_reg(1) <= iec_clk_out;
					mux_d_reg(2) <= iec_srq_out;
					mux_d_reg(3) <= iec_atn_out;
					mux_reg <= X"D";
--
-- USART, LEDs and IR
				when MUX_LED =>
					mux_d_reg <= flash_cs_n & rtc_cs & led_green & led_red;
					mux_reg <= X"B";
--
-- PS2
				when MUX_PS2 =>
					mux_d_reg(0) <= ps2_keyboard_dat_out;
					mux_d_reg(1) <= ps2_keyboard_clk_out;
					mux_d_reg(2) <= ps2_mouse_dat_out;
					mux_d_reg(3) <= ps2_mouse_clk_out;
					mux_reg <= X"E";
--
-- WAITS
				when MUX_WAIT0 =>
					if spi_req /= spi_run then
						spi_run <= spi_req;
						mmc_state <= "100000";
					end if;
					-- Use dead time to do IEC reads/writes
					mux_d_reg(0) <= iec_dat_out;
					mux_d_reg(1) <= iec_clk_out;
					mux_d_reg(2) <= iec_srq_out;
					mux_d_reg(3) <= iec_atn_out;
					mux_reg <= X"D";
					if enable_raw_spi then
						mux_d_reg(0) <= spi_raw_clk;
						mux_d_reg(1) <= spi_raw_mosi;
						mux_d_reg(2) <= mmc_cs_n;
						mux_d_reg(3) <= to_usb_rx;
						mux_reg <= X"C";
						spi_raw_ack <= '1';
					end if;
				when MUX_WAIT1 =>
					-- Continue BUSVIC output at end of phi2=0, so we sample BA a few times.
					mux_d_reg <= "0101";
					if docking_station_loc = '1' then
						mux_d_reg <= "1111";
					end if;
					mux_reg <= X"7";
					-- Toggle between SPI/IEC and updating BUSVIC.
					if mux_toggle = '1' then
						if enable_iec_access then
							mux_d_reg(0) <= iec_dat_out;
							mux_d_reg(1) <= iec_clk_out;
							mux_d_reg(2) <= iec_srq_out;
							mux_d_reg(3) <= iec_atn_out;
							mux_reg <= X"D";
						end if;
						if enable_raw_spi then
							mux_d_reg(0) <= spi_raw_clk;
							mux_d_reg(1) <= spi_raw_mosi;
							mux_d_reg(2) <= mmc_cs_n;
							mux_d_reg(3) <= to_usb_rx;
							mux_reg <= X"C";
							spi_raw_ack <= '1';
						end if;
					end if;
--
-- PHI2  0
				when MUX_A3_C =>
					mux_d_reg <= X"C";
					mux_reg <= X"5";
				when MUX_BUSVIC =>
					mux_d_reg <= "0101";
					if docking_station_loc = '1' then
						mux_d_reg <= "1111";
					end if;
					mux_reg <= X"7";
				when MUX_ULTIMAX =>
					mux_d_reg <= "1011";
					mux_reg <= X"8";
				when MUX_D0VIC =>
					mux_d_reg <= c64_to_io(3 downto 0);
					mux_reg <= X"0";
				when MUX_D1VIC =>
					mux_d_reg <= c64_to_io(7 downto 4);
					mux_reg <= X"1";
				when MUX_END0 =>
					mux_d_reg <= "0111";
					if docking_station_loc = '1' then
						mux_d_reg <= "1111";
					end if;
					mux_reg <= X"7";
--
-- PHI2  1
				when MUX_A0 =>
					mux_d_reg <= c64_addr(3 downto 0);
					mux_reg <= X"2";
				when MUX_A1 =>
					mux_d_reg <= c64_addr(7 downto 4);
					mux_reg <= X"3";
				when MUX_A2 =>
					mux_d_reg <= c64_addr(11 downto 8);
					mux_reg <= X"4";
				when MUX_BUS =>
					if c64_vic_loc = '0' then
						if c64_cs_loc = '1' then
							mux_d_reg <= "00" & (not c64_we_loc) & (not c64_we_loc);
							mux_reg <= X"7";
						end if;
					else
						-- A15..12 driven, A11..0 not driven, Data driven, no write.
						mux_d_reg <= "0101";
						mux_reg <= X"7";
					end if;
				when MUX_CLKPORT =>
					-- GAME = low unless accessing roms
					mux_d_reg <= "1" & c64_roms_loc & "11";
					if c64_clockport_loc = '1' then
						if c64_we_loc = '0' then
							-- Clockport read
							mux_d_reg <= "1010";
						else
							-- Clockport write
							mux_d_reg <= "1001";
						end if;
					end if;
					mux_reg <= X"8";
				when MUX_A3 =>
					if c64_vic_loc = '0' then
						if c64_cs_loc = '1' then
							mux_d_reg <= c64_addr(15 downto 12);
							mux_reg <= X"5";
						end if;
					end if;
--				when MUX_D0WR | MUX_D0WR_1 | MUX_D0WR_2 =>
				when MUX_D0WR | MUX_D0WR_1 | MUX_D0WR_2 | MUX_D0RD_1 | MUX_D0RD_2 =>
					mux_d_reg <= c64_to_io(3 downto 0);
					mux_reg <= X"0";
--				when MUX_D1WR | MUX_D1WR_1 | MUX_D1WR_2 =>
				when MUX_D1WR | MUX_D1WR_1 | MUX_D1WR_2 | MUX_D1RD_1 | MUX_D1RD_2 =>
					mux_d_reg <= c64_to_io(7 downto 4);
					mux_reg <= X"1";
				when others =>
					null;
				end case;
			end if;
		end if;
	end process;

	process(clk_mux)
	begin
		if rising_edge(clk_mux) then
			if mmc_state(5) = '0' then
				spi_ack <= spi_run;
			end if;
		end if;
	end process;

	mux_clk <= mux_clk_reg;
	mux_d <= mux_d_reg;
	mux <= mux_reg;
end architecture;
