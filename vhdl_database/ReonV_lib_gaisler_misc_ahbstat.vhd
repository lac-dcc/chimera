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
-------------------------------------------------------------------------------
-- Entity:      ahbstat.vhd
-- File:        ahbstat.vhd
-- Author:      Cobham Gaisler AB
-- Contact:     support@gaisler.com
-- Description: AHB status register
------------------------------------------------------------------------------

library ieee;
library grlib;
library gaisler;

use ieee.std_logic_1164.all;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
use gaisler.misc.all;

entity ahbstat is
  generic(
    pindex : integer := 0;
    paddr  : integer := 0;
    pmask  : integer := 16#FFF#;
    pirq   : integer := 0;
    nftslv : integer range 1 to NAHBSLV - 1 := 3;
    ver    : integer range 0 to 1 := 0
    );
  port(
    rst   : in std_ulogic;
    clk   : in std_ulogic;
    ahbmi : in ahb_mst_in_type;
    ahbsi : in ahb_slv_in_type;
    stati : in ahbstat_in_type;
    apbi  : in apb_slv_in_type;
    apbo  : out apb_slv_out_type
  );
end entity;

architecture rtl of ahbstat is


  type astat_addr_type is array (0 to ver) of std_logic_vector(31 downto 0);
  type astat_hsize_type is array (0 to ver) of std_logic_vector(2 downto 0);
  type astat_hmaster_type is array (0 to ver) of std_logic_vector(3 downto 0);
  type astat_errfilt_type is array (0 to ver) of std_logic_vector(ver downto 0);
  
  type reg_type is record
    addr    : astat_addr_type; --failing address
    hsize   : astat_hsize_type;  --ahb signals for failing op.
    hmaster : astat_hmaster_type;
    hwrite  : std_logic_vector(0 to ver);
    hresperr: std_ulogic;
    newerr  : std_logic_vector(0 to ver); --new error detected
    cerror  : std_logic_vector(0 to ver); --correctable error detected
    errfilt : astat_errfilt_type; --error filter
    bwatch  : std_ulogic;
    multierr: std_logic_vector(0 to ver);
    pirq    : std_ulogic; 
  end record;

  signal r, rin : reg_type;

  constant VERSION : integer := ver;
  
  constant pconfig : apb_config_type := (
  0 => ahb_device_reg (VENDOR_GAISLER, GAISLER_AHBSTAT, 0, VERSION, pirq),
  1 => apb_iobar(paddr, pmask));

begin

  comb : process(rst, ahbmi, ahbsi, stati, apbi, r) is
  variable v       : reg_type;
  variable prdata  : std_logic_vector(31 downto 0);
  variable vpirq   : std_logic_vector(NAHBIRQ - 1 downto 0);
  variable ce      : std_ulogic; --correctable error
  begin
    v := r; vpirq := (others => '0'); prdata := (others => '0'); v.pirq := '0';

    ce := orv(stati.cerror(0 to nftslv-1));

    for i in 0 to ver loop
      if ver = 0 or apbi.paddr(3) = conv_std_logic(i = 1) then
        case apbi.paddr(2) is
          when '0' => --status values
            prdata(2 downto 0) := r.hsize(i);
            prdata(6 downto 3) := r.hmaster(i);
            prdata(7) := r.hwrite(i);
            prdata(8) := r.newerr(i);
            prdata(9) := r.cerror(i);
            if ver /= 0 then
              prdata(ver+10 downto 10) := r.errfilt(i);
            end if;
            prdata(13) := r.multierr(i);
          when others => --failing address
            prdata := r.addr(i);
        end case;
        --writes. data is written in setup cycle so that r.newerr is updated
        --when hready = '1'
        if (apbi.psel(pindex) and not apbi.penable and apbi.pwrite) = '1' then
          case apbi.paddr(2) is 
            when '0' =>
              v.newerr(i) := apbi.pwdata(8);
              v.cerror(i) := apbi.pwdata(9);
              if ver /= 0 and apbi.pwdata(12) = '1' then
                v.errfilt(i) := apbi.pwdata(10+ver downto 10);
              end if;
              v.multierr(i) := apbi.pwdata(13);
            when others => null;
          end case;
        end if;
      end if;
    end loop;

    for i in 0 to ver loop
      if (ahbsi.hready = '1') then
        if (((ver = 0) and ((r.hresperr or ce) = '1')) or
            ((ver /= 0 and (not v.newerr(0) or r.newerr(0)) = '1') and
             (((r.hresperr and not r.errfilt(i)(0)) = '1') or
              ((ce and not r.errfilt(i)(ver)) = '1')))) then
          if (ver = 0) or (r.bwatch = '0') then
            if r.newerr(i) = '0' then
              v.newerr(i) := '1';
              v.cerror(i) := ce;
            elsif ver /= 0 and r.newerr(i) = '1' then
              if (andv(r.newerr) = '1' or
                  ((i = 0) and ((r.hresperr and r.errfilt(ver)(0)) = '1' or
                                ((ce and r.errfilt(ver)(ver)) = '1'))) or
                  ((i = 1) and ((r.hresperr and r.errfilt(0)(0)) = '1' or
                                ((ce and r.errfilt(0)(ver)) = '1')))) then
                v.multierr(i) := '1';
              end if;
            end if;
          end if;
          if ver /= 0 then v.bwatch := '1'; end if;
        elsif r.newerr(i) = '0' then
          v.addr(i) := ahbsi.haddr;
          v.hsize(i) := ahbsi.hsize;
          v.hmaster(i) := ahbsi.hmaster;
          v.hwrite(i) := ahbsi.hwrite;
        end if;
      end if;
    end loop;
    if ver = 0 or (ahbsi.hready = '1' and ahbsi.htrans /= "11") then
      v.bwatch := '0';
    end if;
    v.hresperr := '0';
    if ahbsi.hready = '0' and ahbmi.hresp = HRESP_ERROR then v.hresperr := '1'; end if;
    
    --irq generation
    v.pirq := orv(v.newerr and not r.newerr);
    vpirq(pirq) := r.pirq;
        
    --reset
    if rst = '0' then
      v.newerr := (others => '0');
      v.cerror := (others => '0');
      v.errfilt := (others => (others => '0'));
      v.multierr := (others => '0');
    end if;

    if ver = 0 then
      v.errfilt := (others => (others => '0'));
      v.multierr := (others => '0');
    end if;
    
    rin <= v;
    apbo.prdata <= prdata;
    apbo.pirq <= vpirq;
  end process;

  apbo.pconfig <= pconfig;
  apbo.pindex <= pindex;
  
  regs : process(clk) is
  begin
    if rising_edge(clk) then r <= rin; end if;
  end process;

-- boot message

-- pragma translate_off
    bootmsg : report_version 
    generic map ("ahbstat" & tost(pindex) & 
	": AHB status unit rev " & tost(VERSION) & 
	", irq " & tost(pirq));
-- pragma translate_on

end architecture;

