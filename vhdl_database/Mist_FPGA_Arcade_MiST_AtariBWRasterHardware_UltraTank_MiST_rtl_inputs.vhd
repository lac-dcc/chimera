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
			clk6					: in	std_logic;
			DipSw					: in  std_logic_vector(7 downto 0);
			Coin1_n				: in 	std_logic;
			Coin2_n				: in	std_logic;
			Start1_n				: in	std_logic;
			Start2_n				: in	std_logic;
			Invisible_n			: in	std_logic;
			Rebound_n			: in	std_logic;
			Barrier_n			: in  std_logic;
			JoyW_Fw				: in	std_logic;
			JoyW_Bk				: in	std_logic;
			JoyY_Fw				: in  std_logic;
			JoyY_Bk				: in	std_logic;
			JoyX_Fw				: in	std_logic;
			JoyX_Bk				: in	std_logic;
			JoyZ_Fw				: in	std_logic;
			JoyZ_Bk				: in	std_logic;
			FireA_n				: in	std_logic;
			FireB_n				: in 	std_logic;
			Throttle_Read_n	: in	std_logic;
			Coin_Read_n			: in	std_logic;
			Options_Read_n		: in	std_logic;
			Barrier_Read_n		: in  std_logic;
			Wr_DA_Latch_n		: in  std_logic;
			Adr					: in  std_logic_vector(2 downto 0);
			DBus					: in  std_logic_vector(3 downto 0);
			Dout					: out std_logic_vector(7 downto 0)
			);
end control_inputs;

architecture rtl of control_inputs is


signal Coin					: std_logic := '1';
signal Coin1				: std_logic := '0';
signal Coin2				: std_logic := '0';
signal Options				: std_logic_vector(1 downto 0) := "11";
signal Throttle			: std_logic := '1';
signal DA_latch			: std_logic_vector(3 downto 0) := (others => '0');
signal JoyW					: std_logic;
signal JoyX					: std_logic;
signal JoyY					: std_logic;
signal JoyZ					: std_logic;


begin

-- Joysticks use a clever analog multiplexing in the real hardware in order to reduce the pins required
-- in the wiring harness to the board. For an FPGA this would require additional hardware and complexity 
-- so this has been re-worked to provide individual active-low inputs

--- E6 is a quad synchronous latch driving a 4 bit resistor DAC
E6: process(Clk6, Wr_DA_Latch_n, DBus)
begin	
	if falling_edge(Wr_DA_Latch_n) then
		DA_latch <= (not DBus);
	end if;
end process;

-- Each joystick input goes to a comparator that compares it with a reference voltage coming from the DAC
-- Here we dispense with the DAC and use separate inputs for each of the two switches in each joystick
JoyW <= JoyW_Fw and (JoyW_Bk or DA_latch(0));
JoyY <= JoyY_Fw and (JoyY_Bk or DA_latch(0));
JoyX <= JoyX_Fw and (JoyX_Bk or DA_latch(1));
JoyZ <= JoyZ_Fw and (JoyZ_Bk or DA_latch(1));

-- 9312 Data Selector/Multiplexer at K11
K11: process(Adr, Start1_n, Start2_n, FireA_n, FireB_n, JoyW, JoyY, JoyX, JoyZ)
begin
	case Adr(2 downto 0) is
		when "000" => Throttle <= Start1_n;
		when "001" => Throttle <= JoyW;
		when "010" => Throttle <= Start2_n;
		when "011" => Throttle <= JoyY;
		when "100" => Throttle <= FireA_n;
		when "101" => Throttle <= JoyX;
		when "110" => Throttle <= FireB_n;
		when "111" => Throttle <= JoyZ;
		when others => Throttle <= '0';
	end case;
end process;

-- 9312 Data Selector/Multiplexer at F10
F10: process(Adr, Coin1_n, Coin2_n, Invisible_n, Rebound_n)
begin
	case Adr(2 downto 0) is
		when "000" => Coin <= (not Coin1_n);
		when "001" => Coin <= '1';
		when "010" => Coin <= (not Coin2_n);
		when "011" => Coin <= '1';
		when "100" => Coin <= (not Invisible_n);
		when "101" => Coin <= '1';
		when "110" => Coin <= (not Rebound_n);
		when "111" => Coin <= '1';
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


-- Inputs data mux
Dout <=  	Throttle & "1111111" when Throttle_Read_n = '0' else
				Coin & "1111111" when Coin_Read_n = '0' else 
				Barrier_n & "1111111" when Barrier_Read_n = '0' else
				"111111" & Options when Options_Read_n = '0' else
				x"FF";

end rtl;