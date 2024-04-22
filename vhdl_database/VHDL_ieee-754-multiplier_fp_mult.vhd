-- File : fp_mult.vhd

library ieee;
use ieee.std_logic_1164.all;

entity fp_mult is
  port (
    A_H : in  std_logic_vector (31 downto 0);
    B_H : in  std_logic_vector (31 downto 0);
    O_H : out std_logic_vector (31 downto 0)
    );
end fp_mult;

architecture arch of fp_mult is

  component mant_mult is
    port (
      A_EXP : in  std_logic_vector(7 downto 0);
      B_EXP : in  std_logic_vector(7 downto 0);
      A_H : in  std_logic_vector(22 downto 0);
      B_H : in  std_logic_vector(22 downto 0);
      C_H : out std_logic;
      O_H : out std_logic_vector(47 downto 0));
  end component mant_mult;

  component post_norm is
    port (
      N_MANT : in  std_logic_vector(47 downto 0);
      ADJ    : out std_logic_vector(4 downto 0);
      O_MANT : out std_logic_vector(22 downto 0)
      );
  end component post_norm;

  component exp_add is
    port (
      A_EXP : in  std_logic_vector(7 downto 0);
      B_EXP : in  std_logic_vector(7 downto 0);
      ADJ   : in  std_logic_vector(4 downto 0);
      O_EXP : out std_logic_vector(7 downto 0)
      );
  end component exp_add;

  signal s_mm_c : std_logic;
  signal s_mm_o : std_logic_vector(47 downto 0);

  signal s_ea_adj : std_logic_vector(4 downto 0);

begin  -- arch

  O_H(31) <= A_H(31) xor B_H(31);

  MM_0 : MANT_MULT
    port map (
      A_EXP => A_H(30 downto 23),
      B_EXP => B_H(30 downto 23),
      A_H => A_H(22 downto 0),
      B_H => B_H(22 downto 0),
      C_H => s_mm_c,
      O_H => s_mm_o
      );

  EA_0 : EXP_ADD
    port map (
      A_EXP => A_H(30 downto 23),
      B_EXP => B_H(30 downto 23),
      ADJ   => s_ea_adj,
      O_EXP => O_H(30 downto 23)
      );

  PN_0 : POST_NORM
    port map (
      N_MANT => s_mm_o,
      ADJ    => s_ea_adj,
      O_MANT => O_H(22 downto 0)
      );

end arch;
