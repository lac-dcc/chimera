-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_gpio.vhd,v 1.3 2005/10/10 21:21:20 arnim Exp $
--
-- General purpose IO input for CPU Main Unit.
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

entity ladybug_gpio is

  port (
    a_i          : in  std_logic_vector(1 downto 0);
    cs_in_n_i    : in  std_logic;
    cs_extra_n_i : in  std_logic;
    in0_i        : in  std_logic_vector(7 downto 0);
    in1_i        : in  std_logic_vector(7 downto 0);
    in2_i        : in  std_logic_vector(7 downto 0);
    in3_i        : in  std_logic_vector(7 downto 0);
    extra_i      : in  std_logic_vector(7 downto 0);
    d_o          : out std_logic_vector(7 downto 0)
  );

end ladybug_gpio;


architecture rtl of ladybug_gpio is

begin

  -----------------------------------------------------------------------------
  -- Process gpio
  --
  -- Purpose:
  --   Multiplex the IN and EXTRA inputs onto the data bus for CPU.
  --
  gpio: process (a_i,
                 cs_in_n_i,
                 cs_extra_n_i,
                 in0_i,
                 in1_i,
                 in2_i,
                 in3_i,
                 extra_i)
    variable cs_n_v : std_logic_vector(1 downto 0);
  begin
    -- default assignment with inactive bus value
    d_o <= (others => '1');

    cs_n_v := cs_extra_n_i & cs_in_n_i;
    case cs_n_v is
      -- IN ports and DIP switches selected -----------------------------------
      when "10" =>
        case a_i is
          -- IN 0 addressed
          when "00" =>
            d_o <= in0_i;
          -- IN 1 addressed
          when "01" =>
            d_o <= in1_i;
          -- DIP 0 addressed
          when "10" =>
            d_o <= in2_i;
          -- DIP 1 addressed
          when "11" =>
            d_o <= in3_i;

          when others =>
            null;
        end case;

      -- Extra bank selected --------------------------------------------------
      when "01" =>
        case a_i is
          when "00" =>
            d_o(1) <= extra_i(7);
            d_o(0) <= extra_i(3);
          when "01" =>
            d_o(1) <= extra_i(6);
            d_o(0) <= extra_i(2);
          when "10" =>
            d_o(1) <= extra_i(5);
            d_o(0) <= extra_i(1);
          when "11" =>
            d_o(1) <= extra_i(4);
            d_o(0) <= extra_i(0);
          when others =>
            null;
        end case;

      when others =>
        null;
    end case;

  end process gpio;
  --
  -----------------------------------------------------------------------------

end rtl;
