-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_clk.vhd,v 1.5 2005/10/28 21:17:41 arnim Exp $
--
-- Clock generator for the Lady Bug machine.
--
-- This module generates the clock enables which are required to mimic the
-- different clocks of the Lady Bug boards.
--
-- Theory of Operation:
--   A PLL is used to tune the external clock to 20 MHz. This forms the
--   main clock which is used by all sequential elements.
--   All derived clocks are built with clock enables to allow a synchronous
--   design style (sort of).
--
-- Note:
--   The counters and enable signals are reset by the power-on reset.
--   Thus, the "derived clocks" run during normal system reset.
--
-------------------------------------------------------------------------------
--
-- Copyright (c) 2005, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ladybug_clk is

  port (
    clk_20mhz_i      : in  std_logic;
    por_n_i          : in  std_logic;
    clk_en_10mhz_o   : out std_logic;
    clk_en_10mhz_n_o : out std_logic;
    clk_en_5mhz_o    : out std_logic;
    clk_en_5mhz_n_o  : out std_logic;
    clk_en_4mhz_o    : out std_logic
  );

end ladybug_clk;


library ieee;
use ieee.numeric_std.all;

architecture rtl of ladybug_clk is

  -- counter for 5 MHz and 10 MHz clock enables
  signal clk_cnt_5mhz_q   : unsigned(1 downto 0);
  -- counter for 4 MHz clock enable
  signal clk_cnt_4mhz_q   : unsigned(2 downto 0);

begin

  -----------------------------------------------------------------------------
  -- Process clk_en
  --
  -- Purpose:
  --   Generates the clock enables for 10 MHz, 5 MHz, 4 MHz.
  --
  clk_en: process (clk_20mhz_i, por_n_i)
  begin
    if por_n_i = '0' then
      clk_cnt_5mhz_q   <= (others => '0');
      clk_cnt_4mhz_q   <= (others => '0');
      clk_en_10mhz_o   <= '0';
      clk_en_10mhz_n_o <= '0';
      clk_en_5mhz_o    <= '0';
      clk_en_5mhz_n_o  <= '0';
      clk_en_4mhz_o    <= '0';

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then

      -------------------------------------------------------------------------
      -- 10 MHz / 5 MHz clock domain
      --
      -- counter for 10 MHz and 5 MHz clock enables
      clk_cnt_5mhz_q <= clk_cnt_5mhz_q + 1;

      -- generate clock enable for 10 MHz
      -- enable on every second clock of clk_20mhz_i
      clk_en_10mhz_o   <=     clk_cnt_5mhz_q(0);
      -- enable with 180 deg phase shift
      clk_en_10mhz_n_o <= not clk_cnt_5mhz_q(0);

      -- generate clock enables for 5 MHz:
      -- enable on every forth clock of clk_20mhz_i
      if clk_cnt_5mhz_q = "11" then
        clk_en_5mhz_o   <= '1';
      else
        clk_en_5mhz_o   <= '0';
      end if;
      -- enable with 180 deg phase shift
      if clk_cnt_5mhz_q = "01" then
        clk_en_5mhz_n_o <= '1';
      else
        clk_en_5mhz_n_o <= '0';
      end if;
      --
      -------------------------------------------------------------------------


      -------------------------------------------------------------------------
      -- 4 MHz domain
      --
      -- counter for 4 MHz clock enable, wrap around after 5 clocks
      clk_en_4mhz_o  <= clk_cnt_4mhz_q(2);

      if clk_cnt_4mhz_q = "100" then
        clk_cnt_4mhz_q <= (others => '0');
      else
        clk_cnt_4mhz_q <= clk_cnt_4mhz_q + 1;
      end if;
      --
      -------------------------------------------------------------------------

    end if;
  end process clk_en;
  --
  -----------------------------------------------------------------------------


end rtl;
