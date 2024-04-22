LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY clock IS
  PORT (
    i_clk : IN STD_LOGIC;
    o25_clk : OUT STD_LOGIC;
    o50_clk : OUT STD_LOGIC
  );
END clock;

ARCHITECTURE rtl OF clock IS

  SIGNAL clk_divider : unsigned(1 DOWNTO 0) := (OTHERS => '0');

BEGIN

  div : PROCESS (i_clk)
  BEGIN
    IF (rising_edge(i_clk)) THEN
      clk_divider <= clk_divider + 1;
    END IF;
  END PROCESS div;

  o25_clk <= clk_divider(1);
  o50_clk <= clk_divider(0);

END rtl;