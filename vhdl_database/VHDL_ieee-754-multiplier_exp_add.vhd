-- File : exp_add.vhd

library ieee;
use ieee.std_logic_1164.all;

entity exp_add is
  port (
    A_EXP : in  std_logic_vector(7 downto 0);
    B_EXP : in  std_logic_vector(7 downto 0);
    ADJ   : in  std_logic_vector(4 downto 0);  -- adjustment needed from
                                               -- right shifting mantissa
    O_EXP : out std_logic_vector(7 downto 0)
    );
end exp_add;

architecture arch of exp_add is

  component sub_8 is
    port (
      A : in  std_logic_vector(7 downto 0);
      B : in  std_logic_vector(7 downto 0);
      D : out std_logic_vector(7 downto 0)
      );
  end component sub_8;

  component add_16 is
    port (
      A : in  std_logic_vector (15 downto 0);
      B : in  std_logic_vector (15 downto 0);
      C : in  std_logic;
      O : out std_logic_vector (15 downto 0);
      G : out std_logic;
      P : out std_logic);
  end component add_16;

  signal s_a_b_sum   : std_logic_vector(15 downto 0);
  signal s_a_b_sum_p : std_logic;
  signal s_a_b_sum_g : std_logic;

  signal s_a_b_adj_sum   : std_logic_vector(15 downto 0);
  signal s_a_b_adj_sum_p : std_logic;
  signal s_a_b_adj_sum_g : std_logic;

  signal s_output : std_logic_vector(7 downto 0);

begin  -- arch

  O_EXP <= s_output;

  add_0 : add_16
    port map (
      A(15 downto 8) => (others => '0'),
      A(7 downto 0)  => A_EXP,
      B(15 downto 8) => (others => '0'),
      B(7 downto 0)  => B_EXP,
      C              => '0',
      O              => s_a_b_sum,
      G              => s_a_b_sum_g,
      P              => s_a_b_sum_p
      );

  add_1 : add_16
    port map (
      A => s_a_b_sum,
      B(15 downto 5) => (others => '0'),
      B(4 downto 0)  => ADJ,
      C => '0',
      O => s_a_b_adj_sum,
      G => s_a_b_adj_sum_g,
      P => s_a_b_adj_sum_p
      );

  sub_0 : sub_8
    port map (
      A => s_a_b_adj_sum(7 downto 0),
      B => X"7F",                       -- substract bias (127)
      D => s_output
      );

end arch;
