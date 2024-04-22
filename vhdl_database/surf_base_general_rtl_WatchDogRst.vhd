-------------------------------------------------------------------------------
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: Watch Dog Reset module
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library surf;
use surf.StdRtlPkg.all;

entity WatchDogRst is
   generic (
      TPD_G          : time    := 1 ns;
      IN_POLARITY_G  : sl      := '1';
      OUT_POLARITY_G : sl      := '1';
      USE_DSP_G      : string  := "no";
      DURATION_G     : natural := 156250000);
   port (
      clk    : in  sl;
      monIn  : in  sl;
      rstOut : out sl);
end WatchDogRst;

architecture rtl of WatchDogRst is

   signal rst      : sl := not(OUT_POLARITY_G);
   signal monInput : sl;

   signal cnt : natural range 0 to DURATION_G := 0;

   attribute use_dsp        : string;
   attribute use_dsp of cnt : signal is USE_DSP_G;

begin

   Synchronizer_Inst : entity surf.Synchronizer
      generic map (
         TPD_G => TPD_G)
      port map (
         clk     => clk,
         dataIn  => monIn,
         dataOut => monInput);

   process (clk)
   begin
      if rising_edge(clk) then
         -- Reset the flag
         rst <= not(OUT_POLARITY_G) after TPD_G;
         -- Check the monitoring input
         if monInput = IN_POLARITY_G then
            -- Reset the counter
            cnt <= 0 after TPD_G;
         else
            -- Increment the counter
            cnt <= cnt + 1 after TPD_G;
            -- Check the counter value
            if cnt = DURATION_G then
               -- Reset the counter
               cnt <= 0              after TPD_G;
               -- Set the flag
               rst <= OUT_POLARITY_G after TPD_G;
            end if;
         end if;
      end if;
   end process;

   rstOut <= rst;

end rtl;
