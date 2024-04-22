------------------------------------------------------------------------------
-- Project    : Red Zombie
------------------------------------------------------------------------------
-- File       :  kleinkram/clk_status.vhd
-- Author     :  fpgakuechle
-- Company    : hobbyist
-- Created    : 2013-01
-- Last update: 2013-04-28
-- Licence     : GNU General Public License (http://www.gnu.de/documents/gpl.de.html)
------------------------------------------------------------------------------
-- Description: 
-- clk status display (simple LED-blink)

library ieee;
use ieee.std_logic_1164.all;

entity clock_blink is
  generic(
    G_TICKS_PER_SEC : integer := 10000
    );
  port(
    clk     : in  std_logic;
    blink_o : out std_logic);
end entity clock_blink;

architecture behave of clock_blink is

  signal blink_int_q : std_logic                        := '0';
  signal count_q     : integer range 100*2**20 downto 0 := 0;

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if count_q = 0 then
        count_q     <= G_TICKS_PER_SEC/2;
        blink_int_q <= not blink_int_q;
      else
        count_q <= count_q - 1;
      end if;
    end if;
  end process;

  blink_o <= blink_int_q;

end architecture behave;
