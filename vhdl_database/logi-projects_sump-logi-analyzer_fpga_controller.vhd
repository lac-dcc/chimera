----------------------------------------------------------------------------------
-- controller.vhd
--
-- Copyright (C) 2006 Michael Poppitz
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- Controls the capturing & readback operation.
-- 
-- If no other operation has been activated, the controller samples data
-- into the memory. When the run signal is received, it continues to do so
-- for fwd * 4 samples and then sends bwd * 4 samples  to the transmitter.
-- This allows to capture data from before the trigger match which is a nice 
-- feature.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity controller is
    Port ( clock : in  STD_LOGIC;
			  reset : in std_logic;

           input : in  STD_LOGIC_VECTOR (31 downto 0);
			  inputReady : in std_logic;

			  run : in std_logic;
			  wrSize : in std_logic;
			  data : in STD_LOGIC_VECTOR (31 downto 0);

			  busy : in std_logic;
			  send : out std_logic;
           output : out  STD_LOGIC_VECTOR (31 downto 0);
			  
           memoryIn : in  STD_LOGIC_VECTOR (31 downto 0);
           memoryOut : out  STD_LOGIC_VECTOR (31 downto 0);
           memoryRead : out  STD_LOGIC;
           memoryWrite : out  STD_LOGIC
	 );
end controller;

architecture Behavioral of controller is

type CONTROLLER_STATES is (SAMPLE, DELAY, READ, READWAIT);

signal fwd, bwd : std_logic_vector (15 downto 0);
signal ncounter, counter: std_logic_vector (17 downto 0);
signal nstate, state : CONTROLLER_STATES;
signal sendReg : std_logic;

begin
	output <= memoryIn;
	memoryOut <= input;
	send <= sendReg;

	-- synchronization and reset logic
	process(run, clock, reset)
	begin
		if reset = '1' then
			state <= SAMPLE;
		elsif rising_edge(clock) then
			state <= nstate;
			counter <= ncounter;
		end if;
	end process;

	-- FSM to control the controller action
	process(state, run, counter, fwd, inputReady, bwd, busy)
	begin
		case state is

			-- default mode: sample data from input to memory
			when SAMPLE =>
				if run = '1' then
					nstate <= DELAY;
				else
					nstate <= state;
				end if;
				ncounter <= (others => '0');
				memoryWrite <= inputReady;
				memoryRead <= '0';
				sendReg <= '0';

			-- keep sampling for 4 * fwd + 4 samples after run condition
			when DELAY =>
				if counter = fwd & "11" then
					ncounter <= (others => '0');
					nstate <= READ;
				else
					if inputReady = '1' then
						ncounter <= counter + 1;
					else
						ncounter <= counter;
					end if;
					nstate <= state;
				end if;
				memoryWrite <= inputReady;
				memoryRead <= '0';
				sendReg <= '0';

			-- read back 4 * bwd + 4 samples after DELAY
			-- go into wait state after each sample to give transmitter time
			when READ =>
				if counter = bwd & "11" then
					ncounter <= (others => '0');
					nstate <= SAMPLE;
				else
					ncounter <= counter + 1;
					nstate <= READWAIT;
				end if;
				memoryWrite <= '0';
				memoryRead <= '1';
				sendReg <= '1';

			-- wait for the transmitter to become ready again
			when READWAIT =>
				if busy = '0' and sendReg = '0' then
					nstate <= READ;
				else
					nstate <= state;
				end if;
				ncounter <= counter;
				memoryWrite <= '0';
				memoryRead <= '0';
				sendReg <= '0';

		end case;
	end process;

	-- set speed and size registers if indicated
	process(clock)
	begin
		if rising_edge(clock) then
			
			if wrSize = '1' then
				fwd <= data(31 downto 16);
				bwd <= data(15 downto 0);
			end if;

		end if;
	end process;
	
end Behavioral;
