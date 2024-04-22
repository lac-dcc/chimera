-------------------------------------------------------------------------------
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: Converts the 32-bit interface to 64-bit JESD interface
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

entity Jesd32bTo64b is
   generic (
      TPD_G         : time                 := 1 ns;
      SYNTH_MODE_G  : string               := "inferred";
      SYNC_STAGES_G : natural range 2 to 8 := 3);
   port (
      -- 16-bit Write Interface
      wrClk     : in  sl;
      wrRst     : in  sl;
      validIn   : in  sl;
      trigIn    : in  sl := '0';
      overflow  : out sl;
      dataIn    : in  slv(31 downto 0);
      -- 32-bit Read Interface
      rdClk     : in  sl;
      rdRst     : in  sl;
      validOut  : out sl;
      trigOut   : out slv(1 downto 0);
      underflow : out sl;
      dataOut   : out slv(63 downto 0));
end Jesd32bTo64b;

architecture rtl of Jesd32bTo64b is

   type RegType is record
      wordSel : sl;
      wrEn    : sl;
      trig    : slv(1 downto 0);
      data    : slv(63 downto 0);
   end record;

   constant REG_INIT_C : RegType := (
      wordSel => '0',
      wrEn    => '0',
      trig    => "00",
      data    => (others => '0'));

   signal r       : RegType := REG_INIT_C;
   signal rin     : RegType;
   signal s_valid : sl;

   -- attribute dont_touch      : string;
   -- attribute dont_touch of r : signal is "TRUE";

begin

   comb : process (dataIn, r, trigIn, validIn, wrRst) is
      variable v : RegType;
   begin
      -- Latch the current value
      v := r;

      -- Check if data valid
      if validIn = '1' then
         if r.wordSel = '0' then
            -- Set the flags and data bus
            v.wordSel           := '1';
            v.data(31 downto 0) := dataIn;
            v.trig(0)           := trigIn;
            v.wrEn              := '0';
         else
            -- Set the flags and data bus
            v.wordSel            := '0';
            v.data(63 downto 32) := dataIn;
            v.trig(1)            := trigIn;
            v.wrEn               := '1';
         end if;
      else
         v := REG_INIT_C;
      end if;

      -- Synchronous Reset
      if (wrRst = '1') then
         v := REG_INIT_C;
      end if;

      -- Register the variable for next clock cycle
      rin <= v;

   end process comb;

   U_FIFO : entity surf.Fifo
      generic map (
         TPD_G         => TPD_G,
         SYNTH_MODE_G  => SYNTH_MODE_G,
         MEMORY_TYPE_G => "distributed",
         FWFT_EN_G     => true,
         SYNC_STAGES_G => SYNC_STAGES_G,
         DATA_WIDTH_G  => 66,
         ADDR_WIDTH_G  => 5)
      port map (
         -- Asynchronous Reset
         rst                => wrRst,
         -- Write Ports (wr_clk domain)
         wr_clk             => wrClk,
         wr_en              => r.wrEn,
         din(65 downto 64)  => r.trig,
         din(63 downto 0)   => r.data,
         overflow           => overflow,
         -- Read Ports (rd_clk domain)
         rd_clk             => rdClk,
         rd_en              => s_valid,
         dout(65 downto 64) => trigOut,
         dout(63 downto 0)  => dataOut,
         underflow          => underflow,
         valid              => s_valid);

   validOut <= s_valid;

   seq : process (wrClk) is
   begin
      if (rising_edge(wrClk)) then
         r <= rin after TPD_G;
      end if;
   end process seq;

end rtl;
