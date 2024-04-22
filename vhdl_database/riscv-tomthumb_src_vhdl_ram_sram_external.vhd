library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sram_external is
	generic(
		ADDRBITS: integer := 19;
		DATABITS: integer := 8
	);
	port(
		I_addr: in std_logic_vector(ADDRBITS-1 downto 0);
		I_data: in std_logic_vector(DATABITS-1 downto 0);
		I_en: in std_logic := '0';
		I_we: in std_logic := '0';
		O_data: out std_logic_vector(DATABITS-1 downto 0);
		
		IO_external_data: inout std_logic_vector(DATABITS-1 downto 0);
		O_external_addr: out std_logic_vector(ADDRBITS-1 downto 0);
		O_external_ce: out std_logic := '1';
		O_external_oe: out std_logic := '1';
		O_external_we: out std_logic := '1'
	);
end sram_external;


architecture Behavioral of sram_external is
begin

	process(I_we, I_data, IO_external_data)
	begin
		if I_we = '1' then
			IO_external_data <= I_data;
			O_data <= I_data;
		else
			IO_external_data <= (others => 'Z');
			O_data <= IO_external_data;
		end if;
	end process;
	
	-- pass through address
	O_external_addr <= I_addr;
	
	-- control signals for external SRAM are active low
	O_external_ce <= not I_en;
	O_external_we <= not I_we;
	O_external_oe <= not (I_en and (not I_we));

end Behavioral;