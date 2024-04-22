-- Toggle_On_FN_Key.vhd
-- Implement an toggle on the FN key press
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

---------------------------------------------------

entity Toggle_On_FN_Key is
port(	
   FNKey:			in std_logic;
	clock:			in std_logic;
	n_res:			in std_logic;
	latchFNKey:	out std_logic
);
end Toggle_On_FN_Key;

----------------------------------------------------

architecture behv of Toggle_On_FN_Key is

    signal FNDelta1	: std_logic := '0';
    signal FNDelta2	: std_logic := '0';
    signal FNDelta3	: std_logic := '0';
    signal loopback	: std_logic := '0';

begin
	process(clock, n_res, loopback)
	begin
		if n_res = '0' then
			FNDelta1 <= '0';
			FNDelta2 <= '0';
			FNDelta3 <= '0';
			latchFNKey <= '0';
			loopback <= '0';
		elsif rising_edge(clock) then
			FNDelta1 <= FNKey;
			FNDelta2 <= FNDelta1;
			FNDelta3 <= FNDelta2;
			if FNDelta3 = '0' and FNDelta2 = '1' then
				loopback <= not loopback;
			end if;
		end if;
		latchFNKey <= loopback;
	end process;

end behv;
