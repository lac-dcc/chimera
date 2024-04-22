library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delayer is
	generic(
		DATA_WIDTH	: integer := 32;
		STAGES		: integer := 1 -- stages of delay, should be at least 1
		);
	port(
		clk			: in std_logic;
		data_in		: in std_logic_vector(DATA_WIDTH-1 downto 0);
		data_out	: out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end entity;

architecture rtl of delayer is
	type data_buffer_t is array(STAGES-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal data_buffer	: data_buffer_t;
begin
	process(clk)begin
		if(rising_edge(clk))then
			data_buffer(0)	<= data_in;
		
			if (STAGES > 1)then
				for i in STAGES-1 downto 1 loop
					data_buffer(i)	<= data_buffer(i-1);
				end loop;
			end if;
		end if;
	end process;
	
	data_out	<= data_buffer(STAGES-1);
end architecture;