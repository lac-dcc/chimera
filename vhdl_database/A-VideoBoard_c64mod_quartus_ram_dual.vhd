library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_dual is
	generic
	(
		data_width : integer := 8;
		addr_width : integer := 16
	); 
	port 
	(
		data	: in std_logic_vector(data_width-1 downto 0);
		raddr	: in std_logic_vector(addr_width-1 downto 0);
		waddr	: in std_logic_vector(addr_width-1 downto 0);
		we		: in std_logic := '1';
		rclk	: in std_logic;
		wclk	: in std_logic;
		q		: out std_logic_vector(data_width-1 downto 0)
	);	
end ram_dual;

architecture rtl of ram_dual is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector(data_width-1 downto 0);
	type memory_t is array((2**addr_width)-1 downto 0) of word_t;
	
	-- Declare the RAM signal.
	signal ram : memory_t;

begin

	process(wclk)
	begin
		if(rising_edge(wclk)) then 
			if(we = '1') then
				ram(to_integer(unsigned(waddr))) <= data;
			end if;
		end if;
	end process;
	
	process(rclk)
	begin
		if(rising_edge(rclk)) then
			q <= ram(to_integer(unsigned(raddr)));
		end if;
	end process;

end rtl;
