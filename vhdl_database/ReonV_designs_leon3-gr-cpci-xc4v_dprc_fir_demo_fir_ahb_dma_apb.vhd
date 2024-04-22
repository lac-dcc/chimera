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
-- Entity:      fir_ahb_dma_apb
-- File:        fir_ahb_dma_apb.vhd
-- Author:      Pascal Trotta (TestGroup research group - Politecnico di Torino)
-- Contacts:    pascal.trotta@polito.it www.testgroup.polito.it
-- Description: FIR filter peripheral example for dprc demo
------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
use grlib.dma2ahb_package.all;
library techmap;
use techmap.gencomp.all;

entity fir_ahb_dma_apb is
  generic (
    hindex : integer := 0;
    pindex : integer := 0;
    paddr : integer := 0;
    pmask : integer := 16#fff#;
    technology : integer := virtex4);
  port ( 
    clk : in std_ulogic; 
    rstn : in std_ulogic; 
    apbi : in apb_slv_in_type; 
    apbo : out apb_slv_out_type;
    ahbin : in ahb_mst_in_type;
    ahbout : out ahb_mst_out_type;
    rm_reset : in std_ulogic);
end fir_ahb_dma_apb;

architecture fir_abh_rtl of fir_ahb_dma_apb is

  component fir port (
    clk : in std_ulogic;
    rst : in std_ulogic;
    start : in std_ulogic;
    in_data : in std_logic_vector(31 downto 0);
    in_data_read : out std_ulogic;
    out_data : out std_logic_vector (31 downto 0);
    out_data_write : out std_ulogic);
  end component;

  type fir_in_type is record
    start : std_ulogic;
    in_data : std_logic_vector(31 downto 0);
  end record;

  type fir_out_type is record
    data_read : std_ulogic;
    data_write : std_ulogic;
    out_data : std_logic_vector(31 downto 0);
  end record;

  type fifo_type is record
    wen : std_ulogic;
    ren : std_logic;
    idata : std_logic_vector(31 downto 0);
    raddr : std_logic_vector(8 downto 0);
    waddr : std_logic_vector(8 downto 0);
  end record;
 
  type apbreg_type is record
    control : std_logic_vector(31 downto 0);
    address_in : std_logic_vector(31 downto 0);
    address_out : std_logic_vector(31 downto 0);
    timer : std_logic_vector(31 downto 0);
  end record;

  type apbreg_control is record
    clear_control : std_ulogic;
    clear_timer : std_ulogic;
    en_timer : std_ulogic;
  end record;

  type fsm_state is (idle, idata_request, idata_wait, core_wait, odata_request, odata_wait);
  signal pstate, nstate : fsm_state;

  type regs is record
    cgrant : std_logic_vector(8 downto 0);
    cready : std_logic_vector(8 downto 0);
    cokay : std_logic_vector(8 downto 0);
    cidata : std_logic_vector(8 downto 0);
    codata : std_logic_vector(8 downto 0);
    address : std_logic_vector(31 downto 0);
    address_out : std_logic_vector(31 downto 0);
  end record;

  signal dmain : dma_in_type;
  signal dmaout : dma_out_type;
  signal ifir : fir_in_type;
  signal ofir : fir_out_type;
  signal fifo_in, fifo_out, regfifo_out : fifo_type;
  signal fifo_o1data, fifo_o2data : std_logic_vector(31 downto 0);
  signal reg_apb, reg_apb_in : apbreg_type;
  signal reg_control : apbreg_control;
  signal reg, reg_in : regs;
  signal rst_core : std_ulogic;
  signal ofir_wen : std_logic;
  signal ofir_data : std_logic_vector(31 downto 0);

  constant pconfig : apb_config_type := (
    0 => ahb_device_reg (VENDOR_CONTRIB, CONTRIB_CORE2, 0, 0, 0), 
    1 => apb_iobar(paddr, pmask));

begin

  rst_core <= not(rstn) or rm_reset;

  -- APB interface signals
  apbo.pirq <= (others => '0');       --no interrupt
  apbo.pindex <= pindex;
  apbo.pconfig <= pconfig;

  -- DMA2AHB signals
  dmain.Beat <= HINCR;
  dmain.Size <= HSIZE32;
  dmain.Reset <= not(rstn);
  dmain.Data <= fifo_o2data;
  fifo_in.idata <= dmaout.Data;

  -- FIFOs / Core signals
  ifir.in_data <= fifo_o1data;
  fifo_in.waddr <= reg.cready;
  fifo_in.raddr <= reg.cidata;
  fifo_out.waddr <= reg.codata;
  fifo_out.idata <= ofir.out_data;
  fifo_in.ren <= ofir.data_read;
  fifo_out.wen <= ofir.data_write; 

  comb : process(reg_apb, apbi, reg_control, pstate, reg, dmaout, regfifo_out, ofir)
           variable readdata : std_logic_vector(31 downto 0);
           variable regvi : apbreg_type;
           variable regv : regs;
           variable vfifo_out : fifo_type;
         begin

           -- APB interface ----------------------
           -- assign register outputs to variables
           regvi := reg_apb;
        
           -- read register
           readdata := (others => '0');
           case apbi.paddr(3 downto 2) is         
             when "00" =>
               readdata := reg_apb.control;
             when "01" =>
               readdata := reg_apb.address_in;
             when "10" => 
               readdata := reg_apb.address_out;
             when "11" =>
               readdata := reg_apb.timer;
             when others =>
               readdata := (others => '0');
           end case;

           -- write registers
           if (apbi.psel(pindex) and apbi.penable and apbi.pwrite) = '1' then
             case apbi.paddr(3 downto 2) is
               when "00" =>
                 regvi.control := apbi.pwdata;
               when "01" =>
                 regvi.address_in := apbi.pwdata;
               when "10" =>
                 regvi.address_out := apbi.pwdata;
               when others =>
             end case;
           end if;

           -- timer
           if reg_control.clear_timer='1' then
             regvi.timer := (others=>'0');
           elsif reg_control.en_timer='1' then
                regvi.timer := regvi.timer+'1';
           end if;

           -- clear control registers
           if reg_control.clear_control='1' then
             regvi.control := std_logic_vector(to_unsigned(2,32));
           end if;
        
           -- assign variables to register inputs
           reg_apb_in <= regvi;
           
           -- drive bus with read data
           apbo.prdata <= readdata;
           -------------------------------------

           -- fsm (read, execute, write --------
           regv := reg;
           vfifo_out := regfifo_out;
           
           ifir.start <= '0';
           fifo_in.wen <= '0';
           dmain.Request <= '0';
           dmain.Burst <= '0';
           dmain.Store <= '0';
           dmain.Lock <= '0';
           reg_control.clear_timer<='0';
           reg_control.en_timer<='0';
           reg_control.clear_control<='0';
           
           case pstate is
             when idle => 
               if (reg_apb.control=std_logic_vector(to_unsigned(1,32))) then
                 nstate <= idata_request;
                 dmain.Request <= '1';
                 dmain.Burst <= '1';
                 dmain.Lock <= '1';
                 reg_control.clear_timer<='1';
               else
                 nstate <= pstate;
               end if;
               regv.address := reg_apb.address_in;
               regv.cgrant := (others=>'0');
               regv.cready := (others=>'0');
               regv.cidata := (others=>'0');
               regv.codata := (others=>'0');
               regv.cokay := (others=>'0');
               dmain.Address <= reg.address;

             when idata_request => 
               if regv.cgrant=std_logic_vector(to_unsigned(100,9)) then
                 nstate <= idata_wait;
               else
                 nstate <= idata_request;
                 dmain.Request <= '1';
                 dmain.Burst <= '1';
                 dmain.Lock <= '1';
               end if;
               fifo_in.wen <= dmaout.Ready;
               dmain.Address <= reg.address;
               
             when idata_wait => 
               if regv.cready=std_logic_vector(to_unsigned(100,9)) then 
                 nstate <= core_wait;
                 ifir.start <= '1';
               else
                 nstate <= idata_wait;
               end if;
               fifo_in.wen <= dmaout.Ready;
               dmain.Address <= reg.address;

             when core_wait => 
               if regv.codata=std_logic_vector(to_unsigned(91,9)) then
                 nstate <= odata_request;
               else
                 nstate <= core_wait;
               end if;
               regv.address_out := reg_apb.address_out;
               regv.cready := (others=>'0');
               regv.cgrant := (others=>'0');
               regv.cokay := (others=>'0');
               dmain.Address <= reg.address_out;

             when odata_request => 
               if regv.cgrant=std_logic_vector(to_unsigned(91,9)) then
                 nstate <= odata_wait;
                 dmain.Request <= '0';
                 dmain.Burst <= '0';
                 dmain.Lock <= '0';
                 dmain.Store <= '0';
               else
                 nstate <= odata_request;
                 dmain.Request <= '1';
                 dmain.Burst <= '1';
                 dmain.Lock <= '1';
                 dmain.Store <= '1';
               end if;
               dmain.Address <= reg.address_out;

             when odata_wait =>
               if regv.cokay=std_logic_vector(to_unsigned(91,9)) then
                 nstate <= idle;
                 reg_control.clear_control<='1';
               else
                 nstate <= odata_wait;
               end if;
               dmain.Address <= reg.address_out;

           end case;
               
           if (pstate/=idle) then
             reg_control.en_timer<='1';
           end if;
           -------------------------------------

           -- counters update ------------------
           if (dmaout.Ready='1') then
             regv.cready := regv.cready+1;
           end if;
           if (dmaout.Okay='1') then
             regv.cokay := regv.cokay+1;
             regv.address_out := regv.address_out+4;
           end if;
           if (dmaout.Grant='1') then
             regv.cgrant := regv.cgrant+1;
             regv.address := regv.address+4;
           end if;
           if (ofir.data_read='1') then
             regv.cidata := regv.cidata+1;
           end if;
           if (ofir.data_write='1') then
             regv.codata := regv.codata+1;
           end if;
           
           -------------------------------------
           vfifo_out.raddr := regv.cokay;
           reg_in <= regv;
           fifo_out.raddr <= vfifo_out.raddr;

    end process;

    regs_proc : process(clk,rstn)
         begin
           if (rstn='0') then
             reg_apb.control <= (others => '0');
             reg_apb.address_in <= (others => '0');
             reg_apb.address_out <= (others => '0');
             reg_apb.timer <= (others => '0');
             reg.cgrant <= (others => '0');
             reg.cready <= (others => '0');
             reg.cokay <= (others => '0');
             reg.cidata <= (others => '0');
             reg.codata <= (others => '0');
             reg.address <= (others => '0');
             reg.address_out <= (others => '0');
             pstate <= idle;
           elsif rising_edge(clk) then
             reg_apb <= reg_apb_in;
             reg <= reg_in;
             pstate <= nstate;
           end if;
         end process;

    regs_core: process(clk,rst_core)
      begin
        if (rst_core='1') then
          ofir.data_write <= '0';
          ofir.out_data <= (others => '0');
        elsif rising_edge(clk) then
          ofir.data_write<=ofir_wen;
          ofir.out_data<=ofir_data;
        end if;
      end process;

  -- DMA2AHB	
  fir_dma_to_ahb : dma2ahb generic map (
    hindex=>hindex, vendorid=>VENDOR_CONTRIB, deviceid=>CONTRIB_CORE2)
    port map (hclk=>clk, hresetn=>rstn,	dmain=>dmain, dmaout=>dmaout, ahbin=>ahbin, ahbout=>ahbout);
  
  -- FIR core 
  fir_core : fir port map (clk => clk, rst => rst_core, start => ifir.start, in_data => ifir.in_data, in_data_read => ofir.data_read,
                             out_data => ofir_data, out_data_write => ofir_wen);

  -- Input data buffer
  ram0 : syncram_2p generic map ( tech => technology, abits => 9, dbits => 32)
  port map (clk, fifo_in.ren, fifo_in.raddr, fifo_o1data, clk, fifo_in.wen, fifo_in.waddr, fifo_in.idata);

  -- Output data buffer
  ram1 : syncram_2p generic map ( tech => technology, abits => 9, dbits => 32)
  port map (clk, '1', fifo_out.raddr, fifo_o2data, clk, fifo_out.wen, fifo_out.waddr, fifo_out.idata); -- First word Fall Through

        

end fir_abh_rtl;
