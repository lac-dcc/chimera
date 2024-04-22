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
-- A SDRAM controller to emulate the 16-bit wide code ROM.
--
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity gigatron_sdram_ctrl is
	generic (
		clk_ticks_per_usec : integer;
		refresh_period_us : integer := 64000;
		colbits : integer := 9;
		rowbits : integer := 13;
		setup_cycles : integer := 2
	);
	port (
		clk : in std_logic;
		reset : in std_logic;

	-- Parameters
		cas_latency : in unsigned(1 downto 0) := "10";
		ras_nops : in unsigned(3 downto 0) := "0001";
		write_nops : in unsigned(3 downto 0) := "0000";
		precharge_nops : in unsigned(3 downto 0) := "0001";
		refresh_nops : in unsigned(3 downto 0) := "0110";

	-- Initial ROM image load from spi-flash
		romload_req : in std_logic;
		romload_ack : out std_logic;
		romload_a : in unsigned((rowbits+colbits+2) downto 0);
		romload_d : in unsigned(7 downto 0);

	-- Reading of 16-bit ROM data from emulation
		rom_req : in std_logic;
		rom_ack : out std_logic;
		rom_a : in unsigned(15 downto 0);
		rom_q : out unsigned(15 downto 0);

	-- SDRAM interface
		ram_data : inout unsigned(15 downto 0);
		ram_addr : out unsigned((rowbits-1) downto 0);
		ram_ba : out unsigned(1 downto 0);
		ram_we : out std_logic;
		ram_ras : out std_logic;
		ram_cas : out std_logic;
		ram_ldqm : out std_logic;
		ram_udqm : out std_logic
	);
end entity;

architecture rtl of gigatron_sdram_ctrl is
	constant refresh_interval : integer := (refresh_period_us * clk_ticks_per_usec) / (2**rowbits);
	constant refresh_timer_range : integer := refresh_interval*3;

	type state_t is (
		ST_RESET,
		ST_INIT_PRECHARGE, ST_SETMODE, ST_IDLE,
		ST_LOADROM_CAS, ST_ROM_CAS, ST_ROM_DATA,
		ST_REFRESH);
	signal state_reg : state_t := ST_RESET;
	signal refresh_timer_reg : integer range 0 to refresh_timer_range := 0;

	signal timer_reg : unsigned(3 downto 0) := (others => '0');

	signal ram_oe_reg : std_logic := '0';
	signal ram_ras_reg : std_logic := '1';
	signal ram_cas_reg : std_logic := '1';
	signal ram_we_reg : std_logic := '1';
	signal ram_ba_reg : unsigned(ram_ba'range) := (others => '0');
	signal ram_data_reg : unsigned(ram_data'range) := (others => '0');
	signal ram_addr_reg : unsigned(ram_addr'range) := (others => '0');
	signal ram_ldqm_reg : std_logic := '1';
	signal ram_udqm_reg : std_logic := '1';

	signal romload_req_reg : std_logic := '0';
	signal romload_ack_reg : std_logic := '0';
	signal romload_bank : unsigned(ram_ba'range);
	signal romload_row : unsigned(ram_addr'range);
	signal romload_col : unsigned(colbits-1 downto 0);

	signal rom_req_reg : std_logic := '0';
	signal rom_ack_reg : std_logic := '0';
	signal rom_q_reg : unsigned(rom_q'range) := (others => '0');
	signal rom_bank : unsigned(ram_ba'range);
	signal rom_row : unsigned(ram_addr'range);
	signal rom_col : unsigned(colbits-1 downto 0);
begin
	romload_ack <= romload_ack_reg;
	rom_ack <= rom_ack_reg;
	rom_q <= rom_q_reg;

	ram_ras <= ram_ras_reg;
	ram_cas <= ram_cas_reg;
	ram_we <= ram_we_reg;
	ram_ba <= ram_ba_reg;
	ram_data <= ram_data_reg when ram_oe_reg = '1' else (others => 'Z');
	ram_addr <= ram_addr_reg;
	ram_ldqm <= ram_ldqm_reg;
	ram_udqm <= ram_udqm_reg;

	romload_bank <= romload_a(rowbits+colbits+2 downto rowbits+colbits+1);
	romload_row <= romload_a(rowbits+colbits downto colbits+1);
	romload_col <= romload_a(colbits downto 1);

	rom_bank <= "00";
	rom_row <= "000000" & rom_a(15 downto 9);
	rom_col <= rom_a(8 downto 0);

	process(clk)
	begin
		if rising_edge(clk) then
			ram_addr_reg <= (others => '0');
			ram_data_reg <= (others => '0');
			ram_oe_reg <= '0';
			ram_ras_reg <= '1';
			ram_cas_reg <= '1';
			ram_we_reg <= '1';
			ram_ldqm_reg <= '0';
			ram_udqm_reg <= '0';

			refresh_timer_reg <= refresh_timer_reg + 1;
			if timer_reg /= 0 then
				timer_reg <= timer_reg - 1;
			else
				case state_reg is
				when ST_RESET =>
					state_reg <= ST_INIT_PRECHARGE;
					timer_reg <= (others => '1');
				when ST_INIT_PRECHARGE =>
					ram_ras_reg <= '0';
					ram_we_reg <= '0';
					-- Precharge all banks
					ram_addr_reg(10) <= '1';
					timer_reg <= precharge_nops;
					state_reg <= ST_SETMODE;
				when ST_SETMODE =>
					ram_ras_reg <= '0';
					ram_cas_reg <= '0';
					ram_we_reg <= '0';
					ram_ba_reg <= "00";
					-- A2-A0=111 burst length, A3=0 sequential, A6-A4 cas-latency, rest reserved or default 0
					ram_addr_reg <= "0000000" & cas_latency & "0000";
					timer_reg <= to_unsigned(setup_cycles - 1, timer_reg'length);
					state_reg <= ST_IDLE;
				when ST_IDLE =>
					if romload_req /= romload_req_reg then
						romload_req_reg <= romload_req;
						ram_ras_reg <= '0';
						ram_ba_reg <= romload_bank;
						ram_addr_reg <= romload_row;
						timer_reg <= ras_nops;
						state_reg <= ST_LOADROM_CAS;
					elsif rom_req /= rom_req_reg then
						rom_req_reg <= rom_req;
						ram_ras_reg <= '0';
						ram_ba_reg <= rom_bank;
						ram_addr_reg <= rom_row;
						timer_reg <= ras_nops;
						state_reg <= ST_ROM_CAS;
					elsif refresh_timer_reg > refresh_interval then
						state_reg <= ST_REFRESH;
					end if;
				when ST_LOADROM_CAS =>
					ram_cas_reg <= '0';
					ram_we_reg <= '0';
					ram_ba_reg <= romload_bank;
					ram_addr_reg(romload_col'range) <= romload_col;
					ram_addr_reg(10) <= '1';
					ram_data_reg <= romload_d & romload_d;
					ram_oe_reg <= '1';
					ram_ldqm_reg <= romload_a(0);
					ram_udqm_reg <= not romload_a(0);
					timer_reg <= precharge_nops;
					romload_ack_reg <= romload_req_reg;
					state_reg <= ST_IDLE;
				when ST_ROM_CAS =>
					ram_cas_reg <= '0';
					ram_ba_reg <= rom_bank;
					ram_addr_reg(romload_col'range) <= rom_col;
					ram_addr_reg(10) <= '1';
					timer_reg <= "0010";
					if cas_latency = 3 then
						timer_reg <= "0011";
					end if;
					state_reg <= ST_ROM_DATA;
				when ST_ROM_DATA =>
					rom_q_reg <= ram_data;
					rom_ack_reg <= rom_req_reg;
					state_reg <= ST_IDLE;
				when ST_REFRESH =>
					refresh_timer_reg <= refresh_timer_reg - refresh_interval;
					timer_reg <= refresh_nops;
					ram_ras_reg <= '0';
					ram_cas_reg <= '0';
					state_reg <= ST_IDLE;
				end case;
			end if;
			if reset = '1' then
				state_reg <= ST_RESET;
				romload_req_reg <= romload_req;
				romload_ack_reg <= romload_req;
				rom_req_reg <= rom_req;
				rom_ack_reg <= rom_req;
			end if;
		end if;
	end process;
end architecture;
