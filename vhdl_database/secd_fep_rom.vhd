-- RAM behavioural model for SECD, simulation only

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.ROM_defs.all;

entity rom is
  port(
    data         : out std_logic_vector(7 downto 0);
    addr         : in std_logic_vector(13 downto 0);
    cs           : in std_logic;
    clk          : in std_logic
    );
end;

architecture syn of rom is

  signal ROM            : ROM_type := ROM_init;
  signal rdata : std_logic_vector(7 downto 0);

begin
  process (clk)
  begin
    rdata <= ROM(conv_integer(addr));
    if rising_edge(clk) then
      if cs = '1' then
        data <= rdata;
      end if;
    end if;
  end process;

end architecture;

