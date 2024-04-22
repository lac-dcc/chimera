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
-- Entity:  sdctrl16
-- File:    sdctrl16.vhd
-- Author:  Jiri Gaisler - Gaisler Research
-- Modified by: Daniel Bengtsson & Richard Fång
-- Description: 16- and 32-bit SDRAM memory controller.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use grlib.devices.all;
use gaisler.memctrl.all;

entity sdctrl16 is
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#f00#;
    ioaddr  : integer := 16#000#;
    iomask  : integer := 16#fff#;
    wprot   : integer := 0;
    invclk  : integer := 0;
    fast    : integer := 0;
    pwron   : integer := 0;
    sdbits  : integer := 16;
    oepol   : integer := 0;
    pageburst : integer := 0;
    mobile  : integer := 0
  );
  port (
    rst     : in  std_ulogic;
    clk     : in  std_ulogic;
    ahbsi   : in  ahb_slv_in_type;
    ahbso   : out ahb_slv_out_type;
    sdi     : in  sdctrl_in_type;
    sdo     : out sdctrl_out_type
  );
end;

architecture rtl of sdctrl16 is

constant WPROTEN   : boolean := wprot = 1;
constant SDINVCLK  : boolean := invclk = 1;
constant BUS16    : boolean := (sdbits = 16);
constant BUS32    : boolean := (sdbits = 32);
constant BUS64    : boolean := (sdbits = 64);

constant REVISION  : integer := 1;

constant PM_PD    : std_logic_vector(2 downto 0) := "001";
constant PM_SR    : std_logic_vector(2 downto 0) := "010";
constant PM_DPD   : std_logic_vector(2 downto 0) := "101";

constant std_rammask: Std_Logic_Vector(31 downto 20) :=
                        Conv_Std_Logic_Vector(hmask, 12);

constant hconfig : ahb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_SDCTRL, 0, REVISION, 0),
  4 => ahb_membar(haddr, '1', '1', hmask),
  5 => ahb_iobar(ioaddr, iomask),
  others => zero32);

type mcycletype is (midle, active, leadout);
type sdcycletype is (act1, act2, act3, act3_16, rd1, rd2, rd3, rd4, rd4_16, rd5, rd6, rd7, rd8,
                     wr1, wr1_16, wr2, wr3, wr4, wr5, sidle,
                     sref, pd, dpd);
type icycletype is (iidle, pre, ref, lmode, emode, finish);

-- sdram configuration register

type sdram_cfg_type is record
  command         : std_logic_vector(2 downto 0);
  csize           : std_logic_vector(1 downto 0);
  bsize           : std_logic_vector(2 downto 0);
  casdel          : std_ulogic;  -- CAS to data delay: 2/3 clock cycles
  trfc            : std_logic_vector(2 downto 0);
  trp             : std_ulogic;  -- precharge to activate: 2/3 clock cycles
  refresh         : std_logic_vector(14 downto 0);
  renable         : std_ulogic;
  pageburst       : std_ulogic;
  mobileen        : std_logic_vector(1 downto 0); -- Mobile SD support, Mobile SD enabled
  ds              : std_logic_vector(3 downto 0); -- ds(1:0) (ds(3:2) used to detect update)
  tcsr            : std_logic_vector(3 downto 0); -- tcrs(1:0) (tcrs(3:2) used to detect update)
  pasr            : std_logic_vector(5 downto 0); -- pasr(2:0) (pasr(5:3) used to detect update)
  pmode           : std_logic_vector(2 downto 0); -- Power-Saving mode
  txsr            : std_logic_vector(3 downto 0); -- Exit Self Refresh timing
  cke             : std_ulogic; -- Clock enable
end record;

-- local registers

type reg_type is record
  hready        : std_ulogic;
  hsel          : std_ulogic;
  bdrive        : std_ulogic;
  nbdrive       : std_ulogic;
  burst         : std_ulogic;
  wprothit      : std_ulogic;
  hio           : std_ulogic;
  startsd       : std_ulogic;
  lhw           : std_ulogic; --Lower halfword

  mstate        : mcycletype;
  sdstate       : sdcycletype;
  cmstate       : mcycletype;
  istate        : icycletype;
  icnt          : std_logic_vector(2 downto 0);

  haddr         : std_logic_vector(31 downto 0);
  hrdata        : std_logic_vector((sdbits-1)+((16/sdbits)*16) downto 0);
  hwdata        : std_logic_vector(31 downto 0);
  hwrite        : std_ulogic;
  htrans        : std_logic_vector(1 downto 0);
  hresp         : std_logic_vector(1 downto 0);
  size          : std_logic_vector(1 downto 0);

  cfg           : sdram_cfg_type;
  trfc          : std_logic_vector(3 downto 0);
  refresh       : std_logic_vector(14 downto 0);
  sdcsn         : std_logic_vector(1  downto 0);
  sdwen         : std_ulogic;
  rasn          : std_ulogic;
  casn          : std_ulogic;
  dqm           : std_logic_vector(7 downto 0);
  address       : std_logic_vector(16 downto 2);  -- memory address
  bsel          : std_ulogic;

  idlecnt       : std_logic_vector(3 downto 0); -- Counter, 16 idle clock sycles before entering Power-Saving mode
  sref_tmpcom   : std_logic_vector(2 downto 0); -- Save SD command when exit sref
end record;

signal r, ri : reg_type;
signal rbdrive, ribdrive : std_logic_vector(31 downto 0);
attribute syn_preserve : boolean;
attribute syn_preserve of rbdrive : signal is true;

begin

  ctrl : process(rst, ahbsi, r, sdi, rbdrive)
  variable v       : reg_type;                      -- local variables for registers
  variable startsd : std_ulogic;
  variable dataout : std_logic_vector(31 downto 0); -- data from memory
  variable regsd   : std_logic_vector(31 downto 0); -- data from registers
  variable dqm     : std_logic_vector(7 downto 0);
  variable raddr   : std_logic_vector(12 downto 0);
  variable adec    : std_ulogic;
  variable rams    : std_logic_vector(1 downto 0);
  variable ba      : std_logic_vector(1 downto 0);
  variable haddr   : std_logic_vector(31 downto 0);
  variable dout    : std_logic_vector(31 downto 0);
  variable hsize   : std_logic_vector(1 downto 0);
  variable hwrite  : std_ulogic;
  variable htrans  : std_logic_vector(1 downto 0);
  variable hready  : std_ulogic;
  variable vbdrive : std_logic_vector(31 downto 0);
  variable bdrive  : std_ulogic;
  variable lline    : std_logic_vector(2 downto 0);
  variable lineburst : boolean;
  variable haddr_tmp : std_logic_vector(31 downto 0);
  variable arefresh : std_logic;
  variable hwdata  : std_logic_vector(31 downto 0);

  begin

-- Variable default settings to avoid latches

    v := r; startsd := '0'; v.hresp := HRESP_OKAY; vbdrive := rbdrive; arefresh := '0';
    if BUS16 then
      if (r.lhw = '1') then --muxes read data to correct part of the register.
        v.hrdata(sdbits-1 downto 0) := sdi.data(sdbits-1 downto 0);
      else
        v.hrdata((sdbits*2)-1 downto sdbits) := sdi.data(sdbits-1 downto 0);
      end if;
    else
      v.hrdata(sdbits-1 downto sdbits-32) := sdi.data(sdbits-1 downto sdbits-32);
      v.hrdata(31 downto 0) := sdi.data(31 downto 0);
    end if;
    hwdata := ahbreadword(ahbsi.hwdata, r.haddr(4 downto 2)); v.hwdata := hwdata;
    lline := not r.cfg.casdel &  r.cfg.casdel &  r.cfg.casdel;
    if (pageburst = 0) or ((pageburst = 2) and r.cfg.pageburst = '0') then
      lineburst := true;
    else lineburst := false; end if;


    if ((ahbsi.hready and ahbsi.hsel(hindex)) = '1') then
      v.size := ahbsi.hsize(1 downto 0); v.hwrite := ahbsi.hwrite;
      v.htrans := ahbsi.htrans;
      if ahbsi.htrans(1) = '1' then
        v.hio := ahbsi.hmbsel(1);
        v.hsel := '1'; v.hready := v.hio;
      end if;
      v.haddr := ahbsi.haddr;
      -- addr must be masked since address range can be smaller than
      -- total banksize. this can result in wrong chip select being
      -- asserted
      for i in 31 downto 20 loop
        v.haddr(i) := ahbsi.haddr(i) and not std_rammask(i);
      end loop;
    end if;

    if (r.hsel = '1') and (ahbsi.hready = '0') then
      haddr := r.haddr;  hsize := r.size;
      htrans := r.htrans; hwrite := r.hwrite;
    else
      haddr := ahbsi.haddr;  hsize := ahbsi.hsize(1 downto 0);
      htrans := ahbsi.htrans; hwrite := ahbsi.hwrite;
      -- addr must be masked since address range can be smaller than
      -- total banksize. this can result in wrong chip select being
      -- asserted
      for i in 31 downto 20 loop
        haddr(i) := ahbsi.haddr(i) and not std_rammask(i);
      end loop;
    end if;
    if fast = 1 then haddr := r.haddr; end if;

    if ahbsi.hready = '1' then v.hsel := ahbsi.hsel(hindex); end if;

-- main state
    if BUS16 then
      case r.size is
      when "00" => --bytesize
        case r.haddr(0) is
        when '0' => dqm := "11111101";
        when others => dqm := "11111110";
        end case;
      when others => dqm := "11111100"; --halfword, word
      end case;
    else
      case r.size is
      when "00" =>
        case r.haddr(1 downto 0) is
        when "00" => dqm := "11110111";
        when "01" => dqm := "11111011";
        when "10" => dqm := "11111101";
        when others => dqm := "11111110";
        end case;
      when "01" =>
        if r.haddr(1) = '0' then dqm := "11110011"; else  dqm := "11111100"; end if;
      when others => dqm := "11110000";
      end case;
    end if;
--
--      case r.size is
--      when "00" =>
--        case r.haddr(1 downto 0) is
--        when "00" => dqm := "11111101"; lhw := '0'; --lhv := r.haddr(1)
--        when "01" => dqm := "11111110"; lhw := '0';
--        when "10" => dqm := "11111101"; lhw := '1';
--        when others => dqm := "11111110"; lhw := '1';
--        end case;
--      when "01" =>
--        dqm := "11111100";
--        if r.haddr(1) = '0' then 
--          lhw := '0'; 
--        else  
--          lhw := '1'; 
--	end if;
--    when others => dqm := "11111100"; --remember when word: lhw first 0 then 1
--      end case;
--
    if BUS64 and (r.bsel = '1') then dqm := dqm(3 downto 0) & "1111"; end if;

-- main FSM

    case r.mstate is
    when midle =>
      if ((v.hsel and htrans(1) and not v.hio) = '1') then
        if (r.sdstate = sidle) and (r.cfg.command = "000") 
           and (r.cmstate = midle) and (v.hio = '0')
        then
          if fast = 0 then startsd := '1';  else v.startsd := '1'; end if;
          v.mstate := active;
        elsif ((r.sdstate = sref) or (r.sdstate = pd) or (r.sdstate = dpd))
           and (r.cfg.command = "000") and (r.cmstate = midle) and (v.hio = '0')
        then
          v.startsd := '1';
          if r.sdstate = dpd then -- Error response when on Deep Power-Down mode
            v.hresp := HRESP_ERROR;
          else 
            v.mstate := active; 
          end if;
        end if;
      end if;
    when others => null;
    end case;

    startsd := startsd or r.startsd;

-- generate row and column address size

    if BUS16 then
      case r.cfg.csize is
      when "00" => raddr := haddr(21 downto 9);-- case to check for bursting over row limit, since 1 row is 512 byte.
      when "01" => raddr := haddr(22 downto 10);
      when "10" => raddr := haddr(23 downto 11);
      when others =>
        if r.cfg.bsize = "110" then raddr := haddr(25 downto 13); --tänk
        else raddr := haddr(24 downto 12); end if;
      end case;
    else
      case r.cfg.csize is
      when "00" => raddr := haddr(22 downto 10);
      when "01" => raddr := haddr(23 downto 11);
      when "10" => raddr := haddr(24 downto 12);
      when others =>
        if r.cfg.bsize = "111" then raddr := haddr(26 downto 14);
        else raddr := haddr(25 downto 13); end if;
      end case;
    end if;

-- generate bank address
--    if BUS16 then --011
--      ba := genmux(r.cfg.bsize, haddr(26 downto 19)) &
--            genmux(r.cfg.bsize, haddr(25 downto 18));
--    else
      ba := genmux(r.cfg.bsize, haddr(28 downto 21)) &
            genmux(r.cfg.bsize, haddr(27 downto 20));
 --   end if;

-- generate chip select

    if BUS64 then
      adec := genmux(r.cfg.bsize, haddr(30 downto 23));
      v.bsel := genmux(r.cfg.bsize, r.haddr(29 downto 22));
    else
      adec := genmux(r.cfg.bsize, haddr(29 downto 22)); v.bsel := '0';
    end if;
--    elsif BUS32 then
--      adec := genmux(r.cfg.bsize, haddr(29 downto 22)); v.bsel := '0';
--    else
--      adec := genmux(r.cfg.bsize, haddr(27 downto 20)); v.bsel := '0';
--    end if;

    rams := adec & not adec;

-- sdram access FSM

    if r.trfc /= "0000" then v.trfc := r.trfc - 1; end if;
    
    if r.idlecnt /= "0000" then v.idlecnt := r.idlecnt - 1; end if;

    case r.sdstate is

    when sidle =>
      if (startsd = '1') and (r.cfg.command = "000") and (r.cmstate = midle) then
      --  if BUS16 then        
      --    v.address(16 downto 2) := '0' & ba & raddr(11 downto 0); --since 1 bit lower row => tot adress field 14 bits
      --  else
          v.address(16 downto 2) := ba & raddr; -- ba(16-15) & raddr(14-2) (2+13= 15 bits)
      --  end if;
        v.sdcsn := not rams(1 downto 0); v.rasn := '0'; v.sdstate := act1;
        v.startsd := '0';
      elsif (r.idlecnt = "0000") and (r.cfg.command = "000") 
            and (r.cmstate = midle) and (r.cfg.mobileen(1) = '1') then
        case r.cfg.pmode is
        when PM_SR => 
          v.cfg.cke := '0'; v.sdstate := sref;
          v.sdcsn := (others => '0'); v.rasn := '0'; v.casn := '0';
          v.trfc := (r.cfg.trp and r.cfg.mobileen(1)) & r.cfg.trfc; -- Control minimum duration of Self Refresh mode (= tRAS)
        when PM_PD => v.cfg.cke := '0'; v.sdstate := pd;
        when PM_DPD => 
          v.cfg.cke := '0'; v.sdstate := dpd;
          v.sdcsn := (others => '0'); v.sdwen := '0'; v.rasn := '1'; v.casn := '1';
        when others =>
        end case;
      end if;

    when act1 =>
      v.rasn := '1'; v.trfc := (r.cfg.trp and r.cfg.mobileen(1)) & r.cfg.trfc;
      if r.cfg.casdel = '1' then v.sdstate := act2; else
        v.sdstate := act3;
        if not BUS16 then -- needs if, otherwise it might clock in incorrect write data to state act3_16
          v.hready := r.hwrite and ahbsi.htrans(0) and ahbsi.htrans(1);
        end if;
      end if;
      if WPROTEN then
        v.wprothit := sdi.wprot;
        if sdi.wprot = '1' then v.hresp := HRESP_ERROR; end if;
      end if;

    when act2 =>
      v.sdstate := act3;
      if not BUS16 then
        v.hready := r.hwrite and ahbsi.htrans(0) and ahbsi.htrans(1);
      end if;
      if WPROTEN and (r.wprothit = '1') then
        v.hresp := HRESP_ERROR; v.hready := '0';
      end if;

    when act3 =>
      v.casn := '0';
      if BUS16 then --HW adress needed to memory
        v.address(14 downto 2) := r.haddr(12 downto 11) & '0' & r.haddr(10 downto 1); --only allowed to use tot adressbits - ba bits
--        v.address(13 downto 2) := r.haddr(11) & '0' & r.haddr(10 downto 1); --only allowed to use tot adressbits - ba bits
	v.lhw := r.haddr(1); -- 14-2 = 12 colummn bits => 13 downto 2
      else
        v.address(14 downto 2) := r.haddr(13 downto 12) & '0' & r.haddr(11 downto 2);
      end if;
      v.dqm := dqm; v.burst := r.hready; -- ??

      if r.hwrite = '1' then

        if BUS16 then --16 bit
          if r.size(1) = '1' then --word
            v.hready := ahbsi.htrans(0) and ahbsi.htrans(1); --delayed this check 1 state to keep write data correct in act3_16
            v.burst := ahbsi.htrans(0) and ahbsi.htrans(1);
            v.sdstate := act3_16; -- goto state for second part of word transfer
        --  v.lhw := '0'; --write MSB 16 bits to AMBA adress that ends with 00
          else --halfword or byte
            v.sdstate := act3_16; v.hready := '1';
          end if; 
        else --32 bit or 64
          v.sdstate := wr1;
          if ahbsi.htrans = "11" or (r.hready = '0') then v.hready := '1'; end if;
        end if;
        v.sdwen := '0'; v.bdrive := '0'; --write
        if WPROTEN and (r.wprothit = '1') then
          v.hresp := HRESP_ERROR; v.hready := '1';
          if BUS16 then v.sdstate := act3_16; else v.sdstate := wr1; end if; 
          v.sdwen := '1'; v.bdrive := '1'; v.casn := '1'; --skip write, remember hready high in next state
        end if;
      else v.sdstate := rd1; end if;

    when act3_16 => --handle 16 bit and WORD write
      v.address(14 downto 2) := r.haddr(12 downto 11) & '0' & r.haddr(10 downto 2) & '1';
--      v.address(13 downto 2) := r.haddr(11) & '0' & r.haddr(10 downto 2) & '1';
      v.lhw := '1';
      if (r.hready and r.burst) = '1' and not (WPROTEN and (r.wprothit = '1')) then
        v.hready := '0'; --kolla på transfertyp nonseq om vi vill delaya nedankoll.
        if( ahbsi.htrans = "11" and 
            not ((r.haddr(5 downto 2) = "1111") and (r.cfg.command = "100")) and
            not ((r.haddr(9) xor ahbsi.haddr(9)) = '1' and r.cfg.csize = "00") ) then
          v.sdstate := wr1_16;
        end if;
      elsif r.burst = '1' or (r.hready and not r.burst) = '1' then --terminate burst or single write
        v.sdstate := wr2; v.bdrive := '1'; v.casn := '1'; v.sdwen := '1';
        v.dqm := (others => '1');
      else -- complete single write
        v.hready := '1'; 
        v.sdstate := act3_16; --gick till wr1 förut 
      end if;
      
    when wr1_16 =>
      v.address(14 downto 2) := r.haddr(12 downto 11) & '0' & r.haddr(10 downto 1);
--      v.address(13 downto 2) := r.haddr(11) & '0' & r.haddr(10 downto 1);
      v.lhw := r.haddr(1);
      v.sdstate := act3_16;
      v.hready := '1';

    when wr1 =>
      v.address(14 downto 2) := r.haddr(13 downto 12) & '0' & r.haddr(11 downto 2);
      if (((r.burst and r.hready) = '1') and (r.htrans = "11"))
         and not (WPROTEN and (r.wprothit = '1'))
      then
        v.hready := ahbsi.htrans(0) and ahbsi.htrans(1) and r.hready;
        if ((r.haddr(5 downto 2) = "1111") and (r.cfg.command = "100")) then -- exit on refresh
          v.hready := '0';
        end if;
      else
        v.sdstate := wr2; v.bdrive := '1'; v.casn := '1'; v.sdwen := '1';
        v.dqm := (others => '1');
      end if;

    when wr2 =>
      if (r.cfg.trp = '0') then v.rasn := '0'; v.sdwen := '0'; end if;
      v.sdstate := wr3;

    when wr3 =>
      if (r.cfg.trp = '1') then
        v.rasn := '0'; v.sdwen := '0'; v.sdstate := wr4;
      else
        v.sdcsn := "11"; v.rasn := '1'; v.sdwen := '1'; v.sdstate := sidle;
        v.idlecnt := (others => '1');
      end if;

    when wr4 =>
      v.sdcsn := "11"; v.rasn := '1'; v.sdwen := '1';
      if (r.cfg.trp = '1') then v.sdstate := wr5;
      else v.sdstate := sidle; v.idlecnt := (others => '1'); end if;

    when wr5 =>
      v.sdstate := sidle; v.idlecnt := (others => '1');

    when rd1 => --first read applied to sdram
      v.casn := '1'; v.sdstate := rd7; --nop
      if not BUS16 then --starting adress cannot be XXXX...111 since we have word burst in this case. and lowest bit always 0.
        if lineburst and (ahbsi.htrans = "11") then
          if r.haddr(4 downto 2) = "111" then
            v.address(9 downto 5) := r.address(9 downto 5) + 1; --adds only within 1KB limit.
            v.address(4 downto 2) := "000"; v.casn := '0';
	  end if;
        end if;
      end if;

    when rd7 =>
      v.casn := '1'; --nop
      if BUS16 then
        if r.cfg.casdel = '1' then --casdel3
          v.sdstate := rd2;
          if lineburst and (ahbsi.htrans = "11") then
            if r.haddr(3 downto 1) = "110" then
              v.address(10 downto 5) := r.address(10 downto 5) + 1;
              v.address(4 downto 2) := "000"; v.casn := '0';
            end if;
          end if;
        else                       --casdel2
          v.sdstate := rd3;
          if ahbsi.htrans /= "11" then
            if (r.trfc(3 downto 1) = "000") then v.rasn := '0'; v.sdwen := '0'; end if;
          elsif lineburst then
            if r.haddr(3 downto 1) = "110" then
              v.address(10 downto 5) := r.address(10 downto 5) + 1;
              v.address(4 downto 2) := "000"; v.casn := '0';
            end if;
          end if;
        end if;
      else -- 32 bit or larger
        if r.cfg.casdel = '1' then --casdel3
          v.sdstate := rd2;
          if lineburst and (ahbsi.htrans = "11") then
            if r.haddr(4 downto 2) = "110" then
              v.address(9 downto 5) := r.address(9 downto 5) + 1;
              v.address(4 downto 2) := "000"; v.casn := '0';
            end if;
          end if;
        else                       --casdel2
          v.sdstate := rd3;
          if ahbsi.htrans /= "11" then
            if (r.trfc(3 downto 1) = "000") then v.rasn := '0'; v.sdwen := '0'; end if; --precharge
          elsif lineburst then
            if r.haddr(4 downto 2) = "110" then
              v.address(9 downto 5) := r.address(9 downto 5) + 1;
              v.address(4 downto 2) := "000"; v.casn := '0';
            end if;
          end if;
        end if;
      end if;

    when rd2 =>
      v.casn := '1'; v.sdstate := rd3;
      if BUS16 then
        if ahbsi.htrans /= "11" then 
          v.rasn := '0'; v.sdwen := '0'; v.dqm := (others => '1'); --precharge & DQM
          --note that DQM always has 2 cycle delay before blocking data. So NP if we fetch second HW
        end if;
      else
        if ahbsi.htrans /= "11" then v.rasn := '0'; v.sdwen := '0'; v.dqm := (others => '1'); --precharge & DQM
        elsif lineburst then 
          if r.haddr(4 downto 2) = "101" then
            v.address(9 downto 5) := r.address(9 downto 5) + 1;
            v.address(4 downto 2) := "000"; v.casn := '0';
          end if;
        end if;
      end if;

    when rd3 => --first read data from sdram output v.lhw := r.haddr(1);
      v.casn := '1'; --if read before cas makes nop else if pre => no difference
      if BUS16 then
        --note if read is for halfwor or byte we dont want to read a second time but exit.
        --if the read is a word we need to change LHW to one since the next read should be muxed in next cylcle.
    --    if r.size(1) = '1' then --word v.hready := not r.size(1)
    --      v.sdstate := rd4_16; v.hready := '0'; --hready low since just first part of a word
    --      v.lhw := '1'; -- read low 16 next state
    --    else --HW or byte
    --      v.sdstate := rd4_16; v.hready := '1';
    --    end if;
        v.sdstate := rd4_16;
        v.lhw := not r.lhw; --r.lhw is 0 for word, we should invert for next half of word.For HW or Byte v.lhw does not matter.
        v.hready := not r.size(1); --if word transfer the r.size(1) is 1 and hready goes low.If HW or byte r.size(1)=0 => hready=1
        if r.sdwen = '0' then
          v.rasn := '1'; v.sdwen := '1'; v.sdcsn := "11"; v.dqm := (others => '1'); -- make DSEL (NOP)
        elsif lineburst and ((ahbsi.htrans = "11") and (r.cfg.casdel = '1')) then --only enter if cl3
          if r.haddr(3 downto 1) = "100" then
            v.address(10 downto 5) := r.address(10 downto 5) + 1;
            v.address(4 downto 2) := "000"; v.casn := '0';
          end if;
        end if;
      else --32 bit or larger
        v.sdstate := rd4; v.hready := '1'; 
        if r.sdwen = '0' then
          v.rasn := '1'; v.sdwen := '1'; v.sdcsn := "11"; v.dqm := (others => '1'); -- make DSEL (NOP)
        elsif lineburst and (ahbsi.htrans = "11") and (r.casn = '1') then
          if r.haddr(4 downto 2) = ("10" & not r.cfg.casdel) then
            v.address(9 downto 5) := r.address(9 downto 5) + 1;
            v.address(4 downto 2) := "000"; v.casn := '0';
          end if;
        end if;
      end if;

    when rd4_16 => --enter as word (r.hready is still 0) else 1. If hready one next transfer sampled into v.
      --v.hready := '1'; 
      v.hready := not r.hready;-- if Byte or HW exit with hready low. If word flip bit, makes correct exit with hready low.
      v.lhw := not r.lhw; --r.lhw is one the first time we enter (taking care of second part of word)
      v.casn := '1';
      --quit on: Single transfer CL 2/3 (prcharge if CL 2 and timer was not 0)
      if (ahbsi.htrans /= "11" and (r.hready = '1')) or
         ((r.haddr(9) xor ahbsi.haddr(9)) = '1' and r.cfg.csize = "00" and r.hready = '1') or --probably dont have to check hready 1 since if 0 adresses equal. 
         ((r.haddr(5 downto 2) = "1111") and (r.cfg.command = "100") and (r.hready = '1')) then --quit on: ST W/HW/BYTE OR
        --v.hready := '0'; --if Byte or HW exit with hready low, if ST word exit with high.
        v.dqm := (others => '1');
        if r.sdcsn /= "11" then --not prechargeing
          v.rasn := '0'; v.sdwen := '0'; v.sdstate := rd5; --precharge
        else--exit
          if r.cfg.trp = '1' then v.sdstate := rd6;
          else v.sdstate := sidle; v.idlecnt := (others => '1'); end if;
        end if;
      elsif lineburst then --NOTE: r.casn = 1 makes sure its the first halfword of a word that is checked (hready low)
        if r.cfg.casdel = '0' then
          if (r.haddr(3 downto 1) = "100") and (r.casn = '1') then --lline = 011 if casdel =1, 100 if casdel= 0
            v.address(10 downto 5) := r.address(10 downto 5) + 1;
            v.address(4 downto 2) := "000"; v.casn := '0';
          end if;
        else
          if (r.haddr(3 downto 1) = "010") and (r.hready = '1') then --lline = 011 if casdel =1, 100 if casdel= 0
            v.address(10 downto 5) := r.address(10 downto 5) + 1;
            v.address(4 downto 2) := "000"; v.casn := '0';
          end if;
        end if;
      end if;
      
    when rd4 =>
      v.hready := '1'; v.casn := '1';
      if (ahbsi.htrans /= "11") or (r.sdcsn = "11") or
         ((r.haddr(5 downto 2) = "1111") and (r.cfg.command = "100")) -- exit on refresh
      then
        v.hready := '0'; v.dqm := (others => '1');
        if (r.sdcsn /= "11") then
          v.rasn := '0'; v.sdwen := '0'; v.sdstate := rd5;
        else
          if r.cfg.trp = '1' then v.sdstate := rd6;
          else v.sdstate := sidle; v.idlecnt := (others => '1'); end if;
        end if;
      elsif lineburst then
        if (r.haddr(4 downto 2) = lline) and (r.casn = '1') then
          v.address(9 downto 5) := r.address(9 downto 5) + 1;
          v.address(4 downto 2) := "000"; v.casn := '0';
        end if;
      end if;

    when rd5 =>
      if r.cfg.trp = '1' then v.sdstate := rd6; else v.sdstate := sidle; v.idlecnt := (others => '1'); end if;
      v.sdcsn := (others => '1'); v.rasn := '1'; v.sdwen := '1'; v.dqm := (others => '1');
      v.casn := '1';

    when rd6 =>
      v.sdstate := sidle; v.idlecnt := (others => '1'); v.dqm := (others => '1');
      v.sdcsn := (others => '1'); v.rasn := '1'; v.sdwen := '1';

    when sref =>
      if (startsd = '1' and (r.hio = '0')) 
          or (r.cfg.command /= "000") or r.cfg.pmode /= PM_SR then
        if r.trfc = "0000" then -- Minimum duration (= tRAS) 
          v.cfg.cke := '1'; 
          v.sdcsn := (others => '0'); v.rasn := '1'; v.casn := '1';
        end if;
        if r.cfg.cke = '1' then
          if (r.idlecnt = "0000") then -- tXSR ns with NOP 
            v.sdstate := sidle;
            v.idlecnt := (others => '1');
            v.sref_tmpcom := r.cfg.command;
            v.cfg.command := "100";
          end if;
        else
          v.idlecnt := r.cfg.txsr;
        end if;
      end if;

    when pd =>
      if (startsd = '1' and (r.hio = '0')) 
          or (r.cfg.command /= "000") or r.cfg.pmode /= PM_PD then
        v.cfg.cke := '1'; 
        v.sdstate := sidle;
        v.idlecnt := (others => '1');
      end if;

    when dpd =>
      v.sdcsn := (others => '1'); v.sdwen := '1'; v.rasn := '1'; v.casn := '1';
      v.cfg.renable := '0';
      if (startsd = '1' and r.hio = '0') then
        v.hready := '1'; -- ack all accesses with Error response
        v.startsd := '0';
        v.hresp := HRESP_ERROR; 
      elsif r.cfg.pmode /= PM_DPD then
        v.cfg.cke := '1';
        if r.cfg.cke = '1' then
          v.sdstate := sidle;
          v.idlecnt := (others => '1');
          v.cfg.renable := '1';
        end if;
      end if;

    when others =>
      v.sdstate := sidle; v.idlecnt := (others => '1');
    end case;

-- sdram commands

    case r.cmstate is
    when midle =>
      if r.sdstate = sidle then
        case r.cfg.command is
        when "010" => -- precharge
          v.sdcsn := (others => '0'); v.rasn := '0'; v.sdwen := '0';
          v.address(12) := '1'; v.cmstate := active;
        when "100" => -- auto-refresh
          v.sdcsn := (others => '0'); v.rasn := '0'; v.casn := '0';
          v.cmstate := active;
        when "110" => -- Lodad Mode Reg
          v.sdcsn := (others => '0'); v.rasn := '0'; v.casn := '0';
          v.sdwen := '0'; v.cmstate := active;
          if lineburst then
            v.address(16 downto 2) := "0000010001" & r.cfg.casdel & "0011";
          else
            v.address(16 downto 2) := "0000010001" & r.cfg.casdel & "0111";
          end if;
        when "111" => -- Load Ext-Mode Reg
          v.sdcsn := (others => '0'); v.rasn := '0'; v.casn := '0';
          v.sdwen := '0'; v.cmstate := active;
          v.address(16 downto 2) := "10000000" & r.cfg.ds(1 downto 0) & r.cfg.tcsr(1 downto 0) 
                                    & r.cfg.pasr(2 downto 0);
        when others => null;
        end case;
      end if;
    when active =>
      v.sdcsn := (others => '1'); v.rasn := '1'; v.casn := '1';
      v.sdwen := '1'; --v.cfg.command := "000";
      v.cfg.command := r.sref_tmpcom; v.sref_tmpcom := "000";
      v.cmstate := leadout; v.trfc := (r.cfg.trp and r.cfg.mobileen(1)) & r.cfg.trfc;
    when leadout =>
      if r.trfc = "0000" then v.cmstate := midle; end if;

    end case;

-- sdram init

    case r.istate is
    when iidle =>
      v.cfg.cke := '1';
      if r.cfg.renable = '1' and r.cfg.cke = '1' then
        v.cfg.command := "010"; v.istate := pre;
      end if;
    when pre =>
      if r.cfg.command = "000" then
        v.cfg.command := "100"; v.istate := ref; v.icnt := "111";
      end if;
    when ref =>
      if r.cfg.command = "000" then
        v.cfg.command := "100"; v.icnt := r.icnt - 1;
        if r.icnt = "000" then v.istate := lmode; v.cfg.command := "110"; end if;
      end if;
    when lmode =>
      if r.cfg.command = "000" then
        if r.cfg.mobileen = "11" then
          v.cfg.command := "111"; v.istate := emode;
        else
          v.istate := finish;
        end if;
      end if;
    when emode =>
      if r.cfg.command = "000" then
        v.istate := finish;
      end if;
    when others =>
      if r.cfg.renable = '0' and r.sdstate /= dpd then
        v.istate := iidle;
      end if;
    end case;

    if (ahbsi.hready and ahbsi.hsel(hindex) ) = '1' then
      if ahbsi.htrans(1) = '0' then v.hready := '1'; end if;
    end if;

    if (r.hsel and r.hio and not r.hready) = '1' then v.hready := '1'; end if;

-- second part of main fsm

    case r.mstate is
    when active =>
      if v.hready = '1' then
        v.mstate := midle;
      end if;
    when others => null;
    end case;

-- sdram refresh counter

-- pragma translate_off
    if not is_x(r.cfg.refresh) then
-- pragma translate_on
      if (r.cfg.renable = '1') and (r.istate = finish) and r.sdstate /= sref then
        v.refresh := r.refresh - 1;
        if (v.refresh(14) and not r.refresh(14))  = '1' then
          v.refresh := r.cfg.refresh;
          v.cfg.command := "100";
          arefresh := '1';
        end if;
      end if;
-- pragma translate_off
    end if;
-- pragma translate_on

-- AHB register access
-- if writing to IO space config regs. Just mapping write data to all config values in config reg
    if (r.hsel and r.hio and r.hwrite and r.htrans(1)) = '1' then
      if r.haddr(3 downto 2) = "00" then
        if pageburst = 2 then v.cfg.pageburst :=  hwdata(17); end if;
        v.cfg.command   :=  hwdata(20 downto 18);
        v.cfg.csize     :=  hwdata(22 downto 21);
        v.cfg.bsize     :=  hwdata(25 downto 23);
        v.cfg.casdel    :=  hwdata(26);
        v.cfg.trfc      :=  hwdata(29 downto 27);
        v.cfg.trp       :=  hwdata(30);
        v.cfg.renable   :=  hwdata(31);
        v.cfg.refresh   :=  hwdata(14 downto 0);
        v.refresh       :=  (others => '0');
      elsif r.haddr(3 downto 2) = "01" then
        if r.cfg.mobileen(1) = '1' and mobile /= 3 then v.cfg.mobileen(0) := hwdata(31); end if;
        if r.cfg.pmode = "000" then
          v.cfg.cke               :=  hwdata(30);
        end if;
        if r.cfg.mobileen(1) = '1' then
          v.cfg.txsr              :=  hwdata(23 downto 20);
          v.cfg.pmode             :=  hwdata(18 downto 16);
          v.cfg.ds(3 downto 2)    :=  hwdata( 6 downto  5);
          v.cfg.tcsr(3 downto 2)  :=  hwdata( 4 downto  3);
          v.cfg.pasr(5 downto 3)  :=  hwdata( 2 downto  0);
        end if;
      end if;
    end if;

    -- Disable CS and DPD when Mobile SDR is Disabled
    if r.cfg.mobileen(0) = '0' then v.cfg.pmode(2) := '0'; end if;

    -- Update EMR when ds, tcsr or pasr change
    if r.cfg.command = "000" and arefresh = '0' and r.cfg.mobileen(0) = '1' then
      if r.cfg.ds(1 downto 0) /= r.cfg.ds(3 downto 2) then
        v.cfg.command := "111"; v.cfg.ds(1 downto 0) := r.cfg.ds(3 downto 2);
      end if;
      if r.cfg.tcsr(1 downto 0) /= r.cfg.tcsr(3 downto 2) then
        v.cfg.command := "111"; v.cfg.tcsr(1 downto 0) := r.cfg.tcsr(3 downto 2);
      end if;
      if r.cfg.pasr(2 downto 0) /= r.cfg.pasr(5 downto 3) then
        v.cfg.command := "111"; v.cfg.pasr(2 downto 0) := r.cfg.pasr(5 downto 3);
      end if;
    end if;

    regsd := (others => '0');
    --reads out config registers (r/w does not matter) according to manual depending on address, notice generic determines data width.
    if r.haddr(3 downto 2) = "00" then
      regsd(31 downto 18) := r.cfg.renable & r.cfg.trp & r.cfg.trfc &
                             r.cfg.casdel & r.cfg.bsize & r.cfg.csize & r.cfg.command;
      if not lineburst then regsd(17) := '1'; end if;
      regsd(16) := r.cfg.mobileen(1);
      if BUS64 then regsd(15) := '1'; end if;
      regsd(14 downto 0) := r.cfg.refresh;
    elsif r.haddr(3 downto 2) = "01" then
      regsd(31) := r.cfg.mobileen(0);
      regsd(30) := r.cfg.cke;
      regsd(23 downto 0) := r.cfg.txsr & '0' & r.cfg.pmode & "000000000" &
                            r.cfg.ds(1 downto 0) & r.cfg.tcsr(1 downto 0) & r.cfg.pasr(2 downto 0);
    end if;

    if (r.hsel and r.hio) = '1' then dout := regsd;
    else
      if BUS64 and r.bsel = '1' then dout := r.hrdata(63 downto 32);
      else dout := r.hrdata(31 downto 0); end if;
    end if;

    v.nbdrive := not v.bdrive;

    if oepol = 1 then bdrive := r.nbdrive; vbdrive := (others => v.nbdrive);
    else bdrive := r.bdrive; vbdrive := (others => v.bdrive);end if;

-- reset

    if rst = '0' then
      v.sdstate       := sidle;
      v.mstate        := midle;
      v.istate        := iidle;
      v.cmstate       := midle;
      v.hsel          := '0';
      v.cfg.command   := "000";
      v.cfg.csize     := "10";
      v.cfg.bsize     := "000";
      v.cfg.casdel    :=  '1';
      v.cfg.trfc      := "111";
      if pwron = 1 then v.cfg.renable :=  '1';
      else v.cfg.renable :=  '0'; end if;
      v.cfg.trp       :=  '1';
      v.dqm           := (others => '1');
      v.sdwen         := '1';
      v.rasn          := '1';
      v.casn          := '1';
      v.hready        := '1';
      v.bsel          := '0';
      v.startsd       := '0';
      if (pageburst = 2) then
        v.cfg.pageburst   :=  '0';
      end if;
      if mobile >= 2 then v.cfg.mobileen := "11";
      elsif mobile = 1 then v.cfg.mobileen := "10";
      else v.cfg.mobileen := "00"; end if;
      v.cfg.txsr      := (others => '1');
      v.cfg.pmode     := (others => '0');
      v.cfg.ds        := (others => '0');
      v.cfg.tcsr      := (others => '0');
      v.cfg.pasr      := (others => '0');
      if mobile >= 2 then v.cfg.cke := '0';
      else v.cfg.cke       := '1'; end if;
      v.sref_tmpcom   := "000";
      v.idlecnt := (others => '1');
    end if;

    ri <= v; 
    ribdrive <= vbdrive;

    ahbso.hready  <= r.hready;
    ahbso.hresp   <= r.hresp;
    ahbso.hrdata  <= ahbdrivedata(dout);

  end process;

  --sdo.sdcke     <= (others => '1');
  sdo.sdcke     <= (others => r.cfg.cke);
  ahbso.hconfig <= hconfig;
  ahbso.hirq    <= (others => '0');
  ahbso.hindex  <= hindex;
  ahbso.hsplit  <= (others => '0');

  -- Quick hack to get rid of undriven signal warnings. Check this for future
  -- merge with main sdctrl.
  drivehack : block
  begin
    sdo.qdrive <= '0';
    sdo.nbdrive <= '0';
    sdo.ce <= '0';
    sdo.moben <= '0';
    sdo.cal_rst <= '0';
    sdo.oct <= '0';
    sdo.xsdcsn <= (others => '1');
    sdo.data(127 downto 16) <= (others => '0');
    sdo.cb <= (others => '0');
    sdo.ba <= (others => '0');
    sdo.sdck <= (others => '0');
    sdo.cal_en <= (others => '0');
    sdo.cal_inc <= (others => '0');
    sdo.cal_pll <= (others => '0');
    sdo.odt <= (others => '0');
    sdo.conf <= (others => '0');
    sdo.vcbdrive <= (others => '0');
    sdo.dqs_gate <= '0';
    sdo.cbdqm <= (others => '0');
    sdo.cbcal_en <= (others => '0');
    sdo.cbcal_inc <= (others => '0');
    sdo.read_pend <= (others => '0');
    sdo.regwdata <= (others => '0');
    sdo.regwrite <= (others => '0');
  end block drivehack;
    
  regs : process(clk, rst) begin
    if rising_edge(clk) then
      r <= ri; rbdrive <= ribdrive;
      if rst = '0' then r.icnt <= (others => '0'); end if;
    end if;
    if (rst = '0') then
      r.sdcsn  <= (others => '1'); r.bdrive <= '1'; r.nbdrive <= '0';
      if oepol = 0 then rbdrive <= (others => '1');
      else rbdrive <= (others => '0'); end if;
    end if;
  end process;

  rgen : if not SDINVCLK generate
    sdo.address  <= r.address;
    sdo.bdrive   <= r.nbdrive when oepol = 1 else r.bdrive;
    sdo.vbdrive  <= zero32 & rbdrive;
    sdo.sdcsn    <= r.sdcsn;
    sdo.sdwen    <= r.sdwen;
    sdo.dqm      <= "11111111" & r.dqm;
    sdo.rasn     <= r.rasn;
    sdo.casn     <= r.casn;

    mux16_wrdata : if BUS16 generate --mux data depending on Low/High HW
      sdo.data(15 downto 0) <= r.hwdata(15 downto 0) when r.lhw = '1' else r.hwdata(31 downto 16);
    end generate;

    wrdata : if not BUS16 generate
      drivebus: for i in 0 to sdbits/64 generate
        sdo.data(31+32*i downto 32*i) <= r.hwdata;
      end generate;
    end generate;
  end generate;

  ngen : if SDINVCLK generate
    nregs : process(clk, rst) begin
      if falling_edge(clk) then
        sdo.address  <= r.address;
        if oepol = 1 then sdo.bdrive <= r.nbdrive;
        else sdo.bdrive <= r.bdrive; end if;
        sdo.vbdrive  <= zero32 & rbdrive;
        sdo.sdcsn    <= r.sdcsn;
        sdo.sdwen    <= r.sdwen;
        sdo.dqm      <= "11111111" & r.dqm;
        sdo.rasn     <= r.rasn;
        sdo.casn     <= r.casn;
        if BUS16 then --mux data depending on Low/High HW
          if (r.lhw ='1') then 
            sdo.data(15 downto 0) <= r.hwdata(15 downto 0); 
          else 
            sdo.data(15 downto 0) <= r.hwdata(31 downto 16); 
          end if;
        end if;

        if not BUS16 then
          for i in 0 to sdbits/64 loop
            sdo.data(31+32*i downto 32*i) <= r.hwdata;
          end loop;
        end if;
      end if;
      if rst = '0' then sdo.sdcsn <= (others => '1'); end if;
    end process;
  end generate;

-- pragma translate_off
  bootmsg : report_version
  generic map ("sdctrl16" & tost(hindex) &
    ": PC133 SDRAM controller rev " & tost(REVISION));
-- pragma translate_on

end;

