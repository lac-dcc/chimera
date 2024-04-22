-- File : tb_right_shifter.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_right_shifter is
end entity tb_right_shifter;

architecture tb_right_shifter of tb_right_shifter is

  component right_shifter is
    port (
      A : in  std_logic_vector(22 downto 0);
      S : in  std_logic_vector(4 downto 0);
      O : out std_logic_vector(22 downto 0)
      );
  end component right_shifter;

  signal X_A_VAL : std_logic_vector(22 downto 0);
  signal X_S_VAL : std_logic_vector(4 downto 0);
  signal X_O_OUT : std_logic_vector(22 downto 0);

begin
  UUT : right_shifter
    port map (
      A => X_A_VAL,
      S => X_S_VAL,
      O => X_O_OUT);

-- 01_0001_1100_1011_0100_1101
-- 11_1110_1111_1111_1110_0100
-- 10_0101_0101_0110_0001_1111
-- 10_1100_0101_1101_0001_0100

  STIMULUS_PROC :
  process
  begin
    X_A_VAL <= B"000_0101_0100_0010_1000_0001";
    X_S_VAL <= B"0_0001";
    wait for 100 ns;

    X_A_VAL <= B"000_0000_0000_0000_0001_0111";
    X_S_VAL <= B"0_0010";
    wait for 100 ns;

    X_A_VAL <= B"000_1000_1000_1000_0001_1010";
    X_S_VAL <= B"0_0100";
    wait for 100 ns;

    X_A_VAL <= B"010_0001_1100_1001_1111_0101";
    X_S_VAL <= B"0_1000";
    wait for 100 ns;

    X_A_VAL <= B"101_1101_1010_1011_1010_0000";
    X_S_VAL <= B"1_0000";
    wait for 100 ns;

    X_A_VAL <= B"010_1100_0001_0101_0101_0001";
    X_S_VAL <= B"0_0011";
    wait for 100 ns;

    X_A_VAL <= B"010_0111_0010_1001_1111_0000";
    X_S_VAL <= B"0_0101";
    wait for 100 ns;

    X_A_VAL <= B"001_0000_0001_0110_0100_1111";
    X_S_VAL <= B"0_0110";
    wait for 100 ns;
  end process;

end architecture tb_right_shifter;
