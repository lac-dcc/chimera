library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;

entity ApIntBranch is
             port (condition: in ApInt;
                   clk,reset: in std_logic;
                   req: in Boolean;
                   ack0: out Boolean;
                   ack1: out Boolean);
end entity;


architecture Behave of ApIntBranch is
begin

   process(clk)
   begin
        if(clk'event and clk = '1') then
		if(reset = '1') then
			ack0 <= false;
			ack1 <= false;
		elsif req then
			if(condition(condition'right) = '1') then
				ack1 <= true;
				ack0 <= false;
			else
				ack0 <= true;
				ack1 <= false;
			end if;
		else
			ack0 <= false;
			ack1 <= false;
		end if;
	end if;
   end process;
end Behave;

