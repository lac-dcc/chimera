library ieee;
    use ieee.std_logic_1164.all;
library ahir;
use ahir.types.all;
use ahir.subprograms.all;

entity ApIntPhi is
port(x,y: in ApInt;
     reqx,reqy: in boolean;
     z: out ApInt;
     ack: out boolean;
     clk,reset: in std_logic);
end ApIntPhi;

architecture arch of ApIntPhi is 
begin

assert (x'length = y'length) and (x'length = z'length)
report "Length Mismatch in ApIntPhi" severity error; 

process(x,y,reqx,reqy,reset,clk)

begin
 
   if(clk'event and clk = '1') then
       if(reset = '1') then
 	  ack <= false;
	  z <= apintzero(z'length);
       elsif(reqx = true) then
	  ack <= true;
	  z <= x;
       elsif(reqy = true) then
	  ack <= true;
	  z <= y;
       else
	  ack <= false;
       end if;
   end if;
end process;

end arch;

