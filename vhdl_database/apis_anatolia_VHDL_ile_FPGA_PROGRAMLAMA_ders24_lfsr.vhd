library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr is
generic (
c_clkfreq	: integer := 100_000_000;	-- Hz
c_datawidth	: integer := 10;			-- bit
c_shiftfreq	: integer := 100			-- Hz
);
port (
clk			: in std_logic;
load_i		: in std_logic;
enable_i	: in std_logic;
poly_i		: in std_logic_vector (c_datawidth-1 downto 0);
number_o	: out std_logic_vector (c_datawidth-1 downto 0)
);
end lfsr;

architecture Behavioral of lfsr is

constant c_timerlim	: integer := c_clkfreq/c_shiftfreq;

signal load_next	: std_logic := '0';
signal polynomial	: std_logic_vector (c_datawidth-1 downto 0) := (c_datawidth-1 => '1', others => '0'); -- "100...0000"
signal datareg		: std_logic_vector (c_datawidth-1 downto 0) := (c_datawidth-1 => '1', others => '0'); -- "100...0000"
signal timer		: integer range 0 to c_timerlim	:= 0;

begin

P_MAIN : process (clk) is 
	variable tmp : std_logic;
begin
if (rising_edge(clk)) then

	tmp := '0';
	
	load_next	<= load_i;
	
	if (load_i = '1' and load_next = '0') then
		polynomial	<= poly_i;
	end if;
	
	if (enable_i = '1') then
	
		if (timer = c_timerlim-1) then
		
			datareg(c_datawidth-1 downto 1) <= datareg(c_datawidth-2 downto 0);
			
			for i in 0 to c_datawidth-1 loop 
				tmp := (datareg(i) and polynomial(i)) xor tmp;			
			end loop;					
			datareg(0) <= tmp;
			
			timer	<= 0;
		else
			timer	<= timer + 1;
		end if;
		
	end if;

end if;
end process;

number_o	<= datareg;

end Behavioral;