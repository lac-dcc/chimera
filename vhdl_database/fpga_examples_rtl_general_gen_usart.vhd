-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2010 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/?.html
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
-- gen_usart.vhd
--
-- -----------------------------------------------------------------------
--
-- USART - Synchronous serial receiver/transmitter
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_usart is
	generic (
		bits : integer := 8
	);
	port (
		clk : in std_logic;

		d : in unsigned(bits-1 downto 0) := (others => '0');
		d_trigger : in std_logic := '0';
		d_empty : out std_logic;
		q : out unsigned(bits-1 downto 0);
		q_trigger : out std_logic;

		serial_clk : in std_logic;
		serial_rxd : in std_logic := '1';
		serial_txd : out std_logic;
		serial_cts_n : in std_logic := '0'
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_usart is
	type state_t is (
		STATE_IDLE,
		STATE_BITS,
		STATE_STOP);
	signal serial_clk_reg : std_logic := '0';
	signal serial_clk_dly : std_logic := '0';
	signal receive_state : state_t := STATE_IDLE;
	signal receive_shift : unsigned(bits-1 downto 0) := (others => '0');
	signal receive_cnt : integer range 0 to bits-1 := 0;

	signal transmit_state : state_t := STATE_IDLE;
	signal transmit_empty : std_logic := '1';
	signal transmit_buffer : unsigned(bits-1 downto 0) := (others => '0');
	signal transmit_shift : unsigned(bits-1 downto 0) := (others => '0');
	signal transmit_cnt : integer range 0 to bits-1 := 0;
begin
	d_empty <= transmit_empty and (not d_trigger);

	process(clk)
	begin
		if rising_edge(clk) then
			serial_clk_reg <= serial_clk;
			serial_clk_dly <= serial_clk_reg;
		end if;
	end process;

	receive_process: process(clk)
	begin
		if rising_edge(clk) then
			q_trigger <= '0';
			-- Detect rising edge
			if (serial_clk_reg = '1') and (serial_clk_dly = '0') then
				case receive_state is
				when STATE_IDLE =>
					receive_cnt <= 0;
					if serial_rxd = '0' then
						receive_state <= STATE_BITS;
					end if;
				when STATE_BITS =>
					receive_shift <= serial_rxd & receive_shift(receive_shift'high downto 1);
					if receive_cnt = bits-1 then
						receive_state <= STATE_STOP;
					else
						receive_cnt <= receive_cnt + 1;
					end if;
				when STATE_STOP =>
					receive_state <= STATE_IDLE;
					if serial_rxd = '1' then
						q <= receive_shift;
						q_trigger <= '1';
					end if;
				end case;
			end if;
		end if;
	end process;
	
	transmit_process: process(clk)
	begin
		if rising_edge(clk) then
			-- Detect falling edge
			if (serial_clk_reg = '0') and (serial_clk_dly = '1') then
				case transmit_state is
				when STATE_IDLE =>
					transmit_cnt <= 0;
					if (transmit_empty = '0') and (serial_cts_n = '0') then
						transmit_shift <= transmit_buffer;
						transmit_empty <= '1';
						transmit_state <= STATE_BITS;
						serial_txd <= '0';
					else
						serial_txd <= '1';
					end if;
				when STATE_BITS =>
					serial_txd <= transmit_shift(transmit_cnt);
					if transmit_cnt = bits-1 then
						transmit_state <= STATE_STOP;
					else
						transmit_cnt <= transmit_cnt + 1;
					end if;
				when STATE_STOP =>
					serial_txd <= '1';
					transmit_state <= STATE_IDLE;
				end case;
			end if;
			if d_trigger = '1' then
				transmit_buffer <= d;
				transmit_empty <= '0';
			end if;
		end if;
	end process;
	
end architecture;





