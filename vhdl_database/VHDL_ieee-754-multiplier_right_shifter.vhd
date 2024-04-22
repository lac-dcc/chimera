-- File : right_shifter.vhd

library ieee;
use ieee.std_logic_1164.all;

entity right_shifter is
  port (
    A : in  std_logic_vector(22 downto 0);
    S : in  std_logic_vector(4 downto 0);
    O : out std_logic_vector(22 downto 0)
    );
end right_shifter;

architecture arch of right_shifter is

  component x_2_to_1_mux_46 is
    port (
      A : in  std_logic_vector(47 downto 0);
      B : in  std_logic_vector(47 downto 0);
      S : in  std_logic;
      O : out std_logic_vector(47 downto 0)
      );
  end component x_2_to_1_mux_46;

  signal s_8_to_16 : std_logic_vector(47 downto 0);
  signal s_4_to_8  : std_logic_vector(47 downto 0);
  signal s_2_to_4  : std_logic_vector(47 downto 0);
  signal s_1_to_2  : std_logic_vector(47 downto 0);

  signal s_dont_care : std_logic_vector(24 downto 0);

begin  -- arch

  -- 1-bit shift
  X21M_1 : x_2_to_1_mux_46
    port map (
      A(47 downto 23) => (others => '0'),
      A(22 downto 0)  => A,
      B(47 downto 22) => (others => '0'),
      B(21 downto 0)  => A(22 downto 1),
      S               => S(0),
      O               => s_1_to_2
      );

  -- 2-bit shift
  X21M_2 : x_2_to_1_mux_46
    port map (
      A               => s_1_to_2,
      B(47 downto 21) => (others => '0'),
      B(20 downto 0)  => s_1_to_2(22 downto 2),
      S               => S(1),
      O               => s_2_to_4
      );

  -- 4-bit shift
  X21M_4 : x_2_to_1_mux_46
    port map (
      A               => s_2_to_4,
      B(47 downto 19) => (others => '0'),
      B(18 downto 0)  => s_2_to_4(22 downto 4),
      S               => S(2),
      O               => s_4_to_8
      );

  -- 8-bit shift
  X21M_8 : x_2_to_1_mux_46
    port map (
      A               => s_4_to_8,
      B(47 downto 15) => (others => '0'),
      B(14 downto 0)  => s_4_to_8(22 downto 8),
      S               => S(3),
      O               => s_8_to_16
      );

  -- 16-bit shift
  X21M_16 : x_2_to_1_mux_46
    port map (
      A               => s_8_to_16,
      B(47 downto 7)  => (others => '0'),
      B(6 downto 0)   => s_8_to_16(22 downto 16),
      S               => S(4),
      O(47 downto 23) => s_dont_care,
      O(22 downto 0)  => O
      );

end arch;
