--
-- ROMs Using Block RAM Resources.
-- VHDL code for a ROM with registered output (template 1)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mon_rom_defs.all;

entity mon_rom is
  port (clk   : in std_logic;
        cs    : in std_logic;
        addr  : in std_logic_vector (10 downto 0);
        rdata : out std_logic_vector(7 downto 0));
end mon_rom;

architecture syn of mon_rom is

  signal rom : mon_rom_type := mon_rom_init;

begin

  process (clk)
  begin
    if rising_edge(clk) then
      if (cs = '1') then
        rdata <= rom(conv_integer(addr));
      end if;
    end if;
  end process;

end;
