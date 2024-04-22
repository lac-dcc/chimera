-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_rgb.vhd,v 1.4 2005/10/10 22:02:14 arnim Exp $
--
-- RGB Generation Module of the Lady Bug Machine.
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

entity ladybug_rgb is

  port (
    clk_20mhz_i   : in  std_logic;
    por_n_i       : in  std_logic;
    clk_en_5mhz_i : in  std_logic;
    crg_i         : in  std_logic_vector(5 downto 1);
    sig_i         : in  std_logic_vector(4 downto 1);
    rgb_r_o       : out std_logic_vector(1 downto 0);
    rgb_g_o       : out std_logic_vector(1 downto 0);
    rgb_b_o       : out std_logic_vector(1 downto 0)
  );

end ladybug_rgb;

architecture rtl of ladybug_rgb is

  signal a_s     : std_logic_vector(5 downto 1);
  signal rgb_s   : std_logic_vector(8 downto 1);
  signal rgb_n_q : std_logic_vector(8 downto 1);

begin

  -----------------------------------------------------------------------------
  -- Process addr
  --
  -- Purpose:
  --   Generates the PROM address.
  --
  addr: process (crg_i,
                 sig_i)
    variable sig_and_v : std_logic;
  begin
    sig_and_v := sig_i(1) and sig_i(2) and sig_i(3) and sig_i(4);

    a_s(5) <= crg_i(1) and sig_and_v;

    if not (sig_and_v and (crg_i(1) or crg_i(2))) = '0' then
      a_s(4 downto 1) <= crg_i(2) & crg_i(5) & crg_i(4) & crg_i(3);
    else
      a_s(4 downto 1) <= sig_i;
    end if;

  end process addr;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- The RGB Conversion PROM
  -----------------------------------------------------------------------------
  rgb_prom_b : entity work.prom_10_2
    port map (
      CLK    => clk_20mhz_i,
      ADDR   => a_s,
      DATA   => rgb_s
    );

  -----------------------------------------------------------------------------
  -- Process rgb_latch
  --
  -- Purpose:
  --   Implements the output latch for the RGB values.
  --
  rgb_latch: process (clk_20mhz_i, por_n_i)
  begin
    if por_n_i = '0' then
      rgb_n_q <= (others => '1');
    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      if clk_en_5mhz_i = '1' then
        rgb_n_q <= not rgb_s;
      end if;
    end if;
  end process rgb_latch;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output Mapping
  -----------------------------------------------------------------------------
  rgb_r_o <= rgb_n_q(5+1) & rgb_n_q(0+1);
  rgb_g_o <= rgb_n_q(6+1) & rgb_n_q(2+1);
  rgb_b_o <= rgb_n_q(7+1) & rgb_n_q(4+1);

end rtl;
