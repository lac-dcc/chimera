-- user_ram.vhd - Synthesizable model for the User RAM

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity user_ram is
  port(
    dout             : out std_logic_vector(7 downto 0);
    din              : in std_logic_vector(7 downto 0);
    addr             : in std_logic_vector(11 downto 0);
    en               : in std_logic;
    we               : in std_logic;
    clk              : in std_logic
  );
end;

architecture syn of user_ram is

  type user_ram_type is array (0 to 4096) of std_logic_vector (7 downto 0);

  signal RAM : user_ram_type;

begin
  process (clk)
  begin
    if rising_edge(clk) then
      if en = '1' then
        if we = '1' then
          RAM(conv_integer(addr)) <= din;
        end if;
        dout <= RAM(conv_integer(addr));
      end if;
    end if;
  end process;
end;
