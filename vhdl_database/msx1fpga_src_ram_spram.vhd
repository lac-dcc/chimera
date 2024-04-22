-------------------------------------------------------------------------------
--
-- Generic single port RAM.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity spram is
	generic (
		addr_width_g : integer := 8;
		data_width_g : integer := 8
	);
	port (
		clock_i		: in  std_logic;
		clock_en_i	: in  std_logic;
		we_n_i		: in  std_logic;
		addr_i		: in  std_logic_vector(addr_width_g-1 downto 0);
		data_i		: in  std_logic_vector(data_width_g-1 downto 0);
		data_o		: out std_logic_vector(data_width_g-1 downto 0)
	);
end spram;

library ieee;
use ieee.numeric_std.all;

architecture rtl of spram is

	type ram_t is array (natural range 2**addr_width_g-1 downto 0) of std_logic_vector(data_width_g-1 downto 0);
	signal ram_q : ram_t
		-- pragma translate_off
		:= (others => (others => '0'))
		-- pragma translate_on
	;
	signal read_addr_q : unsigned(addr_width_g-1 downto 0);

begin

	process (clock_i, clock_en_i)
	begin
		if rising_edge(clock_i) and clock_en_i = '1' then
			if we_n_i = '0' then
				ram_q(to_integer(unsigned(addr_i))) <= data_i;
			end if;
			read_addr_q <= unsigned(addr_i);
		end if;
	end process;

	data_o <= ram_q(to_integer(read_addr_q));

end rtl;
