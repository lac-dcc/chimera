-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_res.vhd,v 1.8 2005/10/10 20:52:04 arnim Exp $
--
-- Reset generator for the Lady Bug machine.
--
-- This module generates a reset signal for the whole system synchronous to
-- the main clock.
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

library ieee;
use ieee.numeric_std.all;

entity ladybug_res is

  port (
    clk_20mhz_i : in  std_logic;
    ext_res_n_i : in  std_logic;
    res_n_o     : out std_logic;
    por_n_o     : out std_logic
  );

end ladybug_res;

architecture rtl of ladybug_res is

  -- 4.7e-2 s = 1 / 20,000,000 Hz * 940000
  constant res_delay_c : natural := 940000;

  signal res_sync_n_q : std_logic_vector(1 downto 0);

  signal res_delay_q  : unsigned(19 downto 0);
  signal res_n_q      : std_logic;

  signal por_cnt_q : unsigned(1 downto 0) := "00";
  signal por_n_q   : std_logic := '0';
begin

  por_n_o <= por_n_q;
  res_n_o <= res_n_q;

  -----------------------------------------------------------------------------
  -- Process por_cnt
  --
  -- Purpose:
  --   Generate a power-on reset for 4 clock cycles.
  --
  por_cnt: process (clk_20mhz_i)
  begin
    if clk_20mhz_i'event and clk_20mhz_i = '1' then
      if por_cnt_q = "11" then
        por_n_q   <= '1';
      else
        por_cnt_q <= por_cnt_q + 1;
      end if;
    end if;
  end process por_cnt;
  --
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- Process res_sync
  --
  -- Purpose:
  --   Synchronize asynchronous external reset to main 20 MHz clock.
  --
  res_sync: process (clk_20mhz_i, ext_res_n_i, por_n_q)
  begin
    if ext_res_n_i = '0' or por_n_q = '0' then
      res_sync_n_q <= (others => '0');

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      res_sync_n_q(0) <= '1';
      res_sync_n_q(1) <= res_sync_n_q(0);
    end if;
  end process res_sync;
  --
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- Process res_delay
  --
  -- Purpose:
  --   Delay reset event (external or power-on) by 4.7e-2 s.
  --   Reset delay is taken from Lady Bug reset circuit using NE555.
  --   This duration might be too long for the actual requirements of the
  --   FPGA circuit.
  --
  res_delay: process (clk_20mhz_i, res_sync_n_q)
  begin
    if res_sync_n_q(1) = '0' then
      res_delay_q <= (others => '0');
      res_n_q     <= '0';

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      if res_delay_q = res_delay_c then
        res_n_q     <= '1';
      else
        res_delay_q <= res_delay_q + 1;
      end if;
    end if;
  end process res_delay;
  --
  -----------------------------------------------------------------------------

end rtl;
