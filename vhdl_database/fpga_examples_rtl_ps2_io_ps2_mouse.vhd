-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2009 by Peter Wendrich (pwsoft@syntiac.com)
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
-- PS/2 mouse driver
--
-- Uses: io_ps2_com
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity io_ps2_mouse is
	generic (
		-- Enable support for intelli-mouse mode.
		-- This allows the use of the scroll-wheel on mice that have them.
		intelliMouseSupport : boolean := true;
		-- Number of system-cycles used for PS/2 clock filtering
		clockFilter : integer := 15;
		-- Timer calibration
		ticksPerUsec : integer := 33   -- 33 Mhz clock
	);
	port (
		clk: in std_logic;
		reset : in std_logic := '0';
		
		ps2_clk_in: in std_logic;
		ps2_dat_in: in std_logic;
		ps2_clk_out: out std_logic;
		ps2_dat_out: out std_logic;
		
		mousePresent : out std_logic;
		
		trigger : out std_logic;
		leftButton : out std_logic;
		middleButton : out std_logic;
		rightButton : out std_logic;
		deltaX : out signed(8 downto 0);
		deltaY : out signed(8 downto 0);
		deltaZ : out signed(3 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of io_ps2_mouse is
	constant ticksPer100Usec : integer := ticksPerUsec * 100;
	constant tickTimeout : integer := ticksPerUsec * 3500000;
	type mainStateDef is (
		stateInit, stateInitAA, stateInitID, stateReset, stateReset2, stateResetAck,
		intelliKnock, intelliKnockAck, intelliCheckId,
		stateSetDataReporting, stateSetDataReportingAck,
		stateWaitByte1, stateWaitByte2, stateWaitByte3, stateWaitByte4);

	signal masterState : mainStateDef := stateInit;
	signal timeoutCount : integer range 0 to tickTimeout := 0;
	signal resetCom : std_logic;
	signal inIdle : std_logic;

	signal recvTrigger : std_logic := '0';
	signal sendTrigger : std_logic := '0';
	signal sendBusy : std_logic;
	signal sendByte : unsigned(7 downto 0);
	signal recvByte : unsigned(10 downto 0);
	
	signal intelliMouse : std_logic := '0';
	signal intelliCnt : unsigned(2 downto 0) := "000";

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
-- Mouse state machine
	process(clk)
	begin
		if rising_edge(clk) then
			resetCom <= '0';
			mousePresent <= '0';
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
				-- Reset mouse
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
			-- Mouse BAT handling states (Basic assurance test)
			--
			when stateInit =>
				-- Wait for mouse to perform self-test
				timeoutCount <= tickTimeout;
				masterState <= stateInitAA;
			when stateInitAA =>
				-- Receive selftest result. It should be AAh.
				if recvTrigger = '1' then
					if recvByte(8 downto 1) = X"AA" then
						masterState <= stateInitID;
					end if;
				end if;
			when stateInitID =>
				-- Receive device ID (it isn't checked)
				if recvTrigger = '1' then
					timeoutCount <= tickTimeout;
					masterState <= stateSetDataReporting;
					intelliCnt <= (others => '0');
					if intelliMouseSupport then
						masterState <= intelliKnock;
					end if;
				end if;

			--
			-- Intelli Mouse knock sequence for wheel support
			--
			when intelliKnock =>
				if sendBusy = '0' then
					sendTrigger <= '1';
					masterState <= intelliKnockAck;
					intelliCnt <= intelliCnt + 1;

					case intelliCnt is
					when "000" => sendByte <= X"F3"; -- Set sample rate
					when "001" => sendByte <= X"C8"; -- Rate 200
					when "010" => sendByte <= X"F3"; -- Set sample rate
					when "011" => sendByte <= X"64"; -- Rate 100
					when "100" => sendByte <= X"F3"; -- Set sample rate
					when "101" => sendByte <= X"50"; -- Rate 80
					when "110" => sendByte <= X"F2"; -- Request ID
					when others => sendByte <= (others => '-');
					end case;
				end if;
			when intelliKnockAck =>
				if recvTrigger = '1' then
					masterState <= intelliKnock;
					-- End of knock sequence, check the mouse ID
					if intelliCnt = "111" then
						masterState <= intelliCheckId;
					end if;
				end if;
			when intelliCheckId =>
				if recvTrigger = '1' then
					masterState <= stateSetDataReporting;
					intelliMouse <= '0';
					if recvByte(8 downto 1) = X"03" then
						intelliMouse <= '1';
					end if;
				end if;

			--
			-- Enable data reporting
			--
			when stateSetDataReporting =>
				if sendBusy = '0' then
					sendByte <= X"F4";
					sendTrigger <= '1';
					masterState <=  stateSetDataReportingAck;
				end if;
			when stateSetDataReportingAck =>
				if recvTrigger = '1' then
					masterState <= stateWaitByte1;
				end if;

			--
			-- Receive movement packet
			--
			when stateWaitByte1 =>
				mousePresent <= '1';
				if inIdle = '1' then
					timeoutCount <= tickTimeout;
				end if;
				if recvTrigger = '1' then
					leftButton <= recvByte(1);
					rightButton <= recvByte(2);
					middleButton <= recvByte(3);
					deltaX(8) <= recvByte(5);
					deltaY(8) <= recvByte(6);
					masterState <= stateWaitByte2;
				end if;
			when stateWaitByte2 =>
				mousePresent <= '1';
				if recvTrigger = '1' then
					deltaX(7 downto 0) <= signed(recvByte(8 downto 1));
					masterState <= stateWaitByte3;
				end if;
			when stateWaitByte3 =>
				mousePresent <= '1';
				if recvTrigger = '1' then
					deltaY(7 downto 0) <= signed(recvByte(8 downto 1));
					if intelliMouse = '1' then
						masterState <= stateWaitByte4;
					else
						deltaZ <= (others => '0');
						trigger <= '1';
						masterState <= stateWaitByte1;
					end if;
				end if;
			when stateWaitByte4 =>
				mousePresent <= '1';
				if recvTrigger = '1' then
					deltaZ <= signed(recvByte(4 downto 1));
					trigger <= '1';
					masterState <= stateWaitByte1;
				end if;			
			end case;
			
			if reset = '1' then
				masterState <= stateReset;
			end if;
		end if;
	end process;
end architecture;

