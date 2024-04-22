------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity:      apb3cdc
-- File:        apb3cdc.vhd
-- Author:      Magnus Hjorth - Cobham Gaisler AB
-- Description: Clock domain crossing for APB3
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
library techmap;
use techmap.gencomp.all;

entity apb3cdc is
  generic (
    tech: integer;
    nsync: integer := 2;
    skew: integer := 1;
    pindex: integer := 0
    );
  port (
    cclk     : in std_ulogic;
    crst     : in std_ulogic;
    csclkact : in std_ulogic;
    capb3i   : in apb3_slv_in_type;
    capb3o   : out apb3_slv_out_type;
    cpend    : out std_ulogic;
    sclk     : in std_ulogic;
    srst     : in std_ulogic;
    scclkact : in std_ulogic;
    sapb3i   : out apb3_slv_in_type;
    sapb3o   : in apb3_slv_out_type
    );
end;

architecture rtl of apb3cdc is

  signal cready: std_ulogic;
  signal sready: std_ulogic;
  signal srack: std_ulogic;
  signal crack,crack2: std_ulogic;
  signal spsel,spenable: std_ulogic;
  signal cacc, sacc: std_logic_vector(64 downto 0);
  signal sresp, cresp: std_logic_vector(32 downto 0);
  signal cdcen, cdc2en: std_ulogic;

begin

  cpend <= cready xor crack2;

  capb3o <= (
    prdata  => cresp(31 downto 0),
    pready  => cready xnor crack2,
    pslverr => cresp(32),
    pirq    => (others => '0'),
    pconfig => sapb3o.pconfig,
    pindex  => pindex
    );

  sapb3i <= (
    psel    => (others => spsel),
    penable => spenable,
    paddr   => sacc(31 downto 0),
    pwrite  => sacc(64),
    pwdata  => sacc(63 downto 32),
    pirq    => (others => '0'),
    testen  => capb3i.testen,
    testrst => capb3i.testrst,
    scanen  => capb3i.scanen,
    testoen => capb3i.testoen,
    testin  => capb3i.testin
    );

  cregs: process(cclk)
  begin
    if rising_edge(cclk) then
      crack2 <= crack and csclkact;
      if capb3i.psel(pindex)='1' and capb3i.penable='0' then
        cready <= not cready;
      end if;
      if crst='0' then
        cready <= '0';
      end if;
    end if;
  end process;

  ssr: syncreg
    generic map (tech => tech, stages => nsync)
    port map (clk => sclk, d => cready, q => sready);

  acccdc: cdcbus
    generic map (tech => tech, width => 65)
    port map (busin => cacc, clk => sclk, enable => cdcen,
              busout => sacc, tsten => capb3i.testen);
  cacc <= capb3i.pwrite & capb3i.pwdata & capb3i.paddr;
  cdcen <= sready xor srack;

  sregs: process(sclk)
  begin
    if rising_edge(sclk) then
      spsel <= '0';
      spenable <= '0';
      if (sready xor srack)='1' and scclkact='1' then
        spsel <= '1';
        spenable <= spsel;
      end if;
      if spenable='1' and sapb3o.pready='1' then
        sresp <= sapb3o.pslverr & sapb3o.prdata;
        srack <= not srack;
        spsel <= '0';
        spenable <= '0';
      end if;
      if srst='0' then
        srack <= '0';
      end if;
    end if;
  end process;

  csr: syncreg
    generic map (tech => tech, stages => nsync)
    port map (clk => cclk, d => srack, q => crack);

  respcdc: cdcbus
    generic map (tech => tech, width => 33)
    port map (busin => sresp, clk => cclk, enable => cdc2en,
              busout => cresp, tsten => capb3i.testen);
  cdc2en <= crack xor crack2;

end;
