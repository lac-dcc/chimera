-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_sound_unit.vhd,v 1.4 2006/06/16 22:41:37 arnim Exp $
--
-- Sound Unit of the Lady Bug Machine.
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
use ieee.numeric_std.all;

entity ladybug_sound_unit is

  port (
    clk_20mhz_i    : in  std_logic;
    clk_en_4mhz_i  : in  std_logic;
    por_n_i        : in  std_logic;
    cs11_n_i       : in  std_logic;
    cs12_n_i       : in  std_logic;
    wr_n_i         : in  std_logic;
    d_from_cpu_i   : in  std_logic_vector(7 downto 0);
    sound_wait_n_o : out std_logic;
    audio_o        : out std_logic_vector(8 downto 0)
  );

end ladybug_sound_unit;

architecture struct of ladybug_sound_unit is

  signal ready_b1_s,
         ready_c1_s  : std_logic;

  signal aout_b1_s,
         aout_c1_s   : std_logic_vector(7 downto 0);

begin

  -----------------------------------------------------------------------------
  -- SN76489 Sound Chip B1
  -----------------------------------------------------------------------------
  snd_b1_b : entity work.sn76489_top
    generic map (
      clock_div_16_g => 1
    )
    port map (
      clock_i    => clk_20mhz_i,
      clock_en_i => clk_en_4mhz_i,
      res_n_i    => por_n_i,
      ce_n_i     => cs11_n_i,
      we_n_i     => wr_n_i,
      ready_o    => ready_b1_s,
      d_i        => d_from_cpu_i,
      aout_o     => aout_b1_s
    );


  -----------------------------------------------------------------------------
  -- SN76489 Sound Chip C1
  -----------------------------------------------------------------------------
  snd_c1_b : entity work.sn76489_top
    generic map (
      clock_div_16_g => 1
    )
    port map (
      clock_i    => clk_20mhz_i,
      clock_en_i => clk_en_4mhz_i,
      res_n_i    => por_n_i,
      ce_n_i     => cs12_n_i,
      we_n_i     => wr_n_i,
      ready_o    => ready_c1_s,
      d_i        => d_from_cpu_i,
      aout_o     => aout_c1_s
    );


  -----------------------------------------------------------------------------
  -- Process mix
  --
  -- Purpose:
  --   Mix the digital audio of the two SN76489 instances.
  audio_o <= std_logic_vector(unsigned('0'&aout_b1_s) + unsigned('0'&aout_c1_s));
  -- 
  -----------------------------------------------------------------------------


  sound_wait_n_o <= ready_b1_s and ready_c1_s;

end struct;
