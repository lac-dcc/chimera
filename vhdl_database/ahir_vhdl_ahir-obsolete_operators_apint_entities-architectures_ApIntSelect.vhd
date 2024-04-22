library ieee;
    use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;

entity ApIntSelect is
port(x,y,sel: in ApInt;
     req: in boolean;
     z: out ApInt;
     ack: out boolean;
     clk,reset: in std_logic);
end ApIntSelect;


architecture arch of ApIntSelect is 
begin

assert (x'length = y'length) and (x'length = z'length) and (sel'length = 1)
report "Length Mismatch in ApIntSelect" severity error; 

process(x,y,sel,req,reset,clk)

begin
 
   if(clk'event and clk = '1') then
       if(reset = '1') then
 	  ack <= false;
	  z <= apintzero(z'length);
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

