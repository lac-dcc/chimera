library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity decoder_3_to_8 is
    port (
        addr: in std_logic_vector(2 downto 0);
        data_n: out std_logic_vector(7 downto 0)
    );
end entity;


architecture Behavioral of decoder_3_to_8 is
begin
    data_n <= "11111110" when addr = "000" else
              "11111101" when addr = "001" else
              "11111011" when addr = "010" else
              "11110111" when addr = "011" else
              "11101111" when addr = "100" else
              "11011111" when addr = "101" else
              "10111111" when addr = "110" else
              "01111111" when addr = "111" else
              "11111111";
end architecture;
