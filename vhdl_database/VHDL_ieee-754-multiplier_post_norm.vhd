-- File : post_norm.vhd

library ieee;
use ieee.std_logic_1164.all;

entity post_norm is
  port (
    N_MANT : in  std_logic_vector(47 downto 0);
    ADJ    : out std_logic_vector(4 downto 0);
    O_MANT : out std_logic_vector(22 downto 0)
    );
end post_norm;

architecture arch of post_norm is

  signal s_a_shift : std_logic_vector(23 downto 0);
  signal s_s_shift : std_logic_vector(4 downto 0);

begin  -- arch

  ADJ <= B"0_0001" when N_MANT(47) = '1' else
         B"0_0000";

  O_MANT <= s_a_shift(22 downto 0);

  s_a_shift <= N_MANT(47 downto 24) when N_MANT(47) = '1' else
               N_MANT(46 downto 23) when N_MANT(46) = '1' else
               N_MANT(45 downto 22) when N_MANT(45) = '1' else
               N_MANT(44 downto 21) when N_MANT(44) = '1' else
               N_MANT(43 downto 20) when N_MANT(43) = '1' else
               N_MANT(42 downto 19) when N_MANT(42) = '1' else
               N_MANT(41 downto 18) when N_MANT(41) = '1' else
               N_MANT(40 downto 17) when N_MANT(40) = '1' else
               N_MANT(39 downto 16) when N_MANT(39) = '1' else
               N_MANT(38 downto 15) when N_MANT(38) = '1' else
               N_MANT(37 downto 14) when N_MANT(37) = '1' else
               N_MANT(36 downto 13) when N_MANT(36) = '1' else
               N_MANT(35 downto 12) when N_MANT(35) = '1' else
               N_MANT(34 downto 11) when N_MANT(34) = '1' else
               N_MANT(33 downto 10) when N_MANT(33) = '1' else
               N_MANT(32 downto  9) when N_MANT(32) = '1' else
               N_MANT(31 downto  8) when N_MANT(31) = '1' else
               N_MANT(30 downto  7) when N_MANT(30) = '1' else
               N_MANT(29 downto  6) when N_MANT(29) = '1' else
               N_MANT(28 downto  5) when N_MANT(28) = '1' else
               N_MANT(27 downto  4) when N_MANT(27) = '1' else
               N_MANT(26 downto  3) when N_MANT(26) = '1' else
               N_MANT(25 downto  2) when N_MANT(25) = '1' else
               N_MANT(24 downto  1) when N_MANT(24) = '1' else
               N_MANT(23 downto  0);
end arch;
