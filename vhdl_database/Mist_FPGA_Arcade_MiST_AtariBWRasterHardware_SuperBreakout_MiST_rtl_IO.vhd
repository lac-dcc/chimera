-- IO block for Atari Super Breakout
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

entity IO is 
port(		
			CLK6				: in  std_logic; 
			SW2				: in  std_logic_vector(7 downto 0); -- DIP switches
			Coin1_n			: in  std_logic; -- Coin switches
			Coin2_n			: in 	std_logic;
			Start1_n			: in	std_logic; -- 1 and 2 player start switches
			Start2_n			: in	std_logic;
			Select1_n		: in  std_logic; -- Game select inputs from rotary switch
			Select2_n		: in  std_logic;
			Serve_n			: in	std_logic; -- Serve button
			Test_n			: in	std_logic; -- Self test switch
			Slam_n			: in	std_logic; -- Slam switch
			Sense1			: in  std_logic; -- Sense signals from paddle input circuit
			Sense2			: in	std_logic;
			Mask1_n			: out std_logic; -- Mask signals to paddle input circuit
			Mask2_n			: out std_logic;
			Timer_Reset_n	: out std_logic;
			IntAck_n			: out std_logic;
			IO_wr				: in  std_logic;
			Lamp1				: out std_logic; -- Player start button lamps
			Lamp2				: out std_logic; -- Active high to trigger SCRs controlling incandescent lamps
			Serv_LED_n		: out std_logic; -- Serve button LED is active low
			Counter			: out std_logic; -- Coin counter
			Adr				: in  std_logic_vector(9 downto 0); -- Adress bus, only the lower 9 bits used by IO circuitry
			Inputs			: out std_logic_vector(1 downto 0)  -- Out to data bus, only upper two bits used
			);
end IO;

architecture rtl of IO is

signal A8_8				: std_logic;
signal H9_Q_n			: std_logic;
signal H8_en			: std_logic;
signal Coin1			: std_logic;
signal Coin2			: std_logic;
signal SW2_bank1		: std_logic;
signal SW2_bank2		: std_logic;
signal DipSW			: std_logic_vector(7 downto 0);
signal E8_in			: std_logic_vector(3 downto 0);
signal J9_out			: std_logic_vector(7 downto 0);
signal E8_out			: std_logic_vector(9 downto 0);


begin

-- Inputs
M8: process(Adr(7 downto 6), Coin1, Coin2, Start1_n, Start2_n, Test_n, Slam_n, A8_8, SW2_bank2)
begin
	case Adr(7 downto 6) is
		when "00" => Inputs <= A8_8 & SW2_bank2; -- There is actually an inverter N9 fed by A8_8 so we will just account for that
		when "01" => Inputs <= Coin2 & Coin1;
		when "10" => Inputs <= Start2_n & Start1_n;
		when "11" => Inputs <= Test_n & Slam_n;
		when others => Inputs <= "11";
		end case;
end process;
-- Coin switch inputs are active-high internally but inverted on board from active-low inputs
Coin1 <= (not Coin1_n);
Coin2 <= (not Coin2_n);


H9: process(Adr, Select1_n, Select2_n, Serve_n, Sense1, Sense2)
begin
	if Adr(4) = '0' then -- Adr(4) is connected to enable
		case Adr(2 downto 0) is
			when "000" => H9_Q_n <= (not Select1_n);
			when "100" => H9_Q_n <= (not Sense1);
			when "101" => H9_Q_n <= (not Sense2);
			when "110" => H9_Q_n <= (not Serve_n);
			when "111" => H9_Q_n <= (not Select2_n);
			when others => H9_Q_n <= '1';
			end case;
	else
		H9_Q_n <= '1';
	end if;
end process;
		
	
-- The way the dip switches are wired in the real hardware requires some changes 
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
DipSW(7) <= J9_out(7) when SW2(1) = '0' else '1';
DipSW(6) <= J9_out(6) when SW2(3) = '0' else '1';
DipSW(5) <= J9_out(5) when SW2(5) = '0' else '1';
DipSW(4) <= J9_out(4) when SW2(7) = '0' else '1';

--Bank 2
DipSW(3) <= J9_out(3) when SW2(0) = '0' else '1';
DipSW(2) <= J9_out(2) when SW2(2) = '0' else '1';
DipSW(1) <= J9_out(1) when SW2(4) = '0' else '1';
DipSW(0) <= J9_out(0) when SW2(6) = '0' else '1';

-- Outputs from each switch bank are tied together, logical AND since they are active low
SW2_bank1 <= DipSW(7) and DipSW(6) and DipSW(5) and DipSW(4);
SW2_bank2 <= DipSW(3) and DipSW(2) and DipSW(1) and DipSW(0);

-- Bank 1 of dip switches is multiplexed with player inputs connected to selector H9
A8_8 <= SW2_bank1 and H9_Q_n;


-- Outputs
E8_in <= IO_wr & Adr(9 downto 7);
E8: process(E8_in)
begin
	case E8_in is
		when "0000" => E8_out <= "1111111110";
		when "0001" => E8_out <= "1111111101";
      when "0100" => E8_out <= "1111101111";
      when others => E8_out <= "1111111111";
      end case;
end process;

H8_en <= E8_out(0);
TIMER_RESET_n <= E8_out(1);
INTACK_n <= E8_out(4);

-- H8 9334 
H8_dec: process(clk6)
begin
if rising_edge(clk6) then
	if (H8_en = '0') then
	  case Adr(6 downto 4) is
		 when "000" => null;
		 when "001" => SERV_LED_n <= Adr(0);
		 when "010" => null;
		 when "011" => LAMP1 <= Adr(0);
		 when "100" => LAMP2 <= Adr(0);
		 when "101" => MASK1_n <= Adr(0);
		 when "110" => MASK2_n <= Adr(0);
		 when "111" => COUNTER <= Adr(0);
		 when others => null;
	  end case;
	end if;
 end if;
end process;

end rtl;