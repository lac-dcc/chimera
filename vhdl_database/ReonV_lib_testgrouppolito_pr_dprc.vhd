------------------------------------------------------------------------------
-- Copyright (c) 2014, Pascal Trotta - Testgroup (Politecnico di Torino)
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without modification, 
-- are permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this 
--    list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright notice, this
--    list of conditions and the following disclaimer in the documentation and/or other 
--    materials provided with the distribution.
--
-- THIS SOURCE CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
-- MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
-- COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
-- GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
-- OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
-----------------------------------------------------------------------------
-- Entity:      dprc
-- File:        dprc.vhd
-- Author:      Pascal Trotta (TestGroup research group - Politecnico di Torino)
-- Contacts:    pascal.trotta@polito.it www.testgroup.polito.it
-- Description: Top entity of the dynamic partial reconfiguration controller for Xilinx FPGAs
--              (see the DPRC IP-core user manual for configuration and operations).
-- Last revision: 08/10/2014
------------------------------------------------------------------------------  

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library grlib;
use grlib.amba.all;
use grlib.devices.all;
use grlib.DMA2AHB_Package.all;
library techmap;
use techmap.gencomp.all;
library testgrouppolito;
use testgrouppolito.dprc_pkg.all;
library unisim;
use unisim.vcomponents.all;
--pragma translate_off
use std.textio.all;
use ieee.std_logic_textio.all;
use grlib.stdlib.report_version;
use grlib.stdlib.tost;
--pragma translate_on

entity dprc is
  generic (              
    cfg_clkmul    : integer := 2;                       -- clkraw multiplier
    cfg_clkdiv    : integer := 1;                       -- clkraw divisor
    raw_freq      : integer := 50000;                   -- Board frequency in KHz
    clk_sel       : integer := 0;                       -- Select between clkraw and clk100 for ICAP domain clk when configured in async or d2prc mode
    hindex        : integer := 2;                       -- AMBA AHB master index
    vendorid      : integer := VENDOR_CONTRIB;          -- Vendor ID
    deviceid      : integer := CONTRIB_CORE1;           -- Device ID
    version       : integer := 1;                       -- Device version
    pindex        : integer := 13;                      -- AMBA APB slave index
    paddr         : integer := 13;                      -- Address for APB I/O BAR
    pmask         : integer := 16#fff#;                 -- Mask for APB I/O BAR
    pirq          : integer := 0;                       -- Interrupt index
    technology    : integer := virtex4;                 -- FPGA target technology
    crc_en        : integer := 0;                       -- Enable bitstream verification (d2prc-crc mode)
    edac_en       : integer := 1;                       -- Enable bitstream EDAC (d2prc-edac mode)
    words_block   : integer := 10;                      -- Number of 32-bit words in a CRC-block
    fifo_dcm_inst : integer := 0;                       -- Instantiate clock generator and fifo (async/sync mode)
    fifo_depth    : integer := 9);                      -- Number of addressing bits for the FIFO (true FIFO depth = 2**fifo_depth)
  port (
    rstn          : in  std_ulogic;                     -- Asynchronous Reset input (active low)
    clkm          : in  std_ulogic;                     -- Clock input
    clkraw        : in  std_ulogic;                     -- Raw Clock input
    clk100        : in  std_ulogic;                     -- 100 MHz Clock input
    ahbmi         : in ahb_mst_in_type;                 -- AHB master input
    ahbmo         : out ahb_mst_out_type;               -- AHB master output
    apbi          : in  apb_slv_in_type;                -- APB slave input
    apbo          : out apb_slv_out_type;               -- APB slave output
    rm_reset      : out std_logic_vector(31 downto 0)); -- Reconfigurable modules reset (1 bit for each different reconfigurable partition)
end dprc;

architecture dprc_rtl of dprc is

  signal dma_in : DMA_In_Type;
  signal dma_out : DMA_Out_Type;
  signal icap_in, ricap_in : icap_in_type;
  signal icap_out, ricap_out : icap_out_type;
  signal clk_icap : std_ulogic; 
  signal icap_swapped : std_logic_vector(31 downto 0);
  signal cgi : clkgen_in_type;
  signal cgo : clkgen_out_type;
  signal sysrstn : std_ulogic;
  signal rego, reg_apbout : dprc_apbregout_type;
  signal regi, reg_apbin : dprc_apbregin_type;
  signal regcontrol, rregcontrol : dprc_apbcontrol_type;
  signal wen_del : std_ulogic;

  constant pconfig : apb_config_type := (0 => ahb_device_reg (vendorid, deviceid, 0, version, pirq), 1 => apb_iobar(paddr, pmask));
   
  --pragma translate_off
  file icap_file: TEXT open write_mode is "icap_data";
  --pragma translate_on

begin

  -- ahb interface
  dma2ahb_inst: DMA2AHB
    generic map(hindex => hindex, vendorid => vendorid, deviceid => deviceid, version => version) 
    port map(HCLK => clkm, HRESETn => sysrstn, DMAIn => dma_in, DMAOut => dma_out, AHBIn => ahbmi, AHBOut => ahbmo);

  -- apb interface
  apbo.pindex <= pindex;
  apbo.pconfig <= pconfig;

  comb : process(reg_apbout, reg_apbin, apbi, regcontrol, rregcontrol)
           variable readdata : std_logic_vector(31 downto 0);
           variable regvi : dprc_apbregin_type;
           variable regvo : dprc_apbregout_type;
           variable irq   : std_logic_vector(NAHBIRQ-1 downto 0);
         begin
           -- assign register outputs to variables
           regvi := reg_apbin;
           regvo := reg_apbout;
        
           -- read register
           readdata := (others => '0');
           case apbi.paddr(4 downto 2) is         
             when "000" =>
               readdata := reg_apbin.control;
             when "001" =>
               readdata := reg_apbin.address;
             when "010" => 
               readdata := reg_apbout.status;
             when "011" =>
               readdata := reg_apbout.timer;
             when "100" =>
               readdata := reg_apbin.rm_reset;
             when others =>
               readdata := (others => '0');
           end case;

           -- write registers
           if (apbi.psel(pindex) and apbi.penable and apbi.pwrite) = '1' then
             case apbi.paddr(4 downto 2) is
               when "000" =>
                 regvi.control := apbi.pwdata;
               when "001" =>
                 regvi.address := apbi.pwdata;
               when "100" =>
                 regvi.rm_reset := apbi.pwdata;
               when others =>
             end case;
           end if;

           -- timer
           if regcontrol.timer_clear='1' then
             regvo.timer := (others=>'0');
           elsif regcontrol.timer_en='1' then
                regvo.timer := regvo.timer+'1';
           end if;

           -- clear control registers
           if regcontrol.control_clr='1' then
             regvi.control(19 downto 0) := (others=>'0');
           end if;

           -- update status
           if (regcontrol.status_clr='1') then
             regvo.status := (others=>'0');
           elsif regcontrol.status_en='1' then
               regvo.status := regcontrol.status_value;
           end if;

           -- generate interrupt pulse after status register has been updated (if interrupts are enabled through control register bit 20)
           irq := (others=>'0');
           if (regcontrol.status_en='0') and (rregcontrol.status_en='1') and (reg_apbin.control(31)='1') then
             irq(pirq) := '1'; 
           end if;
           apbo.pirq <= irq;       -- drive interrupt on the bus
        
           -- assign variables to register inputs
           regi <= regvi;
           rego <= regvo;
           
           -- drive bus with read data
           apbo.prdata <= readdata;

    end process;

  regs : process(clkm,sysrstn)
         begin
           if (sysrstn='0') then
             reg_apbin.control <= (others => '0');
             reg_apbin.address <= (others => '0');
             reg_apbin.rm_reset <= (others => '0');
             reg_apbout.status(31 downto 4) <= (others => '0');
             reg_apbout.status(3 downto 0) <= (others => '1');
             reg_apbout.timer <= (others => '0');
             rregcontrol.status_en <= '0';
           elsif rising_edge(clkm) then
             reg_apbin <= regi;
             reg_apbout <= rego;
             rregcontrol.status_en <= regcontrol.status_en;
           end if;
         end process;

  -- Register ICAP I/Os
  regs_icap: process(clk_icap, sysrstn)
    begin
      if (sysrstn='0') then
        ricap_out.odata<=(others=>'0');
        ricap_out.busy<='0';
        ricap_in.idata<=(others=>'0');
        ricap_in.cen<='1';
        ricap_in.wen<='1';
        wen_del <= '1';
      elsif rising_edge(clk_icap) then
        ricap_out <= icap_out;
        ricap_in <= icap_in;
        wen_del <= ricap_in.wen;
      end if;
    end process;


  -- operating mode selection
  d2prc_crc_gen: if crc_en=1 generate
    d2prc_inst : d2prc
      generic map (technology => technology, crc_block => words_block, fifo_depth => fifo_depth)     
      port map (rstn => sysrstn, clkm => clkm, clk100 => clk_icap, dmai => dma_in, dmao => dma_out, icapi => icap_in, icapo => ricap_out, apbregi => reg_apbin, apbcontrol => regcontrol, rm_reset => rm_reset);
    -- Boot message
    -- pragma translate_off
    bootmsg : report_version
    generic map (
      "dprc: ahb master " & tost(hindex) & ", apb slave " & tost(pindex) & ", Dynamic Partial Reconfiguration Controller, rev " &
      tost(version) & ", irq " & tost(pirq) & ", mode D2PRC-CRC, fifo " & tost(2**fifo_depth) );
    -- pragma translate_on
  end generate;

  d2prc_edac_gen: if edac_en=1 generate
    d2prc_inst : d2prc_edac
      generic map (technology => technology, fifo_depth => fifo_depth)     
      port map (rstn => sysrstn, clkm => clkm, clk100 => clk_icap, dmai => dma_in, dmao => dma_out, icapi => icap_in, icapo => ricap_out, apbregi => reg_apbin, apbcontrol => regcontrol, rm_reset => rm_reset);
    -- Boot message
    -- pragma translate_off
    bootmsg : report_version
    generic map (
      "dprc: ahb master " & tost(hindex) & ", apb slave " & tost(pindex) & ", Dynamic Partial Reconfiguration Controller, rev " &
      tost(version) & ", irq " & tost(pirq) & ", mode D2PRC-SECDED, fifo " & tost(2**fifo_depth) );
    -- pragma translate_on
  end generate;
	
  asyncsync_gen: if (crc_en=0) and (edac_en=0) generate
    async_gen: if fifo_dcm_inst=1 generate
      async_dprc_inst : async_dprc
      generic map(technology => technology, fifo_depth => fifo_depth)     
      port map(rstn => sysrstn, clkm => clkm, clk100 => clk_icap, dmai => dma_in, dmao => dma_out, icapi => icap_in, icapo => ricap_out, apbregi => reg_apbin, apbcontrol => regcontrol, rm_reset => rm_reset);
      -- Boot message
      -- pragma translate_off
      bootmsg : report_version
      generic map (
        "dprc: ahb master " & tost(hindex) & ", apb slave " & tost(pindex) & ", Dynamic Partial Reconfiguration Controller, rev " &
        tost(version) & ", irq " & tost(pirq) & ", mode DPRC-ASYNC, fifo " & tost(2**fifo_depth) );
      -- pragma translate_on
    end generate;
    sync_gen: if fifo_dcm_inst=0 generate
      sync_dprc_inst: sync_dprc
        port map(rstn => sysrstn, clkm => clkm, dmai => dma_in, dmao => dma_out, icapi => icap_in, icapo => ricap_out, apbregi => reg_apbin, apbcontrol => regcontrol, rm_reset => rm_reset);
      -- Boot message
      -- pragma translate_off
      bootmsg : report_version
      generic map (
        "dprc: ahb master " & tost(hindex) & ", apb slave " & tost(pindex) & ", Dynamic Partial Reconfiguration Controller, rev " &
        tost(version) & ", irq " & tost(pirq) & ", mode DPRC-SYNC" );
      -- pragma translate_on
    end generate;
  end generate;

  -- clock generation (if necessary)
  clock_gen: if (crc_en=1 or fifo_dcm_inst=1 or edac_en=1) generate
    ext_clk_gen: if clk_sel=1 generate
      clk_icap <= clk100;  -- 100 MHz external clock
      sysrstn <= rstn;
    end generate;
    int_clk_gen: if clk_sel=0 generate  -- instantiate internal clock generator
      cgi.pllctrl <= "00"; cgi.pllrst <= rstn;
      clkgen_inst : clkgen
        generic map (technology, cfg_clkmul, cfg_clkdiv, 0, 0, 0, 0, 0, raw_freq)
        port map (clkin => clkraw, pciclkin => '0', clk => clk_icap, cgi => cgi, cgo => cgo);
      sysrstn <= cgo.clklock;
    end generate;
  end generate;
  noclock_gen: if (crc_en=0 and fifo_dcm_inst=0 and edac_en=0) generate
      clk_icap <= clkm;  -- system clock
      sysrstn <= rstn;
  end generate;

  -- ICAP input data byte swapping (if necessary)
  swap_gen: if (technology=virtex5 or technology=virtex6 or technology=virtex7 or technology=artix7 or technology=kintex7 or technology=zynq7000) generate
    icapbyteswap(ricap_in.idata,icap_swapped);
  end generate;

  -- ICAP instantiation  
  icapv4_gen: if (technology=virtex4) generate
    icap_virtex4_inst: ICAP_VIRTEX4
      generic map (ICAP_WIDTH => "X32")
      port map (BUSY => icap_out.busy, O => icap_out.odata, CE => ricap_in.cen, CLK => clk_icap, I => ricap_in.idata, WRITE => wen_del);
  end generate;
  
  icapv5_gen: if (technology=virtex5) generate
    icap_virtex5_inst: ICAP_VIRTEX5
      generic map (ICAP_WIDTH => "X32") -- 32 bit data width
      port map (BUSY => icap_out.busy, O => icap_out.odata, CE => ricap_in.cen, CLK => clk_icap, I => icap_swapped, WRITE => wen_del);
  end generate;
  
  icapv6_gen: if (technology=virtex6) generate
    icap_virtex6_inst: ICAP_VIRTEX6
      generic map (DEVICE_ID => X"04244093", ICAP_WIDTH => "X32", SIM_CFG_FILE_NAME => "NONE")
      port map (BUSY => icap_out.busy, O => icap_out.odata, CSB => ricap_in.cen, CLK => clk_icap, I => icap_swapped, RDWRB => wen_del);
  end generate;
  
  icap7_gen: if (technology=virtex7 or technology=artix7 or technology=kintex7 or technology=zynq7000) generate
    icap_7series_inst: ICAPE2
      generic map ( DEVICE_ID => X"03631093", ICAP_WIDTH => "X32", SIM_CFG_FILE_NAME => "NONE")
      port map (O => icap_out.odata, CSIB => ricap_in.cen, CLK => clk_icap, I => icap_swapped, RDWRB => wen_del);
  end generate;

  --pragma translate_off
  -- write ICAP data input to a file for verification purposes
  wfile: process
    variable l : line;
    begin
      while true loop
        wait until rising_edge(clk_icap);
        wait for 1 ns;
        if ricap_in.cen='0' and wen_del='0' then
          write(l, ricap_in.idata);
          writeline(icap_file, l);
        end if;
      end loop;
  end process;
  --pragma translate_on

end dprc_rtl;
