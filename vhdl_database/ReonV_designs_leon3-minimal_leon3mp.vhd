------------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2013 Aeroflex Gaisler
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
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library techmap;
use techmap.gencomp.all;
use techmap.allclkgen.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.jtag.all;
--pragma translate_off
use gaisler.sim.all;
--pragma translate_on
library esa;
use esa.memoryctrl.all;
use work.config.all;

entity leon3mp is
  generic (
    fabtech  : integer := CFG_FABTECH;
    memtech  : integer := CFG_MEMTECH;
    padtech  : integer := CFG_PADTECH;
    clktech  : integer := CFG_CLKTECH
    );
  port (
    clk             : in    std_ulogic; -- FPGA main clock input
   
   -- Buttons & LEDs
    btnCpuResetn    : in    std_ulogic; -- Reset button
    Led             : out   std_logic_vector(15 downto 0);
    
    -- Onboard Cellular RAM
    RamOE           : out   std_ulogic;
    RamWE           : out   std_ulogic;
    RamAdv          : out   std_ulogic;
    RamCE           : out   std_ulogic;
    RamClk          : out   std_ulogic;
    RamCRE          : out   std_ulogic;
    RamLB           : out   std_ulogic;
    RamUB           : out   std_ulogic;

    address         : out   std_logic_vector(22 downto 0);
    data            : inout std_logic_vector(15 downto 0);
    
    -- USB-RS232 interface
    RsRx            : in    std_logic;
    RsTx            : out   std_logic
  );
end;

architecture rtl of leon3mp is
  signal vcc : std_logic;
  signal gnd : std_logic;

  -- Memory controler signals
  signal memi : memory_in_type;
  signal memo : memory_out_type;
  signal wpo  : wprot_out_type;
  
  -- AMBA bus signals
  signal apbi  : apb_slv_in_type;
  signal apbo  : apb_slv_out_vector := (others => apb_none);
  signal ahbsi : ahb_slv_in_type;
  signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi : ahb_mst_in_type;
  signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal cgi : clkgen_in_type;
  signal cgo : clkgen_out_type;

  signal u1i, dui : uart_in_type;
  signal u1o, duo : uart_out_type;

  signal irqi : irq_in_vector(0 to 0);
  signal irqo : irq_out_vector(0 to 0);

  signal dbgi : l3_debug_in_vector(0 to 0);
  signal dbgo : l3_debug_out_vector(0 to 0);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type;
  signal ndsuact : std_ulogic;

  signal gpti : gptimer_in_type;

  signal clkm, rstn         : std_ulogic;
  signal tck, tms, tdi, tdo : std_ulogic;
  signal rstraw             : std_logic;
  signal lock               : std_logic;

  -- RS232 APB Uart (unconnected)
  signal rxd1 : std_logic;
  signal txd1 : std_logic;
  
  attribute keep                     : boolean;
  attribute keep of lock             : signal is true;
  attribute keep of clkm             : signal is true;

  constant clock_mult : integer := 10;      -- Clock multiplier
  constant clock_div  : integer := 20;      -- Clock divider
  constant BOARD_FREQ : integer := 100000;  -- CLK input frequency in KHz
  constant CPU_FREQ   : integer := BOARD_FREQ * clock_mult / clock_div;  -- CPU freq in KHz
begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= '1';
  gnd <= '0';

  cgi.pllctrl <= "00";
  cgi.pllrst <= rstraw;

  rst0 : rstgen generic map (acthigh => 0)
    port map (btnCpuResetn, clkm, lock, rstn, rstraw);
  lock <= cgo.clklock;

  -- clock generator
  clkgen0 : clkgen
    generic map (fabtech, clock_mult, clock_div, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
    port map (clk, gnd, clkm, open, open, open, open, cgi, cgo, open, open, open);
  
---------------------------------------------------------------------- 
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl
    generic map (ioen => 1, nahbm => 4, nahbs => 8)
    port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  -- LEON3 processor
  u0 : leon3s
    generic map (hindex=>0, fabtech=>fabtech, memtech=>memtech, dsu=>1, fpu=>0, v8=>2,
                 mac=>0, isetsize=>8, dsetsize=>8,icen=>1, dcen=>1,tbuf=>2)
    port map (clkm, rstn, ahbmi, ahbmo(0), ahbsi, ahbso, irqi(0), irqo(0), dbgi(0), dbgo(0));

  -- LEON3 Debug Support Unit    
  dsu0 : dsu3
    generic map (hindex => 2, ncpu => 1, tech => memtech, irq => 0, kbytes => 2)
    port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);
  dsui.enable <= '1';
  led(3) <= dbgo(0).error;
  
  -- Debug UART
  dcom0 : ahbuart 
    generic map (hindex => 1, pindex => 4, paddr => 7)
    port map (rstn, clkm, dui, duo, apbi, apbo(4), ahbmi, ahbmo(1));
  dsurx_pad : inpad generic map (tech  => padtech) port map (RsRx, dui.rxd);
  dsutx_pad : outpad generic map (tech => padtech) port map (RsTx, duo.txd);
  led(0) <= not dui.rxd;
  led(1) <= not duo.txd;

  ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => 3)
    port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(3),
             open, open, open, open, open, open, open, gnd);

----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  -- LEON2 memory controller
  sr1 : mctrl generic map (hindex => 5, pindex => 0, paddr => 0, rommask => 0,
      iomask => 0, ram8 => 0, ram16 => 1,srbanks=>1)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(5), apbi, apbo(0), wpo, open);

  memi.brdyn  <= '1';
  memi.bexcn  <= '1';
  memi.writen <= '1';
  memi.wrn    <= "1111";
  memi.bwidth <= "01";   -- Sets data bus width for PROM accesses.
  
  -- Bidirectional data bus
  bdr  : iopadv generic map (tech => padtech, width => 8)
    port map (data(7 downto 0), memo.data(23 downto 16),
              memo.bdrive(1), memi.data(23 downto 16));
  bdr2 : iopadv generic map (tech => padtech, width => 8)
    port map (data(15 downto 8), memo.data(31 downto 24),
              memo.bdrive(0), memi.data(31 downto 24));
  
  -- Out signals to memory
  addr_pad : outpadv generic map (tech => padtech, width => 23) -- Address bus
    port map (address, memo.address(23 downto 1));
  oen_pad : outpad generic map (tech => padtech)  -- Output Enable
    port map (RamOE, memo.oen);
  cs_pad : outpad generic map (tech => padtech)   -- SRAM Chip select
    port map (RamCE, memo.ramsn(0));
  lb_pad : outpad generic map (tech => padtech)
    port map (RamLB, memo.mben(0));
  ub_pad : outpad generic map (tech => padtech)
    port map (RamUB, memo.mben(1));
  wri_pad : outpad generic map (tech => padtech)  -- Write enable
    port map (RamWE, memo.writen);

  RamCRE <= '0';  -- Special SRAM signals specific
  RamClk <= '0';  -- to Nexys4 board
  RamAdv <= '0';

-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  brom : entity work.ahbrom
    generic map (hindex => 6, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
    port map ( rstn, clkm, ahbsi, ahbso(6));
  
----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl       -- APB Bridge
    generic map (hindex => 1, haddr => 16#800#)
    port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo);

  irqctrl0 : irqmp     -- Interrupt controller
    generic map (pindex => 2, paddr => 2, ncpu => 1)
    port map (rstn, clkm, apbi, apbo(2), irqo, irqi);

  timer0 : gptimer     -- Time Unit
    generic map (pindex => 3, paddr => 3, pirq => 8,
                 sepirq => 1, ntimers => 2)
    port map (rstn, clkm, apbi, apbo(3), gpti, open);
  gpti <= gpti_dhalt_drive(dsuo.tstop);

  uart1 : apbuart      -- UART 1
    generic map (pindex   => 1, paddr => 1, pirq => 2, console => 1)
    port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
  u1i.rxd    <= rxd1;
  u1i.ctsn   <= '0';
  u1i.extclk <= '0';
  txd1       <= u1o.txd;

-----------------------------------------------------------------------
--  Test report module, only used for simulation ----------------------
-----------------------------------------------------------------------

--pragma translate_off
  test0 : ahbrep generic map (hindex => 4, haddr => 16#200#)
    port map (rstn, clkm, ahbsi, ahbso(4));
--pragma translate_on


-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
    generic map (
      msg1 => "LEON3 Demonstration design",
      fabtech => tech_table(fabtech), memtech => tech_table(memtech),
      mdel => 1
      );
-- pragma translate_on

end rtl;

