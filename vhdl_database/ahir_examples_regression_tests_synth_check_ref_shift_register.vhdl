library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity shift_register is
 port (
	data_in: in std_logic_vector(31 downto 0);
	data_out: out std_logic_vector(31 downto 0);
	clk, reset: in std_logic
	);
end entity shift_register;


architecture behave of shift_register is
	subtype  d32 is unsigned(31 downto 0);
	type  sr_array is array (natural range <>) of d32;

	signal sr: sr_array(0 to 4);

begin
	data_out <= std_logic_vector(sr(4));
	sr(0) <= unsigned(data_in);

	sr_gen: for I in 1 to 4 generate
		process(clk) 
		begin
			if(clk'event and (clk = '1')) then
				if(reset = '1') then
					sr(I) <= (others => '0');
				else
					sr(I) <= (sr(I-1) + 1);
				end if;
			end if;
		end process;
	end generate sr_gen;
end behave;
	
