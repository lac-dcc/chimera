library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff is
  port (
    d    : in std_logic;
    clk  : in std_logic;
    arst : in std_logic;
    q    : out std_logic
    );
end;

architecture rtl of dff is
begin
  process(clk, arst)
  begin
    if arst = '1' then
      q <= '0';
    elsif rising_edge(clk) then
      q <= d;
    end if;
  end process;
end;

