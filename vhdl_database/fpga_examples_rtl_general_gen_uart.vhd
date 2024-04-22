-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2011 by Peter Wendrich (pwsoft@syntiac.com)
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
-- gen_uart.vhd
--
-- -----------------------------------------------------------------------
--
-- UART
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_uart is
	generic (
		bits : integer := 8;
		baud : integer;
		ticksPerUsec : integer
	);
	port (
		clk : in std_logic;

		d : in unsigned(bits-1 downto 0) := (others => '0');
		d_trigger : in std_logic := '0';
		d_empty : out std_logic;
		q : out unsigned(bits-1 downto 0);
		q_trigger : out std_logic;

		serial_rxd : in std_logic := '1';
		serial_txd : out std_logic
	);
end entity;

architecture rtl of gen_uart is
	constant ticksPerBit : integer := (1000000*ticksPerUsec) / baud;
	type state_t is (
		STATE_IDLE,
		STATE_START,
		STATE_BITS,
		STATE_LAST,
		STATE_STOP);

	signal receive_state : state_t := STATE_IDLE;
	signal receive_buffer : unsigned(bits-1 downto 0) := (others => '0');
	signal receive_shift : unsigned(bits-1 downto 0) := (others => '0');
	signal receive_cnt : integer range 0 to bits-1 := 0;
	signal receive_baud_cnt : integer range 0 to ticksPerBit := 0;

	signal transmit_state : state_t := STATE_IDLE;
	signal transmit_empty : std_logic := '1';
	signal transmit_buffer : unsigned(bits-1 downto 0) := (others => '0');
	signal transmit_shift : unsigned(bits-1 downto 0) := (others => '0');
	signal transmit_cnt : integer range 0 to bits-1 := 0;
	signal transmit_baud_cnt : integer range 0 to ticksPerBit := 0;

	signal serial_rxd_reg : std_logic := '1';
	signal serial_txd_reg : std_logic := '1';
begin
	d_empty <= transmit_empty and (not d_trigger);
	q <= receive_buffer;
	serial_txd <= serial_txd_reg;

	receive_process: process(clk)
	begin
		if rising_edge(clk) then
			serial_rxd_reg <= serial_rxd;
			q_trigger <= '0';
			case receive_state is
			when STATE_IDLE =>
				receive_cnt <= 0;
				-- start bit?
				if serial_rxd_reg = '0' then
					receive_state <= STATE_START;
					receive_baud_cnt <= ticksPerBit;
				end if;
			when STATE_START =>
				if receive_baud_cnt = 0 then
					-- Sample half-way of the bit
					receive_baud_cnt <= ticksPerBit/2;
					receive_state <= STATE_BITS;
				else
					receive_baud_cnt <= receive_baud_cnt - 1;
				end if;
			when STATE_BITS =>
				if receive_baud_cnt = 0 then
					receive_baud_cnt <= ticksPerBit;
					receive_shift(receive_cnt) <= serial_rxd_reg;
					if receive_cnt = bits-1 then
						receive_state <= STATE_LAST;
					else
						receive_cnt <= receive_cnt + 1;
					end if;
				else
					receive_baud_cnt <= receive_baud_cnt - 1;
				end if;
			when STATE_LAST =>
				q_trigger <= '1';
				receive_baud_cnt <= ticksPerBit;
				receive_buffer <= receive_shift;
				receive_state <= STATE_STOP;
			when STATE_STOP =>
				if receive_baud_cnt = 0 then
					receive_state <= STATE_IDLE;
				else
					receive_baud_cnt <= receive_baud_cnt - 1;
				end if;
			when others =>
				null;
			end case;
		end if;
	end process;

	transmit_process: process(clk)
	begin
		if rising_edge(clk) then
			case transmit_state is
			when STATE_IDLE =>
				serial_txd_reg <= '1';
				transmit_cnt <= 0;
				transmit_baud_cnt <= ticksPerBit;
				if transmit_empty = '0' then
					transmit_shift <= transmit_buffer;
					transmit_empty <= '1';
					transmit_state <= STATE_BITS;
					serial_txd_reg <= '0';
				end if;
			when STATE_BITS =>
				if transmit_baud_cnt = 0 then
					transmit_baud_cnt <= ticksPerBit;
					serial_txd_reg <= transmit_shift(transmit_cnt);
					if transmit_cnt = bits-1 then
						transmit_state <= STATE_LAST;
					else
						transmit_cnt <= transmit_cnt + 1;
					end if;
				else
					transmit_baud_cnt <= transmit_baud_cnt - 1;
				end if;
			when STATE_LAST =>
				if transmit_baud_cnt = 0 then
					transmit_baud_cnt <= ticksPerBit;
					transmit_state <= STATE_STOP;
				else
					transmit_baud_cnt <= transmit_baud_cnt - 1;
				end if;
			when STATE_STOP =>
				serial_txd_reg <= '1';
				if transmit_baud_cnt = 0 then
					transmit_state <= STATE_IDLE;
				else
					transmit_baud_cnt <= transmit_baud_cnt - 1;
				end if;
			when others =>
				null;
			end case;
			if d_trigger = '1' then
				transmit_buffer <= d;
				transmit_empty <= '0';
			end if;
		end if;
	end process;
end architecture;
