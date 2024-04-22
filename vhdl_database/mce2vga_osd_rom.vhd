library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity osd_rom is
  port ( 	clk 		: in std_logic;
			e 			: in std_logic;
			addr 		: in unsigned(10 downto 0);
			data 		: out std_logic
		 );
end entity osd_rom;

architecture behavioral of osd_rom is

type mem is array ( 0 to 255 ) of unsigned(7 downto 0);

constant rom_data : mem := (

	x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00",
	x"66", x"00", x"7E", x"1C", x"3C", x"00", x"00", x"00",
	x"66", x"00", x"33", x"36", x"66", x"00", x"00", x"00",
	x"66", x"00", x"33", x"63", x"70", x"00", x"00", x"00",
	x"7E", x"00", x"3E", x"63", x"38", x"00", x"00", x"00",
	x"66", x"00", x"30", x"63", x"0E", x"00", x"00", x"00",
	x"66", x"60", x"30", x"36", x"66", x"00", x"00", x"00",
	x"66", x"60", x"78", x"1C", x"3C", x"00", x"00", x"00",
	
	x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00",
	x"66", x"00", x"7E", x"1C", x"3C", x"00", x"00", x"00",
	x"66", x"00", x"33", x"36", x"66", x"00", x"00", x"00",
	x"66", x"00", x"33", x"63", x"70", x"00", x"00", x"00",
	x"66", x"00", x"3E", x"63", x"38", x"00", x"00", x"00",
	x"66", x"00", x"30", x"63", x"0E", x"00", x"00", x"00",
	x"3C", x"60", x"30", x"36", x"66", x"00", x"00", x"00",
	x"18", x"60", x"78", x"1C", x"3C", x"00", x"00", x"00",
	
	x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00",
	x"7E", x"66", x"18", x"3C", x"7F", x"00", x"00", x"00",
	x"33", x"66", x"3C", x"66", x"31", x"00", x"00", x"00",
	x"33", x"66", x"66", x"70", x"34", x"00", x"00", x"00",
	x"3E", x"7E", x"66", x"38", x"3C", x"00", x"00", x"00",
	x"30", x"66", x"7E", x"0E", x"34", x"00", x"00", x"00",
	x"30", x"66", x"66", x"66", x"31", x"00", x"00", x"00",
	x"78", x"66", x"66", x"3C", x"7F", x"00", x"00", x"00",
	
	x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00",
	x"3C", x"18", x"63", x"7E", x"78", x"7F", x"3C", x"00",
	x"66", x"3C", x"77", x"33", x"30", x"31", x"66", x"00",
	x"70", x"66", x"7F", x"33", x"30", x"34", x"70", x"00",
	x"38", x"66", x"7F", x"3E", x"30", x"3C", x"38", x"00",
	x"0E", x"7E", x"6B", x"30", x"31", x"34", x"0E", x"00",
	x"66", x"66", x"63", x"30", x"33", x"31", x"66", x"00",
	x"3C", x"66", x"63", x"78", x"7F", x"7F", x"3C", x"00"
);

begin

	process(clk)
	begin
		if rising_edge(clk) then
			if e = '1' then
				data <=	rom_data(to_integer(addr(10 downto 3)))(7 - to_integer(addr(2 downto 0)));
			else	
				data <= '0';
			end if;
		end if;
	end process;

end architecture behavioral;