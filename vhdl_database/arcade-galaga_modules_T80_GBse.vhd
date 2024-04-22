-- ****
-- T80(b) core. In an effort to merge and maintain bug fixes ....
--
--
-- Ver 300 started tidyup
-- MikeJ March 2005
-- Latest version from www.fpgaarcade.com (original www.opencores.org)
--
-- ****
--
-- Z80 compatible microprocessor core, synchronous top level with clock enable
-- Different timing than the original z80
-- Inputs needs to be synchronous and outputs may glitch
--
-- Version : 0240
--
-- Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
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
-- The latest version of this file can be found at:
--      http://www.opencores.org/cvsweb.shtml/t80/
--
-- Limitations :
--
-- File history :
--
--      0235 : First release
--
--      0236 : Added T2Write generic
--
--      0237 : Fixed T2Write with wait state
--
--      0238 : Updated for T80 interface change
--
--      0240 : Updated for T80 interface change
--
--      0242 : Updated for T80 interface change
--

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.t80_pack.all;

entity gbse is
  generic (
    t2write : integer := 1; -- 0 => WR_n active in T3, /=0 => WR_n active in T2
    iowait  : integer := 1  -- 0 => Single cycle I/O, 1 => Std I/O cycle
  );
  port (
    reset_n : in    std_logic;
    clk_n   : in    std_logic;
    clken   : in    std_logic;
    wait_n  : in    std_logic;
    int_n   : in    std_logic;
    nmi_n   : in    std_logic;
    busrq_n : in    std_logic;
    m1_n    : out   std_logic;
    mreq_n  : out   std_logic;
    iorq_n  : out   std_logic;
    rd_n    : out   std_logic;
    wr_n    : out   std_logic;
    rfsh_n  : out   std_logic;
    halt_n  : out   std_logic;
    busak_n : out   std_logic;
    stop    : out   std_logic;
    a       : out   std_logic_vector(15 downto 0);
    di      : in    std_logic_vector(7 downto 0);
    do      : out   std_logic_vector(7 downto 0)
  );
end entity gbse;

architecture rtl of gbse is

  signal intcycle_n : std_logic;
  signal noread     : std_logic;
  signal write      : std_logic;
  signal iorq       : std_logic;
  signal di_reg     : std_logic_vector(7 downto 0);
  signal mcycle     : std_logic_vector(2 downto 0);
  signal tstate     : std_logic_vector(2 downto 0);

begin

  u0 : component t80
    generic map (
      mode   => 3,
      iowait => iowait,
      flag_s => 0,
      flag_p => 0,
      flag_x => 0,
      flag_y => 0,
      flag_c => 4,
      flag_h => 5,
      flag_n => 6,
      flag_z => 7
    )
    port map (
      cen        => clken,
      m1_n       => m1_n,
      iorq       => iorq,
      noread     => noread,
      write      => write,
      rfsh_n     => rfsh_n,
      halt_n     => halt_n,
      stop       => stop,
      wait_n     => wait_n,
      int_n      => int_n,
      nmi_n      => nmi_n,
      reset_n    => reset_n,
      busrq_n    => busrq_n,
      busak_n    => busak_n,
      clk_n      => clk_n,
      a          => a,
      dinst      => di,
      di         => di_reg,
      do         => do,
      mc         => mcycle,
      ts         => tstate,
      intcycle_n => intcycle_n
    );

  process (reset_n, clk_n) is
  begin

    if (reset_n = '0') then
      rd_n   <= '1';
      wr_n   <= '1';
      iorq_n <= '1';
      mreq_n <= '1';
      di_reg <= "00000000";
    elsif (clk_n'event and clk_n = '1') then
      if (clken = '1') then
        rd_n   <= '1';
        wr_n   <= '1';
        iorq_n <= '1';
        mreq_n <= '1';
        if (mcycle = "001") then
          if (tstate = "001" or (tstate = "010" and wait_n = '0')) then
            rd_n   <= not intcycle_n;
            mreq_n <= not intcycle_n;
          end if;
          if (tstate = "011") then
            mreq_n <= '0';
          end if;
        elsif (mcycle = "011" and intcycle_n = '0') then
          if (tstate = "001") then
            iorq_n <= '0'; -- Acknowledge IRQ
          end if;
        else
          if ((tstate = "001" or (tstate = "010" and wait_n = '0')) and noread = '0' and write = '0') then
            rd_n   <= '0';
            iorq_n <= not iorq;
            mreq_n <= iorq;
          end if;
          if (t2write = 0) then
            if (tstate = "010" and write = '1') then
              wr_n   <= '0';
              iorq_n <= not iorq;
              mreq_n <= iorq;
            end if;
          else
            if ((tstate = "001" or (tstate = "010" and wait_n = '0')) and write = '1') then
              wr_n   <= '0';
              iorq_n <= not iorq;
              mreq_n <= iorq;
            end if;
          end if;
        end if;
        if (tstate = "010" and wait_n = '1') then
          di_reg <= di;
        end if;
      end if;
    end if;

  end process;

end architecture rtl;
