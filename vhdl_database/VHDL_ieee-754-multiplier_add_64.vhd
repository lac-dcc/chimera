-- File : add_64.vhd

library ieee;
use ieee.std_logic_1164.all;

library lib438;
use lib438.all;

entity add_64 is
  port (
    A : in  std_logic_vector (63 downto 0);
    B : in  std_logic_vector (63 downto 0);
    C : in  std_logic;
    G : out std_logic;
    P : out std_logic;
    O : out std_logic_vector (63 downto 0)
    );
end add_64;

architecture arch of add_64 is

  component add_16 is
    port (
      A : in  std_logic_vector (15 downto 0);
      B : in  std_logic_vector (15 downto 0);
      C : in  std_logic;
      O : out std_logic_vector (15 downto 0);
      G : out std_logic;
      P : out std_logic
      );
  end component add_16;

  component LACG is
    generic (
      DELAY : time := 6 ns
      );
    port (
      C_IN : in std_logic;

      P0_H : in std_logic;
      G0_H : in std_logic;

      CX : out std_logic;

      P1_H : in std_logic;
      G1_H : in std_logic;

      CY : out std_logic;

      P2_H : in std_logic;
      G2_H : in std_logic;

      CZ : out std_logic;

      P3_H : in std_logic;
      G3_H : in std_logic;

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

  GROUP_3 : ADD_16
    port map (
      A => A (63 downto 48),
      B => B (63 downto 48),
      C => C_3,
      P => P_3,
      G => G_3,
      O => O (63 downto 48));

  GROUP_2 : ADD_16
    port map (
      A => A (47 downto 32),
      B => B (47 downto 32),
      C => C_2,
      P => P_2,
      G => G_2,
      O => O (47 downto 32));

  GROUP_1 : ADD_16
    port map (
      A => A (31 downto 16),
      B => B (31 downto 16),
      C => C_1,
      P => P_1,
      G => G_1,
      O => O (31 downto 16));

  GROUP_0 : ADD_16
    port map (
      A => A (15 downto 0),
      B => B (15 downto 0),
      C => C,
      P => P_0,
      G => G_0,
      O => O (15 downto 0));

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
