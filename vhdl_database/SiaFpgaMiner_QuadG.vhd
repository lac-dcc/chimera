-- Copyright (c) 2017, Pedro Rivera, all rights reserved.
--
-- === QuadG.vhd ===
--
-- Just a 4-Mix wrapper to keep the upper-level code more readable.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.PkgBlake2b.all;

entity QuadG is
  port(
    Clk   : in  std_logic;
    A_in  : in  U64Array_t(3 downto 0);
    B_in  : in  U64Array_t(3 downto 0);
    C_in  : in  U64Array_t(3 downto 0);
    D_in  : in  U64Array_t(3 downto 0);
    X     : in  U64Array_t(3 downto 0);
    Y     : in  U64Array_t(3 downto 0);
    A_out : out U64Array_t(3 downto 0);
    B_out : out U64Array_t(3 downto 0);
    C_out : out U64Array_t(3 downto 0);
    D_out : out U64Array_t(3 downto 0)
  );
end QuadG;

architecture rtl of QuadG is
begin

  MixerGen: for i in 0 to 3 generate
    G: entity work.MixG_FlopPipe_4
      port map(
        Clk   => Clk,
        A_in  => A_in(i),
        B_in  => B_in(i),
        C_in  => C_in(i),
        D_in  => D_in(i),
        X     => X(i),
        Y     => Y(i),
        A_out => A_out(i),
        B_out => B_out(i),
        C_out => C_out(i),
        D_out => D_out(i)
      ); 
  end generate;

end rtl;