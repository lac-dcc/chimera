-- Gear Shift
-- (c) 2019 alanswx


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity gearshift is 
port(   
			Clk				: in	std_logic;
			reset				: in	std_logic;
			gearup			: in	std_logic;
			geardown			: in	std_logic;
			gearout			: out std_logic_vector(2 downto 0);
			gear1				: out std_logic;
			gear2				: out std_logic;
			gear3				: out std_logic
			
			);
end gearshift;

architecture rtl of gearshift is

signal gear : std_logic_vector(2 downto 0):= (others =>'0');
signal old_gear_up : std_logic:='0';
signal old_gear_down : std_logic:='0';


begin

gearout<=gear;

process (clk, gear)
begin

  if rising_edge(clk) then


  if (reset='1') then
		gear<="000";
  elsif (gearup='1') then
   if (old_gear_up='0') then
		old_gear_up<='1';
		if (gear < 3) then
			gear<= gear +1;
		end if;
	end if;
  elsif (geardown='1') then
   if (old_gear_down='0') then
	   old_gear_down<='1';
		if (gear>0) then
			gear<=gear-1;
		end if;
	end if;
  else
    old_gear_up<='0';
	 old_gear_down<='0';
  end if;

  end if;

   case gear is
        when "000" => gear1 <=  '0' ;
        when "001" => gear1 <=  '1' ;
        when "010" => gear1 <=  '1' ;
        when "011" => gear1 <=  '1' ;
        when others => gear1 <= '1' ;
    end case;
   case gear is
        when "000" => gear2 <=  '1' ;
        when "001" => gear2 <=  '0' ;
        when "010" => gear2 <=  '1' ;
        when "011" => gear2 <=  '1' ;
        when others => gear2 <= '1' ;
    end case;
   case gear is
        when "000" => gear3 <=  '1' ;
        when "001" => gear3 <=  '1' ;
        when "010" => gear3 <=  '0' ;
        when "011" => gear3 <=  '1' ;
        when others => gear3 <= '1' ;
    end case;
	
end process;


end rtl;