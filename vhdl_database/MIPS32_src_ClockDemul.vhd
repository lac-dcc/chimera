library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Common.all;

entity ClockDemul is
  port (
    clk_in:       in      std_logic;
    rst:          in      std_logic;
    divisor:      in      integer;
    clk_out:      out     std_logic
  );
end ClockDemul;

architecture Behavioral of ClockDemul is
begin
  process (clk_in, rst)
    variable counter: integer;
  begin
    if rst = '0' then
      counter := 0;
      clk_out <= '0';
    elsif rising_edge(clk_in) then
      if divisor = 1 then
        clk_out <= clk_in;
      else
        counter := counter + 1;
        if counter = divisor / 2 then
          clk_out <= '1';
        elsif counter = divisor then
          clk_out <= '0';
          counter := 0;
        end if;
      end if;
    end if;
  end process;
end Behavioral;
