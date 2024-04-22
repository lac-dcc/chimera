-- Input block for Kee Games Sprint 1
-- 2017 James Sweet
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity control_inputs is 
port(		
			Clk6				: in  std_logic; 
			SW1				: in  std_logic_vector(7 downto 0); -- DIP switches
			Coin1_n			: in  std_logic; -- Coin switches
			Coin2_n			: in 	std_logic;
			Start				: in	std_logic; -- player start switch
			Gas				: in  std_logic; -- Gas pedal, simple on/off switche
			Gear1				: in  std_logic; -- Gear select lever
			Gear2				: in  std_logic;
			Gear3				: in  std_logic;
			Self_Test		: in	std_logic; -- Self test switch
			Steering1A_n	: in  std_logic; -- Steering wheel signals
			Steering1B_n	: in  std_logic;
			SteerRst1_n		: in  std_logic;
			Adr				: in  std_logic_vector(9 downto 0); -- Adress bus, only the lower 9 bits used by IO circuitry
			Inputs			: out std_logic_vector(1 downto 0)  -- Out to data bus, only upper two bits used
			);
end control_inputs;

architecture rtl of control_inputs is

signal A8_8					: std_logic;
signal H9_Q_n				: std_logic;
signal H8_en				: std_logic;
signal Coin1				: std_logic;
signal Coin2				: std_logic;
signal SW1_bank1			: std_logic;
signal SW1_bank2			: std_logic;
signal DipSW				: std_logic_vector(7 downto 0);
signal E8_in				: std_logic_vector(3 downto 0);
signal J9_out				: std_logic_vector(7 downto 0);
signal E8_out				: std_logic_vector(9 downto 0);

signal Steering1B_Q_n		: std_logic;
signal Steering1A_Q		: std_logic;


begin

-- Inputs
M8: process(Adr, A8_8, SW1_bank2, Coin2_n, Coin1_n, Steering1B_Q_n, Steering1A_Q)
begin
	case Adr(7 downto 6) is
		when "00" => Inputs <= A8_8 & SW1_bank2; -- There is actually an inverter N9 fed by A8_8 so we will just account for that
		when "01" => Inputs <= Coin2_n & Coin1_n;
		when "10" => Inputs <= Steering1B_Q_n & Steering1A_Q;
		when others => Inputs <= "11";
		end case;
end process;

H9: process(Adr, Gear1, Gear2, Gear3, Gas, Self_Test, Start)
begin
	if Adr(4) = '0' then -- Adr(4) is connected to enable
		case Adr(2 downto 0) is
			when "000" => H9_Q_n <= (not Gear1);
			when "001" => H9_Q_n <= (not Gear2);
			when "010" => H9_Q_n <= (not Gear3);
			when "011" => H9_Q_n <= (not Gas);
			when "100" => H9_Q_n <= (not Self_Test);
			when "101" => H9_Q_n <= (not Start);
			when "110" => H9_Q_n <= '1';
			when others => H9_Q_n <= '1';
			end case;
	else
		H9_Q_n <= '1';
	end if;
end process;

-- Steering
M9: process(Steering1A_n, Steering1B_n, SteerRst1_n)
begin
	if SteerRst1_n <= '0' then -- Asynchronous clear
		Steering1B_Q_n <= '1';
	elsif rising_edge(Steering1B_n) then -- Steering encoders are active low but inverted on board
		Steering1A_Q <= Steering1A_n;
		Steering1B_Q_n <= '0';
	end if;
end process;		
		
-- The way the dip switches are wired in the real hardware requires OR logic 
-- to achieve the same result while using standard active-low switch inputs.
-- Switches are split into two banks, each bank fed from half of selector J9.
J9: process(Adr)
begin
	if Adr(3) = '1' then
		J9_out <= "11111111";
	else
		case Adr(1 downto 0) is
			when "00" => J9_out <= "11101110";
			when "01" => J9_out <= "11011101";
			when "10" => J9_out <= "10111011";
			when "11" => J9_out <= "01110111";
			end case;
	end if;
end process;

-- Re-order the dip switch signals to match the physical order of the switches
-- Bank 1
DipSW(7) <= J9_out(7) or SW1(1);
DipSW(6) <= J9_out(6) or SW1(3);
DipSW(5) <= J9_out(5) or SW1(5);
DipSW(4) <= J9_out(4) or SW1(7);

--Bank 2
DipSW(3) <= J9_out(3) or SW1(0);
DipSW(2) <= J9_out(2) or SW1(2);
DipSW(1) <= J9_out(1) or SW1(4);
DipSW(0) <= J9_out(0) or SW1(6);

-- Outputs from each switch bank are tied together, logical AND since they are active low
SW1_bank1 <= DipSW(7) and DipSW(6) and DipSW(5) and DipSW(4);
SW1_bank2 <= DipSW(3) and DipSW(2) and DipSW(1) and DipSW(0);

-- Bank 1 of dip switches is multiplexed with player inputs connected to selectors F9 and H9
A8_8 <= SW1_bank1 and H9_Q_n;

end rtl;