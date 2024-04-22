library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2 is
  Generic (
            DATA_WIDTH : integer := 16
          );
  Port ( a_in : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
         b_in : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
         select_in : in STD_LOGIC;
         data_out : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
end mux_2;

architecture Behavioral of mux_2 is
begin
  with select_in select
    data_out <= a_in when '0',
                b_in when others;
end Behavioral;
