library ieee;
use ieee.std_logic_1164.all;

entity divider is
  generic(
    divides : integer := 240_000_000
    );

  port(
    clk : in  std_ulogic;
    rst : in  std_ulogic;
    o   : out std_ulogic);
end divider;

architecture syn of divider is
begin
  process(clk, rst)
    variable counter : integer := 0;
  begin
    if rst = '1' then
      counter := 0;
    elsif rising_edge(clk) then
      if counter < divides - 1 then
        counter := counter + 1;
      else
        counter := 0;
      end if;

      if counter < divides / 2 then
        o <= '0';
      else
        o <= '1';
      end if;
    end if;
  end process;

end syn;
