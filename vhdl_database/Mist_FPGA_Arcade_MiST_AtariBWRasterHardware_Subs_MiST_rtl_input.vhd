-- Switch and steering input circuitry for Atari Subs
-- (c) 2018 James Sweet
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
use IEEE.STD_LOGIC_UNSIGNED.all;

entity input is 
port(		
			Clk6				: in  std_logic; 
			Sw_F9				: in  std_logic_vector(7 downto 0); -- DIP switches
			Coin1_n			: in  std_logic; -- Coin switches
			Coin2_n			: in 	std_logic;
			Start1			: in	std_logic; -- 1 and 2 player start switches
			Start2			: in	std_logic;
			Fire1				: in  std_logic;
			Fire2				: in  std_logic;
			Test_n			: in	std_logic; -- Self test switch
			Diag_step		: in  std_logic;
			Diag_hold		: in  std_logic;
			Slam				: in  std_logic;
			Steering1A_n	: in  std_logic; -- Steering wheel signals
			Steering1B_n	: in  std_logic;
			Steering2A_n	: in  std_logic;
			Steering2B_n	: in  std_logic;
			SteerReset_n	: in  std_logic;
			Coin_Rd_n		: in	std_logic;
			Control_Rd_n	: in 	std_logic;
			Options_Rd_n	: in	std_logic;
			VBlank_n_s		: in	std_logic;
			Adr				: in  std_logic_vector(2 downto 0); -- Adress bus, only the lower 3 bits used by IO circuitry
			DBus				: out std_logic_vector(7 downto 0);  -- Out to data bus, only bits 7, 1, and 0 used
			Coin_Ctr			: out std_logic -- Coin counter output
			);
end input;

architecture rtl of input is		


signal Coin1			: std_logic;
signal Coin2			: std_logic;

signal SteerDir1		: std_logic;
signal SteerDir2		: std_logic;
signal SteerFlag1		: std_logic;
signal SteerFlag2		: std_logic;

signal E10_y			: std_logic;
signal F10_y			: std_logic;
signal E9_y				: std_logic_vector(1 downto 0);
			
			
			
begin			

Coin1 <= (not Coin1_n); -- Coin inputs are inverted by gates in H11
Coin2 <= (not Coin2_n);
Coin_Ctr <= Coin1 or Coin2; -- Coin counter uses a simple OR gate, not CPU controlled


-- Steering inputs, handled by 7474's at H10 and J10 
SteeringA: process(Steering1A_n, Steering1B_n, SteerReset_n)
begin
	if SteerReset_n = '0' then -- Asynchronous clear
		SteerFlag1 <= '0';
	elsif rising_edge(Steering1B_n) then 
		SteerFlag1 <= '1';
		SteerDir1 <= (not Steering1A_n); -- Steering encoders are active low but inverted on board
	end if;
end process;
	
SteeringB: process(Steering2A_n, Steering2B_n, SteerReset_n)
begin
	if SteerReset_n = '0' then -- Asynchronous clear
		SteerFlag2 <= '0';
	elsif rising_edge(Steering2B_n) then 
		SteerFlag2 <= '1';
		SteerDir2 <= (not Steering2A_n);
	end if;
end process;


-- 74LS251 data selector/multiplexer at E10
E10: process(Adr, Start1, Start2, Fire1, Fire2, Coin1, Coin2, Test_n, VBlank_n_s)
begin
	case Adr(2 downto 0) is
		when "000" => E10_y <= Coin2;
		when "001" => E10_y <= Start1;
		when "010" => E10_y <= Coin1;
		when "011" => E10_y <= Start2;
		when "100" => E10_y <= VBlank_n_s;
		when "101" => E10_y <= Fire1;
		when "110" => E10_y <= Test_n;
		when "111" => E10_y <= Fire2;
		when others => E10_y <= '1';
	end case;
end process;


-- 74LS251 data selector/multiplexer at F10
F10: process(Adr, Diag_step, Diag_hold, Slam, SteerDir1, SteerDir2, SteerFlag1, SteerFlag2, VBlank_n_s)
begin
	case Adr(2 downto 0) is
		when "000" => F10_y <= Diag_step;
		when "001" => F10_y <= Diag_hold;
		when "010" => F10_y <= Slam;
		when "011" => F10_y <= '1'; -- 'Spare' on schematic
		when "100" => F10_y <= SteerDir1;
		when "101" => F10_y <= SteerFlag1;
		when "110" => F10_y <= SteerDir2;
		when "111" => F10_y <= SteerFlag2;
		when others => F10_y <= '1';
	end case;
end process;


-- 74LS253 dual selector/multiplexer at E9
E9: process(Adr, Sw_F9)
begin
	case Adr(1 downto 0) is
		when "00" => E9_y <= Sw_F9(0) & Sw_F9(1); 
		when "01" => E9_y <= Sw_F9(2) & Sw_F9(3);
		when "10" => E9_y <= Sw_F9(4) & Sw_F9(5);
		when "11" => E9_y <= Sw_F9(6) & Sw_F9(7);
		when others => E9_y <= "11";
		end case;
end process;


-- Input data mux
DBus <= 	E10_y & "1111111" when Coin_Rd_n = '0' else
			F10_y & "1111111" when Control_Rd_n = '0' else 
			"111111" & E9_y  when Options_Rd_n = '0' else
			x"FF";

end rtl;
