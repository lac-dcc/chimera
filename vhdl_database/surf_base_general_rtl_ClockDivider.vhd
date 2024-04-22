-------------------------------------------------------------------------------
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: A clock divider with programmable duty cycle and phase delay.
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library surf;
use surf.StdRtlPkg.all;

entity ClockDivider is
   generic (
      TPD_G          : time                  := 1 ns;
      RST_ASYNC_G    : boolean               := false;
      LEADING_EDGE_G : sl                    := '1';
      COUNT_WIDTH_G  : integer range 1 to 32 := 16);
   port (
      clk        : in  sl;
      rst        : in  sl;
      highCount  : in  slv(COUNT_WIDTH_G-1 downto 0);
      lowCount   : in  slv(COUNT_WIDTH_G-1 downto 0);
      delayCount : in  slv(COUNT_WIDTH_G-1 downto 0);
      divClk     : out sl;
      preRise    : out sl;
      preFall    : out sl);
end entity ClockDivider;

architecture rtl of ClockDivider is

   type StateType is (DELAY_S, CLOCK_S);

   type RegType is record
      state   : StateType;
      divClk  : sl;
      preRise : sl;
      preFall : sl;
      counter : slv(COUNT_WIDTH_G-1 downto 0);
   end record RegType;

   constant REG_INIT_C : RegType := (
      state   => DELAY_S,
      divClk  => not LEADING_EDGE_G,
      preRise => '0',
      preFall => '0',
      counter => (others => '0'));

   signal r   : RegType := REG_INIT_C;
   signal rin : RegType;

begin

   comb : process (delayCount, highCount, lowCount, r, rst) is
      variable v : RegType;
   begin
      v := r;

      v.counter := r.counter + 1;
      v.preRise := '0';
      v.preFall := '0';

      case (r.state) is
         when DELAY_S =>
            if (r.counter = delayCount -1) then
               if (LEADING_EDGE_G = '1') then
                  v.preRise := '1';
               else
                  v.preFall := '1';
               end if;
            end if;
            if (r.counter = delayCount) then
               v.divClk  := LEADING_EDGE_G;
               v.state   := CLOCK_S;
               v.counter := (others => '0');
            end if;

         when CLOCK_S =>
            if (r.divClk = '1' and r.counter = highCount-1) then
               v.preFall := '1';
            end if;

            if (r.divClk = '0' and r.counter = lowCount-1) then
               v.preRise := '1';
            end if;

            if ((r.divClk = '1' and (r.counter = highCount)) or (r.divClk = '0' and (r.counter = lowCount))) then
               v.divClk  := not r.divClk;
               v.counter := (others => '0');
            end if;
      end case;

      if (RST_ASYNC_G = false and rst = '1') then
         v := REG_INIT_C;
      end if;

      rin <= v;

      divClk  <= r.divClk;
      preRise <= r.preRise;
      preFall <= r.preFall;
   end process comb;

   seq : process (clk, rst) is
   begin
      if (RST_ASYNC_G and rst = '1') then
         r <= REG_INIT_C after TPD_G;
      elsif rising_edge(clk) then
         r <= rin after TPD_G;
      end if;
   end process seq;

end architecture rtl;
