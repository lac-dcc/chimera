-------------------------------------------------------------------------------
--
-- FPGA Lady Bug
--
-- $Id: ladybug_addr_dec.vhd,v 1.10 2005/12/10 14:51:46 arnim Exp $
--
-- Address decoder of the CPU Unit.
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

entity ladybug_addr_dec is

  port (
    clk_20mhz_i    : in  std_logic;
    res_n_i        : in  std_logic;
    a_i            : in  std_logic_vector(15 downto 12);
    rd_n_i         : in  std_logic;
    wr_n_i         : in  std_logic;
    mreq_n_i       : in  std_logic;
    rfsh_n_i       : in  std_logic;
    cs_n_o         : out std_logic_vector(15 downto 0);
    ram_cpu_cs_n_o : out std_logic
  );

end ladybug_addr_dec;


library ieee;
use ieee.numeric_std.all;

architecture rtl of ladybug_addr_dec is

begin

  -----------------------------------------------------------------------------
  -- Process adec
  --
  -- Purpose:
  --   Decode the CPU address and generate one-hot chip select signals.
  --   Each chip select enables a 4 KByte address segment.
  --
  --   The chip select outputs are registered with the 20 MHz clock to
  --   break potentially long combinational paths here.
  --
  adec: process (clk_20mhz_i, res_n_i)
  begin
    if res_n_i = '0' then
      cs_n_o <= (others => '1');

    elsif clk_20mhz_i'event and clk_20mhz_i = '1' then
      -- default assignment
      cs_n_o <= (others => '1');

      if a_i(15) = '0' then
        if rd_n_i = '0' or wr_n_i = '0' then
          cs_n_o(to_integer(unsigned( '0' & a_i(14 downto 12) ))) <= '0';
        end if;

      else
        if mreq_n_i = '0' and rfsh_n_i = '1' then
          cs_n_o(to_integer(unsigned( '1' & a_i(14 downto 12) ))) <= '0';
        end if;

      end if;

    end if;
  end process adec;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process cs_ext_ram
  --
  -- Purpose:
  --   Builds the combinational chip select signal for the external CPU RAM.
  --
  cs_ext_ram: process (a_i,
                       rd_n_i, wr_n_i)
  begin
    if (rd_n_i = '0' or wr_n_i = '0') and
       a_i(15 downto 12) = "0110"     then
      ram_cpu_cs_n_o <= '0';
    else
      ram_cpu_cs_n_o <= '1';
    end if;
  end process cs_ext_ram;
  --
  -----------------------------------------------------------------------------

end rtl;
