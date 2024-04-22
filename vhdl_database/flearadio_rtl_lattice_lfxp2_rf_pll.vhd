library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity rf_pll is
  port
  (
    clki: in std_logic; -- 25 MHz
    clkop: out std_logic; -- 25 MHz
    clkos: out std_logic; -- 8.333 MHz
    clkos2: out std_logic; -- 360 MHz
    clkos3: out std_logic  -- 10 MHz
  );
end rf_pll;

architecture x of rf_pll is
  signal clk_25M, clk_50M, clk_8M33, clk_360M, clk_10M: std_logic;
begin
  clk_25M <= clki;
  pll_25M_50M_8M33: entity work.lfxp2_pll_25M_50M_8M33
    port map (
      clk => clk_25M,
      clkop => clk_50M,
      clkok => clk_8M33
    );
  pll_50M_360M_10M: entity work.lfxp2_pll_50M_360M_10M
    port map (
      clk => clk_50M,
      clkop => clk_360M,
      clkok => clk_10M
    );
  clkop <= clk_25M;
  clkos <= clk_8M33;
  clkos2 <= clk_360M;
  clkos3 <= clk_10M;
end architecture;
