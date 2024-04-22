library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use work.arithmetic_pkg.all;

entity reorder_stack is
	generic(
		STACK_SIZE				: integer := 256;
		ALMOST_FULL_THRESH		: integer := 200;
		DATA_WIDTH				: integer := 32 
	);
	port(
		clk				: in std_logic;
		reset_n			: in std_logic;
		
		data_in			: in std_logic_vector(DATA_WIDTH-1 downto 0);
		wr_en			: in std_logic;
		
		data_out		: out std_logic_vector(DATA_WIDTH-1 downto 0);
		data_valid_out	: out std_logic;
		rd_en			: in std_logic;
		
		almost_full		: out std_logic;
		empty_out		: out std_logic;
		last_out		: out std_logic
	);
end entity;

architecture rtl of reorder_stack is
	constant STACK_SIZE_LOG 	: integer := work.arithmetic_pkg.clog2(STACK_SIZE);
	
	type data_array_t  is array(STACK_SIZE-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal data_memory			: data_array_t;
	signal pointer				: unsigned(STACK_SIZE_LOG-1 downto 0);
	signal empty				: std_logic;
	signal last					: std_logic;
	signal data_rd				: std_logic_vector(DATA_WIDTH-1 downto 0);
begin
	empty						<= '1' when pointer = 0 else '0';
	
	process(clk)
	begin
		if(rising_edge(clk))then
		    if(pointer >= ALMOST_FULL_THRESH)then
		          almost_full					<= '1';
		    else
		          almost_full					<= '0';
		    end if;
		end if;
	end process;

	process(clk)
	begin
		if(rising_edge(clk))then
			assert (wr_en and rd_en) /= '1' report "stack should not r/w at the same time" severity error;
			if(wr_en = '1')then
				assert pointer < STACK_SIZE report "stack overflow in recorder stack" severity error;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				pointer		<= (others => '0');
			elsif(wr_en = '1')then
				pointer		<= pointer + 1;
			elsif(rd_en = '1' and empty /= '1')then
				pointer		<= pointer - 1;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk))then
			if(wr_en = '1')then
				data_memory(to_integer(pointer))			<= data_in;
			end if;
			
			data_out							<= data_memory(to_integer(pointer-1));
			if(rd_en = '1' and empty /= '1')then
				data_valid_out					<= '1';
			else
				data_valid_out					<= '0';
			end if;
			
			if(pointer = 1)then
				last	<= '1';
			else
				last	<= '0';
			end if;
		end if;
	end process;
	
	empty_out				<= empty;
	last_out				<= last;
end architecture;