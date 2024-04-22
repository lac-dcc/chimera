library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bootrom is
    port(
        clk : in std_logic;
        addr : in std_logic_vector(3 downto 0);
        data : out std_logic_vector(7 downto 0)
    );
end bootrom;

architecture rtl of bootrom is
begin
    process
    begin
        wait until rising_edge(clk);
     
        case to_integer(unsigned(addr)) is
            when 0 => data <= x"C3"; -- JP F000
            when 1 => data <= x"00";
            when 2 => data <= x"F0";
            when others => data <= "--------";
        end case;
        
--        case to_integer(unsigned(addr)) is
--            when 0 => data <= x"F3"; -- DI
--            when 1 => data <= x"31"; -- LD   SP,200H
--            when 2 => data <= x"00";
--            when 3 => data <= x"02";
--            when 4 => data <= x"C3"; -- JP 8000
--            when 5 => data <= x"00";
--            when 6 => data <= x"80";
--            when others => data <= "--------";
--      end case;
    end process;
end;



 
 
