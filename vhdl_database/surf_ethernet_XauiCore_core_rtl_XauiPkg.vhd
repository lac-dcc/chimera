-------------------------------------------------------------------------------
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: XAUI Package Files
-------------------------------------------------------------------------------
-- This file is part of 'SLAC Firmware Standard Library'.
-- It is subject to the license terms in the LICENSE.txt file found in the
-- top-level directory of this distribution and at:
--    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
-- No part of 'SLAC Firmware Standard Library', including this file,
-- may be copied, modified, propagated, or distributed except according to
-- the terms contained in the LICENSE.txt file.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


library surf;
use surf.StdRtlPkg.all;
use surf.EthMacPkg.all;

package XauiPkg is

   type XauiConfig is record
      softRst      : sl;
      macConfig    : EthMacConfigType;
      configVector : slv(6 downto 0);
   end record;
   constant XAUI_CONFIG_INIT_C : XauiConfig := (
      softRst      => '0',
      macConfig    => ETH_MAC_CONFIG_INIT_C,
      configVector => (others => '0'));

   type XauiStatus is record
      phyReady     : sl;
      macStatus    : EthMacStatusType;
      areset       : sl;
      clkLock      : sl;
      statusVector : slv(7 downto 0);
      debugVector  : slv(5 downto 0);
   end record;

end XauiPkg;
