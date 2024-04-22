-- Input module for Kee Games Ultra Tank
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

entity control_inputs is 
port(		
			Clk6					: in	std_logic;
			DipSw					: in  std_logic_vector(7 downto 0);
			Trac_Sel_n			: in  std_logic;
			Coin1					: in 	std_logic;
			Coin2					: in	std_logic;
			Coin3					: in 	std_logic;
			Coin4					: in	std_logic;			
			Start1_n				: in	std_logic;
			Start2_n				: in	std_logic;
			Start3_n				: in	std_logic;
			Start4_n				: in	std_logic;	
			Gas1_n				: in  std_logic; -- Gas pedals, these are simple on/off switches
			Gas2_n				: in  std_logic;		
			Gas3_n				: in  std_logic;	
			Gas4_n				: in  std_logic;				
			Gear1_1_n			: in  std_logic; -- Gear select levers
			Gear2_1_n			: in  std_logic;	
			Gear3_1_n			: in  std_logic;			
			Gear1_2_n			: in  std_logic;
			Gear2_2_n			: in  std_logic;
			Gear3_2_n			: in  std_logic;
			Gear1_3_n			: in  std_logic;
			Gear2_3_n			: in  std_logic;
			Gear3_3_n			: in  std_logic;
			Gear1_4_n			: in  std_logic;
			Gear2_4_n			: in  std_logic;
			Gear3_4_n			: in  std_logic;
			Steering1A_n		: in  std_logic; -- Steering wheel signals
			Steering1B_n		: in  std_logic;
			Steering2A_n		: in  std_logic;
			Steering2B_n		: in  std_logic;
			Steering3A_n		: in  std_logic;
			Steering3B_n		: in  std_logic;
			Steering4A_n		: in  std_logic;
			Steering4B_n		: in  std_logic;
			Collision_n			: in	std_logic_vector(4 downto 1); -- Collision detection signals
			Gas_Read_n			: in	std_logic;
			AD_Read_n			: in  std_logic;
			Coin_Read_n			: in	std_logic;
			Options_Read_n		: in	std_logic;
			Trac_Sel_Read_n	: in  std_logic;
			Wr_DA_Latch_n		: in  std_logic;
			
			da_latch				: out std_logic_vector(3 downto 0);
			
			
			Adr					: in  std_logic_vector(2 downto 0);
			DBus					: in  std_logic_vector(3 downto 0);
			Dout					: out std_logic_vector(7 downto 0)
			);
end control_inputs;

architecture rtl of control_inputs is


signal Coin					: std_logic := '1';

signal Options				: std_logic_vector(1 downto 0) := "11";
signal AD_Sel				: std_logic := '1';
--signal DA_latch			: std_logic_vector(3 downto 0) := (others => '0');
signal Gas_Collis_n		: std_logic;
signal Steer1				: std_logic;
signal Steer2				: std_logic;
signal Steer3				: std_logic;
signal Steer4				: std_logic;
signal Shift1				: std_logic;
signal Shift2				: std_logic;
signal Shift3				: std_logic;
signal Shift4				: std_logic;

begin

-- Steering and gear shifts use a clever analog multiplexing in the real hardware in order to reduce the pins required
-- in the wiring harness to the board. For an FPGA this would require additional hardware and complexity 
-- so this has been re-worked to provide individual active-low inputs

--- E6 is a quad synchronous latch driving a 4 bit resistor DAC
E6: process(Clk6, Wr_DA_Latch_n, DBus)
begin	
	if falling_edge(Wr_DA_Latch_n) then
		DA_latch <= (not DBus);
	end if;
end process;

-- Each steering and gear shift input goes to a comparator that compares it with a reference voltage coming 
-- from the DAC Here we dispense with the DAC and use separate inputs for each of the two outputs from each 
-- steering wheel and three from each gear shifter

--Steer1 <= JoyW_Fw and (JoyW_Bk or DA_latch(0));
--Shift1 <= JoyW_Fw and (JoyW_Bk or DA_latch(0));
--Steer2 <= JoyY_Fw and (JoyY_Bk or DA_latch(0));
--Shift2 <= JoyW_Fw and (JoyW_Bk or DA_latch(0));
--Steer3 <= JoyX_Fw and (JoyX_Bk or DA_latch(1));
--Shift3 <= JoyW_Fw and (JoyW_Bk or DA_latch(0));
--Steer4 <= JoyZ_Fw and (JoyZ_Bk or DA_latch(1));
--Shift4 <= JoyZ_Fw and (JoyZ_Bk or DA_latch(1));

-- 9312 Data Selector/Multiplexer at K11
-- Reads steering and gear shift inputs
K11: process(Adr, Steer1, Steer2, Steer3, Steer4, Shift1, Shift2, Shift3, Shift4)
begin
	case Adr(2 downto 0) is
		when "000" => AD_Sel <= Steer1;
		when "001" => AD_Sel <= Shift1;
		when "010" => AD_Sel <= Steer2;
		when "011" => AD_Sel <= Shift2;
		when "100" => AD_Sel <= Steer3;
		when "101" => AD_Sel <= Shift3;
		when "110" => AD_Sel <= Steer4;
		when "111" => AD_Sel <= Shift4;
		when others => AD_Sel <= '0';
	end case;
end process;

-- 9312 Data Selector/Multiplexer at F10
-- Reads coin switches and player start buttons
F10: process(Adr, Coin1, Coin2, Coin3, Coin4, Start1_n, Start2_n, Start3_n, Start4_n)
begin
	case Adr(2 downto 0) is
		when "000" => Coin <= (not Coin1);
		when "001" => Coin <= Start1_n;
		when "010" => Coin <= (not Coin2);
		when "011" => Coin <= Start2_n;
		when "100" => Coin <= (not Coin3);
		when "101" => Coin <= Start3_n;
		when "110" => Coin <= (not Coin4);
		when "111" => Coin <= Start4_n;
		when others => Coin <= '0';
	end case;
end process;


-- Configuration DIP switches
N9: process(Adr(1 downto 0), DipSw)
begin
	case Adr(1 downto 0) is
		when "00" => Options <= DipSw(0) & DipSw(1);
		when "01" => Options <= DipSw(2) & DipSw(3);
		when "10" => Options <= DipSw(4) & DipSw(5);
		when "11" => Options <= DipSw(6) & DipSw(7);
		when others => Options <= "11";
		end case;
end process;


-- 9312 Data Selector/Multiplexer at L12
-- Reads collision detection signals and gas pedals
L12: process(Adr, Gas1_n, Gas2_n, Gas3_n, Gas4_n, Collision_n)
begin
	case Adr(2 downto 0) is
		when "000" => Gas_Collis_n <= Gas1_n;
		when "001" => Gas_Collis_n <= Collision_n(1);
		when "010" => Gas_Collis_n <= Gas2_n;
		when "011" => Gas_Collis_n <= Collision_n(2);
		when "100" => Gas_Collis_n <= Gas3_n;
		when "101" => Gas_Collis_n <= Collision_n(3);
		when "110" => Gas_Collis_n <= Gas4_n;
		when "111" => Gas_Collis_n <= Collision_n(4);
		when others => Gas_Collis_n <= '1';
	end case;
end process;	

-- Inputs data mux
Dout <=  	AD_Sel & "1111111" when AD_Read_n = '0' else
				Coin & "1111111" when Coin_Read_n = '0' else 
				Trac_Sel_n & "1111111" when Trac_Sel_Read_n = '0' else
				"111111" & Options when Options_Read_n = '0' else
				Gas_Collis_n & "1111111" when Gas_Read_n = '0' else
				x"FF";

end rtl;