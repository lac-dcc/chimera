----------------------------------------------------------------------------------
-- la.vhd
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
-- Logic Analyzer top level module. It connects the core with the hardware
-- dependend IO modules and defines all inputs and outputs that represent
-- phyisical pins of the fpga.
--
-- It defines two constants FREQ and RATE. The first is the clock frequency 
-- used for receiver and transmitter for generating the proper baud rate.
-- The second defines the speed at which to operate the serial port.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity la is
	Port(
	   resetSwitch : in std_logic;
		xtalClock : in std_logic;

		exClock : in std_logic;
		input : in std_logic_vector(31 downto 0);
		ready50 : out std_logic;

		rx : in std_logic;
		tx : inout std_logic;

		an : OUT std_logic_vector(3 downto 0);
		segment : OUT std_logic_vector(7 downto 0);
		led : OUT std_logic_vector(7 downto 0);
		switch : in std_logic_vector(1 downto 0);

		ramIO1 : INOUT std_logic_vector(15 downto 0);
		ramIO2 : INOUT std_logic_vector(15 downto 0);      
		ramA : OUT std_logic_vector(17 downto 0);
		ramWE : OUT std_logic;
		ramOE : OUT std_logic;
		ramCE1 : OUT std_logic;
		ramUB1 : OUT std_logic;
		ramLB1 : OUT std_logic;
		ramCE2 : OUT std_logic;
		ramUB2 : OUT std_logic;
		ramLB2 : OUT std_logic
	);
end la;

architecture Behavioral of la is

	COMPONENT clockman
	PORT(
		clkin : in  STD_LOGIC;
		clk0 : out std_logic
		);
	END COMPONENT;
	
	COMPONENT display
	PORT(
		data : IN std_logic_vector(31 downto 0);
		clock : IN std_logic;          
		an : OUT std_logic_vector(3 downto 0);
		segment : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT eia232
	generic (
		FREQ : integer;
		SCALE : integer;
		RATE : integer
	);
	PORT(
		clock : IN std_logic;
		reset : in std_logic;
		speed : IN std_logic_vector(1 downto 0);
		rx : IN std_logic;
		data : IN std_logic_vector(31 downto 0);
		send : IN std_logic;          
		tx : OUT std_logic;
		cmd : OUT std_logic_vector(39 downto 0);
		execute : OUT std_logic;
		busy : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT core
	PORT(
		clock : IN std_logic;
		extReset : IN std_logic;
		cmd : IN std_logic_vector(39 downto 0);
		execute : IN std_logic;
		input : IN std_logic_vector(31 downto 0);
		inputClock : IN std_logic;
		sampleReady50 : OUT std_logic;
      output : out  STD_LOGIC_VECTOR (31 downto 0);
      outputSend : out  STD_LOGIC;
      outputBusy : in  STD_LOGIC;
		memoryIn : IN std_logic_vector(31 downto 0);          
		memoryOut : OUT std_logic_vector(31 downto 0);
		memoryRead : OUT std_logic;
		memoryWrite : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT sram
	PORT(
		clock : IN std_logic;
		input : IN std_logic_vector(31 downto 0);
		output : OUT std_logic_vector(31 downto 0);
		read : IN std_logic;
		write : IN std_logic;    
		ramIO1 : INOUT std_logic_vector(15 downto 0);
		ramIO2 : INOUT std_logic_vector(15 downto 0);      
		ramA : OUT std_logic_vector(17 downto 0);
		ramWE : OUT std_logic;
		ramOE : OUT std_logic;
		ramCE1 : OUT std_logic;
		ramUB1 : OUT std_logic;
		ramLB1 : OUT std_logic;
		ramCE2 : OUT std_logic;
		ramUB2 : OUT std_logic;
		ramLB2 : OUT std_logic
		);
	END COMPONENT;
	
signal cmd : std_logic_vector (39 downto 0);
signal memoryIn, memoryOut : std_logic_vector (31 downto 0);
signal output : std_logic_vector (31 downto 0);
signal clock : std_logic;
signal read, write, execute, send, busy : std_logic;

constant FREQ : integer := 100000000;				-- limited to 100M by onboard SRAM
constant TRXSCALE : integer := 28; 					-- 100M / 28 / 115200 = 31 (5bit)
constant RATE : integer := 115200;					-- maximum & base rate

begin
	led(7 downto 0) <= exClock & "00" & switch & "000";

	Inst_clockman: clockman PORT MAP(
		clkin => xtalClock,
		clk0 => clock
	);

	Inst_display: display PORT MAP(
		data => memoryIn,
		clock => clock,
		an => an,
		segment => segment
	);

	Inst_eia232: eia232
	generic map (
		FREQ => FREQ,
		SCALE => TRXSCALE,
		RATE => RATE
	)
	PORT MAP(
		clock => clock,
		reset => resetSwitch,
		speed => switch,
		rx => rx,
		tx => tx,
		cmd => cmd,
		execute => execute,
		data => output,
		send => send,
		busy => busy
	);
	
	Inst_core: core PORT MAP(
		clock => clock,
		extReset => resetSwitch,
		cmd => cmd,
		execute => execute,
		input => input,
		inputClock => exClock,
		sampleReady50 => ready50,
		output => output,
		outputSend => send,
		outputBusy => busy,
		memoryIn => memoryIn,
		memoryOut => memoryOut,
		memoryRead => read,
		memoryWrite => write
	);

	Inst_sram: sram PORT MAP(
		clock => clock,
		input => memoryOut,
		output => memoryIn,
		read => read,
		write => write,
		ramA => ramA,
		ramWE => ramWE,
		ramOE => ramOE,
		ramIO1 => ramIO1,
		ramCE1 => ramCE1,
		ramUB1 => ramUB1,
		ramLB1 => ramLB1,
		ramIO2 => ramIO2,
		ramCE2 => ramCE2,
		ramUB2 => ramUB2,
		ramLB2 => ramLB2 
	);
end Behavioral;

