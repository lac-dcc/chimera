-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Multi purpose FPGA expansion for the Commodore 64 computer
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2017 by Peter Wendrich (pwsoft@syntiac.com)
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
-- Chameleon USB micro communication
--
-- -----------------------------------------------------------------------
-- remote_reset_enabled - Enable remote reset feature.
--                        Addressable memory is reduced from 4 Gb to 2 Gb.
--                        As bit 31 of the address is used as reset trigger.
-- -----------------------------------------------------------------------
-- clk           - system clock
-- req           - toggles on a access request (read & write)
-- ack           - toggled by system when the request is processed.
-- we            - write enable, is high during write actions
-- a             - 32 bits address bus
-- d             - data input
-- q             - data output
--
-- reconfig      - When high the usb-micro is requested to boot another FPGA core.
-- reconfig_slot - Selects which slot (0-15) to use for booting the FPGA core.
--
-- flashslot     - Slot number (0-15) in flash where FPGA is started from.
--                 Highest bit is valid-bit, is set when slot number is valid.
-- serial_clk    - clock of synchronous serial communication
-- serial_rxd    - serial receive data
-- serial_txd    - serial send data
-- serial_cts_n  - clear to send inverted. When low USB micro is ready to
--                 receive bytes.
--
-- remote_reset  - high when a remote reset is requested by writing data
--                 with address bit 31 set. Enable this feature with
--                 "remote_reset_enabled".
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity chameleon_usb is
	generic (
		remote_reset_enabled : boolean := false
	);
	port (
		clk : in std_logic;

		req : out std_logic;
		ack : in std_logic := '0';
		we : out std_logic;
		a : out unsigned(31 downto 0);
		d : in unsigned(7 downto 0) := (others => '0');
		q : out unsigned(7 downto 0);

		reconfig : in std_logic := '0';
		reconfig_slot : in unsigned(3 downto 0) := (others => '0');

		flashslot : out unsigned(4 downto 0);

		serial_clk : in std_logic;
		serial_rxd : in std_logic := '1';
		serial_txd : out std_logic;
		serial_cts_n : in std_logic := '0';

		serial_debug_trigger : out std_logic;
		serial_debug_data : out unsigned(8 downto 0);

		remote_reset : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_usb is
	type state_t is (
		STATE_RESET, STATE_IDLE,
		STATE_READ, STATE_READ_ACK, STATE_WRITE, STATE_WRITE_ACK,
		STATE_ADDR0, STATE_ADDR1, STATE_ADDR2, STATE_ADDR3,
		STATE_LEN0, STATE_LEN1, STATE_LEN2,
		STATE_REMOTE_RESET);
	type command_t is (
		CMD_NONE, CMD_READ, CMD_WRITE);

	signal req_reg : std_logic := '0';
	signal state : state_t := STATE_RESET;
	signal remote_reset_reg : std_logic := '0';
	signal flashslot_reg : unsigned(4 downto 0) := (others => '0');

	signal recv_trigger : std_logic;
	signal recv_data : unsigned(8 downto 0) := (others => '0');

	signal send_trigger : std_logic := '0';
	signal send_empty : std_logic;
	signal send_data : unsigned(8 downto 0) := (others => '0');

	signal command : command_t := CMD_NONE;
	signal cmd_length : unsigned(23 downto 0) := (others => '0');
	signal cmd_address : unsigned(31 downto 0) := (others => '0');
begin
	req <= req_reg;
	we <= '1' when ((state = STATE_WRITE) or (state = STATE_WRITE_ACK)) else '0';
	a <= cmd_address;
	flashslot <= flashslot_reg;

	serial_debug_trigger <= recv_trigger;
	serial_debug_data <= recv_data;

	remote_reset <= remote_reset_reg;

-- -----------------------------------------------------------------------

	myUsart : entity work.gen_usart
		generic map (
			bits => 9
		)
		port map (
			clk => clk,

			d => send_data,
			d_trigger => send_trigger,
			d_empty => send_empty,
			q => recv_data,
			q_trigger => recv_trigger,

			serial_clk => serial_clk,
			serial_rxd => serial_rxd,
			serial_txd => serial_txd,
			serial_cts_n => serial_cts_n
		);

	process(clk)
	begin
		if rising_edge(clk) then
			send_trigger <= '0';
			remote_reset_reg <= '0';
			case state is
			when STATE_RESET =>
				if send_empty = '1' then
					send_data <= "100101010"; -- 42, 0x12A
					send_trigger <= '1';
				end if;
			when STATE_IDLE =>
				if (send_empty = '1') and (reconfig = '1') then
					send_data <= "11111" & reconfig_slot;
					send_trigger <= '1';
				end if;
			when STATE_READ =>
				if (req_reg = ack) and (send_empty = '1') then
					req_reg <= not req_reg;
					state <= STATE_READ_ACK;
				end if;
			when STATE_READ_ACK =>
				if (req_reg = ack) then
					send_data <= "0" & d;
					send_trigger <= '1';
					cmd_address <= cmd_address + 1;
					if cmd_length = 0 then
						state <= STATE_IDLE;
					else
						cmd_length <= cmd_length - 1;
						state <= STATE_READ;
					end if;
				end if;
			when STATE_WRITE_ACK =>
				if req_reg = ack then
					cmd_address <= cmd_address + 1;
					state <= STATE_WRITE;
				end if;
			when STATE_REMOTE_RESET =>
				remote_reset_reg <= '1';
			when others =>
				null;
			end case;
			if recv_trigger = '1' then
				if recv_data(8) = '1' then
					case recv_data(7 downto 0) is
					when X"00" =>
						command <= CMD_NONE;
						state <= STATE_IDLE;
					when X"01" =>
						command <= CMD_WRITE;
						state <= STATE_ADDR3;
					when X"02" =>
						command <= CMD_READ;
						state <= STATE_ADDR3;
					when X"10" | X"11" | X"12" | X"13" | X"14" | X"15" | X"16" | X"17"
					   | X"18" | X"19" | X"1A" | X"1B" | X"1C" | X"1D" | X"1E" | X"1F" =>
						flashslot_reg <= recv_data(4 downto 0);
						command <= CMD_NONE;
						state <= STATE_IDLE;
					when others =>
						command <= CMD_NONE;
						state <= STATE_IDLE;
					end case;
				else
					case state is
					when STATE_WRITE =>
						q <= recv_data(7 downto 0);
						req_reg <= not req_reg;
						state <= STATE_WRITE_ACK;
					when STATE_ADDR0 =>
						cmd_address(7 downto 0) <= recv_data(7 downto 0);
						case command is
						when CMD_READ =>
							state <= STATE_LEN2;
						when CMD_WRITE =>
							state <= STATE_WRITE;
						when others =>
							state <= STATE_IDLE;
						end case;
						if remote_reset_enabled and (cmd_address(31) = '1') then
							state <= STATE_REMOTE_RESET;
						end if;
					when STATE_ADDR1 =>
						cmd_address(15 downto 8) <= recv_data(7 downto 0);
						state <= STATE_ADDR0;
					when STATE_ADDR2 =>
						cmd_address(23 downto 16) <= recv_data(7 downto 0);
						state <= STATE_ADDR1;
					when STATE_ADDR3 =>
						cmd_address(31 downto 24) <= recv_data(7 downto 0);
						state <= STATE_ADDR2;
					when STATE_LEN0 =>
						cmd_length(7 downto 0) <= recv_data(7 downto 0);
						state <= STATE_READ;
					when STATE_LEN1 =>
						cmd_length(15 downto 8) <= recv_data(7 downto 0);
						state <= STATE_LEN0;
					when STATE_LEN2 =>
						cmd_length(23 downto 16) <= recv_data(7 downto 0);
						state <= STATE_LEN1;
					when others =>
						null;
					end case;
				end if;
			end if;
		end if;
	end process;

end architecture;


