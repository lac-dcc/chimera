-- lpc2lcd.vhd by Ryzee119.

-- This VHDL code was written to replace the CPLD logic on the cheap AladdinXT 4032 Original Xbox modchip.
-- It converts the modchip to a basic LCD driver, consequently it looses the ability to load a custom bios.
-- This is best used with a TSOP modded or soft modded console.
--
-- The Lattice LC4032V CPLD on the cheap alladin modchips is extremely limited, so this code is a hacky bare minimim
-- to reduce macrocell usage to fit onto the CPLD. Therefore it will not support any other
-- functionality, unless you decide to migrate it to a higher macrocell count CPLD (i.e 4064 variant)
--
-- This does not support adjusting the backlight via the dashboard settings
-- This has very limited contrast control through the dashboard settings. It couldnt even manage an 8-bit PWM signal.
-- For the dashboard settings: 0%=No Contrast, 25%=Full Constrast. Anything else wont work as expected.
-- If this isn't good enough for your particular LCD, use an external trimmer.


-- Ref 1. Intel® Low Pin Count (LPC) Interface Specification Rev 1.1 (August 2002)
-- Ref 2. SmartXX LT OPX Software Developer Documentation
-- Other references that I used:
--    Xblast OS Source code for confirmation of SmartXX commands https://bitbucket.org/psyko_chewbacca/lpcmod_os/src/master/


-- This program is free software: you can redistribute it and/or modify  
-- it under the terms of the GNU General Public License as published by  
-- the Free Software Foundation, version 3.
--
-- This program is distributed in the hope that it will be useful, but 
-- WITHOUT ANY WARRANTY; without even the implied warranty of 
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License 
-- along with this program. If not, see <http://www.gnu.org/licenses/>.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity LPC2LCD is

port(
	--HD44780 LCD Pins
	LCD_DATA: out std_logic_vector ( 3 downto 0 );
	LCD_RS: out std_logic;
	LCD_E: out std_logic;
	LCD_CONTRAST: out std_logic;

	--LPC Pins
	LPC_RST: in std_logic;
	LPC_CLK: in std_logic;
	LPC_LAD: inout std_logic_vector ( 3 downto 0 )

);

end;

architecture LPC2LCD_arch of LPC2LCD is
	-- LPC clocks state machine for Host Initiated I/O Write Cycles
	-- Straight out of the Ref 1 Table 10.
	type LPC_STATE_MACHINE is (
		WAIT_START,
		CYCTYPE_DIR,
		ADDRESS, -- Ideally this is broken into 4 steps to capture full address
		DATA1,
		DATA2,
		TAR1_1,
		TAR1_2,
		SYNC
		--There's another TAR sequence that should really be here
		--But removed to save space. Works ok without it.
	);

	--Keep track of LPC clocks in the state machine
	signal LPC_CURRENT_STATE: LPC_STATE_MACHINE ;
	
	-- Holds the 2 byte address
	signal LPC_ADDRESS: STD_LOGIC_VECTOR (15 downto 0 ) := "0000000000000000";

	--0,D6,D7,D4,D5,E,RS,0 from MSB to LSB, See Ref 2 Table 1.
	signal LCD_DATA_BYTE: STD_LOGIC_VECTOR ( 7 downto 0 ) := "00000000";

	-- 0 to 16 contrast value
	signal LCD_CONTRAST_NIBBLE: STD_LOGIC_VECTOR ( 3 downto 0 ) := "1100"; --Ok default contrast value 

	-- Counter used for the PWM output
  	signal PWM_COUNT_CONTRAST: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	
	-- Counter used to track LPC address clocking
 	signal LPC_COUNT_ADDRESS: STD_LOGIC_VECTOR (1 downto 0 ) := "00";



begin

	--LCD Data has this format
	--X,D6,D7,D4,D5,E,RS,X in that order. See Ref 2.
	LCD_RS <= LCD_DATA_BYTE(1);
	LCD_E <= LCD_DATA_BYTE(2);
	LCD_DATA(0) <= LCD_DATA_BYTE(4);
	LCD_DATA(1) <= LCD_DATA_BYTE(3);
	LCD_DATA(2) <= LCD_DATA_BYTE(6);
	LCD_DATA(3) <= LCD_DATA_BYTE(5);

	--On SYNC output "0000" to indicate no errors. else high impedance input
	LPC_LAD <= "0000" when LPC_CURRENT_STATE = SYNC else "ZZZZ";
		
	--Really rough PWM output for the contrast count. Outputs 1 or 0 as a ratio of the contrast value
	--set by the dashboard.
	LCD_CONTRAST <= '0' when (PWM_COUNT_CONTRAST < LCD_CONTRAST_NIBBLE) else '1'; --PWM output

	-- Create a process which is evaluated with changes on LPC_CLK and LPC_RST pins
	process(LPC_CLK, LPC_RST)
	begin
		PWM_COUNT_CONTRAST <= PWM_COUNT_CONTRAST + 1;
		
		if (LPC_RST = '0') then
			LPC_CURRENT_STATE <= WAIT_START;
			LCD_DATA_BYTE	 <= "00000000";
		  	LPC_ADDRESS <= "0000000000000000";
			LCD_CONTRAST_NIBBLE <= "1100";

		elsif (LPC_CLK'EVENT and LPC_CLK='1') then
			case LPC_CURRENT_STATE is
				when WAIT_START =>
					-- When LAD lines are "0000" on a CLK edge, this indicates a
					-- start of cycle for a target for Memory, I/O, and DMA cycles
					-- This is no LFRAME on xbox 1.3+, so this is how we frame transactions
					if LPC_LAD = "0000" then
						LPC_CURRENT_STATE <= CYCTYPE_DIR;
					end if;
					
				when CYCTYPE_DIR =>
					-- Bits[3:1] = "001" when the host has requested an I/O Write.
					-- This is what we expect for LCD commands
					-- See Ref 1 Section 4.2.1.2
					if LPC_LAD(3 downto 1) = "001" then
						LPC_CURRENT_STATE <= ADDRESS; -- Cool, lets find out what address
					else
						LPC_CURRENT_STATE <= WAIT_START; -- Unsupported, reset state machine.
					end if;
				
				-- Address is 2 bytes long, this is 4 LPC clocks
				-- It is driven out with the most significant nibble first
				-- See Ref 1, Section 4.2.1.5
				-- Due to space constraints, I wait until the 4th clock and
				-- grab the lowest nibble only. Again, a bit hacky but seems to work.
				when ADDRESS =>
					LPC_COUNT_ADDRESS<=LPC_COUNT_ADDRESS+1;
					if(LPC_COUNT_ADDRESS = "00") then
						LPC_ADDRESS(3 downto 0) <= LPC_LAD;
						LPC_CURRENT_STATE <= DATA1;
					end if;
				
				-- Following the 2 byte address, there is a 1 byte data value
				-- The purpose of this data value depends on the address, lower nibble first
				when DATA1 =>
					--SmartXX LPC registers to drive LCD (lower nibble)
					--The LPC registers are actually 0xF70x (See Ref 2) but CPLD is too small
					--so just compare the last couple bits. Not ideal but seems to work ok.
					case LPC_ADDRESS(1 downto 0) is
						when  "00" => -- LCD Data
							LCD_DATA_BYTE(3 downto 0) <= LPC_LAD;
						when "11" => -- Contrast Value
							if(LPC_ADDRESS(3)='0') then --Quick check of bit3 too to double check its the right command
								LCD_CONTRAST_NIBBLE(3 downto 0) <= LPC_LAD;
							end if;
						when others =>
								
					end case;
					LPC_CURRENT_STATE <= DATA2;
				
				when DATA2 =>
					--Second nibble of data byte...
					case LPC_ADDRESS(1 downto 0) is
						when  "00" => -- LCD Data
							LCD_DATA_BYTE(7 downto 4) <= LPC_LAD;
						--when "11" => -- Contrast Value
							--CPLD is so small, cant even manage full byte of contrast
							--for PWM. limit it to 1 nibble. good enough.
					  		--The upper nibble would normally be here
						when others =>
						
					end case;
					LPC_CURRENT_STATE <= TAR1_1;

				-- Turn LPC bus around over next 2 clocks
				when TAR1_1 =>
					LPC_CURRENT_STATE <= TAR1_2;
					
				when TAR1_2 =>
					LPC_CURRENT_STATE <= SYNC;

				when SYNC =>
					--LAD lines are set to "0000" here to indicate a successful transaction
					--This is done by this behaviour defined earlier:
					--LPC_LAD <= "0000" when LPC_CURRENT_STATE = SYNC else "ZZZZ";
					LPC_CURRENT_STATE <= WAIT_START;			
					
			end case;
		end if;
	end process;

end LPC2LCD_arch;


