library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity spy_hunter_control is
port(
 clock_40     	: in std_logic;
 reset        	: in std_logic;
 vsync 			: in std_logic;
 
 gas_plus     	: in std_logic;
 gas_minus     : in std_logic;
 steering_plus : in std_logic;
 steering_minus: in std_logic;
 steering      : out std_logic_vector(7 downto 0);
 gas           : out std_logic_vector(7 downto 0)
  );
end spy_hunter_control;
 
 
architecture struct of spy_hunter_control is
 signal steering_r    : std_logic_vector(7 downto 0);
 --signal steering_plus    : std_logic;
 signal steering_plus_r  : std_logic;
 --signal steering_minus   : std_logic;
 signal steering_minus_r : std_logic;
 signal steering_timer   : std_logic_vector(5 downto 0);
 
 signal gas_r    : std_logic_vector(7 downto 0);
 --signal gas_plus    : std_logic;
 signal gas_plus_r  : std_logic;
 --signal gas_minus   : std_logic;
 signal gas_minus_r : std_logic;
 signal gas_timer   : std_logic_vector(5 downto 0);
 signal vsync_r : std_logic;
 begin-- absolute position decoder simulation
--
--  steering :
--       thresholds        median
--   F5 <  left 8   < 34    30
--   35 <  left 7   < 3C    38
--   3D <  left 6   < 44    40
--   45 <  left 5   < 4C    48     
--   4D <  left 4   < 54    50
--   45 <  left 3   < 5C    58
--   5D <  left 2   < 64    60
--   65 <  left 1   < 6C    68
--   6D < centrered < 74    70
--   75 <  right 1  < 7C    78
--   7D <  right 2  < 84    80
--   85 <  right 3  < 8C    88
--   8D <  right 4  < 94    90
--   95 <  right 5  < 9C    98
--   9D <  right 6  < A4    A0
--   A5 <  right 7  < AC    A8
--   AD <  right 8  < F4    BO

-- gas :
--         threshold          median
--    00 < gas pedal 00 < 3B   (39)  3E-5
--    3C < gas pedal 01 < 40    3E
--    41 < gas pedal 02 < 45    43
--    46 < gas pedal 03 < 4A    48      
--    4B < gas pedal 04 < 4F    4D
--    50 < gas pedal 05 < 54    52
--    55 < gas pedal 06 < 59    57
--    5A < gas pedal 07 < 5E    5C
--    5F < gas pedal 08 < 63    61
--     ...
--    FA < gas pedal 27 < FE    FC
--    FF = gas pedal 28        (FF)  FC+4


gas <= gas_r;
steering <= steering_r;

process (clock_40, reset)
begin
	if reset = '1' then 	
		gas_r <= x"39";
		steering_r <= x"70";
	else

		if rising_edge(clock_40) then
			gas_plus_r       <= gas_plus;
			gas_minus_r      <= gas_minus;
			steering_plus_r  <= steering_plus;
			steering_minus_r <= steering_minus;
			vsync_r          <= vsync;
			
			-- gas increase/decrease as long as btn is pushed
			-- keep current value when no btn is pushed
			if gas_r < x"39" then
				gas_r <= x"39";
			else 		
				if (gas_plus_r = not gas_plus)  or
					(gas_minus_r = not gas_minus) then
						gas_timer <= (others => '0');
				else
					if vsync_r ='0' and vsync = '1' then 
						if (gas_timer >= 5 and (gas_minus_r = '1' or gas_plus_r = '1')) then --tune inc/dec rate
							gas_timer <= (others => '0');
						else
							gas_timer <= gas_timer + 1;
						end if;
					end if;
				end if;
	
				if vsync_r ='0' and vsync = '1' and gas_timer = 0 then	
					if gas_plus = '1' then
						if gas_r >= x"FC" then gas_r <= x"FF"; else gas_r <= gas_r + 5; end if;
					elsif gas_minus = '1' then
						if gas_r <= x"3E" then gas_r <= x"39"; else gas_r <= gas_r - 5; end if;
					end if;
				end if;
				
			end if;
		
			-- steering increase/decrease as long as btn is pushed
			-- return to center value when no btn is pushed
			if steering_r < x"30" then
				steering_r <= x"30";
			elsif steering_r > x"B0" then
				steering_r <= x"B0"; 
			else
				if (steering_plus_r = not steering_plus)  or
					(steering_minus_r = not steering_minus) then
						steering_timer <= (others => '0');
				else
					if vsync_r ='0' and vsync = '1' then 
						if (steering_timer >= 7 and (steering_minus_r = '1' or  steering_plus_r = '1')) or   -- tune btn pushed   rate
						   (steering_timer >= 3 and (steering_minus_r = '0' and steering_plus_r = '0')) then -- tune btn released rate
							steering_timer <= (others => '0');
						else
							steering_timer <= steering_timer + 1;
						end if;
					end if;
				end if;
				
				if vsync_r ='0' and vsync = '1' and steering_timer = 0 then	
					if steering_plus = '1' then 
						if steering_r >= x"A8" then steering_r <= x"B0"; else steering_r <= steering_r + 8; end if;
					elsif steering_minus = '1' then
						if steering_r <= x"38" then steering_r <= x"30"; else steering_r <= steering_r - 8; end if;
					else
						if steering_r <= x"68" then steering_r <= steering_r + 8; end if;						
						if steering_r >= x"78" then steering_r <= steering_r - 8; end if;
						if (steering_r > x"68") and (steering_r < x"78") then steering_r <= x"70"; end if;						
					end if;
				end if;

			end if;
		
		end if;
		
	end if;
end process;	

end struct;
