
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multi74123 is
    Port ( inh_pos : in  STD_LOGIC;
           q_neg : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end multi74123;

architecture Behavioral of multi74123 is
constant pulse_len : integer range 0 to 32767 := 20160;
signal cnt : integer range 0 to 32767 := 0;
signal inh_R : std_logic := '0';
signal inh_R_prev : std_logic := '0';

begin

	process (clk) is
	begin
		if rising_edge(clk) then
			if cnt>0 then
				cnt <= cnt - 1;
			end if;
			inh_R_prev <= inh_R;
			inh_R <= inh_pos;
			if inh_R_prev = '0' and inh_R='1' then
				cnt <= pulse_len;
			end if;
		end if;
	end process;

	q_neg <= '0' when (cnt>0) else '1';
	
end Behavioral;

