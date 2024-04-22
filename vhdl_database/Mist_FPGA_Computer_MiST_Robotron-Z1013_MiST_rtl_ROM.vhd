------------------------------------------------------------------------------
-- Project    : Red Zombie
------------------------------------------------------------------------------
-- File       :  ROM.vhd
-- Author     :  fpgakuechle
-- Company    : hobbyist
-- Created    : 2012-12
-- Last update: 2013-03-12
-- Licence     : GNU General Public License (http://www.gnu.de/documents/gpl.de.html) 
------------------------------------------------------------------------------
-- Description: 
-- (p)rom for firmware (monitor)
-- Z1013 EPROM-image U2632  Empty
-- Faked Firmware, only JUMP to start of firmware, the rest is NOP
-- firmware images (called monitor here) can be found at:
--
--http://hc-ddr.hucki.net/wiki/doku.php/z1013:software:monitor
------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--ROM (Boot-Loader, character table) for CPU
-------------
--Z1013:               2 or 4 kByte (U2632 EPROM + U2616)
--                      U2632 EPROM - BitMaske 204 - Firmware
--                      U2616         BitMaske 100 - Character ROM                           
--HC9000              16 kByte (ROM-BASIC)
--KC85/2               4 kByte
--KC85/3              16 kByte
--KC85/4              20 kByte
--KC87(KC85/1,Z9001)  16 kByte (4 K OS, 10k Basic, 2k character set (non addressable)
--PC1715               2 kByte
-----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg_redz0mb1e.all;
--use work.bm204_empty_pkg.all; -- "empty firmware" (only endless loop)
use work.bm204_202_pkg.all;   --2k ROM Vers. 202 (8x4 keybord)
--use work.bm204_pkg.all;     --4k ROM (Address line A11 = 1 = -> Vers. 202 else Vers a2)

entity rom_sys is
  generic(G_SYSTEM    : T_SYSTEM := DEV);
  port(
    clk    : in  std_logic;             --not used at original
    cs_ni  : in  std_logic;
    oe_ni  : in  std_logic;
    data_o : out std_logic_vector(7 downto 0);
    --4k as max for Z1013
    addr_i : in  std_logic_vector(11 downto 0));
end entity rom_sys;

architecture behave of rom_sys is
  signal mem_array    : T_MEM := C_MEM_ARRAY_INIT;
  signal selected     : BOOLEAN;
  signal addr_integer : T_INDEX;
begin
  addr_integer <= to_integer(unsigned(addr_i(c_addrline_high downto 0)));
  selected     <= cs_ni = '0';

  --will be synthesized as  ROM-Block
  process(clk)
  begin
    if falling_edge(clk) then
      if selected and (oe_ni = '0') then
        data_o <= std_logic_vector(to_unsigned(mem_array(addr_integer), 8));
      end if;
    end if;
  end process;
end architecture behave;
