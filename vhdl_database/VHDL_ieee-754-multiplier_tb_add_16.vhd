-- File : tb_add_16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TB_ADDER8 is
end entity TB_ADDER8;

architecture TB_ADDER8 of TB_ADDER8 is

  component add_16 is
    port (
      A : in  std_logic_vector (15 downto 0);
      B : in  std_logic_vector (15 downto 0);
      C : in  std_logic;
      O : out std_logic_vector (15 downto 0);
      G : out std_logic;
      P : out std_logic);
  end component add_16;

  signal X_CIN_H : std_logic;
  signal X_A_VAL : std_logic_vector (15 downto 0);
  signal X_B_VAL : std_logic_vector (15 downto 0);
  signal X_F_OUT : std_logic_vector (15 downto 0);
  signal X_G_H   : std_logic;
  signal X_P_H   : std_logic;

begin

  UUT : ADD_16
    port map (
      C => X_CIN_H,
      A => X_A_VAL,
      B => X_B_VAL,
      O => X_F_OUT,
      G => X_G_H,
      P => X_P_H
      );

  STIMULUS_PROC :
  process
  begin
    X_A_VAL <= X"0000"; X_B_VAL <= X"0000"; X_CIN_H <= '0';
    wait for 100 ns;
    X_A_VAL <= X"0000"; X_B_VAL <= X"0000"; X_CIN_H <= '1';
    wait for 100 ns;
    X_A_VAL <= X"00FF"; X_B_VAL <= X"00FF"; X_CIN_H <= '0';
    wait for 100 ns;
    X_A_VAL <= X"00FF"; X_B_VAL <= X"00FF"; X_CIN_H <= '1';
    wait for 100 ns;
    X_A_VAL <= X"0055"; X_B_VAL <= X"00AA"; X_CIN_H <= '0';
    wait for 100 ns;
    X_A_VAL <= X"0055"; X_B_VAL <= X"00AA"; X_CIN_H <= '1';
    wait for 100 ns;
    X_A_VAL <= X"0355"; X_B_VAL <= X"01AA"; X_CIN_H <= '1';
    wait for 100 ns;
    X_A_VAL <= X"FFFF"; X_B_VAL <= X"FFFF"; X_CIN_H <= '0';
    wait for 100 ns;
  end process;

end architecture TB_ADDER8;
