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
-- Entity:      axinullslv
-- File:        axinullslv.vhd
-- Author:      Magnus Hjorth - Cobham Gaisler
-- Description: AXI slave returning dummy data and ignoring writes
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;

entity axinullslv is
  port (
    clk: in std_ulogic;
    rst: in std_ulogic;
    axisi: in axi_mosi_type;
    axiso: out axi_somi_type
    );
end;

architecture rtl of axinullslv is

  type axinullslv_regs is record
    aw_ready: std_ulogic;
    wrid: std_logic_vector(3 downto 0);
    w_ready: std_ulogic;
    b_valid: std_ulogic;
    ar_ready: std_ulogic;
    rdid: std_logic_vector(3 downto 0);
    rdlen: std_logic_vector(3 downto 0);
    r_valid: std_ulogic;
    r_last: std_ulogic;
    datactr: std_logic_vector(15 downto 0);
  end record;

  signal r,nr: axinullslv_regs;

begin

  comb: process(rst,axisi,r)
    variable v: axinullslv_regs;    
  begin
    v := r;

    if axisi.aw.valid='1' and r.aw_ready='1' then
      v.aw_ready := '0';
      v.w_ready := '1';
      v.wrid := axisi.aw.id;
    end if;
    if axisi.w.valid='1' and axisi.w.last='1' and r.w_ready='1' then
      v.b_valid := '1';
      v.w_ready := '0';
    end if;
    if axisi.b.ready='1' and r.b_valid='1' then
      v.b_valid := '0';
      v.aw_ready := '1';
    end if;

    if axisi.ar.valid='1' and r.ar_ready='1' then
      v.ar_ready := '0';
      v.r_valid := '1';
      v.rdid := axisi.ar.id;
      v.rdlen := axisi.ar.len;
    end if;
    if axisi.r.ready='1' and r.r_valid='1' then
      v.datactr := std_logic_vector(unsigned(r.datactr)+1);
      v.rdlen := std_logic_vector(unsigned(r.rdlen)-1);
      if r.r_last='1' then
        v.r_valid := '0';
        v.ar_ready := '1';
      end if;
    end if;

    v.r_last := '0';
    if v.rdlen="0000" then v.r_last:='1'; end if;

    if rst='0' then
      v.aw_ready := '1';
      v.w_ready := '0';
      v.b_valid := '0';
      v.ar_ready := '1';
      v.r_valid := '0';
      v.datactr := (others => '0');
    end if;

    nr <= v;
    axiso <= (
      aw => (ready => r.aw_ready),
      w => (ready => r.w_ready),
      b => (id => r.wrid, resp => "00", valid => r.b_valid),
      ar => (ready => r.ar_ready),
      r => (id => r.rdid, data => ahbdrivedata(r.datactr), resp => "00", last => r.r_last, valid => r.r_valid)
      );
  end process;

  regs: process(clk)
  begin
    if rising_edge(clk) then
      r <= nr;
    end if;
  end process;

end;
