-- File : x_2_to_1_mux_46.vhd

library ieee;
use ieee.std_logic_1164.all;

entity x_2_to_1_mux_46 is
  
  port (
    A : in  std_logic_vector(47 downto 0);
    B : in  std_logic_vector(47 downto 0);
    S : in  std_logic;
    O : out std_logic_vector(47 downto 0)
    );

end x_2_to_1_mux_46;

architecture arch of x_2_to_1_mux_46 is

begin  -- arch

  with S select
    O <=
    A               when '0',
    B               when '1',
    (others => 'X') when others;

end arch;
