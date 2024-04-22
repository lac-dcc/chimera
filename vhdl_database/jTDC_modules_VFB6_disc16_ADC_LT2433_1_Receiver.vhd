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


-- Clock High        Min /  Max / Internal Clock
--              3,125 ms / 4 us /     57,14 us
-- resulting SPS   0,125 / 97,5 /     6.8 
-- samlpe interval  8s   / 10ms / 147 ms
-- -> if clock is high for 4 ms, a new packet is to arrive


entity ADC_LT2433_1_Receiver is
    Port ( CLK : in  STD_LOGIC;
           SCLK : in  STD_LOGIC; --internal oscillator: SCLK=17,5kHz, external oscillator SCLK=f_EOSC/8=250kHz Maximum, 320 Hz Minimum
           SDO : in  STD_LOGIC;
           Data : out  STD_LOGIC_VECTOR (18 downto 0) :="1111110111011101110"; -- in hex 7eeee to indicate that no value was read so far
           Data_Update : out  STD_LOGIC);
end ADC_LT2433_1_Receiver;

architecture Behavioral of ADC_LT2433_1_Receiver is

signal timeout_counter : unsigned (18 downto 0) := to_unsigned(0,19);

Signal D_SCLK, DD_SCLK, D_SDO, LE_SCLK : STD_LOGIC :='0';
Signal Reset_Packet : STD_LOGIC :='0';


signal bit_counter : unsigned (4 downto 0) := to_unsigned(0,5);

Signal Shift_register : STD_LOGIC_VECTOR (18 downto 0) :=(others=>'0');
Signal SR_Full, DSR_Full : STD_LOGIC :='0';

--signal Data_reg :  STD_LOGIC_VECTOR (18 downto 0) :="1111110111011101110"; -- in hex 7eeee to indicate that no value was read so far

begin


Process (CLK) is begin
	if rising_edge(CLK) then
		D_SCLK<=SCLK;
		DD_SCLK<=D_SCLK;
		D_SDO<=SDO;
	end if;
end process;

process (D_SCLK, DD_SCLK) is begin
	if D_SCLK='1' AND DD_SCLK='0' then
		LE_SCLK<='1';
	else
		LE_SCLK<='0';
	end if;
end process;

Process (CLK) is begin
	if rising_edge(CLK) then
		if D_SCLK='0' then
			timeout_counter<=to_unsigned(0,19);
			Reset_Packet<='0';
		elsif timeout_counter = to_unsigned (400000, 19) then-- simulation 400/ synthesis:400000
			Reset_Packet<='1';
		elsif D_SCLK='1' then
			timeout_counter<=timeout_counter+1;		
		end if;
	end if;
end process;


process (CLK) is begin
	if rising_edge(CLK) then
		if Reset_Packet='1' then
			bit_counter<=to_unsigned(0,5);
		elsif LE_SCLK='1' then
			bit_counter<=bit_counter+1;
			Shift_register(0)<=SDO;
			Shift_register(18 downto 1)<=Shift_register(17 downto 0);
		end if;
		
		if bit_counter=to_unsigned(19,5) then
			SR_Full<='1';
		else 
			SR_Full <='0';
		end if;
		
		DSR_Full<=SR_Full;
		
	end if;
end process;

Process (CLK) is begin --(SR_Full, DSR_Full, Shift_register, Data) is begin
	if rising_edge(CLK) then
		if SR_Full='1' and DSR_Full='0' then
			Data_Update<='1';
			Data<=Shift_register;
		else
			Data_Update<='0';
		end if;
	end if;
end process;


end Behavioral;

