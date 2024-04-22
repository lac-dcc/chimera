-- OUT_LATCH.vhd
-- Implement an 8-bit output latch
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

---------------------------------------------------

entity OUT_LATCH is

generic(n: natural :=8);
port(	
   dataIn8:	in std_logic_vector(n-1 downto 0);
	clock:			in std_logic;
	load:			in std_logic;
	clear:			in std_logic;
	latchOut:		out std_logic_vector(n-1 downto 0)
);
end OUT_LATCH;

----------------------------------------------------

architecture behv of OUT_LATCH is

    signal Q_tmp: std_logic_vector(n-1 downto 0);

begin
	process(dataIn8, clock, load, clear)
	begin
		if clear = '0' then
		-- use 'range in signal assigment 
			Q_tmp <= (Q_tmp'range => '0');
		elsif (clock='1' and clock'event) then
			if load = '0' then
				Q_tmp <= dataIn8;
			end if;
		end if;
	end process;

	-- concurrent statement
	latchOut <= Q_tmp;

end behv;
