-------------------------------------------------------------------------
----                                                                 ----
---- Company : ELB-Elektroniklaboratorien Bonn UG                    ----
----           (haftungsbeschränkt)                                  ----
----                                                                 ----
---- Description   : Controller module for DAC088S085, should also   ----
----                 be compatible with 10 bit and 12 bit version.   ----
----                                                                 ----
-------------------------------------------------------------------------
----                                                                 ----
---- Copyright (C) 2015 ELB                                          ----
----                                                                 ----
---- This program is free software; you can redistribute it and/or   ----
---- modify it under the terms of the GNU General Public License as  ----
---- published by the Free Software Foundation; either version 3 of  ----
---- the License, or (at your option) any later version.             ----
----                                                                 ----
---- This program is distributed in the hope that it will be useful, ----
---- but WITHOUT ANY WARRANTY; without even the implied warranty of  ----
---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the    ----
---- GNU General Public License for more details.                    ----
----                                                                 ----
---- You should have received a copy of the GNU General Public       ----
---- License along with this program; if not, see                    ----
---- <http://www.gnu.org/licenses>.                                  ----
----                                                                 ----
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DAC088S085_Controller is
    Port ( CLK : in  STD_LOGIC; -- system clock, max 100MHz, chip select timing has to be checked / modified for higher frequencies
           CLKDivH,CLKDivL : in  STD_LOGIC_VECTOR (3 downto 0); -- seperate dividers for high and low time of clock
           WE : in  STD_LOGIC; -- syncronous (CLK) write enable, DATA and Address are being latched on WE='1'
           Address : in  STD_LOGIC_VECTOR (3 downto 0); -- Data Address (identical to transferred address, lookup in datasheet)
           Data : in  STD_LOGIC_VECTOR (11 downto 0); -- Data to be transferred bits 3...0 =X for 8 bit version
           SCLK, SDA, CS : out  STD_LOGIC; -- Serial communication Signals
           Busy : out  STD_LOGIC); -- busy flag: State machine is busy, incoming WE will be ignored
end DAC088S085_Controller;

architecture Behavioral of DAC088S085_Controller is

Signal BusyRegister : STD_LOGIC :='0';

--Signal DataRegister : STD_LOGIC_VECTOR (11 downto 0) :=(others=>'0');
--signal AddressRegister : STD_LOGIC_VECTOR (4 downto 0) :=(others=>'0');
Signal TransferRegister : STD_LOGIC_VECTOR (14 downto 0) :=(others=>'0'); -- Data and Address to be transfered. Only 15 bit because MSB is applied immidately at WE='1'

Signal SCLKRegister, SDARegister : STD_LOGIC :='0'; -- DAC draws less current if pins are low -> when idle pull low.
Signal CSRegister : STD_LOGIC :='1'; -- Chip select high when idle

Signal ClockDivCounter : unsigned (3 downto 0):=to_unsigned(0,4); -- How many bits have been transfered?
Signal BitCounter : unsigned (4 downto 0):=to_unsigned(0,5); -- How many CLK-Cycles has already been waited (update SCLK, when counter reached value set in interface)

Signal NCRESCLK : STD_LOGIC; -- Next Clockcycle has Rising Edge on SCLK
Signal NCFESCLK : STD_LOGIC; -- Next Clockcycle has Falling Edge on SCLK

begin

SCLK<=SCLKRegister;
SDA<=SDARegister;
CS<=CSRegister;
Busy<=BusyRegister;

GenerateSCLK : Process (CLK) is
begin
	if rising_edge(CLK) then
		if BusyRegister='0' then -- reset case
			ClockDivCounter<=to_unsigned(0,4);
			SCLKRegister<='1';
		else
			ClockDivCounter<=ClockDivCounter+1;
			if SCLKRegister='1' then
				if CLKDivH = STD_LOGIC_VECTOR (ClockDivCounter) then
					SCLKRegister<='0';
					ClockDivCounter<=to_unsigned(0,4);
				end if;
			else 
				if CLKDivL = STD_LOGIC_VECTOR (ClockDivCounter) then
					SCLKRegister<='1';
					ClockDivCounter<=to_unsigned(0,4);
				end if;
			end if;
		end if;
	end if;
end process;

Process (CLKDivL, ClockDivCounter, SCLKRegister) is begin
	if CLKDivL = STD_LOGIC_VECTOR (ClockDivCounter) AND SCLKRegister ='0' then
		NCRESCLK<='1';
	else
		NCRESCLK<='0';
	end if;
end Process;

Process (CLKDivH, ClockDivCounter, SCLKRegister) is begin
	if CLKDivH = STD_LOGIC_VECTOR (ClockDivCounter) AND SCLKRegister ='1' then
		NCFESCLK<='1';
	else
		NCFESCLK<='0';
	end if;
end Process;

Process (CLK) is begin
	if rising_edge(CLK) then
		if BusyRegister='0' then
			if WE='1' then
				TransferRegister(11 downto 0)<= Data;
				TransferRegister(14 downto 12)<= Address (2 downto 0);
				BusyRegister<='1';
				CSRegister<='0';
				SDARegister <=Address(3);
			end if;
		else
			if NCFESCLK ='1' then -- on falling edge, bits are transfered-> increase number of transferred bits
				BitCounter<=BitCounter+1;
			end if;
			
			if NCRESCLK ='1' then -- on rising edge, change data (should work best because t_setup = t_hold = 2,5 ns)
				TransferRegister (14 downto 1) <=TransferRegister (13 downto 0);
				SDARegister <=TransferRegister(14);
			end if;
			
			if BitCounter = to_unsigned(16,5) AND NCRESCLK ='1' then -- when 16 bits have been transfered, wait until clock to cipselect time is fullfilled (min 10 ns, 
				CSRegister<='1';
				BusyRegister<='0';
				BitCounter <=to_unsigned(0,5);
			end if;
		end if;
	end if;
end process;

end Behavioral;

