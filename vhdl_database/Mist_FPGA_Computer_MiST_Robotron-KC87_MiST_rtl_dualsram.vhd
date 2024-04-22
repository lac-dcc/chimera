-- dualport-blockram für altera
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dualsram is
	generic(
		AddrWidth	: integer := 11;
		DataWidth	: integer := 8
	);
	port (
		clk1,clk2    : in std_logic;
		addr1, addr2 : in std_logic_vector(AddrWidth - 1 downto 0);
		din1, din2   : in std_logic_vector(DataWidth - 1 downto 0);
		dout1, dout2 : out std_logic_vector(DataWidth - 1 downto 0);
		we1_n, we2_n : in std_logic;
		ce1_n, ce2_n : in std_logic
	);
end dualsram;

architecture rtl of dualsram is
	type mem is array ((2 ** AddrWidth - 1) downto 0) of std_logic_vector(DataWidth - 1 downto 0);
	signal ram: mem := ((others=> (others=>'0')));
	
begin
	process
	begin
		wait until rising_edge(clk1);
        
        if ce1_n = '0' and we1_n = '0' then
            ram(to_integer(unsigned(addr1))) <= din1;
--            dout1 <= din1;
        end if;
        
        dout1 <= ram(to_integer(unsigned(addr1)));
 	end process;
	
	process
	begin
        wait until rising_edge(clk2);
        
        if ce2_n = '0' and we2_n = '0' then
            ram(to_integer(unsigned(addr2))) <= din2;
--            dout2 <= din2;
        end if;
        
        dout2 <= ram(to_integer(unsigned(addr2)));
	end process;
end rtl;