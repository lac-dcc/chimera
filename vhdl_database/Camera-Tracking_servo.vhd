----------------------------
--- servo code
--
-- inputs 
-- clk    system clock
-- s_high_period ---> number of clock cycles it should be high
-- servo_ctr     ---> the output control signal
--
--
--       |-------------------- 20 ms ----------------------------|
--
--
--        --------                  										--
--       |        |                                              |
--       |        |                                              |
--       |        |                                              |
--       |        |                                              |
-- ------|        |---------------------------------------------- 
--
--       + 1-2ms  +   
--         Angle

-- Angle ranges from 0 to 200 with 0 reresenting 1 ms and 200 indicating 2ms
-- The Period is calculated using a 50 MHz input clock 
-- so there are 50,000 clk counts per 1 ms.
 
 -- Import the definitions for standard logic
library ieee;
use ieee.std_logic_1164.all;

entity servo is 
	port(clk: in STD_LOGIC;
		Angle: in integer := 100;   -- 1.5 ms
		servo_ctr: out STD_LOGIC
	);
end;

architecture behavior of servo is 

------------------------------------
	-- Servo Stuff
	-- assuming a 50 MHz clock
	--s_high_period
	constant s_period: integer range 0 to 1100000:= 1000000; -- 1 X 10^6 is 1 ms 
	signal s_high_period: integer range 0 to 100000;
	signal s_cnt: integer range 0 to 1100000 := 0;
begin
	s_high_period <= 50000 + (250 * Angle);
	process (clk)
	begin
		if(rising_edge(clk))then
			if(s_cnt >= s_period)then
				s_cnt <= 0;
			else 
				s_cnt <= s_cnt + 1;
			end if;

			if(s_cnt >= s_high_period)then
				servo_ctr <= '0';
			else 
				servo_ctr <= '1';
			end if;
		end if;
	end process;
end behavior;
	