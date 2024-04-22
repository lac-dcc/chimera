library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- From https://drive.google.com/file/d/0Bw5zCv39pqmVS2RmcnlUMGp3NVU/view
-- Demo video https://www.youtube.com/watch?v=5BAoJWw11YE


entity pwm is
	generic(
		max_val: integer := 255;
		val_bits: integer := 8
	);
	port(
		clk: in std_logic;
		val_cur: in std_logic_vector((val_bits -1) downto 0);
		pulse: out std_logic
	);
end entity;

architecture arch of pwm is
	signal cnt: std_logic_vector((val_bits -1) downto 0);
	
begin

process(clk) -- Counting
begin
	if(clk'event and clk = '1') then
		if (cnt < (max_val-1)) then
			cnt <= cnt + 1;
		else
			cnt <= (others => '0');
		end if;
	end if;
end process;

process(clk) -- Pulsing
begin
	if(clk'event and clk = '1') then
		if (val_cur > cnt) then
			pulse <= '1';
		else
			pulse <= '0';
		end if;
	end if;
end process;

end arch;
