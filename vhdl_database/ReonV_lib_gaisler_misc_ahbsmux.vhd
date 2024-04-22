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
-- Entity:      ahbsmux
-- File:        ahbsmux.vhd
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

entity ahbsmux is
  generic (
    sindex  : integer := 0 
  );
  port (
    clk     : in  std_ulogic;
    rstn    : in  std_ulogic;
    
    slvsi   : out ahb_slv_in_type;
    slvso   : in  ahb_slv_out_type;
    
    ahbs0i  : in  ahb_slv_in_type;
    ahbs0o  : out ahb_slv_out_type;
    
    ahbs1i  : in  ahb_slv_in_type;
    ahbs1o  : out ahb_slv_out_type;

    force   : in  std_logic;
    locken  : in  std_logic
  );
end entity;

architecture rtl of ahbsmux is
  constant RESET_ALL : boolean := GRLIB_CONFIG_ARRAY(grlib_sync_reset_enable_all) = 1;
  constant ASYNC_RESET : boolean := GRLIB_CONFIG_ARRAY(grlib_async_reset_enable) = 1;

  function set_hsel (index : integer) return std_logic_vector is
    variable hsel : std_logic_vector(0 to NAHBSLV-1);
  begin
    hsel := (others => '0');
    hsel(index) := '1';
    return(hsel);
  end function;
  constant hsel : std_logic_vector(0 to NAHBSLV-1) := set_hsel(sindex);
  
  type s0state_type is (s0active, s0busy, s0idle);
  type s1state_type is (s1active, s1busy, s1idle);

  type reg_type is record
    s0state    : s0state_type;
    s1state    : s1state_type;
    haddr     : std_logic_vector(31 downto 0);
    hsize     : std_logic_vector(2 downto 0);
    hwrite    : std_logic;
    hburst    : std_logic_vector(2 downto 0);
    hprot     : std_logic_vector(3 downto 0);
    hmaster   : std_logic_vector(3 downto 0);
    hmastlock : std_logic;
    hmbsel    : std_logic_vector(0 to NAHBAMR-1);
  end record;
  constant RES : reg_type := (
    s0state   => s0idle,
    s1state   => s1idle,
    haddr     => zero32(31 downto 0),
    hsize     => zero32(2 downto 0),
    hwrite    => '0',
    hburst    => zero32(2 downto 0),
    hprot     => zero32(3 downto 0),
    hmaster   => zero32(3 downto 0),
    hmastlock => '0',
    hmbsel    => zero32(3 downto 0)
  );

  signal r, rin : reg_type;
  signal s0acc : std_logic;
  signal s1acc : std_logic;
  signal s0lock: std_logic;
  signal s1lock: std_logic;
  signal busy_ahbsi : ahb_slv_in_type;
  --signal mst_ahbsi  : ahb_slv_in_type;
  signal slvsi_mux  : ahb_slv_in_type;
begin
  s0acc <= (ahbs0i.hsel(sindex) and ahbs0i.hready and ahbs0i.htrans(1));
  s1acc <= (ahbs1i.hsel(sindex) and ahbs1i.hready and ahbs1i.htrans(1));
  s0lock <= ahbs0i.hmastlock and locken;
  s1lock <= ahbs1i.hmastlock and locken;

  busy_ahbsi.hsel     <= hsel;
  busy_ahbsi.haddr    <= r.haddr;
  busy_ahbsi.hwrite   <= r.hwrite;
  busy_ahbsi.htrans   <= "10";
  busy_ahbsi.hsize    <= r.hsize;
  busy_ahbsi.hburst   <= r.hburst;
  busy_ahbsi.hwdata   <= ahbs0i.hwdata;
  busy_ahbsi.hprot    <= r.hprot;
  busy_ahbsi.hready   <= '1';
  busy_ahbsi.hmaster  <= r.hmaster;
  busy_ahbsi.hmastlock<= r.hmastlock;
  busy_ahbsi.hmbsel   <= r.hmbsel;
  busy_ahbsi.hirq     <= ahbs0i.hirq;
  busy_ahbsi.testen   <= ahbs0i.testen;
  busy_ahbsi.testrst  <= ahbs0i.testrst;
  busy_ahbsi.scanen   <= ahbs0i.scanen;
  busy_ahbsi.testoen  <= ahbs0i.testoen;
  busy_ahbsi.testin   <= ahbs0i.testin;

  comb : process(r, s0acc, s1acc, slvso, ahbs0i, ahbs1i, busy_ahbsi, force, s0lock, s1lock)
    variable v  : reg_type;
  begin
    v := r;

    case r.s0state is
      when s0idle =>
        if s0acc = '1' then
          if (s1acc = '1' or slvso.hready = '0' or s1lock = '1') and r.s1state = s1active then
            v.s0state := s0busy;
          else
            v.s0state := s0active;
          end if;
        end if;
      when s0active =>
        if slvso.hready = '1' and s0acc = '0' and s0lock = '0' then
          v.s0state := s0idle;
        end if;
      when s0busy =>
        if slvso.hready = '1' and s1acc = '0' and not (r.s1state = s1active and s1lock = '1') then
          v.s0state := s0active;
        end if;
      when others => 
        v.s0state := s0idle;
    end case;

    case r.s1state is
      when s1idle =>
        if s1acc = '1' then
          if s0acc = '1' or slvso.hready = '0' or (r.s0state = s0active and s0lock = '1') then
            v.s1state := s1busy;
          else
            v.s1state := s1active;
          end if;
        end if;
      when s1active =>
        if slvso.hready = '1' and s1acc = '0' and s1lock = '0' then
          v.s1state := s1idle;
        end if;
      when s1busy =>
        if slvso.hready = '1' and s0acc = '0' and not (r.s0state = s0active and s0lock = '1') then
          v.s1state := s1active;
        end if;
      when others => 
        v.s1state := s1idle;
    end case;
    
    if r.s0state /= s0busy and v.s0state = s0busy then
      v.haddr     := ahbs0i.haddr;
      v.hsize     := ahbs0i.hsize;
      v.hwrite    := ahbs0i.hwrite;
      v.hburst    := ahbs0i.hburst;
      v.hprot     := ahbs0i.hprot;
      v.hmaster   := ahbs0i.hmaster;
      v.hmastlock := ahbs0i.hmastlock;
      v.hmbsel    := ahbs0i.hmbsel;
    elsif r.s1state /= s1busy and v.s1state = s1busy then
      v.haddr     := ahbs1i.haddr;
      v.hsize     := ahbs1i.hsize;
      v.hwrite    := ahbs1i.hwrite;
      v.hburst    := ahbs1i.hburst;
      v.hprot     := ahbs1i.hprot;
      v.hmaster   := ahbs1i.hmaster;
      v.hmastlock := ahbs1i.hmastlock;
      v.hmbsel    := ahbs1i.hmbsel;
    end if;
  
    if (force = '0' and ((r.s0state = s0busy and s1acc = '0' and not (r.s1state = s1active and s1lock = '1')) or 
                         (r.s1state = s1busy and s0acc = '0' and not (r.s0state = s0active and s0lock = '1')))) then
      slvsi_mux <= busy_ahbsi;
    elsif (force = '0' and ((s1acc = '1' or (r.s1state = s1active and s1lock = '1')) and    -- S1 pending or active (locked)
                           ((s0acc = '0' and not (r.s0state = s0active and s0lock = '1'))   -- AND S0 not pendign or active
                            or r.s1state = s1active))) then                                 --     OR S1 already active
      slvsi_mux <= ahbs1i;
      if ahbs1i.hready = '0' and r.s1state /= s1active then
        slvsi_mux.hsel(sindex) <= '0';
      end if;
    else
      slvsi_mux <= ahbs0i;
      if force = '0' and ahbs0i.hready = '0' and r.s0state /= s0active then
        slvsi_mux.hsel(sindex) <= '0';
      end if;
    end if;

    if r.s1state = s1active then
      slvsi_mux.hwdata <= ahbs1i.hwdata;
      slvsi_mux.hready <= ahbs1i.hready;
    elsif r.s0state = s0active then
      slvsi_mux.hwdata <= ahbs0i.hwdata;
      slvsi_mux.hready <= ahbs0i.hready;
    end if;

    if force = '1' then
      v.s0state := s0idle;
      v.s1state := s1idle;
    end if;

    rin <= v;
  end process;

  slvsi <= slvsi_mux;

  ahbs0o.hready  <= '0' when force = '0' and r.s0state = s0busy else
                    '1' when force = '0' and r.s0state = s0idle else
                    slvso.hready;
  ahbs0o.hresp   <= slvso.hresp when force = '1' or r.s0state = s0active else "00";
  ahbs0o.hrdata  <= slvso.hrdata;
  ahbs0o.hsplit  <= slvso.hsplit;
  ahbs0o.hirq    <= slvso.hirq;
  ahbs0o.hconfig <= slvso.hconfig;
  ahbs0o.hindex  <= slvso.hindex;

  ahbs1o.hready  <= '0' when force = '0' and r.s1state = s1busy else
                    '1' when force = '0' and r.s1state = s1idle else
                    slvso.hready;
  ahbs1o.hresp   <= slvso.hresp when force = '1' or r.s1state = s1active else "00";
  ahbs1o.hrdata  <= slvso.hrdata;
  ahbs1o.hsplit  <= slvso.hsplit;
  ahbs1o.hirq    <= slvso.hirq;
  ahbs1o.hconfig <= slvso.hconfig;
  ahbs1o.hindex  <= slvso.hindex;

  syncrregs : if not ASYNC_RESET generate
    regs : process(clk)
    begin
      if rising_edge(clk) then
        r <= rin;
        if rstn = '0' then
          if RESET_ALL then
            r <= RES;
          else
            r <= RES;
          end if;
        end if;
      end if;
    end process;
  end generate;
  asyncrregs : if ASYNC_RESET generate
    regs : process(clk, rstn)
    begin
      if rstn = '0' then
        if RESET_ALL then
          r <= RES;
        else
          r <= RES;
        end if;
      elsif rising_edge(clk) then
        r <= rin;
      end if;
    end process;
  end generate;
end;
