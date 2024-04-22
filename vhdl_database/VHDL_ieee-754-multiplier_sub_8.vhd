-- File : sub_8.vhd

library ieee;
use ieee.std_logic_1164.all;

entity sub_8 is
  port (
    A : in  std_logic_vector(7 downto 0);
    B : in  std_logic_vector(7 downto 0);
    D : out std_logic_vector(7 downto 0)
    );
end sub_8;

architecture arch of sub_8 is

  signal B_cmpl : std_logic_vector(7 downto 0);
  signal P      : std_logic_vector(7 downto 0);
  signal G      : std_logic_vector(7 downto 0);
  signal C      : std_logic_vector(7 downto 0);

begin  -- arch

  B_cmpl <= not B;
  P      <= A xor B_cmpl;
  G      <= A and B_cmpl;
  C(0)   <= '1';

  D(7) <= P(7) xor C(7);
  D(6) <= P(6) xor C(6);
  D(5) <= P(5) xor C(5);
  D(4) <= P(4) xor C(4);
  D(3) <= P(3) xor C(3);
  D(2) <= P(2) xor C(2);
  D(1) <= P(1) xor C(1);
  D(0) <= P(0) xor C(0);

  C(1) <= G(0) or
          (P(0));
  C(2) <= G(1) or
          (P(1) and G(0)) or
          (P(1) and P(0));
  C(3) <= G(2) or
          (P(2) and G(1)) or
          (P(2) and P(1) and G(0)) or
          (P(2) and P(1) and P(0));
  C(4) <= G(3) or
          (P(3) and G(2)) or
          (P(3) and P(2) and G(1)) or
          (P(3) and P(2) and P(1) and G(0)) or
          (P(3) and P(2) and P(1) and P(0));
  C(5) <= G(4) or
          (P(4) and G(3)) or
          (P(4) and P(3) and G(2)) or
          (P(4) and P(3) and P(2) and G(1)) or
          (P(4) and P(3) and P(2) and P(1) and G(0)) or
          (P(4) and P(3) and P(2) and P(1) and P(0));
  C(6) <= G(5) or
          (P(5) and G(4)) or
          (P(5) and P(4) and G(3)) or
          (P(5) and P(4) and P(3) and G(2)) or
          (P(5) and P(4) and P(3) and P(2) and G(1)) or
          (P(5) and P(4) and P(3) and P(2) and P(1) and G(0)) or
          (P(5) and P(4) and P(3) and P(2) and P(1) and P(0));
  C(7) <= G(6) or
          (P(6) and G(5)) or
          (P(6) and P(5) and G(4)) or
          (P(6) and P(5) and P(4) and G(3)) or
          (P(6) and P(5) and P(4) and P(3) and G(2)) or
          (P(6) and P(5) and P(4) and P(3) and P(2) and G(1)) or
          (P(6) and P(5) and P(4) and P(3) and P(2) and P(1) and G(0)) or
          (P(6) and P(5) and P(4) and P(3) and P(2) and P(1) and P(0));

end arch;
