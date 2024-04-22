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
-- Entity:      simtrans1553
-- File:        simtrans1553.vhd
-- Author:      Magnus Hjorth - Aeroflex Gaisler
-- Description: 1553 Transceiver simulation model
------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.gr1553b_pkg.all;

entity simtrans1553_single is
  generic (
    txdelay: time := 200 ns;
    rxdelay: time := 450 ns
    );
  port (
    buswire: inout wire1553;
    rxen: in std_logic;
    txin: in std_logic;
    txP: in std_logic;
    txN: in std_logic;
    rxP: out std_logic;
    rxN: out std_logic
    );
end;

architecture b of simtrans1553_single is
  signal bw_rxd, bw_txd: wire1553;
begin

  bw_rxd <= transport buswire after rxdelay;
  buswire <= bw_txd after txdelay;

  rxpr: process(bw_rxd,rxen)
    variable p,n: std_ulogic;
  begin
    p:='U'; n:='U';
    case rxen is
      when '0' => p:='0'; n:='0';
      when '1' =>
        case bw_rxd is
          when 'U' => null;
          when 'X' => p := 'X'; n := 'X';
          when '0' => p := '0'; n := '0';
          when '+' => p := '1'; n := '0';
          when '-' => p := '0'; n := '1';
        end case;
      when 'X' => p:='X'; n:='X';
      when others => null;
    end case;
    rxP <= p;
    rxN <= n;    
  end process;

  txpr: process(txin, txP, txN)
    variable w: wire1553;
  begin
    w := 'U';
    if txin='1' or (txP='0' and txN='0') or (txP='1' and txN='1') then
      w := '0';
    elsif txin='0' and txP='1' and txN='0' then
      w := '+';
    elsif txin='0' and txP='0' and txN='1' then
      w := '-';
    elsif txin='X' or txP='X' or txN='X' then
      w := 'X';
    elsif txin='U' or (txP='U' and txN='U') then
      w := 'U';
    else
      w := 'X';
    end if;
    bw_txd <= w;    
  end process;
  
end;




library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.gr1553b_pkg.all;

entity simtrans1553 is
  generic (
    txdelay: time := 200 ns;
    rxdelay: time := 450 ns
    );
  port (
    busA: inout wire1553;
    busB: inout wire1553;
    rxenA: in std_logic;
    txinA: in std_logic;
    txAP: in std_logic;
    txAN: in std_logic;
    rxAP: out std_logic;
    rxAN: out std_logic;
    rxenB: in std_logic;
    txinB: in std_logic;
    txBP: in std_logic;
    txBN: in std_logic;
    rxBP: out std_logic;
    rxBN: out std_logic
    );
end;

architecture s of simtrans1553 is
begin
  
  at: simtrans1553_single
    generic map (txdelay,rxdelay)
    port map (busA,rxenA,txinA,txAP,txAN,rxAP,rxAN);
  
  bt: simtrans1553_single
    generic map (txdelay,rxdelay)
    port map (busB,rxenB,txinB,txBP,txBN,rxBP,rxBN);
  
end;

