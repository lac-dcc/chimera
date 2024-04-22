-------------------------------------------------------------------------------
--
-- TTL 74LS393 - Dual 4-Bit Binary Counter
--
-- $Id: ttl_393.vhd,v 1.3 2005/10/10 21:59:13 arnim Exp $
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

entity ttl_393 is

  port (
    ck_i    : in  std_logic;
    ck_en_i : in  std_logic_vector(2 downto 1);
    por_n_i : in  std_logic;
    cl_i    : in  std_logic_vector(2 downto 1);
    qa_o    : out std_logic_vector(2 downto 1);
    qb_o    : out std_logic_vector(2 downto 1);
    qc_o    : out std_logic_vector(2 downto 1);
    qd_o    : out std_logic_vector(2 downto 1);
    da_o    : out std_logic_vector(2 downto 1);
    db_o    : out std_logic_vector(2 downto 1);
    dc_o    : out std_logic_vector(2 downto 1);
    dd_o    : out std_logic_vector(2 downto 1)
  );

end ttl_393;


library ieee;
use ieee.numeric_std.all;

architecture rtl of ttl_393 is

  type   cnt_q_t is array (natural range 2 downto 1) of unsigned(3 downto 0);
  type   cnt_d_t is array (natural range 2 downto 1) of unsigned(4 downto 0);
  signal cnt_q   : cnt_q_t;
  signal cnt_s   : cnt_d_t;

begin

  -----------------------------------------------------------------------------
  -- Process seq
  --
  -- Purpose:
  --   Implements the flip-flops.
  --
  --   Note: We assume that the sequential elements power-up to the same state
  --         as forced into by cl_i.
  --
  seq: process (ck_i, por_n_i)
  begin
    if por_n_i = '0' then
      cnt_q(1) <= (others => '0');
      cnt_q(2) <= (others => '0');
    elsif ck_i'event and ck_i = '1' then
      cnt_q(1) <= cnt_s(1)(3 downto 0);
      cnt_q(2) <= cnt_s(2)(3 downto 0);
    end if;
  end process seq;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Process adder
  --
  -- Purpose:
  --   Implements the adder.
  --
  adder: process (ck_en_i,
                  cl_i,
                  cnt_q)
  begin
    for idx in 2 downto 1 loop
      cnt_s(idx) <= '0' & cnt_q(idx);

      if cl_i(idx) = '0' then
        if ck_en_i(idx) = '1' then
          -- increment upon enable
          cnt_s(idx) <= ('0' & cnt_q(idx)) + 1;
        end if;

      else
        -- pseudo-asynchronous clear
        cnt_s(idx) <= (others => '0');
      end if;
    end loop;
  end process adder;
  --
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Output Mapping
  -----------------------------------------------------------------------------
  qa_o(1) <= cnt_q(1)(0);
  qb_o(1) <= cnt_q(1)(1);
  qc_o(1) <= cnt_q(1)(2);
  qd_o(1) <= cnt_q(1)(3);
  qa_o(2) <= cnt_q(2)(0);
  qb_o(2) <= cnt_q(2)(1);
  qc_o(2) <= cnt_q(2)(2);
  qd_o(2) <= cnt_q(2)(3);
  da_o(1) <= cnt_s(1)(0);
  db_o(1) <= cnt_s(1)(1);
  dc_o(1) <= cnt_s(1)(2);
  dd_o(1) <= cnt_s(1)(3);
  da_o(2) <= cnt_s(2)(0);
  db_o(2) <= cnt_s(2)(1);
  dc_o(2) <= cnt_s(2)(2);
  dd_o(2) <= cnt_s(2)(3);

end rtl;
