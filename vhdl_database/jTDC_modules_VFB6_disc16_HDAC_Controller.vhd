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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HDAC_Controller is
	 generic (default_DAC_value : STD_LOGIC_VECTOR (11 downto 0) := X"690");
    Port ( CLK : in  STD_LOGIC;
           Channel : in  STD_LOGIC_VECTOR (4 downto 0); --0= boradcast 1... 16=channels 1...16
           Data : in  STD_LOGIC_VECTOR (11 downto 0);  -- data to be written to channels
           Busy : out  STD_LOGIC;  -- module is busy and will ignore commands
			  HDAC_CLK, HDAC_Load, HDAC_SDI : out STD_LOGIC_VECTOR(2 downto 1) :="11"; --pysical lines.
           WE, Init : in  STD_LOGIC);   --WE: write data to channel, Init set dac to WTM
end HDAC_Controller;

architecture Behavioral of HDAC_Controller is

	COMPONENT DAC088S085_Controller
	PORT(
		CLK : IN std_logic;
		CLKDivH : IN std_logic_vector(3 downto 0);
		CLKDivL : IN std_logic_vector(3 downto 0);
		WE : IN std_logic;
		Address : IN std_logic_vector(3 downto 0);
		Data : IN std_logic_vector(11 downto 0);          
		SCLK : OUT std_logic;
		SDA : OUT std_logic;
		CS : OUT std_logic;
		Busy : OUT std_logic
		);
	END COMPONENT;

Signal ContBusy : STD_LOGIC_VECTOR (2 downto 1) :="00";
Signal ContData : STD_LOGIC_VECTOR (11 downto 0) :=X"000";

-- initially: set dacs to WTM (Write through mode)
Signal ContWE: STD_LOGIC_VECTOR (2 downto 1) :="11"; 
Signal ContAddress : STD_LOGIC_VECTOR (3 downto 0):=X"9"; 

signal InternalBusy : STD_LOGIC :='1'; -- necessary due to initialize config

--initially, write default values into registers.
signal InitValues : STD_LOGIC :='1';	
	
function WEChannel1(index: STD_LOGIC_VECTOR(4 downto 0)) return STD_LOGIC is
begin
	if index = "00000" OR index = "00001" OR index = "00010" OR index = "00011" OR index = "00100" OR 
		index = "00101" OR index = "00110" OR index = "00111" OR index = "01000" then
		return '1';
	else
		return '0';
	end if;
end WEChannel1;

function WEChannel2(index: STD_LOGIC_VECTOR(4 downto 0)) return STD_LOGIC is
begin
	if index = "00000" OR index = "01001" OR index = "01010" OR index = "01011" OR index = "01100" OR 
		index = "01101" OR index = "01110" OR index = "01111" OR index = "10000" then
		return '1';
	else
		return '0';
	end if;
end WEChannel2;
	

function AddressCode(index: STD_LOGIC_VECTOR(4 downto 0)) return STD_LOGIC_vector is
begin
	if index = "00000" then  -- boroadcast = chip addr. 0xC
		return X"C";
	elsif index = "00001" then
		return X"0";
	elsif index = "00010" then
		return X"1";
	elsif index = "00011" then
		return X"2";
	elsif index = "00100" then
		return X"3";
	elsif index = "00101" then
		return X"4";
	elsif index = "00110" then
		return X"5";
	elsif index = "00111" then
		return X"6";
	elsif index = "01000" then
		return X"7";
	elsif index = "01001" then
		return X"0";
	elsif index = "01010" then
		return X"1";
	elsif index = "01011" then
		return X"2";
	elsif index = "01100" then
		return X"3";
	elsif index = "01101" then
		return X"4";
	elsif index = "01110" then
		return X"5";
	elsif index = "01111" then
		return X"6";
	elsif index = "10000" then
		return X"7";
	else 
		return X"F";
	end if;
end AddressCode;
	

	
begin

Busy <= ContBusy(1) OR ContBusy(2) OR internalbusy;

process (CLK) is begin
	if rising_edge(CLK) then
		if ContBusy="00" AND InternalBusy='0' then
			if Init='1' then -- initialize config: write through mode
				ContWE<="11";
				InternalBusy<='1';
				ContAddress<=X"9";
			elsif InitValues='1' then -- initialize default dac values
				InitValues <='0';
				InternalBusy<='1';
				ContData<=default_DAC_value;
				ContWE<="11";
				ContAddress<=X"C";
			elsif WE='1' then
				InternalBusy<='1';
				ContData<=Data;
				ContWE(1)<=WEChannel1(Channel);
				ContWE(2)<=WEChannel2(Channel);
				ContAddress<=AddressCode(Channel);
			end if;
		else
			InternalBusy<='0';
			ContWE<="00";
		end if;
	end if;
end process;

	Inst_DAC088S085_Controller_1: DAC088S085_Controller PORT MAP(
		CLK => CLK,
		CLKDivH => "0010",
		CLKDivL => "0010",
		WE => ContWE(1),
		Address => ContAddress,
		Data => ContData,
		SCLK => HDAC_CLK(1),
		SDA => HDAC_SDI(1),
		CS => HDAC_Load(1),
		Busy => ContBusy(1)
	);

	Inst_DAC088S085_Controller_2: DAC088S085_Controller PORT MAP(
		CLK => CLK,
		CLKDivH => "0010",
		CLKDivL => "0010",
		WE => ContWE(2),
		Address => ContAddress,
		Data => ContData,
		SCLK => HDAC_CLK(2),
		SDA => HDAC_SDI(2),
		CS => HDAC_Load(2),
		Busy => ContBusy(2)
	);


end Behavioral;

