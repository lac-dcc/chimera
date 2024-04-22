-- File : left_shifter

library ieee;
use ieee.std_logic_1164.all;

entity left_shifter is
  port (
    A : in  std_logic_vector(23 downto 0);
    S : in  std_logic_vector(4 downto 0);
    O : out std_logic_vector(47 downto 0)
    );
end left_shifter;

architecture arch of left_shifter is

  component x_2_to_1_mux is
    port (
      A : in  std_logic_vector(47 downto 0);
      B : in  std_logic_vector(47 downto 0);
      S : in  std_logic;
      O : out std_logic_vector(47 downto 0)
      );
  end component x_2_to_1_mux;

  signal s_8_to_16 : std_logic_vector(47 downto 0);
  signal s_4_to_8  : std_logic_vector(47 downto 0);
  signal s_2_to_4  : std_logic_vector(47 downto 0);
  signal s_1_to_2  : std_logic_vector(47 downto 0);

begin  -- arch

  -- 1-bit shift
  X21M_1 : x_2_to_1_mux
    port map (
      A(47 downto 24) => (others => '0'),
      A(23 downto 0)  => A,
      B(47 downto 25) => (others => '0'),
      B(24 downto 1)  => A (23 downto 0),
      B(0)            => '0',
      S               => S(0),
      O               => s_1_to_2
      );

  -- 2-bit shift
  X21M_2 : x_2_to_1_mux
    port map (
      A              => s_1_to_2,
      B(47 downto 2) => s_1_to_2(45 downto 0),
      B(1 downto 0)  => (others => '0'),
      S              => S(1),
      O              => s_2_to_4
      );

  -- 4-bit shift
  X21M_4 : x_2_to_1_mux
    port map (
      A              => s_2_to_4,
      B(47 downto 4) => s_2_to_4(43 downto 0),
      B(3 downto 0)  => (others => '0'),
      S              => S(2),
      O              => s_4_to_8
      );

  -- 8-bit shift
  X21M_8 : x_2_to_1_mux
    port map (
      A              => s_4_to_8,
      B(47 downto 8) => s_4_to_8(39 downto 0),
      B(7 downto 0)  => (others => '0'),
      S              => S(3),
      O              => s_8_to_16
      );

  -- 16-bit shift
  X21M_16 : x_2_to_1_mux
    port map (
      A               => s_8_to_16,
      B(47 downto 16) => s_8_to_16(31 downto 0),
      B(15 downto 0)  => (others => '0'),
      S               => S(4),
      O               => O
      );

end arch;
