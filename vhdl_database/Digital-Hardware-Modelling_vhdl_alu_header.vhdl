library IEEE;
use IEEE.std_logic_1164.all;

entity inv is
port(inb: in STD_logic;
     outb: out STD_Logic);
end inv;
architecture structure of inv is
begin
outb <= not (inb);
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity nand2 is
port(a, b: in STD_logic;
	outb: out STD_Logic);
end nand2;
architecture structure of nand2 is
begin
outb <= not(a and b);
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity nand3 is
port(a, b, c: in STD_logic;
           outb: out STD_Logic);
end nand3 ;
architecture structure of nand3 is
begin
outb <= not(a and b and c);
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity nand4 is
port(a, b, c, d: in STD_logic;
	      outb: out STD_Logic);
end nand4 ;
architecture structure of nand4 is
begin
outb <= not(a and b and c and d);
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity nor2 is
port(a, b: in STD_logic;
	outb: out STD_Logic);
end nor2 ;
architecture structure of nor2 is
begin
outb <= not(a or b);
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity nor3 is
port(a, b, c: in STD_logic;
	   outb: out STD_Logic);
end nor3 ;
architecture structure of nor3 is
begin
outb <= not(a or b or c);
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity xor2 is
port(a, b: in STD_logic;
        outb: out STD_Logic);
end xor2 ;
architecture structure of xor2 is
begin
outb <= (a xor b);
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity aoi12 is
port(a, b, c: in STD_logic;
	   outb: out STD_Logic);
end aoi12 ;
architecture structure of aoi12 is
begin
outb <= not(a or (b and c));
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity aoi22 is
port(a, b, c, d: in STD_logic;
              outb: out STD_Logic);
end aoi22 ;
architecture structure of aoi22 is
begin
outb <= not((a and b) or (c and d));
end structure;


library IEEE;
use IEEE.std_logic_1164.all;

entity oai12 is
port(a, b, c: in STD_logic;
	   outb: out STD_Logic);
end oai12;
architecture structure of oai12 is
begin
outb <= not(a and (b or c));
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity oai22 is
port(a, b, c, d: in STD_logic;
              outb: out STD_Logic);
end oai22; 
architecture structure of oai22 is
begin
outb <= not((a or b) and (c or d));
end structure;

library IEEE;
use IEEE.std_logic_1164.all;

entity dff is
port(d, gclk, rnot: in STD_logic;
q: out STD_Logic);
end dff;
architecture structure of dff is
begin
start: process(gclk,rnot)
begin
if ( rising_edge(gclk) or rnot = '0') then
	if (rnot = '0') then
	q <= '0';
	else 
	q <= d;
	end if;
end if;
end process;
end structure;