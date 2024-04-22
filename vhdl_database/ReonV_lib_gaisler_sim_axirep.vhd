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
-- Entity:      axirep
-- File:        axirep.vhd
-- Author:      Magnus Hjorth, Cobham Gaisler AB
-- Description: Simulation AXI test report module
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

library gaisler;
use gaisler.sim.all;

entity axirep is
  generic (
    baseaddr: integer := 16#20000#;
    axibits: integer := AXIDW;
    halt: integer := 1
    );
  port (
    clk  : in std_ulogic;
    rst  : in std_ulogic;
    axisi: in axi_mosi_type;
    axiso: in axi_somi_type
  );
end;

architecture sim of axirep is

  constant axi_somi_idle : axi_somi_type := (
    aw => (ready => '1'),
    w => (ready => '1'),
    b => (id => "0000", resp => "00", valid => '0'),
    ar => (ready => '1'),
    r => (id => "0000", data => (others => '0'), resp => "00", last => '0', valid => '0')
    );

  type rwq_entry is record
    valid: boolean;
    id: std_logic_vector(3 downto 0);
    addr: std_logic_vector(31 downto 0);
    len: std_logic_vector(3 downto 0);
    size: std_logic_vector(2 downto 0);
    done: boolean; -- write queue only
  end record;
  type rwq_type is array(natural range <>) of rwq_entry;

  type wdataq_entry is record
    valid: boolean;
    id: std_logic_vector(3 downto 0);
    data: std_logic_vector(axibits-1 downto 0);
    strb: std_logic_vector(axibits/8-1 downto 0);
  end record;
  type wdataq_type is array(natural range <>) of wdataq_entry;

begin


  p: process
    variable po: axi_somi_type := axi_somi_idle;

    variable wq: rwq_type(0 to 3);
    variable wdq: wdataq_type(0 to 7);
    variable i : integer;
    variable vra: std_logic_vector(7 downto 2);
    variable hwdata: std_logic_vector(31 downto 0);
    variable bl: integer;

    variable vendorid,deviceid,errno,subtest,errcnt: integer := 0;
  begin
    wait until rising_edge(clk);
    po := axiso;

    --------------------------------------------------------------------------
    -- Write handling
    --------------------------------------------------------------------------
    -- Retire write addr queue
    if po.b.valid='1' and axisi.b.ready='1' then
      assert wq(0).valid and wq(0).done and wq(0).id=po.b.id;
      wq(0 to wq'high-1) := wq(1 to wq'high);
      wq(wq'high).valid := false;
    end if;
    -- Enqueue on write address queue
    if po.aw.ready='1' and axisi.aw.valid='1' then
      i := 0;
      while wq(i).valid loop i:=i+1; end loop;
      wq(i).valid := true;
      wq(i).done := false;
      wq(i).id := axisi.aw.id;
      wq(i).addr := axisi.aw.addr;
      wq(i).len := axisi.aw.len;
      wq(i).size := axisi.aw.size;
    end if;
    -- Enqueue on write data queue
    if po.w.ready='1' and axisi.w.valid='1' then
      i := 0;
      while wdq(i).valid loop i:=i+1; end loop;
      wdq(i).valid := true;
      wdq(i).id := axisi.w.id;
      wdq(i).data := axisi.w.data;
      wdq(i).strb := axisi.w.strb;
    end if;
    -- Advance write data
    if wdq(0).valid then
      i := 0;
      while wq(i).valid and wq(i).id /= wdq(0).id loop i:=i+1; end loop;
      if wq(i).valid then
        assert not wq(i).done;
        if wq(i).addr(31 downto 12)=std_logic_vector(to_unsigned(baseaddr,20)) then
          vra := wq(i).addr(7 downto 2);
          bl := to_integer(unsigned(vra)) mod (axibits/32);
          hwdata := wdq(0).data(bl*32+31 downto bl*32);
          hwdata := hwdata(7 downto 0) & hwdata(15 downto 8) & hwdata(23 downto 16) & hwdata(31 downto 24);
          -- print("ahbrep reg write addr=" & tost(wq(i).addr) & " ra=" & tost(vra) & " rd=" & tost(hwdata));
          case vra is
            when "000000" =>
              vendorid := conv_integer(hwdata(31 downto 24));
              deviceid := conv_integer(hwdata(23 downto 12));
              print(iptable(vendorid).device_table(deviceid));
            when "000001" =>
              errno := conv_integer(hwdata(15 downto 0));
              if  (halt = 1) then
                assert false
                  report "test failed, error (" & tost(errno) & ")"
                  severity failure;
              else
                assert false
                  report "test failed, error (" & tost(errno) & ")"
                  severity warning;
              end if;
            when "000010" =>
              subtest := conv_integer(hwdata(7 downto 0));
              call_subtest(vendorid, deviceid, subtest);
            when "000100" =>
              print ("");
              print ("**** GRLIB system test starting ****");
              errcnt := 0;
            when "000101" =>
              if errcnt = 0 then
                print ("Test passed, halting with IU error mode");
              elsif errcnt = 1 then
                print ("1 error detected, halting with IU error mode");
              else
                print (tost(errcnt) & " errors detected, halting with IU error mode");
              end if;
              print ("");
            when "000110" =>
              grlib.testlib.print("Checkpoint " & tost(conv_integer(hwdata(15 downto 0))));
            when "000111" =>
              vendorid := 0; deviceid := 0;
              print ("Basic memory test");
            when others =>
          end case;
        end if;
        if wq(i).len="0000" then
          wq(i).done := true;
        end if;
        wq(i).addr := std_logic_vector(unsigned(wq(i).addr)+2**(to_integer(unsigned(wq(i).size))));
        wq(i).len := std_logic_vector(unsigned(wq(i).len)-1);
        wdq(0 to wdq'high-1) := wdq(1 to wdq'high);
        wdq(wdq'high).valid := false;
      end if;
    end if;
  end process;

end;
