-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the commodore 64 computer
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
-- Chameleon SPI controller for communicating with flash and sdcard
--
-- -----------------------------------------------------------------------
-- clk   - system clock
--
-- sclk  - Serial clock output
-- miso  - master in (input on FPGA), slave out
-- mosi  - master out (output on FPGA), slave in
--
-- req   - Toggle line to start a byte transfer
-- ack   - When equal to req the transfer is finished
-- speed - 0=Slow speed at 250 Kb/s, 1=Fast speed at 8 Mb/s
-- d     - Input byte that is transmitted
-- q     - Byte that has been received
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon2_spi is
	generic (
		clk_ticks_per_usec : integer
	);
	port (
		clk : in std_logic;

		sclk : out std_logic;
		miso : in std_logic;
		mosi : out std_logic;

		req : in std_logic;
		ack : out std_logic;
		speed : in std_logic;
		d : in unsigned(7 downto 0);
		q : out unsigned(7 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon2_spi is
	constant fast_speed_div : integer := (clk_ticks_per_usec / 16)-1; -- 8 Mb
	constant slow_speed_div : integer := (clk_ticks_per_usec * 2)-1; -- 250 Kb

	signal div_reg : unsigned(8 downto 0) := (others => '0');
	signal state_reg : unsigned(3 downto 0) := (others => '1');
	signal ack_reg : std_logic := '0';
	signal req_reg : std_logic := '0';

	signal miso_reg : std_logic := '0';
	signal mosi_reg : std_logic := '0';

	signal in_reg : unsigned(7 downto 0) := (others => '0');
	signal out_reg : unsigned(7 downto 0) := (others => '0');
begin
	sclk <= state_reg(0);
	mosi <= mosi_reg;
	ack <= ack_reg;
	q <= in_reg;

	process(clk)
	begin
		if rising_edge(clk) then
			if (not state_reg) /= 0 then
				miso_reg <= miso;
				mosi_reg <= out_reg(7 - to_integer(state_reg(3 downto 1)));
				if div_reg /= 0 then
					-- Update clock divider
					div_reg <= div_reg  - 1;
				else
					-- Reset clock divider based on selected speed
					div_reg <= to_unsigned(slow_speed_div, div_reg'length);
					if speed = '1' then
						div_reg <= to_unsigned(fast_speed_div, div_reg'length);
					end if;
					-- Sample miso on rising edge of sclk
					if state_reg(0) = '0' then
						in_reg <= in_reg(6 downto 0) & miso_reg;
					end if;
					-- Next sclk edge
					state_reg <= state_reg + 1;
				end if;
			elsif req /= req_reg then
				-- Start SPI transfer
				req_reg <= req;
				out_reg <= d;
				div_reg <= to_unsigned(slow_speed_div, div_reg'length);
				if speed = '1' then
					div_reg <= to_unsigned(fast_speed_div, div_reg'length);
				end if;
				state_reg <= (others => '0');
			elsif req_reg /= ack_reg then
				-- Acknowledge end of transfer
				ack_reg <= req_reg;
			end if;
		end if;
	end process;
end architecture;
