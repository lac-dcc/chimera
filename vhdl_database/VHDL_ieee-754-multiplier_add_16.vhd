-- File : add_16.vhd

library ieee;
use ieee.std_logic_1164.all;

library lib438;
use lib438.all;

entity add_16 is
  port (
    A : in  std_logic_vector (15 downto 0);
    B : in  std_logic_vector (15 downto 0);
    C : in  std_logic;
    O : out std_logic_vector (15 downto 0);
    G : out std_logic;
    P : out std_logic);
end add_16;

architecture arch of add_16 is

  component CLA is
    generic (
      DELAY : time := 6 ns
      );
    port (
      A_IN  : in  std_logic_vector (3 downto 0);
      B_IN  : in  std_logic_vector (3 downto 0);
      C_IN  : in  std_logic;
      P     : out std_logic;
      G     : out std_logic;
      F_OUT : out std_logic_vector (3 downto 0)
      );
  end component CLA;

  component LACG is
    generic (
      DELAY : time := 6 ns
      );
    port (
      C_IN : in  std_logic;

      P0_H : in  std_logic;
      G0_H : in  std_logic;

      CX   : out std_logic;

      P1_H : in  std_logic;
      G1_H : in  std_logic;

      CY   : out std_logic;

      P2_H : in  std_logic;
      G2_H : in  std_logic;

      CZ   : out std_logic;

      P3_H : in  std_logic;
      G3_H : in  std_logic;

      GOUT : out std_logic;
      POUT : out std_logic
      );
  end component LACG;

  signal G_3 : std_logic;
  signal G_2 : std_logic;
  signal G_1 : std_logic;
  signal G_0 : std_logic;

  signal P_3 : std_logic;
  signal P_2 : std_logic;
  signal P_1 : std_logic;
  signal P_0 : std_logic;

  signal C_3 : std_logic;
  signal C_2 : std_logic;
  signal C_1 : std_logic;
  signal C_0 : std_logic;

begin  -- arch

  GROUP_3 : CLA
    port map (
      A_IN  => A (15 downto 12),
      B_IN  => B (15 downto 12),
      C_IN  => C_3,
      P     => P_3,
      G     => G_3,
      F_OUT => O (15 downto 12));

  GROUP_2 : CLA
    port map (
      A_IN  => A (11 downto 8),
      B_IN  => B (11 downto 8),
      C_IN  => C_2,
      P     => P_2,
      G     => G_2,
      F_OUT => O (11 downto 8));

  GROUP_1 : CLA
    port map (
      A_IN  => A (7 downto 4),
      B_IN  => B (7 downto 4),
      C_IN  => C_1,
      P     => P_1,
      G     => G_1,
      F_OUT => O (7 downto 4));

  GROUP_0 : CLA
    port map (
      A_IN  => A (3 downto 0),
      B_IN  => B (3 downto 0),
      C_IN  => C,
      P     => P_0,
      G     => G_0,
      F_OUT => O (3 downto 0));

  LACG_0 : LACG
    port map (
      P3_H => P_3,
      G3_H => G_3,
      P2_H => P_2,
      G2_H => G_2,
      P1_H => P_1,
      G1_H => G_1,
      P0_H => P_0,
      G0_H => G_0,
      C_IN => C,
      CZ   => C_3,
      CY   => C_2,
      CX   => C_1,
      GOUT => G,
      POUT => P);
      
end arch;
