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
-- Entity: 	ahb2mig
-- File:	ahb2mig.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	AHB wrapper for Xilinx Virtex5 DDR2/3 MIG
------------------------------------------------------------------------------

library ieee; 
use ieee.std_logic_1164.all;
library grlib; 
use grlib.amba.all;

package ml50x is

 constant BANK_WIDTH : integer := 2; -- # of memory bank addr bits.
 constant CKE_WIDTH  : integer := 2; -- # of memory clock enable outputs.
 constant CLK_WIDTH  : integer := 2; -- # of clock outputs.
 constant COL_WIDTH  : integer := 10; -- # of memory column bits.
 constant CS_NUM     : integer := 1; --2; -- # of separate memory chip selects.
 constant CS_WIDTH   : integer := 1; --2; -- # of total memory chip selects.
 constant CS_BITS    : integer := 0; --1; -- set to log2(CS_NUM) (rounded up).
 constant DM_WIDTH   : integer := 8; -- # of data mask bits.
 constant DQ_WIDTH   : integer := 64; -- # of data width.
 constant DQ_PER_DQS : integer := 8; -- # of DQ data bits per strobe.
 constant DQS_WIDTH  : integer := 8; -- # of DQS strobes.
 constant DQ_BITS    : integer := 6; -- set to log2(DQS_WIDTH*DQ_PER_DQS).
 constant DQS_BITS   : integer := 3; -- set to log2(DQS_WIDTH).
 constant ODT_WIDTH  : integer := 1; -- # of memory on-die term enables.
 constant ROW_WIDTH  : integer := 13; -- # of memory row and # of addr bits.
 constant APPDATA_WIDTH : integer := 128; -- # of usr read/write data bus bits.
 constant ADDR_WIDTH : integer := 31; -- # of memory row and # of addr bits.
 constant MIGHMASK   : integer := 16#F00#; -- AHB mask for 256 Mbyte memory
-- constant MIGHMASK   : integer := 16#E00#; -- AHB mask for 512 Mbyte memory
-- constant MIGHMASK   : integer := 16#C00#; -- AHB mask for 1024 Mbyte memory

  type mig_app_in_type is record
      app_wdf_wren  : std_logic;
      app_wdf_data  : std_logic_vector(APPDATA_WIDTH-1 downto 0);
      app_wdf_mask  : std_logic_vector(APPDATA_WIDTH/8-1 downto 0);
      app_addr      : std_logic_vector(ADDR_WIDTH-1 downto 0);
      app_cmd       : std_logic_vector(2 downto 0);
      app_en        : std_logic;
  end record;

  type mig_app_out_type is record
      app_af_afull  : std_logic;
      app_wdf_afull : std_logic;
      app_rd_data   : std_logic_vector(APPDATA_WIDTH-1 downto 0);
      app_rd_data_valid : std_logic;
  end record;

  component mig_36_1
  generic(
   BANK_WIDTH               : integer := 2; 
                              -- # of memory bank addr bits.
   CKE_WIDTH                : integer := 1; 
                              -- # of memory clock enable outputs.
   CLK_WIDTH                : integer := 2; 
                              -- # of clock outputs.
   COL_WIDTH                : integer := 10; 
                              -- # of memory column bits.
   CS_NUM                   : integer := 1; 
                              -- # of separate memory chip selects.
   CS_WIDTH                 : integer := 1; 
                              -- # of total memory chip selects.
   CS_BITS                  : integer := 0; 
                              -- set to log2(CS_NUM) (rounded up).
   DM_WIDTH                 : integer := 8; 
                              -- # of data mask bits.
   DQ_WIDTH                 : integer := 64; 
                              -- # of data width.
   DQ_PER_DQS               : integer := 8; 
                              -- # of DQ data bits per strobe.
   DQS_WIDTH                : integer := 8; 
                              -- # of DQS strobes.
   DQ_BITS                  : integer := 6; 
                              -- set to log2(DQS_WIDTH*DQ_PER_DQS).
   DQS_BITS                 : integer := 3; 
                              -- set to log2(DQS_WIDTH).
   ODT_WIDTH                : integer := 1; 
                              -- # of memory on-die term enables.
   ROW_WIDTH                : integer := 13; 
                              -- # of memory row and # of addr bits.
   ADDITIVE_LAT             : integer := 0; 
                              -- additive write latency.
   BURST_LEN                : integer := 4; 
                              -- burst length (in double words).
   BURST_TYPE               : integer := 0; 
                              -- burst type (=0 seq; =1 interleaved).
   CAS_LAT                  : integer := 3; 
                              -- CAS latency.
   ECC_ENABLE               : integer := 0; 
                              -- enable ECC (=1 enable).
   APPDATA_WIDTH            : integer := 128; 
                              -- # of usr read/write data bus bits.
   MULTI_BANK_EN            : integer := 1; 
                              -- Keeps multiple banks open. (= 1 enable).
   TWO_T_TIME_EN            : integer := 1; 
                              -- 2t timing for unbuffered dimms.
   ODT_TYPE                 : integer := 1; 
                              -- ODT (=0(none),=1(75),=2(150),=3(50)).
   REDUCE_DRV               : integer := 0; 
                              -- reduced strength mem I/O (=1 yes).
   REG_ENABLE               : integer := 0; 
                              -- registered addr/ctrl (=1 yes).
   TREFI_NS                 : integer := 7800; 
                              -- auto refresh interval (ns).
   TRAS                     : integer := 40000; 
                              -- active->precharge delay.
   TRCD                     : integer := 15000; 
                              -- active->read/write delay.
   TRFC                     : integer := 105000; 
                              -- refresh->refresh, refresh->active delay.
   TRP                      : integer := 15000; 
                              -- precharge->command delay.
   TRTP                     : integer := 7500; 
                              -- read->precharge delay.
   TWR                      : integer := 15000; 
                              -- used to determine write->precharge.
   TWTR                     : integer := 10000; 
                              -- write->read delay.
   HIGH_PERFORMANCE_MODE    : boolean := TRUE; 
                              -- # = TRUE, the IODELAY performance mode is set
                              -- to high.
                              -- # = FALSE, the IODELAY performance mode is set
                              -- to low.
   SIM_ONLY                 : integer := 0; 
                              -- = 1 to skip SDRAM power up delay.
   DEBUG_EN                 : integer := 0; 
                              -- Enable debug signals/controls.
                              -- When this parameter is changed from 0 to 1,
                              -- make sure to uncomment the coregen commands
                              -- in ise_flow.bat or create_ise.bat files in
                              -- par folder.
   CLK_PERIOD               : integer := 5000; 
                              -- Core/Memory clock period (in ps).
   DLL_FREQ_MODE            : string := "HIGH"; 
                              -- DCM Frequency range.
   CLK_TYPE                 : string := "SINGLE_ENDED"; 
                              -- # = "DIFFERENTIAL " ->; Differential input clocks ,
                              -- # = "SINGLE_ENDED" -> Single ended input clocks.
   NOCLK200                 : boolean := FALSE; 
                              -- clk200 enable and disable
   RST_ACT_LOW              : integer := 1  
                              -- =1 for active low reset, =0 for active high.
   );
  port(
   ddr2_dq               : inout  std_logic_vector((DQ_WIDTH-1) downto 0);
   ddr2_a                : out   std_logic_vector((ROW_WIDTH-1) downto 0);
   ddr2_ba               : out   std_logic_vector((BANK_WIDTH-1) downto 0);
   ddr2_ras_n            : out   std_logic;
   ddr2_cas_n            : out   std_logic;
   ddr2_we_n             : out   std_logic;
   ddr2_cs_n             : out   std_logic_vector((CS_WIDTH-1) downto 0);
   ddr2_odt              : out   std_logic_vector((ODT_WIDTH-1) downto 0);
   ddr2_cke              : out   std_logic_vector((CKE_WIDTH-1) downto 0);
   ddr2_dm               : out   std_logic_vector((DM_WIDTH-1) downto 0);
   sys_clk               : in    std_logic;
   idly_clk_200          : in    std_logic;
   sys_rst_n             : in    std_logic;
   phy_init_done         : out   std_logic;
   rst0_tb               : out   std_logic;
   clk0_tb               : out   std_logic;
   app_wdf_afull         : out   std_logic;
   app_af_afull          : out   std_logic;
   rd_data_valid         : out   std_logic;
   app_wdf_wren          : in    std_logic;
   app_af_wren           : in    std_logic;
   app_af_addr           : in    std_logic_vector(30 downto 0);
   app_af_cmd            : in    std_logic_vector(2 downto 0);
   rd_data_fifo_out      : out   std_logic_vector((APPDATA_WIDTH-1) downto 0);
   app_wdf_data          : in    std_logic_vector((APPDATA_WIDTH-1) downto 0);
   app_wdf_mask_data     : in    std_logic_vector((APPDATA_WIDTH/8-1) downto 0);
   ddr2_dqs              : inout  std_logic_vector((DQS_WIDTH-1) downto 0);
   ddr2_dqs_n            : inout  std_logic_vector((DQS_WIDTH-1) downto 0);
   ddr2_ck               : out   std_logic_vector((CLK_WIDTH-1) downto 0);
   ddr2_ck_n             : out   std_logic_vector((CLK_WIDTH-1) downto 0)
   );

  end component ;

end package; 

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use grlib.devices.all;
use gaisler.memctrl.all;
library techmap;
use techmap.gencomp.all;
use work.ml50x.all;

entity ahb2mig_ml50x is
   generic (
      memtech    : integer := 0;
      hindex     : integer := 0;
      haddr      : integer := 0;
      hmask      : integer := 16#e00#;
      MHz        : integer := 100;
      Mbyte      : integer := 512;
      nosync     : integer := 0
   );
   port (
      rst_ddr : in  std_ulogic;
      rst_ahb : in  std_ulogic;
      clk_ddr : in  std_ulogic;
      clk_ahb : in  std_ulogic;
      ahbsi   : in  ahb_slv_in_type;
      ahbso   : out ahb_slv_out_type;
      migi    : out mig_app_in_type;
      migo    : in mig_app_out_type
   );
end;

architecture rtl of ahb2mig_ml50x is

constant REVISION  : integer := 0;

constant hconfig : ahb_config_type := (
   0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_MIGDDR2, 0, REVISION, 0),
   4 => ahb_membar(haddr, '1', '1', hmask),
   others => zero32);

type ahb_state_type is (midle, rhold, dread, dwrite, whold1, whold2);
type ddr_state_type is (midle, rhold, dread, dwrite, whold1, whold2);
constant abuf : integer := 6;
type access_param is record
   haddr    : std_logic_vector(31 downto 0);
   size     : std_logic_vector(2 downto 0);
   hwrite   : std_ulogic;
end record;
-- local registers

type mem is array(0 to 7) of std_logic_vector(31 downto 0);
type wrm is array(0 to 7) of std_logic_vector(3 downto 0);

type ahb_reg_type is record
   hready   : std_ulogic;
   hsel     : std_ulogic;
   startsd  : std_ulogic;
   state    : ahb_state_type;
   haddr    : std_logic_vector(31 downto 0);
   hrdata   : std_logic_vector(127 downto 0);
   hwrite   : std_ulogic;
   htrans   : std_logic_vector(1 downto 0);
   hresp    : std_logic_vector(1 downto 0);
   raddr    : std_logic_vector(abuf-1 downto 0);
   size     : std_logic_vector(2 downto 0);
   acc      : access_param;
   sync     : std_ulogic;
   hwdata   : mem;
   write    : wrm;
end record;

type ddr_reg_type is record
   startsd      : std_ulogic;
   hrdata       : std_logic_vector(255 downto 0);
   sync         : std_ulogic;
   dstate    	: ahb_state_type;
end record;

signal vcc, clk_ahb1, clk_ahb2 : std_ulogic;
signal r, ri : ddr_reg_type;
signal ra, rai : ahb_reg_type;
signal rbdrive, ribdrive : std_logic_vector(31 downto 0);
signal hwdata, hwdatab : std_logic_vector(127 downto 0);

begin

   vcc <= '1';

   ahb_ctrl : process(rst_ahb, ahbsi, r, ra, migo, hwdata)
   variable va       : ahb_reg_type;  -- local variables for registers
   variable startsd : std_ulogic;
   variable ready   : std_logic;
   variable tmp : std_logic_vector(3 downto 0);
   variable waddr : integer;
   variable rdata : std_logic_vector(127 downto 0);
   begin

      va := ra; va.hresp := HRESP_OKAY; 
      tmp := (others => '0');

      case ra.raddr(2 downto 2) is
      when "0" => rdata := r.hrdata(127 downto 0);
      when others => rdata := r.hrdata(255 downto 128);
      end case;

      if AHBDW > 64 and ra.size = HSIZE_4WORD then
        va.hrdata := rdata(63 downto 0) & rdata(127 downto 64);
      elsif AHBDW > 32 and ra.size = HSIZE_DWORD then
        if ra.raddr(1) = '1' then va.hrdata(63 downto 0) := rdata(127 downto 64);
        else va.hrdata(63 downto 0) := rdata(63 downto 0); end if;
        va.hrdata(127 downto 64) := va.hrdata(63 downto 0);
      else
        case ra.raddr(1 downto 0) is
          when "00" => va.hrdata(31 downto 0) := rdata(63 downto 32);
          when "01" => va.hrdata(31 downto 0) := rdata(31 downto 0);
          when "10" => va.hrdata(31 downto 0) := rdata(127 downto 96);
          when others => va.hrdata(31 downto 0) := rdata(95 downto 64);
        end case;
        va.hrdata(127 downto 32) := va.hrdata(31 downto 0) &
                                   va.hrdata(31 downto 0) &
                                   va.hrdata(31 downto 0);
      end if;

      if nosync = 0 then
	va.sync := r.startsd;
	if ra.startsd = ra.sync then ready := '1'; 
	else ready := '0'; end if;
      else
	if ra.startsd = r.startsd then ready := '1'; 
	else ready := '0'; end if;
      end if;

      if ((ahbsi.hready and ahbsi.hsel(hindex)) = '1') then
         va.htrans := ahbsi.htrans; va.haddr := ahbsi.haddr;
         va.size := ahbsi.hsize(2 downto 0); va.hwrite := ahbsi.hwrite;
         if ahbsi.htrans(1) = '1' then
            va.hsel := '1'; va.hready := '0';
         end if;
      end if;

      if ahbsi.hready = '1' then va.hsel := ahbsi.hsel(hindex); end if;

      case ra.state is
      when midle =>
	 va.write := (others => "0000");
         if ((va.hsel and va.htrans(1)) = '1') then
            if va.hwrite = '0' then
               va.state := rhold; va.startsd := not ra.startsd;
            else
               va.state := dwrite; va.hready := '1';
            end if;
         end if;
         va.raddr := ra.haddr(7 downto 2);
         if ((ahbsi.hready and ahbsi.hsel(hindex)) = '1') then
            va.acc := (va.haddr, va.size, va.hwrite);
         end if;
      when rhold =>
         va.raddr := ra.haddr(7 downto 2);
         if ready = '1' then
            va.state := dread; va.hready := '1';
            if AHBDW > 64 and ra.size(2) = '1' then va.raddr := ra.raddr + 4;
            elsif AHBDW > 32 and andv(ra.size(1 downto 0)) = '1' then va.raddr := ra.raddr + 2;
            else va.raddr := ra.raddr + 1; end if;
         end if;
      when dread =>
         va.hready := '1';
         if AHBDW > 64 and ra.size(2) = '1' then va.raddr := ra.raddr + 4;
         elsif AHBDW > 32 and andv(ra.size(1 downto 0)) = '1' then va.raddr := ra.raddr + 2;
         else va.raddr := ra.raddr + 1; end if;
         if ((va.hsel and va.htrans(1) and va.htrans(0)) = '0') 
            or (ra.raddr(2 downto 0) = "000") then
               va.state := midle; va.hready := '0';
         end if;
         va.acc := (va.haddr, va.size, va.hwrite);
      when dwrite => 
         va.raddr := ra.haddr(7 downto 2); va.hready := '1';
         if (((va.hsel and va.htrans(1) and va.htrans(0)) = '0') 
             or (ra.haddr(4 downto 2) = "111") 
             or (AHBDW > 32 and ra.haddr(5 downto 2) = "1110" and andv(ra.size(1 downto 0)) = '1')
             or (AHBDW > 64 and ra.haddr(5 downto 2) = "1100" and ra.size(2) = '1')) then
            va.startsd := not ra.startsd; va.state := whold1;
            va.hready := '0';
         end if;
        tmp := decode(ra.haddr(1 downto 0));
	waddr := conv_integer(ra.haddr(4 downto 2));
	va.hwdata(waddr) := hwdata(31 downto 0);
	case ra.size is
	when "000" => va.write(waddr) := tmp(0) & tmp(1) & tmp(2) & tmp(3);
	when "001" => va.write(waddr) := tmp(0) & tmp(0) & tmp(2) & tmp(2);
	when "010" => va.write(waddr) := "1111";
	when "011" => va.write(waddr) := "1111"; va.write(waddr+1) := "1111";
	  va.hwdata(waddr+1) := hwdata((63 mod AHBDW) downto (32 mod AHBDW));
	when others => va.write(waddr) := "1111"; va.write(waddr+1) := "1111";
	  va.write(waddr+2) := "1111"; va.write(waddr+3) := "1111";
	  va.hwdata(waddr+1) := hwdata((63 mod AHBDW) downto (32 mod AHBDW));
	  va.hwdata(waddr+2) := hwdata((95 mod AHBDW) downto (64 mod AHBDW));
	  va.hwdata(waddr+3) := hwdata((127 mod AHBDW) downto (96 mod AHBDW));
	end case;
      when whold1 =>
         va.state := whold2; 
      when whold2 =>
         if ready = '1' then
            va.state := midle; va.acc := (va.haddr, va.size, va.hwrite);
         end if;
      end case;

      if (ahbsi.hready and ahbsi.hsel(hindex) ) = '1' then
         if ahbsi.htrans(1) = '0' then va.hready := '1'; end if;
      end if;

      if rst_ahb = '0' then
         va.hsel         := '0';
         va.hready       := '1';
         va.state        := midle;
         va.startsd      := '0';
	 va.acc.hwrite := '0';
         va.acc.haddr := (others => '0');
      end if;

      rai <= va;

   end process;

   ahbso.hready  <= ra.hready;
   ahbso.hresp   <= ra.hresp;
   ahbso.hrdata <= ahbdrivedata(ra.hrdata);

--   migi.app_addr  <= '0' & ra.acc.haddr(28 downto 6) & "000";
   migi.app_addr  <= "00000" & ra.acc.haddr(28 downto 5) & "00";

   ddr_ctrl : process(rst_ddr, r, ra, migo)
   variable v        : ddr_reg_type;   -- local variables for registers
   variable startsd  : std_ulogic;
   variable raddr    : std_logic_vector(13 downto 0);
   variable adec     : std_ulogic;
   variable haddr    : std_logic_vector(31 downto 0);
   variable hsize    : std_logic_vector(1 downto 0);
   variable hwrite   : std_ulogic;
   variable htrans   : std_logic_vector(1 downto 0);
   variable hready   : std_ulogic;
   variable app_en   : std_ulogic;
   variable app_cmd  : std_logic_vector(2 downto 0);
   variable app_wdf_mask  : std_logic_vector(APPDATA_WIDTH/8-1 downto 0);
   variable app_wdf_wren  : std_ulogic;
   variable app_wdf_data  : std_logic_vector(APPDATA_WIDTH-1 downto 0);

   begin

-- Variable default settings to avoid latches

      v := r; app_en := '0'; app_cmd := "000"; app_wdf_wren := '0'; 
      app_wdf_mask := (others => '0');
      app_wdf_mask(15 downto 0) := ra.write(2) & ra.write(3) & ra.write(0) & ra.write(1);
      app_wdf_data := (others => '0');
      app_wdf_data(127 downto 0)  := ra.hwdata(2) & ra.hwdata(3) & ra.hwdata(0) & ra.hwdata(1);
      if ra.acc.hwrite = '0' then app_cmd(0) := '1'; else app_cmd(0) := '0'; end if;
      v.sync := ra.startsd;
      
      if nosync = 0 then
	if r.startsd /= r.sync then startsd := '1';
	else startsd := '0'; end if;
      else
	if ra.startsd /= r.startsd then startsd := '1';
	else startsd := '0'; end if;
      end if;
      
      case r.dstate is
      when midle =>
	if (startsd = '1') and (migo.app_af_afull = '0') then
	  if ra.acc.hwrite = '0' then 
	    v.dstate := dread; app_en := '1';
	  elsif migo.app_wdf_afull = '0' then
	    v.dstate := dwrite; app_en := '1'; app_wdf_wren := '1';
	  end if;
	end if;
      when dread =>
         if migo.app_rd_data_valid = '1' then
	   v.hrdata(127 downto 0) := migo.app_rd_data(127 downto 0);
	   v.dstate := rhold;
	 end if;
      when rhold =>
	   v.hrdata(255 downto 128) := migo.app_rd_data(127 downto 0);
	   v.dstate := midle;
	v.startsd := not r.startsd;
      when dwrite =>
	app_wdf_wren := '1';
	app_wdf_mask(15 downto 0) := ra.write(6) & ra.write(7) & ra.write(4) & ra.write(5);
	app_wdf_data(127 downto 0) := ra.hwdata(6) & ra.hwdata(7) & ra.hwdata(4) & ra.hwdata(5);
	v.startsd := not r.startsd;
	v.dstate := midle;
      when others =>
      end case;

-- reset

      if rst_ddr = '0' then
         v.startsd      := '0';
         app_en := '0';
         v.dstate := midle;
      end if;

      ri <= v;
      migi.app_cmd <= app_cmd;
      migi.app_en  <= app_en;
      migi.app_wdf_wren  <= app_wdf_wren;
      migi.app_wdf_mask  <= not app_wdf_mask;
      migi.app_wdf_data  <= app_wdf_data;
   
   end process;

   ahbso.hconfig <= hconfig;
   ahbso.hirq    <= (others => '0');
   ahbso.hindex  <= hindex;
   ahbso.hsplit  <= (others => '0');

   clk_ahb1 <= clk_ahb; clk_ahb2 <= clk_ahb1;  -- sync clock deltas
   ahbregs : process(clk_ahb2) begin
      if rising_edge(clk_ahb2) then
         ra <= rai;
      end if;
   end process;

   ddrregs : process(clk_ddr) begin
      if rising_edge(clk_ddr) then
         r <= ri;
      end if;
   end process;

   -- Write data selection.
   AHB32: if AHBDW = 32 generate
     hwdata <= ahbsi.hwdata(31 downto 0) & ahbsi.hwdata(31 downto 0) &
               ahbsi.hwdata(31 downto 0) & ahbsi.hwdata(31 downto 0);
   end generate AHB32;
   AHB64: if AHBDW = 64 generate
     -- With CORE_ACDM set to 0 hwdata will always be ahbsi.hwdata(63 downto 0)
     -- otherwise the valid data slice will be selected, and possibly uplicated,
     -- from ahbsi.hwdata. 
     hwdatab(63 downto 0) <= ahbreaddword(ahbsi.hwdata, ra.haddr(4 downto 2)) when (CORE_ACDM = 0 or ra.size(1 downto 0) = "11") else
               (ahbreadword(ahbsi.hwdata, ra.haddr(4 downto 2)) &
                ahbreadword(ahbsi.hwdata, ra.haddr(4 downto 2)));
     hwdata <= hwdatab(31 downto 0) & hwdatab(63 downto 32) &
	      hwdatab(31 downto 0) & hwdatab(63 downto 32);
   end generate AHB64;
   AHBWIDE: if AHBDW > 64 generate
     -- With CORE_ACDM set to 0 hwdata will always be ahbsi.hwdata(127 downto 0)
     -- otherwise the valid data slice will be selected, and possibly uplicated,
     -- from ahbsi.hwdata.
     hwdatab <= ahbread4word(ahbsi.hwdata, ra.haddr(4 downto 2)) when (CORE_ACDM = 0 or ra.size(2) = '1') else
               (ahbreaddword(ahbsi.hwdata, ra.haddr(4 downto 2)) &
                ahbreaddword(ahbsi.hwdata, ra.haddr(4 downto 2))) when (ra.size = "011") else
               (ahbreadword(ahbsi.hwdata, ra.haddr(4 downto 2)) &
                ahbreadword(ahbsi.hwdata, ra.haddr(4 downto 2)) &
                ahbreadword(ahbsi.hwdata, ra.haddr(4 downto 2)) &
                ahbreadword(ahbsi.hwdata, ra.haddr(4 downto 2)));
     hwdata <= hwdatab(31 downto 0) & hwdatab(63 downto 32) &
	      hwdatab(95 downto 64) & hwdatab(127 downto 96);
   end generate AHBWIDE;
   
-- pragma translate_off
   bootmsg : report_version
   generic map (
      msg1 => "ahb2mig" & tost(hindex) & ": 64-bit DDR2/3 controller rev " &
              tost(REVISION) & ", " & tost(Mbyte) & " Mbyte, " & tost(MHz) &
              " MHz DDR clock");
-- pragma translate_on

end;

