library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clock is
port(
  i_clk : in  std_logic;
  o25_clk : out std_logic
);
end clock;

architecture rtl of clock is

signal clk_divider : unsigned(0 downto 0) := (OTHERS=>'0');

begin

div: process(i_clk)
begin
  if (rising_edge(i_clk)) then
    clk_divider <= clk_divider + 1;
  end if;
end process div;

o25_clk <= clk_divider(0);

end rtl;