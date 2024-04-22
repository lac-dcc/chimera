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
--------------------------------------------------------------------------------
-- Entity:      ahbmmux
-- File:        ahbmmux.vhd
-- Author:      Aeroflex Gaisler
-- Contact:     support@gaisler.com
-- Description: 
--              
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.config_types.all;
use grlib.config.all;
use grlib.stdlib.all;
use grlib.amba.all;


entity ahbmmux is
  port (
    clk   : in  std_ulogic;
    rstn  : in  std_ulogic;
    
    mstmi : out ahb_mst_in_type;
    mstmo : in  ahb_mst_out_type;
    
    ahbm0i: in  ahb_mst_in_type;
    ahbm0o: out ahb_mst_out_type;

    ahbm1i: in  ahb_mst_in_type;
    ahbm1o: out ahb_mst_out_type;

    force : in  std_logic
  );
end entity;

architecture rtl of ahbmmux is
begin
  comb : process (mstmo, ahbm0i, ahbm1i, force)
    variable m0o, m1o : ahb_mst_out_type;
    variable mi       : ahb_mst_in_type;
  begin
    m0o := mstmo;
    m1o := mstmo;
    mi  := ahbm0i; 

    if force = '1' then
      mi.hready := ahbm0i.hready;
      mi.hresp  := ahbm0i.hresp ;
      mi.hrdata := ahbm0i.hrdata;
      mi.hgrant := ahbm0i.hgrant;

      m1o.hbusreq := '0';
      m1o.htrans  := "00";
    else
      mi.hready := ahbm1i.hready;
      mi.hresp  := ahbm1i.hresp ;
      mi.hrdata := ahbm1i.hrdata;
      mi.hgrant := ahbm1i.hgrant;

      m0o.hbusreq := '0';
      m0o.htrans  := "00";
    end if;

    mstmi  <= mi;
    ahbm0o <= m0o;
    ahbm1o <= m1o;
  end process;

end;
