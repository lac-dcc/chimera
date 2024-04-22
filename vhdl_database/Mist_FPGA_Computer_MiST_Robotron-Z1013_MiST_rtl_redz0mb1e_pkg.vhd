------------------------------------------------------------------------------
-- Project    : Red Zombie
------------------------------------------------------------------------------
-- File       : redzombie_pkg.vhd
-- Company    : hobbyist
-- Created    : 2012-12
-- Adopted    : fpgakuechle
-- Lizenz     : GNU General Public License (http://www.gnu.de/documents/gpl.de.html)
-- Last update: 2013-02-28
------------------------------------------------------------------------------
-- Description: 
-- central package file (types)
-- actually a placeholder for future use
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package pkg_redz0mb1e is
  type    T_SYSTEM is (DEV, Z1013, KC85);
  subtype T_COLOR is std_logic_vector(2 downto 0);  --3bits, one for red|gree|blue
end package pkg_redz0mb1e;

