-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_chute.vhd,v 1.3 2005/10/10 21:21:20 arnim Exp $
--
-- Pulse shaper for a chute input.
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

entity ladybug_chute is

  port (
    clk_20mhz_i : in  std_logic;
    res_n_i     : in  std_logic;
    chute_i     : in  std_logic;
    chute_o     : out std_logic
  );

end ladybug_chute;


library ieee;
use ieee.numeric_std.all;

architecture rtl of ladybug_chute is

  -- 2.35e-2 s = 1 / 20,000,000 Hz * 470000
  constant chute_delay_c : natural := 470000;

  signal chute_cnt_q : unsigned(18 downto 0);

  signal chute_sync_q : std_logic_vector(1 downto 0);

begin

  -----------------------------------------------------------------------------
  -- Process sync
  --
  -- Purpose:
  --  Synchronize the asynchronous chute input.
  --
  sync: process (clk_20mhz_i, res_n_i)
  begin
    if res_n_i = '0' then
      chute_sync_q <= (others => '0');

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      chute_sync_q(0) <= chute_i;
      chute_sync_q(1) <= chute_sync_q(0);

    end if;
  end process sync;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process cnt
  --
  -- Purpose:
  --  Count the required number of 20 MHz clock cycles before emitting
  --  chute event. This is a low pass filter for the rising edge of chute_i.
  --
  cnt: process (clk_20mhz_i, res_n_i)
  begin
    if res_n_i = '0' then
      chute_cnt_q <= (others => '0');
      chute_o     <= '0';

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      if chute_sync_q(1) = '1' then
        if chute_cnt_q = chute_delay_c then
          chute_o     <= '1';
        else
          chute_cnt_q <= chute_cnt_q + 1;
        end if;

      else
        -- reset counter when chute input goes back to 0
        chute_cnt_q   <= (others => '0');
        chute_o       <= '0';

      end if;
        
    end if;
  end process cnt;
  --
  -----------------------------------------------------------------------------

end rtl;
