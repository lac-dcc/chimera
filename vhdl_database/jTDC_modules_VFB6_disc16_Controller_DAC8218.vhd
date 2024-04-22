-------------------------------------------------------------------------
----                                                                 ----
---- Company : ELB-Elektroniklaboratorien Bonn UG                    ----
----           (haftungsbeschränkt)                                  ----
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

entity Controller_DAC8218 is
    Port ( CLK : in  STD_LOGIC; -- system clock
           SCLK, CS, SDO : out  STD_LOGIC :='0'; -- Clock, Chip Select, and data out (to dac)
           SDI : in  STD_LOGIC; -- data in from DAC
           ADDR : in  STD_LOGIC_VECTOR (4 downto 0); -- address for read / write
           DATA_Read : out  STD_LOGIC_VECTOR (15 downto 0):=(others=>'0'); -- Data to read
           DATA_Write : in  STD_LOGIC_VECTOR (15 downto 0); -- Data to write
           WR, RD : in  STD_LOGIC; -- commands: write and read.
			  busy, Data_Update : out STD_LOGIC :='0'; -- indicates if interfaca is being used, data_update indicates end of read cycle / updated data at output port.
           CLK_DIVIDER : in  STD_LOGIC_VECTOR (3 downto 0)); -- clock prescaler for SCLK
end Controller_DAC8218;

architecture Behavioral of Controller_DAC8218 is

Signal CLK_Div_count : STD_LOGIC_VECTOR (3 downto 0) :="0000";
Signal CE : STD_LOGIC :='0';

-- id read or write command occurs
-- the command is latched
signal reading, writing : STD_LOGIC :='0';
-- also the data to write:
signal data_to_write : STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
-- and the address:
signal latched_address: STD_LOGIC_Vector (4 downto 0):=(others=>'0');

-- counter for SCLK
Signal SPI_Counter : unsigned (5 downto 0):=to_unsigned(0,6);

-- register for chip select, so it's possible to read back its value.
Signal CS_Register : STD_LOGIC :='1'; -- initiate with 1 due to inverted logic
-- same for SCLK
Signal SCLK_Register: STD_LOGIC:='0';


--Shift register for SPI 
Signal ShiftRegister : STD_LOGIC_VECTOR(23 downto 0);

begin


--- genreate clock enable signal. will be used to scale down the internal clock.
--- maximum SCLK is 25MHz for the DAC8218 for VCCO=3V

Generate_Clockenable: process (CLK) is begin
	if rising_edge(CLK) then
		if CLK_Div_count="0000" then
			CE<='1';
			CLK_Div_count<=CLK_DIVIDER;
		else
			CE<='0';
			CLK_Div_count<= std_logic_vector (unsigned(CLK_Div_count)-1);
		end if;
	end if;
end process;


busy<=reading OR Writing or WR or rd;

CS<=CS_Register;
SCLK<=SCLK_Register;

SPI_comm: Process (CLK) is begin
	if rising_edge(CLK) then
		Data_Update<='0';
		if reading='0' and writing='0' then
			if WR='1' then
				writing<='1';
				latched_address<=ADDR;
				data_to_write<=DATA_Write;
			elsif RD='1' then
				reading<='1';
				latched_address<=ADDR;
			end if;
		elsif CE='1' then
			if CS_Register='0' then
				
				
				
				if SCLK_Register ='0' then -- on rising edge of SCLK
					SPI_Counter<=SPI_Counter+1; -- increase count of generated clocks
					-- load shift register serially during transfer
					ShiftRegister(23 downto 1)<=ShiftRegister(22 downto 0);
					ShiftRegister(0) <= SDI;
					SDO<=Shiftregister(23);
					if SPI_Counter=to_unsigned(24,6) then -- when 24 clocks are generated
						CS_Register<='1';	-- finish transfer by disabeling CS (invertet logic)
						reading<='0';
						writing<='0';
						SDO<='0';
						--if reading = '1' then -- condition removed, because in the datasheet a write cycle is used to read (read cycle only to initiate)
							Data_Update<='1';
							DATA_Read(15 downto 1) <= ShiftRegister(14 downto 0);
							DATA_Read(0)<=SDI;
						--end if;
					else
						SCLK_Register<=Not SCLK_Register;
					end if;
				else
					SCLK_Register<=Not SCLK_Register;
				end if;
				
			elsif reading='1' or writing='1' then
				CS_Register<='0';
				SPI_Counter<=to_unsigned(0,6);
				-- load shift register parallely:
				ShiftRegister(23)<=reading; --bit defines if access is read or write, 0=write
				ShiftRegister(22 downto 21) <="00"; --bits are always don't care (however a command is 24 bit long)
				ShiftRegister(20 downto 16) <= latched_address;
				ShiftRegister(15 downto 0)  <= data_to_write;
			end if;
		end if;
	end if;
end process;

end Behavioral;

