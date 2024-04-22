library ieee;
    use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;

entity ApFloatSelect is
port(x,y: in ApFloat;
     sel: in ApInt;
     req: in boolean;
     z: out ApFloat;
     ack: out boolean;
     clk,reset: in std_logic);
end ApFloatSelect;


architecture arch of ApFloatSelect is 
begin

assert (x'length = y'length) and (sel'length = 1)
report "Length Mismatch in ApFloatSelect" severity error; 

process(x,y,sel,req,reset,clk)

begin
 
   if(clk'event and clk = '1') then
       if(reset = '1') then
 	  ack <= false;
       elsif(sel(sel'right) = '1' and req = true) then
	  ack <= req;
	  z <= x;
       elsif(sel(sel'right) = '0' and req = true) then
	  ack <= req;
	  z <= y; 
       else 
          ack <= false;
       end if;
   end if;
end process;

end arch;

