library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity pulse is
  port (
    pulse_in: in std_logic;
    pulse_out: out std_logic;
    clk: in std_logic;
    rst: in std_logic
  );
end entity pulse;

architecture behave of pulse is

signal q1: std_logic := '0';
signal q2: std_logic := '0';
signal reset: std_logic;
begin

  process(pulse_in,q2)
  begin
    if q2='1' then
      q1 <= '0';
    elsif rising_edge(pulse_in) then
      q1 <= '1';
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if rst='1' then
        q2 <= '0';
      else
        q2 <= q1;
      end if;
    end if;
  end process;

  pulse_out <= q2;

end behave;

