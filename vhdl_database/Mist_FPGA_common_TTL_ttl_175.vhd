-------------------------------------------------------------------------------
--
-- TTL 74175 - Quad D-Type Flip-Flops with Clear
--
-- $Id: ttl_175.vhd,v 1.5 2005/10/10 21:59:13 arnim Exp $
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

entity ttl_175 is

  port (
    ck_i    : in  std_logic;
    ck_en_i : in  std_logic;
    por_n_i : in  std_logic;
    cl_n_i  : in  std_logic;
    d_i     : in  std_logic_vector(4 downto 1);
    q_o     : out std_logic_vector(4 downto 1);
    q_n_o   : out std_logic_vector(4 downto 1);
    d_o     : out std_logic_vector(4 downto 1);
    d_n_o   : out std_logic_vector(4 downto 1)
  );

end ttl_175;


architecture rtl of ttl_175 is

  signal flops_q,
         flops_s  : std_logic_vector(4 downto 1);

begin

  -----------------------------------------------------------------------------
  -- Process flops
  --
  -- Purpose:
  --   Implement the sequential elements.
  --
  --   Note: We assume that the sequential elements power-up to the same state
  --         as forced into by cl_n_i.
  --
  flops: process (ck_i, por_n_i)
  begin
    if por_n_i = '0' then
      flops_q  <= (others => '0');
    elsif ck_i'event and ck_i = '1' then
      flops_q <= flops_s;
    end if;
  end process flops;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process comb
  --
  -- Purpose:
  --   Implements the combinational logic.
  --
  comb: process (flops_q,
                 cl_n_i,
                 d_i,
                 ck_en_i)
  begin
    -- default assignments
    flops_s     <= flops_q;

    if cl_n_i = '1' then
      if ck_en_i = '1' then
        flops_s <= d_i;
      end if;

    else
      -- pseudo-asynchronous clear
      flops_s   <= (others => '0');
    end if;
  end process comb;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output Mapping
  -----------------------------------------------------------------------------
  q_o   <= flops_q;
  q_n_o <= not flops_q;
  d_o   <= flops_s;
  d_n_o <= not flops_s;

end rtl;
