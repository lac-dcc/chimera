--
-- NE555V implementation as frequency generator
--
-- basically a real easy way to get one clock from another!
--
-- Mike Coates 
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 

entity NE555V is
	generic (
		freq_in  : integer := 48000;
      freq_out : real := 4000.0;
      duty     : integer := 50
   );
	port (
		reset   : in  std_logic;  -- reset controller
      clk_in  : in  std_logic;  -- input frequency
      clk_out : out std_logic   -- output frequency
	);
end;

 
architecture behavior of NE555V is

	 constant maxcount  : integer := integer(real(freq_in)/freq_out) - 1;
	 constant cyclecount : integer := integer(real(maxcount) * ((100.0 - real(duty)) / 100.0));
	 signal r_reg, r_next: natural;

begin

	 process(clk_in,reset)
    begin

		if reset='0' then 
			r_reg <= 0;
      elsif falling_edge(clk_in) then 
			r_reg <= r_next;
      end if;
    end process;


    -- next state logic
    r_next <= 0 when r_reg=maxcount else r_reg+1;

    -- clk_out setting
    clk_out <= '0' when r_reg < cyclecount else '1';

end behavior;

