-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2010 by Peter Wendrich (pwsoft@syntiac.com)
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
-- PS/2 keyboard driver
--
-- Uses: io_ps2_com
--
-- -----------------------------------------------------------------------
-- ledStatusSupport - Enables transmission of LED states. When disbled the
--                    caps_lock, num_lock and scroll_lock inputs are unused.
--                    This reduces the size of the design.
-- clockFilter      - Filter length of the clock in number of system-clock ticks.
-- ticksPerUsec     - System clock speed in Mhz. Used in timer calibration.

-- clk          - System clock
-- ps2_clk_in   - ps/2 clock input
-- ps2_dat_in   - ps/2 data input
-- ps2_clk_out  - ps/2 clock output
-- ps2_dat_out  - ps/2 data output
--                The ps2_xxx_out outputs need a tristate driver.
--                When 0 the line should be driven low.
--                When 1 the line should be not be driven, but tri-stated (input)
-- caps_lock    - Caps-lock state input (LED). It is transmitted when changed.
-- num_lock     - Num-lock state input (LED). It is transmitted when changed.
-- scroll_lock  - Scroll-lock state input (LED). It is transmitted when changed.
-- trigger      - One clock high when a new scancode is received
-- scancode     - Value of the last scancode received
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity io_ps2_keyboard is
	generic (
		-- Include code for LED status updates
		ledStatusSupport : boolean := true;
		-- Number of system-cycles used for PS/2 clock filtering
		clockFilter : integer := 15;
		-- Timer calibration
		ticksPerUsec : integer := 33   -- 33 Mhz clock
	);
	port (
		clk: in std_logic;
		reset : in std_logic := '0';
		
		-- PS/2 connector
		ps2_clk_in: in std_logic;
		ps2_dat_in: in std_logic;
		ps2_clk_out: out std_logic;
		ps2_dat_out: out std_logic;

		-- LED status
		caps_lock : in std_logic := '0';
		num_lock : in std_logic := '0';
		scroll_lock : in std_logic := '0';

		-- Read scancode
		trigger : out std_logic;
		scancode : out unsigned(7 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of io_ps2_keyboard is
	constant ticksPer100Usec : integer := ticksPerUsec * 100;
	constant tickTimeout : integer := ticksPerUsec * 3500000;

	type mainStateDef is (
		stateInit, stateInitAA,
		stateReset, stateReset2, stateResetAck,
		stateWaitScanCode,
		stateWaitAckED1, stateWaitAckED2);

	signal masterState : mainStateDef := stateInit;
	signal timeoutCount : integer range 0 to tickTimeout := 0;
	signal resetCom : std_logic;
	signal inIdle : std_logic;

	signal recvTrigger : std_logic := '0';
	signal sendTrigger : std_logic := '0';
	signal sendBusy : std_logic;
	signal sendByte : unsigned(7 downto 0);
	signal recvByte : unsigned(10 downto 0);
	
	-- Current LED states
	signal caps_lock_state : std_logic := '0';
	signal num_lock_state : std_logic := '0';
	signal scroll_lock_state : std_logic := '0';

begin
	myPs2Com : entity work.io_ps2_com
		generic map (
			clockFilter => clockFilter,
			ticksPerUsec => ticksPerUsec
		)
		port map (
			clk => clk,
			reset => resetCom,
			ps2_clk_in => ps2_clk_in,
			ps2_dat_in => ps2_dat_in,
			ps2_clk_out => ps2_clk_out,
			ps2_dat_out => ps2_dat_out,
			
			inIdle => inIdle,

			sendTrigger => sendTrigger,
			sendByte => sendByte,
			sendBusy => sendBusy,
			recvTrigger => recvTrigger,
			recvByte => recvByte
		);

--
-- Keyboard state machine
	process(clk)
	begin
		if rising_edge(clk) then
			resetCom <= '0';
			trigger <= '0';
			sendTrigger <= '0';
			if timeoutCount /= 0 then
				timeoutCount <= timeoutCount - 1;
			else
				masterState <= stateReset;
			end if;


			case masterState is
			--
			-- Reset sequence states
			--
			when stateReset =>
				resetCom <= '1';
				timeoutCount <= tickTimeout;
				masterState <= stateReset2;
			when stateReset2 =>
				-- Reset keyboard
				if sendBusy = '0' then
					sendByte <= X"FF";
					sendTrigger <= '1';
					masterState <= stateResetAck;
				end if;
			when stateResetAck =>
				if recvTrigger = '1' then
					masterState <= stateInit;
				end if;
			--
			-- Keyboard BAT handling states
			-- (Basic assurance test)
			--
			when stateInit =>
				-- Wait for keyboard to perform self-test
				timeoutCount <= tickTimeout;
				masterState <= stateInitAA;
				-- Force update of LEDs after (re-)init
				caps_lock_state <= not caps_lock;
				num_lock_state <= not num_lock;
				scroll_lock_state <= not scroll_lock;
			when stateInitAA =>
				-- Receive selftest result. It should be AAh.
				if recvTrigger = '1' then
					if recvByte(8 downto 1) = X"AA" then
						masterState <= stateWaitScanCode;
					end if;
				end if;

			--
			-- Receive scan-codes
			--
			when stateWaitScanCode =>
				if inIdle = '1' then
					timeoutCount <= tickTimeout;
				end if;
				-- New scancode received
				if recvTrigger = '1' then
					trigger <= '1';
					scancode <= recvByte(8 downto 1);
				end if;
				-- If LED status changes, send update to keyboard.
				-- This is done by sending EDh byte followed by a data byte with the status of the LEDs.
				if ledStatusSupport and (inIdle = '1') and
					((num_lock /= num_lock_state) or (caps_lock /= caps_lock_state) or (scroll_lock /= scroll_lock_state)) then
					sendByte <= X"ED";
					sendTrigger <= '1';
					masterState <= stateWaitAckED1;
				end if;
			--
			-- Wait for ack on ED command
			when stateWaitAckED1 =>
				if recvTrigger = '1' then
					if recvByte(8 downto 1) = X"FA" then
						sendByte <= "00000" & caps_lock & num_lock & scroll_lock;
						sendTrigger <= '1';
						num_lock_state <= num_lock;
						caps_lock_state <= caps_lock;
						scroll_lock_state <= scroll_lock;
						masterState <= stateWaitAckED2;
					end if;
				end if;
			--
			-- Wait for ack on ED data byte
			when stateWaitAckED2 =>
				if recvTrigger = '1' then
					if recvByte(8 downto 1) = X"FA" then
						masterState <= stateWaitScanCode;
					end if;
				end if;
			end case;

			if reset = '1' then
				masterState <= stateReset;
			end if;
		end if;
	end process;
end architecture;

