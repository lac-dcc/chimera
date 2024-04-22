-- --------------------------------------------------------------------
-- "fixed_pkg_c.vhdl" package contains functions for fixed point math.
-- Please see the documentation for the fixed point package.
-- This package should be compiled into "aHiR_ieee_proposed" and used as follows:
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use aHiR_ieee_proposed.math_utility_pkg.all;
-- use aHiR_ieee_proposed.fixed_pkg.all;
--
--  This verison is designed to work with the VHDL-93 compilers 
--  synthesis tools.  Please note the "%%%" comments.  These are where we
--  diverge from the VHDL-200X LRM.
-- --------------------------------------------------------------------
-- Version    : $Revision: 1.21 $
-- Date       : $Date: 2007/09/26 18:08:53 $
-- --------------------------------------------------------------------
--  trimmed down for use in the AHIR tool flow (MPD)
-- --------------------------------------------------------------------

use STD.TEXTIO.all;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;

package fixed_pkg is
end package fixed_pkg;
